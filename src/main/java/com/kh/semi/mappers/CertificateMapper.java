package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Certificate;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CertificateMapper {

    List<Certificate> selectCertificateList(int userNo);
}
