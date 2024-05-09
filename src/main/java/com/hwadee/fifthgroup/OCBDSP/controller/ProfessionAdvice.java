package com.hwadee.fifthgroup.OCBDSP.controller;


import com.hwadee.fifthgroup.OCBDSP.bean.R;
import com.hwadee.fifthgroup.OCBDSP.bean.ReProAdviceData;
import com.hwadee.fifthgroup.OCBDSP.bean.TargetPosition;
import com.hwadee.fifthgroup.OCBDSP.service.ProfessionAdviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/profession")
public class ProfessionAdvice {
    @Autowired
    ProfessionAdviceService professionAdviceService;


    @GetMapping("/advice")
    public R ProfessionAdvice(TargetPosition targetPosition){
        String token = "";

        List<ReProAdviceData> reProAdviceData =professionAdviceService.ProfessionAdvice(targetPosition);

        if (reProAdviceData!=null){
            return R.ok().message("职业推荐成功").datas(reProAdviceData).token(token);
        }else {
            return R.fail().message("职业推荐失败").token(token);
        }
    }

}
