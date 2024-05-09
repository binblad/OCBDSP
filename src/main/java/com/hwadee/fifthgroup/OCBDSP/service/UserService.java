package com.hwadee.fifthgroup.OCBDSP.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.hwadee.fifthgroup.OCBDSP.bean.User;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author king
* @description 针对表【user(保存用户信息)】的数据库操作Service
* @createDate 2024-04-08 10:19:26
*/
public interface UserService extends IService<User> {

    User getByAccount(String account);
    User getByAccountAndPassword(String account,String password);

    int registerUser(User user,String majorName);
    IPage<User> userIPageGet(int current, int size);
}
