package com.hwadee.fifthgroup.OCBDSP.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hwadee.fifthgroup.OCBDSP.bean.Admin;
import com.hwadee.fifthgroup.OCBDSP.bean.Api;
import com.hwadee.fifthgroup.OCBDSP.mapper.ApiMapper;
import com.hwadee.fifthgroup.OCBDSP.service.AdminService;
import com.hwadee.fifthgroup.OCBDSP.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* @author thhhh
* @description 针对表【admin】的数据库操作Service实现
* @createDate 2024-04-26 16:48:59
*/
@Service
public class AdminServiceImpl extends ServiceImpl<AdminMapper, Admin>
    implements AdminService{
    @Autowired
    AdminMapper adminMapper;
    @Override
    public IPage<Admin> apiIPageGet(int current, int size){
        Page<Admin> page = new Page<>(current, size);
        return adminMapper.selectPage(page,null);
    }
}




