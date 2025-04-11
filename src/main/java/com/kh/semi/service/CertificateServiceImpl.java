package com.kh.semi.service;

import com.kh.semi.domain.vo.Certificate;
import com.kh.semi.mappers.CertificateMapper;
import com.kh.semi.mappers.LeaveMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CertificateServiceImpl implements CertificateService {

    private final CertificateMapper certificateMapper;

    public CertificateServiceImpl(CertificateMapper certificateMapper, LeaveMapper leaveMapper) {
        this.certificateMapper = certificateMapper;
    }

    @Override
    public List<Certificate> selectCertificateList(int userNo) {
        return certificateMapper.selectCertificateList(userNo);
    }
}
