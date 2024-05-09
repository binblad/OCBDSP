package com.hwadee.fifthgroup.OCBDSP.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hwadee.fifthgroup.OCBDSP.bean.Admin;
import com.hwadee.fifthgroup.OCBDSP.bean.Log;
import com.hwadee.fifthgroup.OCBDSP.bean.Task;
import com.hwadee.fifthgroup.OCBDSP.mapper.AdminMapper;
import com.hwadee.fifthgroup.OCBDSP.mapper.TaskMapper;
import com.hwadee.fifthgroup.OCBDSP.service.LogService;
import com.hwadee.fifthgroup.OCBDSP.mapper.LogMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* @author thhhh
* @description 针对表【log】的数据库操作Service实现
* @createDate 2024-04-27 10:19:38
*/
@Service
public class LogServiceImpl extends ServiceImpl<LogMapper, Log>
    implements LogService{
    @Autowired
    LogMapper logMapper;
    @Override
    public IPage<Log> logIPageGet(int current, int size){
        Page<Log> page = new Page<>(current, size);
        return logMapper.selectPage(page,null);
    }
}




