package com.hwadee.fifthgroup.OCBDSP.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.hwadee.fifthgroup.OCBDSP.bean.*;
import com.hwadee.fifthgroup.OCBDSP.mapper.*;
import com.hwadee.fifthgroup.OCBDSP.service.*;
import com.hwadee.fifthgroup.OCBDSP.utils.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    UserService userService;
    @Autowired
    MajorMapper majorMapper;
    @Autowired
    AdminMapper adminMapper;
    @Autowired
    ApiService apiService;
    @Autowired
    AdminService adminService;
    @Autowired
    DeveloperService developerService;
    @Autowired
    ApikeyService apikeyService;
    @Autowired
    ApikeyMapper apikeyMapper;
    @Autowired
    AppMapper appMapper;
    @Autowired
    AppDeveloperMapper appDeveloperMapper;
    @Autowired
    ReapikeycontrolMapper reapikeycontrolMapper;
    @Autowired
    ReapikeycontrolService reapikeycontrolService;
    @Autowired
    ApiiMapper apiiMapper;
    @Autowired
    ApiiService apiiService;


    @GetMapping("/control/mobileaccount")
    public R CheckUser(int current,int size){
        String token = "";

        IPage<User> userIPage = userService.userIPageGet(current,size);

        if(userIPage!=null) {
            return R.ok().message("手机用户数据查询成功。").token(token).datas(userIPage);
        }else {
            return R.fail().message("手机用户数据查询失败!").token(token).datas(null);
        }
    }


    @PostMapping("/login") // /admin/login
    public R login(String account, String password) {
        String token = "";
        if(com.mysql.cj.util.StringUtils.isNullOrEmpty(account) ||
                com.mysql.cj.util.StringUtils.isNullOrEmpty(password)){
            return R.fail().message("管理者用户名和密码不能为空!").token(token).datas(null);
        }

        Admin flag = adminMapper.selectOneByAccount(account);
        if(flag==null){
            return R.fail().message("管理者用户不存在").token(token);
        }else {
            flag=null;
        }

        Admin result = adminMapper.selectOneByAccountAndPassword(account,password);

        if(result!=null) {
            Map<String,Object> claims = new HashMap<>();
            claims.put("account",account);
            claims.put("password",password);
            JwtUtil jwtUtil = new JwtUtil();
            token = jwtUtil.generateJwt(claims);
            return R.ok().message("管理者登录成功。").token(token);
        }else {
            return R.fail().message("管理者用户名或密码错误!").token(token);
        }
    }

    @GetMapping("/get/developer")//current：当前页面。size：页面大小
    public R CheckDeveloper(/*String account,*/int current,int size){
        String token = "";

        IPage<Developer> developerIPage = developerService.apiIPageGet(current,size);

        if(developerIPage!=null) {
            return R.ok().message("开发者数据查询成功。").token(token).datas(developerIPage);
        }else {
            return R.fail().message("开发者数据查询失败!").token(token).datas(null);
        }
    }

    @PostMapping("/register")//current：当前页面。size：页面大小
    public R RegisterAdmin(Admin admin){
        String token = "";

        long line = adminMapper.insert(admin);

        if(line!=0) {
            return R.ok().message("管理这注册成功。").token(token).datas(line);
        }else {
            return R.fail().message("管理这注册失败!").token(token).datas(null);
        }
    }


    @GetMapping("/get/admin")//current：当前页面。size：页面大小
    public R CheckAdmin(/*String account,*/int current,int size){
        String token = "";

        IPage<Admin> adminIPage = adminService.apiIPageGet(current,size);

        if(adminIPage!=null) {
            return R.ok().message("管理者数据查询成功。").token(token).datas(adminIPage);
        }else {
            return R.fail().message("管理者数据查询失败!").token(token).datas(null);
        }
    }

    @GetMapping("/get/oneadmin")
    public R CheckOneAdmin(String account){
        String token = "";

        Admin admin = adminMapper.selectOneByAccount(account);

        if(admin!=null) {
            return R.ok().message("管理者数据查询成功。").token(token).datas(admin);
        }else {
            return R.fail().message("管理者数据查询失败!").token(token).datas(null);
        }
    }


    @GetMapping("/get/api")
    public R CheckApi(int current,int size){
        String token = "";

        IPage<Apii> apiiIPage = apiiService.apiiIPageGet(current,size);

        if(apiiIPage!=null) {
            return R.ok().message("API数据查询成功。").token(token).datas(apiiIPage);
        }else {
            return R.fail().message("API数据查询失败!").token(token).datas(null);
        }
    }

    @GetMapping("/get/key")//current：RE当前页面。size：页面大小
    public R CheckKey(int current,int size){
        String token = "";
        QueryWrapper<Reapikeycontrol> q = new QueryWrapper<>();
        List<Reapikeycontrol> list = reapikeycontrolMapper.selectList(q);

        InsertReapikeycontrol();

        IPage<Reapikeycontrol> reapikeycontrolIPage = reapikeycontrolService.reapikeycontrolIPageGet(current,size);

        if(reapikeycontrolIPage!=null) {
            return R.ok().message("密钥数据查询成功。").token(token).datas(reapikeycontrolIPage);
        }else {
            return R.fail().message("密钥数据查询失败!").token(token).datas(null);
        }
    }

    public void InsertReapikeycontrol(){
        List<Reapikeycontrol> reapikeycontrolList = new ArrayList<>();

        QueryWrapper<Apikey> queryWrapper = new QueryWrapper<>();
        List<Apikey> apikeys = apikeyMapper.selectList(queryWrapper);
        for (int i = 0; i < apikeys.size(); i++) {
            Apikey apikey = apikeys.get(i);
            //拿到userId
            QueryWrapper<Appdeveloper> appdeveloperQueryWrapper = new QueryWrapper<>();
            appdeveloperQueryWrapper.eq("appId",apikey.getAppId());
            Appdeveloper appdeveloper = appDeveloperMapper.selectOne(appdeveloperQueryWrapper);
            long userId = appdeveloper.getUserId();
            //拿到times和访问时间
            QueryWrapper<Api> apiQueryWrapper=new QueryWrapper<>();
            apiQueryWrapper.eq("apiId",apikey.getAppId());
            Api api = apiService.getOne(apiQueryWrapper);
            long times = api.getTimes();
            //设置reapikeycontrol
            Reapikeycontrol reapikeycontrol = new Reapikeycontrol();
            reapikeycontrol.setKeyId(apikey.getKeyId());
            reapikeycontrol.setAppId(apikey.getAppId());
            reapikeycontrol.setTimes(times);
            reapikeycontrol.setUserId(userId);

            reapikeycontrolList.add(i,reapikeycontrol);
        }

        for (Reapikeycontrol reapikeycontrol : reapikeycontrolList) {
            Reapikeycontrol reapikeycontrol1 = reapikeycontrolMapper.selectById(reapikeycontrol.getKeyId());
            if (reapikeycontrol1==null) {
                int line=  reapikeycontrolMapper.insert(reapikeycontrol);
            }
        }

    }
}
