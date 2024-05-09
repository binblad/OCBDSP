package com.hwadee.fifthgroup.OCBDSP.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hwadee.fifthgroup.OCBDSP.bean.Importantdata;
import com.hwadee.fifthgroup.OCBDSP.bean.Jobtype;
import com.hwadee.fifthgroup.OCBDSP.bean.R;
import com.hwadee.fifthgroup.OCBDSP.mapper.ImportantDataMapper;
import com.hwadee.fifthgroup.OCBDSP.mapper.JobTypeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/report")
public class ReportController {
    @Autowired
    ImportantDataMapper importantDataMapper;
    @Autowired
    JobTypeMapper jobTypeMapper;

    @GetMapping("/get/maininf")
    public R Report(String typeName){
        String token = "";

        QueryWrapper<Jobtype> whereWrapper = new QueryWrapper<>();
        whereWrapper.eq("typeName", typeName);
        Jobtype jobtype = jobTypeMapper.selectOne(whereWrapper);

        QueryWrapper<Importantdata> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("jobTypeId",jobtype.getJobTypeId());
        List<Importantdata> result = importantDataMapper.selectList(queryWrapper);

        if(result!=null) {
            return R.ok().message("报告重要数据获取成功。").token(token).datas(result);
        }else {
            return R.fail().message("报告重要数据获取失败!").token(token).datas(result);
        }
    }

}
