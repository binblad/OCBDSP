package com.hwadee.fifthgroup.OCBDSP.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.hwadee.fifthgroup.OCBDSP.bean.Apii;
import com.hwadee.fifthgroup.OCBDSP.mapper.ApiiMapper;
import com.hwadee.fifthgroup.OCBDSP.service.ApiiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* @author thhhh
* @description 针对表【apii】的数据库操作Service实现
* @createDate 2024-05-06 22:52:17
*/
@Service
public class ApiiServiceImpl extends ServiceImpl<ApiiMapper, Apii>
    implements ApiiService {
    @Autowired
    ApiiMapper apiiMapper;
    @Override
    public IPage<Apii> apiiIPageGet(int current, int size){
        Page<Apii> page = new Page<>(current, size);
        return apiiMapper.selectPage(page,null);
    }
}




