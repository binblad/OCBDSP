package com.hwadee.fifthgroup.OCBDSP.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hwadee.fifthgroup.OCBDSP.bean.Api;
import com.hwadee.fifthgroup.OCBDSP.bean.Developer;
import com.hwadee.fifthgroup.OCBDSP.mapper.ApiMapper;
import com.hwadee.fifthgroup.OCBDSP.service.DeveloperService;
import com.hwadee.fifthgroup.OCBDSP.mapper.DeveloperMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* @author thhhh
* @description 针对表【developer】的数据库操作Service实现
* @createDate 2024-04-27 09:57:00
*/
@Service
public class DeveloperServiceImpl extends ServiceImpl<DeveloperMapper, Developer>
    implements DeveloperService{
    @Autowired
    DeveloperMapper developerMapper;
    @Override
    public IPage<Developer> apiIPageGet(int current, int size) {
        Page<Developer> page = new Page<>(current, size);
        return developerMapper.selectPage(page, null);
    }

}




