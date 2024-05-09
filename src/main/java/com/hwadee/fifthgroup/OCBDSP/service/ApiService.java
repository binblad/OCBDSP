package com.hwadee.fifthgroup.OCBDSP.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hwadee.fifthgroup.OCBDSP.bean.Api;

/**
* @author thhhh
* @description 针对表【api】的数据库操作Service
* @createDate 2024-04-26 14:03:18
*/
public interface ApiService extends IService<Api> {
    IPage<Api> apiIPageGet(int current, int size);
}
