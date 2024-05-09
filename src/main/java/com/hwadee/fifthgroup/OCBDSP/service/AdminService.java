package com.hwadee.fifthgroup.OCBDSP.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.hwadee.fifthgroup.OCBDSP.bean.Admin;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author thhhh
* @description 针对表【admin】的数据库操作Service
* @createDate 2024-04-26 16:48:59
*/
public interface AdminService extends IService<Admin> {
    IPage<Admin> apiIPageGet(int current, int size);
}
