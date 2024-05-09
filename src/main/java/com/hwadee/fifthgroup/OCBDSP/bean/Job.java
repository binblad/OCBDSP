package com.hwadee.fifthgroup.OCBDSP.bean;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@TableName("job")
@Data
@ToString
@NoArgsConstructor
public class Job {
  @TableId
  private long jobId;
  private long jobTypeId;
  private long cityId;
  private long companyId;
  private String jobName;
  private long minEd;
  private int salary;
  private String requiredSkills;


  public long getJobId() {
    return jobId;
  }

  public void setJobId(long jobId) {
    this.jobId = jobId;
  }


  public long getJobTypeId() {
    return jobTypeId;
  }

  public void setJobTypeId(long jobTypeId) {
    this.jobTypeId = jobTypeId;
  }


  public long getCityId() {
    return cityId;
  }

  public void setCityId(long cityId) {
    this.cityId = cityId;
  }


  public long getCompanyId() {
    return companyId;
  }

  public void setCompanyId(long companyId) {
    this.companyId = companyId;
  }


  public String getJobName() {
    return jobName;
  }

  public void setJobName(String jobName) {
    this.jobName = jobName;
  }


  public long getMinEd() {
    return minEd;
  }

  public void setMinEd(long minEd) {
    this.minEd = minEd;
  }


  public int getSalary() {
    return salary;
  }

  public void setSalary(int salary) {
    this.salary = salary;
  }


  public String getRequiredSkills() {
    return requiredSkills;
  }

  public void setRequiredSkills(String requiredSkills) {
    this.requiredSkills = requiredSkills;
  }

}
