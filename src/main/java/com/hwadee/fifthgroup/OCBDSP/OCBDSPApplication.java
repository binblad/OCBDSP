package com.hwadee.fifthgroup.OCBDSP;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.hwadee.fifthgroup.OCBDSP.mapper")
public class OCBDSPApplication {

    public static void main(String[] args) {
        SpringApplication.run(OCBDSPApplication.class, args);
    }

}
