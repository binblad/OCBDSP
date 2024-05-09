package com.hwadee.fifthgroup.OCBDSP.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.hwadee.fifthgroup.OCBDSP.bean.Reapikeycontrol;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author thhhh
* @description 针对表【reapikeycontrol】的数据库操作Service
* @createDate 2024-04-27 15:43:31
*/
public interface ReapikeycontrolService extends IService<Reapikeycontrol> {
    IPage<Reapikeycontrol> reapikeycontrolIPageGet(int current, int size);
}
