package com.kh.semi.mappers;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ClassMapper {
    int insertClass(Class c);
}
