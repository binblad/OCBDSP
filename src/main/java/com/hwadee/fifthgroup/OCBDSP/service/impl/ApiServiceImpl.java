package com.hwadee.fifthgroup.OCBDSP.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.hwadee.fifthgroup.OCBDSP.bean.Api;
import com.hwadee.fifthgroup.OCBDSP.bean.User;
import com.hwadee.fifthgroup.OCBDSP.service.ApiService;
import com.hwadee.fifthgroup.OCBDSP.mapper.ApiMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* @author thhhh
* @description 针对表【api】的数据库操作Service实现
* @createDate 2024-04-26 14:03:18
*/
@Service
public class ApiServiceImpl extends ServiceImpl<ApiMapper, Api>
    implements ApiService {
    @Autowired
    ApiMapper apiMapper;
    @Override
    public IPage<Api> apiIPageGet(int current, int size){
        Page<Api> page = new Page<>(current, size);
        return apiMapper.selectPage(page,null);
    }
}




