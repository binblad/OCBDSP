package com.hwadee.fifthgroup.OCBDSP.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hwadee.fifthgroup.OCBDSP.bean.Major;
import com.hwadee.fifthgroup.OCBDSP.mapper.MajorMapper;
import com.hwadee.fifthgroup.OCBDSP.service.UserService;
import com.hwadee.fifthgroup.OCBDSP.bean.User;
import com.hwadee.fifthgroup.OCBDSP.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author king
 * @description 针对表【user(保存用户信息)】的数据库操作Service实现
 * @createDate 2024-04-08 10:19:26
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User>
        implements UserService {

    @Autowired
    private UserMapper usermapper;
    @Autowired
    private MajorMapper majorMapper;
    @Override
    public User getByAccount(String account) {
        return usermapper.selectOneByAccount(account);
    }
    @Override
    public User getByAccountAndPassword(String account,String password){
        return usermapper.selectOneByAccountAndPassword(account,password);
    }
    @Override
    public int registerUser(User user,String majorName){
        System.out.println(majorName);

        Major major = majorMapper.selectOneByMajorName(majorName);
        user.setMajorId(major.getMajorId());
        System.out.println(user);

        return usermapper.insert(user);
    }
    @Override
    public IPage<User> userIPageGet(int current, int size){
        Page<User> page = new Page<>(current, size);
        return usermapper.selectPage(page,null);

    }
}




