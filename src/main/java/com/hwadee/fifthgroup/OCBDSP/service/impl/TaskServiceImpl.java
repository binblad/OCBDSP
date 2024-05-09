package com.hwadee.fifthgroup.OCBDSP.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hwadee.fifthgroup.OCBDSP.bean.Admin;
import com.hwadee.fifthgroup.OCBDSP.bean.Task;
import com.hwadee.fifthgroup.OCBDSP.mapper.AdminMapper;
import com.hwadee.fifthgroup.OCBDSP.service.TaskService;
import com.hwadee.fifthgroup.OCBDSP.mapper.TaskMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* @author thhhh
* @description 针对表【task】的数据库操作Service实现
* @createDate 2024-04-27 10:19:38
*/
@Service
public class TaskServiceImpl extends ServiceImpl<TaskMapper, Task>
    implements TaskService{
    @Autowired
    TaskMapper taskMapper;
    @Override
    public IPage<Task> taskIPageGet(int current, int size) {
        Page<Task> page = new Page<>(current, size);
        return taskMapper.selectPage(page, null);
    }
}




