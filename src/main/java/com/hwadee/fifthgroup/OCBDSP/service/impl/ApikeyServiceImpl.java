package com.hwadee.fifthgroup.OCBDSP.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hwadee.fifthgroup.OCBDSP.bean.Api;
import com.hwadee.fifthgroup.OCBDSP.bean.Apikey;
import com.hwadee.fifthgroup.OCBDSP.mapper.ApiMapper;
import com.hwadee.fifthgroup.OCBDSP.service.ApikeyService;
import com.hwadee.fifthgroup.OCBDSP.mapper.ApikeyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* @author thhhh
* @description 针对表【apikey】的数据库操作Service实现
* @createDate 2024-04-27 10:04:19
*/
@Service
public class ApikeyServiceImpl extends ServiceImpl<ApikeyMapper, Apikey>
    implements ApikeyService{
    @Autowired
    ApikeyMapper apikeyMapper;
    @Override
    public IPage<Apikey> apikeyIPageGet(int current, int size){
        Page<Apikey> page = new Page<>(current, size);
        return apikeyMapper.selectPage(page,null);
    }

}




