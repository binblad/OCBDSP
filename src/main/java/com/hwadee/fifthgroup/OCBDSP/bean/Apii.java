package com.hwadee.fifthgroup.OCBDSP.bean;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

/**
 * 
 * @TableName apii
 */
@TableName(value ="apii")
public class Apii implements Serializable {
    /**
     * API的唯一标识符
     */
    @TableId(type = IdType.AUTO)
    private Integer apiid;

    /**
     * API的URL地址
     */
    private String url;

    /**
     * 请求的内容或参数
     */
    private String requestcontent;

    /**
     * 响应的内容或格式
     */
    private String responsecontent;

    /**
     * 其他相关信息或描述
     */
    private String content;

    /**
     * 调用次数或相关数值
     */
    private Integer times;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /**
     * API的唯一标识符
     */
    public Integer getApiid() {
        return apiid;
    }

    /**
     * API的唯一标识符
     */
    public void setApiid(Integer apiid) {
        this.apiid = apiid;
    }

    /**
     * API的URL地址
     */
    public String getUrl() {
        return url;
    }

    /**
     * API的URL地址
     */
    public void setUrl(String url) {
        this.url = url;
    }

    /**
     * 请求的内容或参数
     */
    public String getRequestcontent() {
        return requestcontent;
    }

    /**
     * 请求的内容或参数
     */
    public void setRequestcontent(String requestcontent) {
        this.requestcontent = requestcontent;
    }

    /**
     * 响应的内容或格式
     */
    public String getResponsecontent() {
        return responsecontent;
    }

    /**
     * 响应的内容或格式
     */
    public void setResponsecontent(String responsecontent) {
        this.responsecontent = responsecontent;
    }

    /**
     * 其他相关信息或描述
     */
    public String getContent() {
        return content;
    }

    /**
     * 其他相关信息或描述
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * 调用次数或相关数值
     */
    public Integer getTimes() {
        return times;
    }

    /**
     * 调用次数或相关数值
     */
    public void setTimes(Integer times) {
        this.times = times;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        Apii other = (Apii) that;
        return (this.getApiid() == null ? other.getApiid() == null : this.getApiid().equals(other.getApiid()))
            && (this.getUrl() == null ? other.getUrl() == null : this.getUrl().equals(other.getUrl()))
            && (this.getRequestcontent() == null ? other.getRequestcontent() == null : this.getRequestcontent().equals(other.getRequestcontent()))
            && (this.getResponsecontent() == null ? other.getResponsecontent() == null : this.getResponsecontent().equals(other.getResponsecontent()))
            && (this.getContent() == null ? other.getContent() == null : this.getContent().equals(other.getContent()))
            && (this.getTimes() == null ? other.getTimes() == null : this.getTimes().equals(other.getTimes()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getApiid() == null) ? 0 : getApiid().hashCode());
        result = prime * result + ((getUrl() == null) ? 0 : getUrl().hashCode());
        result = prime * result + ((getRequestcontent() == null) ? 0 : getRequestcontent().hashCode());
        result = prime * result + ((getResponsecontent() == null) ? 0 : getResponsecontent().hashCode());
        result = prime * result + ((getContent() == null) ? 0 : getContent().hashCode());
        result = prime * result + ((getTimes() == null) ? 0 : getTimes().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", apiid=").append(apiid);
        sb.append(", url=").append(url);
        sb.append(", requestcontent=").append(requestcontent);
        sb.append(", responsecontent=").append(responsecontent);
        sb.append(", content=").append(content);
        sb.append(", times=").append(times);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}