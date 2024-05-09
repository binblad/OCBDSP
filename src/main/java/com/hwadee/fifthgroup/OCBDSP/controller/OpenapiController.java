package com.hwadee.fifthgroup.OCBDSP.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hwadee.fifthgroup.OCBDSP.bean.*;
import com.hwadee.fifthgroup.OCBDSP.mapper.AppDeveloperMapper;
import com.hwadee.fifthgroup.OCBDSP.mapper.AppMapper;
import com.hwadee.fifthgroup.OCBDSP.mapper.DeveloperMapper;
import com.hwadee.fifthgroup.OCBDSP.mapper.UserMapper;
import com.hwadee.fifthgroup.OCBDSP.service.ApiService;
import com.hwadee.fifthgroup.OCBDSP.service.ApikeyService;
import com.hwadee.fifthgroup.OCBDSP.service.UserService;
import com.hwadee.fifthgroup.OCBDSP.utils.IsValidEmail;
import com.mysql.cj.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

@RestController
@RequestMapping("/openapi")
public class OpenapiController {
    @Autowired
    DeveloperMapper developerMapper;
    @Autowired
    UserMapper userMapper;
    @Autowired
    UserService userService;
    @Autowired
    AppMapper appMapper;
    @Autowired
    AppDeveloperMapper appDeveloperMapper;
    @Autowired
    ApiService apiService;
    @Autowired
    ApikeyService apikeyService;

    @PostMapping("/apply")
    public R OpenAPIApplyUser(User user, String majorName){
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

        int line = userService.registerUser(user,majorName);
        User user1 = userService.getByAccount(user.getAccount());
        if(line==1) {
            Developer developer = new Developer();
            developer.setUserId(user1.getUserId());
            developer.setBlack(0);
            int line1 = developerMapper.insert(developer);
            return R.ok().message("用户注册成功。").token(token).datas(line);
        }else {
            return R.fail().message("用户注册失败!").token(token);
        }
    }


    @PostMapping("/get/key")
    public R OpenAPIGetKey(String account,String appName,String appContent){
        String token = "";
        if(StringUtils.isNullOrEmpty(account)){
            return R.fail().message("用户不能为空!").token(token);
        }
        if(StringUtils.isNullOrEmpty(appName)){
            return R.fail().message("软件名不能为空").token(token);
        }
        if(StringUtils.isNullOrEmpty(appContent)){
            return R.fail().message("软件描述不能为空").token(token);
        }

        User user = userMapper.selectOneByAccount(account);

        Developer developer = developerMapper.selectById(user.getUserId());
        if(developer==null){
            return R.fail().message("用户不为开发者用户").token(token);
        }else if(developer.getBlack()==1){
            return R.fail().message("开发者用户已被拉黑").token(token);
        }

        App app = new App();
        app.setAppName(appName);
        app.setAppContent(appContent);
        int line = appMapper.insert(app);


        QueryWrapper<App> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("appName",appName);
        App app_ = appMapper.selectOne(queryWrapper);

        Appdeveloper appDeveloper = new Appdeveloper();
        appDeveloper.setUserId(user.getUserId());
        appDeveloper.setAppId(app_.getAppId());


        int flag = 0;
        flag = appDeveloperMapper.insert(appDeveloper);
        if(flag!=0) {
            return R.ok().message("开发者用户Api申请api提交成功。").token(token);
        }else {
            return R.fail().message("开发者用户Api申请api提交成功！").token(token);
        }
    }

    @GetMapping("/get/document")
    public R OpenAPIApply(String account){
        String token = "";
        if(StringUtils.isNullOrEmpty(account)){
            return R.fail().message("用户不能为空!").token(token);
        }

        User user = userMapper.selectOneByAccount(account);

        Developer developer = developerMapper.selectById(user.getUserId());
        if(developer==null){
            return R.fail().message("用户不为开发者用户").token(token);
        }else if(developer.getBlack()==1){
            return R.fail().message("开发者用户已被拉黑").token(token);
        }

        QueryWrapper<Appdeveloper> appDQueryWrapper = new QueryWrapper<>();
        appDQueryWrapper.eq("userId",user.getUserId());
        List<Appdeveloper> appDeveloper = appDeveloperMapper.selectList(appDQueryWrapper);
        ArrayList<Long> appId = new ArrayList<Long>();


        for (int i = 0; i < appDeveloper.size(); i++) {
            Appdeveloper appdeveloper_ = appDeveloper.get(i);
            appId.add(appdeveloper_.getAppId());
        }
        System.out.println(appId);

        ArrayList<Long> api = new ArrayList<Long>();

        for (int i = 0; i < appId.size(); i++) {
            QueryWrapper<Apikey> apikeyQueryWrapper = new QueryWrapper<>();
            apikeyQueryWrapper.eq("appId",appId.get(i));
            List<Apikey> apikeys = apikeyService.list(apikeyQueryWrapper);
            for (int j = 0; j < apikeys.size(); j++) {
                api.add(apikeys.get(j).getApiId());
            }
        }

        HashSet<Long> apiHash = new HashSet<>(api);
        api.clear();
        api.addAll(apiHash);

        QueryWrapper<Api> apiQueryWrapper = new QueryWrapper<>();
        apiQueryWrapper.in("apiId",api);
        List<Api> apis = apiService.list(apiQueryWrapper);



        if(apis!=null) {
            return R.ok().message("开发者用户申请api文档成功。").token(token).datas(apis);
        }else {
            return R.fail().message("开发者用户申请api文档失败！").token(token);
        }
    }

}
