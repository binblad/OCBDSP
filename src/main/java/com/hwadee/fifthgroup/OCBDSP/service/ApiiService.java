package com.hwadee.fifthgroup.OCBDSP.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;

import com.hwadee.fifthgroup.OCBDSP.bean.Apii;
import org.springframework.beans.factory.annotation.Autowired;

/**
* @author thhhh
* @description 针对表【apii】的数据库操作Service
* @createDate 2024-05-06 22:52:17
*/
public interface ApiiService extends IService<Apii> {

    IPage<Apii> apiiIPageGet(int current, int size);
}
