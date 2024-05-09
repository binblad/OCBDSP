package com.hwadee.fifthgroup.OCBDSP.bean;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@TableName("apikey")
@Data
@ToString
@NoArgsConstructor
public class Apikey {
  @TableId
  private long keyId;
  private long appId;
  private long apiId;



  public long getKeyId() {
    return keyId;
  }

  public void setKeyId(long keyId) {
    this.keyId = keyId;
  }


  public long getAppId() {
    return appId;
  }

  public void setAppId(long appId) {
    this.appId = appId;
  }


  public long getApiId() {
    return apiId;
  }

  public void setApiId(long apiId) {
    this.apiId = apiId;
  }

}
