package com.hwadee.fifthgroup.OCBDSP.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.hwadee.fifthgroup.OCBDSP.bean.Major;
import org.apache.ibatis.annotations.Select;

public interface MajorService extends IService<Major> {
    @Select("select * from major where majorName = #{majorName}")
    Major getByMajorName(String majorName);
}
