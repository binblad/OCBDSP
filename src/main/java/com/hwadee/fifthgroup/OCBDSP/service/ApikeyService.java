package com.hwadee.fifthgroup.OCBDSP.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.hwadee.fifthgroup.OCBDSP.bean.Apikey;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author thhhh
* @description 针对表【apikey】的数据库操作Service
* @createDate 2024-04-27 10:04:19
*/
public interface ApikeyService extends IService<Apikey> {
    IPage<Apikey> apikeyIPageGet(int current, int size);
}
