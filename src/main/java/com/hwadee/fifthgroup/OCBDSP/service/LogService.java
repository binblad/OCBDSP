package com.hwadee.fifthgroup.OCBDSP.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.hwadee.fifthgroup.OCBDSP.bean.Log;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author thhhh
* @description 针对表【log】的数据库操作Service
* @createDate 2024-04-27 10:19:38
*/
public interface LogService extends IService<Log> {
    IPage<Log> logIPageGet(int current, int size);
}
