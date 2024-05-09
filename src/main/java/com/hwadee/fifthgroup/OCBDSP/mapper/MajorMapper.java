package com.hwadee.fifthgroup.OCBDSP.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hwadee.fifthgroup.OCBDSP.bean.Major;
import org.apache.ibatis.annotations.Select;


public interface MajorMapper extends BaseMapper<Major>{
    @Select("SELECT * from major where majorName = #{majorName}")
    Major selectOneByMajorName(String majorName);

}
