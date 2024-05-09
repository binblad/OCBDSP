package com.hwadee.fifthgroup.OCBDSP.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hwadee.fifthgroup.OCBDSP.bean.Api;
import com.hwadee.fifthgroup.OCBDSP.bean.Datasource;
import com.hwadee.fifthgroup.OCBDSP.mapper.ApiMapper;
import com.hwadee.fifthgroup.OCBDSP.service.DatasourceService;
import com.hwadee.fifthgroup.OCBDSP.mapper.DatasourceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* @author thhhh
* @description 针对表【datasource】的数据库操作Service实现
* @createDate 2024-04-27 10:19:38
*/
@Service
public class DatasourceServiceImpl extends ServiceImpl<DatasourceMapper, Datasource>
    implements DatasourceService{
    @Autowired
    DatasourceMapper datasourceMapper;
    @Override
    public IPage<Datasource> datasourceIPageGet(int current, int size){
        Page<Datasource> page = new Page<>(current, size);
        return datasourceMapper.selectPage(page,null);
    }
}




