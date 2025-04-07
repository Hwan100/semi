package com.kh.semi.service;

import com.kh.semi.mappers.ClassMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClassServiceImpl implements ClassService {

    private final ClassMapper classMapper;

    @Autowired
    public ClassServiceImpl(ClassMapper classMapper) {
        this.classMapper = classMapper;
    }

    @Override
    public int createClass(Class c) {
        return classMapper.insertClass(c);
    }
}
