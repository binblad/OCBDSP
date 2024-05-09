package com.hwadee.fifthgroup.OCBDSP.service;


import com.hwadee.fifthgroup.OCBDSP.bean.Job;
import com.hwadee.fifthgroup.OCBDSP.bean.ReProAdviceData;
import com.hwadee.fifthgroup.OCBDSP.bean.TargetPosition;

import java.util.List;


public interface ProfessionAdviceService {
    List<ReProAdviceData> ProfessionAdvice(TargetPosition advice);
    boolean isInThisCity(long cityId,TargetPosition advice);
    List<ReProAdviceData> reProAdviceDataList(List<Job> finalJobList);
    String ReturnCityName(long cityId);
    List<Object> ReturnCompany(long companyId);
}
