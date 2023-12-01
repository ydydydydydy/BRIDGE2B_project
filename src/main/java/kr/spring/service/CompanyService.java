package kr.spring.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kr.spring.entity.Criteria;
import kr.spring.entity.tb_company;

public interface CompanyService {
	
    List<tb_company> getList(); // 게시글 전체조회

    List<tb_company> searchByCompanyName(String companyName); // 기업명으로 검색
    
	public long totalCount();



}