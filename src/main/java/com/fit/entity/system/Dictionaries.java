package com.fit.entity.system;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 数据字典实体类
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Dictionaries {

    private String DICTIONARIES_ID;     //主键
    private String NAME;                //名称
    private String NAME_EN;             //英文名称
    private String BIANMA;              //编码
    private String ORDER_BY;            //排序
    private String PARENT_ID;           //上级ID
    private String BZ;                  //备注
    private String TBSNAME;             //关联表
    private String target;
    private Dictionaries dict;
    private List<Dictionaries> subDict;
    private boolean hasDict = false;
    private String treeurl;
}
