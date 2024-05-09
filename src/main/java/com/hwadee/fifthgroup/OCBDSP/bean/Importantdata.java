package com.hwadee.fifthgroup.OCBDSP.bean;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@TableName("importantdata")
@Data
@ToString
@NoArgsConstructor
public class Importantdata {
  @TableId
  private long regionId;
  private long jobTypeId;
  private String regionName;
  private long perSalary;
  private long jobNum;


  public long getRegionId() {
    return regionId;
  }

  public void setRegionId(long regionId) {
    this.regionId = regionId;
  }


  public long getJobTypeId() {
    return jobTypeId;
  }

  public void setJobTypeId(long jobTypeId) {
    this.jobTypeId = jobTypeId;
  }


  public String getRegionName() {
    return regionName;
  }

  public void setRegionName(String regionName) {
    this.regionName = regionName;
  }


  public long getPerSalary() {
    return perSalary;
  }

  public void setPerSalary(long perSalary) {
    this.perSalary = perSalary;
  }


  public long getJobNum() {
    return jobNum;
  }

  public void setJobNum(long jobNum) {
    this.jobNum = jobNum;
  }

}
