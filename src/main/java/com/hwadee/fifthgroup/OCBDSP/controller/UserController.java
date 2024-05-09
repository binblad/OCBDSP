package com.hwadee.fifthgroup.OCBDSP.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hwadee.fifthgroup.OCBDSP.bean.*;
import com.hwadee.fifthgroup.OCBDSP.mapper.MajorMapper;
import com.hwadee.fifthgroup.OCBDSP.mapper.UserMapper;
import com.hwadee.fifthgroup.OCBDSP.service.UserService;
import com.hwadee.fifthgroup.OCBDSP.utils.IsValidEmail;
import com.hwadee.fifthgroup.OCBDSP.utils.JwtUtil;
import com.mysql.cj.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author king
 * @date 2024/4/8 10:20
 * @desc 用户管理接口
 */
//@CrossOrigin
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;
    @Autowired
    MajorMapper majorMapper;
    @Autowired
    UserMapper userMapper;

    @PostMapping("/login") // /user/login
    public R login(String account, String password) {
        String token = "";
        if(com.mysql.cj.util.StringUtils.isNullOrEmpty(account) ||
                com.mysql.cj.util.StringUtils.isNullOrEmpty(password)){
            return R.fail().message("用户名和密码不能为空!").token(token).datas(null);
        }

        User flag = userService.getByAccount(account);
        if(flag==null){
            return R.fail().message("用户不存在").token(token);
        }else {
            flag=null;
        }

        User result = userService.getByAccountAndPassword(account,password);

        if(result!=null) {
            Map<String,Object> claims = new HashMap<>();
            claims.put("account",account);
            claims.put("password",password);
            JwtUtil jwtUtil = new JwtUtil();
            token = jwtUtil.generateJwt(claims);
            return R.ok().message("用户登录成功。").token(token);
        }else {
            return R.fail().message("用户名或密码错误!").token(token);
        }
    }

    @PostMapping("/register")
    public R register(User user,String majorName){
        String token = "";
        if(com.mysql.cj.util.StringUtils.isNullOrEmpty(user.getAccount()) ||
                com.mysql.cj.util.StringUtils.isNullOrEmpty(user.getPassword())){
            return R.fail().message("用户名和密码不能为空!").token(token);
        }
        if(StringUtils.isNullOrEmpty(user.getEmail())){
            return R.fail().message("邮箱不能为空").token(token);
        }else if(!IsValidEmail.isValidEmail(user.getEmail())){
            return R.fail().message("邮箱格式不正确").token(token);
        }
        if(majorName==null){
            return R.fail().message("专业不能为空").token(token);
        }
        if(user.getQuestion()==null||user.getAnswer()==null){
            return R.fail().message("密保问题或答案不能为空！").token(token);
        }
        if(userMapper.selectOneByAccount(user.getAccount())!=null){
            return R.fail().message("用户账号已经存在");
        }

        int line = userService.registerUser(user,majorName);
        if(line==1) {
            return R.ok().message("用户注册成功。").token(token);
        }else {
            return R.fail().message("用户注册失败!").token(token);
        }
    }

    @PostMapping("/retrieve")
    public R retrieve(User user){
        String token = "";

        User originUser = userService.getByAccount(user.getAccount());
        if(originUser==null){
            return R.fail().message("用户不存在").token(token);
        }

        if(originUser.getQuestion().equals(user.getQuestion())&&
                originUser.getAnswer().equals(originUser.getAnswer())){
            return R.ok().message("密保验证通过");
        }else {
            return R.fail().message("密保问题或回答错误");
        }

    }

    @GetMapping("/information/get")
    public R Check(String account,String password){
        String token = "";

        User result = userService.getByAccountAndPassword(account,password);

        Major major = majorMapper.selectById(result.getMajorId());

        Map<String,String> major_= new HashMap<>();
        major_.put("专业",major.getMajorName());

        List<Object> inf = new ArrayList<>();
        inf.add(0,result);
        inf.add(1,major_);

        if(inf!=null) {
            return R.ok().message("用户数据获取成功。").token(token).datas(inf);
        }else {
            return R.fail().message("用户数据获取失败!").token(token).datas(inf);
        }
    }

    @PostMapping("/information/update")
    public R Update(User user){
        String token = "";

        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("account",user.getAccount());

        int line = 0;
        line = userMapper.update(user,queryWrapper);

        if(line!=0) {
            Map<String,Object> claims = new HashMap<>();
            claims.put("id",user.getUserId());
            claims.put("password",user.getPassword());
            JwtUtil jwtUtil = new JwtUtil();
            token = jwtUtil.generateJwt(claims);
            return R.ok().message("用户数据更新成功。").token(token).datas(line);
        }else {
            return R.fail().message("用户数据更新失败!").token(token).datas(line);
        }
    }
}
