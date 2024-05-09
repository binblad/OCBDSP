package com.hwadee.fifthgroup.OCBDSP.bean;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@TableName("company")
@Data
@ToString
@NoArgsConstructor
public class Company {
  @TableId
  private long companyId;
  private String companyName;
  private long minStaffNumber;
  private long maxStaffNumber;
  private String financingSize;


  public long getCompanyId() {
    return companyId;
  }

  public void setCompanyId(long companyId) {
    this.companyId = companyId;
  }


  public String getCompanyName() {
    return companyName;
  }

  public void setCompanyName(String companyName) {
    this.companyName = companyName;
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

  public void setFinancingSize(String financingSize) {
    this.financingSize = financingSize;
  }

}
