package com.hwadee.fifthgroup.OCBDSP.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.hwadee.fifthgroup.OCBDSP.bean.Datasource;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author thhhh
* @description 针对表【datasource】的数据库操作Service
* @createDate 2024-04-27 10:19:38
*/
public interface DatasourceService extends IService<Datasource> {
    IPage<Datasource> datasourceIPageGet(int current, int size);
}
