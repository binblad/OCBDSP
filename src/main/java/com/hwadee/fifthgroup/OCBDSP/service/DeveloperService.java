package com.hwadee.fifthgroup.OCBDSP.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.hwadee.fifthgroup.OCBDSP.bean.Developer;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author thhhh
* @description 针对表【developer】的数据库操作Service
* @createDate 2024-04-27 09:57:00
*/
public interface DeveloperService extends IService<Developer> {
    IPage<Developer> apiIPageGet(int current, int size);
}
