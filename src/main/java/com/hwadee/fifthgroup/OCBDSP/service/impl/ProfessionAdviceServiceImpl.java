package com.hwadee.fifthgroup.OCBDSP.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;

import com.hwadee.fifthgroup.OCBDSP.bean.*;
import com.hwadee.fifthgroup.OCBDSP.mapper.CityMapper;
import com.hwadee.fifthgroup.OCBDSP.mapper.CompanyMapper;
import com.hwadee.fifthgroup.OCBDSP.mapper.JobMapper;
import com.hwadee.fifthgroup.OCBDSP.mapper.JobTypeMapper;
import com.hwadee.fifthgroup.OCBDSP.service.ProfessionAdviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProfessionAdviceServiceImpl implements ProfessionAdviceService {
    @Autowired
    CompanyMapper companyMapper;
    @Autowired
    JobMapper jobMapper;
    @Autowired
    JobTypeMapper jobTypeMapper;
    @Autowired
    CityMapper cityMapper;


    public List<ReProAdviceData>  ProfessionAdvice(TargetPosition targetPosition){

        QueryWrapper<Jobtype> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("typeName",targetPosition.getTypeName());
        Jobtype jobtype = jobTypeMapper.selectOne(queryWrapper);
        //判定符合目标薪资的职位
        QueryWrapper<Job> jobQueryWrapper = new QueryWrapper<>();
        jobQueryWrapper.eq("jobTypeId",jobtype.getJobTypeId());
        jobQueryWrapper.between("salary",
                targetPosition.getTargetMinSalary(),targetPosition.getTargetMaxSalary());
        List<Job> jobList = jobMapper.selectList(jobQueryWrapper);
        //判定符合公司规模的职位
        QueryWrapper<Company> companyQueryWrapper = new QueryWrapper<>();
        companyQueryWrapper.between("minStaffNumber",
                targetPosition.getTargetMinstaffNumber(),targetPosition.getTargetMaxstaffNumber());
        companyQueryWrapper.between("maxStaffNumber",
                targetPosition.getTargetMinSalary(),targetPosition.getTargetMaxSalary());
        List<Company> companyList = companyMapper.selectList(companyQueryWrapper);

        ArrayList<Long> companyId = new ArrayList<>();
        for (int i = 0; i < companyList.size(); i++) {
            Company company = companyList.get(i);
            companyId.add(company.getCompanyId());
        }

        List<Job> jobList_1 = new ArrayList<>();
        for (int i = 0;i < jobList.size(); i++) {
            Job job = jobList.get(i);
            if(companyId.contains(job.getCompanyId())){
                jobList_1.add(job);
            }
        }

        List<Job> finalJobList = new ArrayList<>();//最后满足条件的职位
        //判定是否在目标城市的职位
        String city1 = targetPosition.getWorkPlace1();
        String city2 = targetPosition.getWorkPlace2();
        String city3 = targetPosition.getWorkPlace3();
        if(city3!=null||city2!=null||city1!=null){
            List<Job> jobList_2 =new ArrayList<>();
            for (int i = 0; i < jobList_1.size(); i++) {
                Job job = jobList_1.get(i);
                boolean flag = isInThisCity(job.getCityId(),targetPosition);
                if(flag){
                    jobList_2.add(job);
                }
            }

            finalJobList = jobList_2;//最后满足条件的职位
        }else {
            finalJobList = jobList_1;//最后满足条件的职位
        }
        List<ReProAdviceData> RE = reProAdviceDataList(finalJobList);
        return RE;
    }

    public boolean isInThisCity(long cityId,TargetPosition advice){
        QueryWrapper<City> cityQueryWrapper = new QueryWrapper<>();
        String city1 = advice.getWorkPlace1();
        String city2 = advice.getWorkPlace2();
        String city3 = advice.getWorkPlace3();
        cityQueryWrapper.in("cityName",city1,city2,city3);

        List<City> cityList = cityMapper.selectList(cityQueryWrapper);
        ArrayList<Long> cityidList = new ArrayList<>();
        for (int i = 0; i < cityList.size(); i++) {
            City city = cityList.get(i);
            cityidList.add(city.getCityId());
        }
        if(cityidList.contains(cityId)){
            return true;
        }else{
            return false;
        }
    }
    public List<ReProAdviceData> reProAdviceDataList(List<Job> finalJobList){
        List<ReProAdviceData> RE = new ArrayList<>();
        for (int i = 0; i < finalJobList.size(); i++) {
            Job job = finalJobList.get(i);
            ReProAdviceData re = new ReProAdviceData();
            re.setJobName(job.getJobName());
            re.setSalary(job.getSalary());
            re.setMinED(job.getMinEd());
            re.setRequiredSkills(job.getRequiredSkills());
            re.setCityName(ReturnCityName(job.getCityId()));
            List<Object> objectList = ReturnCompany(job.getCompanyId());
            re.setCompanyName((String) objectList.get(0));
            re.setMinStaffNumber((long) objectList.get(1));
            re.setMaxStaffNumber((long) objectList.get(2));
            re.setFinancingSize((String) objectList.get(3));
            RE.add(re);
        }
        return RE;
    }
    public String ReturnCityName(long cityId){
        QueryWrapper<City> cityQueryWrapper = new QueryWrapper<>();
        cityQueryWrapper.eq("cityId",cityId);
        City city = cityMapper.selectOne(cityQueryWrapper);
        return  city.getCityName();
    }
    public List<Object> ReturnCompany(long companyId){
        QueryWrapper<Company> companyQueryWrapper = new QueryWrapper<>();
        companyQueryWrapper.eq("companyId",companyId);
        Company company= companyMapper.selectOne(companyQueryWrapper);
        List<Object> companyList = new ArrayList<>();
        companyList.add(company.getCompanyName());
        companyList.add(company.getMinStaffNumber());
        companyList.add(company.getMaxStaffNumber());
        companyList.add(company.getFinancingSize());
        return  companyList;
    }



}
