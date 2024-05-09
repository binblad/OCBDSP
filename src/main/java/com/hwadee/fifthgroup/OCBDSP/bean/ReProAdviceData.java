package com.hwadee.fifthgroup.OCBDSP.bean;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Data
@ToString
public class ReProAdviceData {
    String jobName;
    long   salary;
    String requiredSkills;
    String   cityName;
    String   companyName;
    long     minStaffNumber;
    long     maxStaffNumber;
    String financingSize;
    long     minED;

    public String getJobName() {
        return jobName;
    }

    public long getSalary() {
        return salary;
    }

    public String getRequiredSkills() {
        return requiredSkills;
    }

    public String getCityName() {
        return cityName;
    }

    public String getCompanyName() {
        return companyName;
    }

    public long getMinStaffNumber() {
        return minStaffNumber;
    }

    public long getMaxStaffNumber() {
        return maxStaffNumber;
    }

    public void setMinStaffNumber(long minStaffNumber) {
        this.minStaffNumber = minStaffNumber;
    }

    public void setMaxStaffNumber(long maxStaffNumber) {
        this.maxStaffNumber = maxStaffNumber;
    }

    public String getFinancingSize() {
        return financingSize;
    }

    public long getMinED() {
        return minED;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public void setSalary(long salary) {
        this.salary = salary;
    }

    public void setRequiredSkills(String requiredSkills) {
        this.requiredSkills = requiredSkills;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }



    public void setFinancingSize(String financingSize) {
        this.financingSize = financingSize;
    }

    public void setMinED(long minED) {
        this.minED = minED;
    }


}
