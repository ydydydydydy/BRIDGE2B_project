package kr.spring.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kr.spring.entity.Criteria;
import kr.spring.entity.tb_company;
import kr.spring.entity.tb_news;

public interface NewsService {
	
    List<tb_news> getList(); // 게시글 전체조회

    
	public long totalCount();

	public List<tb_news> getList(Criteria cri);

	public Page<tb_news> findPagedData(Pageable pageable);
	
	public tb_news getNews(String newsNum);	
}