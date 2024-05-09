package com.hwadee.fifthgroup.OCBDSP.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.hwadee.fifthgroup.OCBDSP.bean.*;
import com.hwadee.fifthgroup.OCBDSP.service.DatasourceService;
import com.hwadee.fifthgroup.OCBDSP.service.LogService;
import com.hwadee.fifthgroup.OCBDSP.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.sql.DataSource;

@RestController
@RequestMapping("/datacollection")
public class DataCollectionController {
    @Autowired
    TaskService taskService;
    @Autowired
    LogService logService;
    @Autowired
    DatasourceService datasourceService;

    @GetMapping("/get/datasource")//current：当前页面。size：页面大小
    public R CheckDataSource(int current, int size){
        String token = "";

        IPage<Datasource> dataSourceIPage = datasourceService.datasourceIPageGet(current,size);

        if(dataSourceIPage!=null) {
            return R.ok().message("开发者数据查询成功。").token(token).datas(dataSourceIPage);
        }else {
            return R.fail().message("开发者数据查询失败!").token(token).datas(null);
        }
    }

    @GetMapping("/get/task")//current：当前页面。size：页面大小
    public R CheckTask(int current, int size){
        String token = "";

        IPage<Task> taskIPage = taskService.taskIPageGet(current,size);

        if(taskIPage!=null) {
            return R.ok().message("开发者数据查询成功。").token(token).datas(taskIPage);
        }else {
            return R.fail().message("开发者数据查询失败!").token(token).datas(null);
        }
    }

    @GetMapping("/get/log")//current：当前页面。size：页面大小
    public R CheckLog(int current, int size){
        String token = "";

        IPage<Log> logIPage = logService.logIPageGet(current,size);

        if(logIPage!=null) {
            return R.ok().message("开发者数据查询成功。").token(token).datas(logIPage);
        }else {
            return R.fail().message("开发者数据查询失败!").token(token).datas(null);
        }
    }

}
