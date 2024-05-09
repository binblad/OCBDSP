package com.hwadee.fifthgroup.OCBDSP.bean;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@TableName("jobtype")
@Data
@ToString
@NoArgsConstructor
public class Jobtype {
  @TableId
  private long jobTypeId;
  private String typeName;


  public long getJobTypeId() {
    return jobTypeId;
  }

  public void setJobTypeId(long jobTypeId) {
    this.jobTypeId = jobTypeId;
  }


  public String getTypeName() {
    return typeName;
  }

  public void setTypeName(String typeName) {
    this.typeName = typeName;
  }

}
