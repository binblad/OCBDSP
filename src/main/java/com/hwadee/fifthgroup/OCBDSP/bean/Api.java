package com.hwadee.fifthgroup.OCBDSP.bean;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@TableName("api")
@Data
@ToString
@NoArgsConstructor
public class Api {
  @TableId
  private long apiId;
  private String url;
  private String requestContent;
  private String responseContent;
  private String content;
  private long times;


  public long getApiId() {
    return apiId;
  }

  public void setApiId(long apiId) {
    this.apiId = apiId;
  }


  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }


  public String getRequestContent() {
    return requestContent;
  }

  public void setRequestContent(String requestContent) {
    this.requestContent = requestContent;
  }


  public String getResponseContent() {
    return responseContent;
  }

  public void setResponseContent(String responseContent) {
    this.responseContent = responseContent;
  }


  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }


  public long getTimes() {
    return times;
  }

  public void setTimes(long times) {
    this.times = times;
  }

}
