package com.kh.semi.service;

import com.kh.semi.domain.vo.Certificate;

import java.util.List;

public interface CertificateService {

    List<Certificate>  selectCertificateList(int userNo);
}
