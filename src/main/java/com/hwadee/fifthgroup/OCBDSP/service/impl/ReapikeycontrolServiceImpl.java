package com.hwadee.fifthgroup.OCBDSP.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hwadee.fifthgroup.OCBDSP.bean.Admin;
import com.hwadee.fifthgroup.OCBDSP.bean.Reapikeycontrol;
import com.hwadee.fifthgroup.OCBDSP.mapper.AdminMapper;
import com.hwadee.fifthgroup.OCBDSP.service.ReapikeycontrolService;
import com.hwadee.fifthgroup.OCBDSP.mapper.ReapikeycontrolMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* @author thhhh
* @description 针对表【reapikeycontrol】的数据库操作Service实现
* @createDate 2024-04-27 15:43:31
*/
@Service
public class ReapikeycontrolServiceImpl extends ServiceImpl<ReapikeycontrolMapper, Reapikeycontrol>
    implements ReapikeycontrolService{
    @Autowired
    ReapikeycontrolMapper reapikeycontrolMapper;
    @Override
    public IPage<Reapikeycontrol> reapikeycontrolIPageGet(int current, int size){
        Page<Reapikeycontrol> page = new Page<>(current, size);
        return reapikeycontrolMapper.selectPage(page,null);
    }
}




