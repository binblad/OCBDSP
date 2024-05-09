package com.hwadee.fifthgroup.OCBDSP.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpHeaders;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


/**
 * @author king
 * @date 2024/4/8 11:35
 * @desc 前端相关配置
 */
@Configuration
public class WebConfig implements WebMvcConfigurer {
    /**
     * 处理映射地址的跨域请求问题
     */
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowCredentials(true)
//                .allowedOriginPatterns("*")
                .allowedOriginPatterns("http://localhost:5173", "http://localhost:5174")
//                .allowedOrigins("http://localhost:5173")
                .allowedMethods("*")
                .allowedHeaders("*")
                .exposedHeaders(HttpHeaders.SET_COOKIE)
                .maxAge(6000L);
    }

}
