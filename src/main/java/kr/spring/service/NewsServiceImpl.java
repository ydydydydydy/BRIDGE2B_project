package kr.spring.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kr.spring.entity.Criteria;
import kr.spring.entity.tb_company;
import kr.spring.entity.tb_news;
import kr.spring.repository.NewsRepository;

@Service
public class NewsServiceImpl implements NewsService {

    @Autowired
    private NewsRepository NewsRepository;

    @Override
    public List<tb_news> getList() {
        return NewsRepository.findAll();
    }

   
    
    @Override
    public long totalCount() {
        return NewsRepository.count();
    }

    @Override
    public List<tb_news> getList(Criteria cri) {
        Pageable pageable = PageRequest.of(cri.getPage() - 1, cri.getPerPageNum()); // 페이지 번호를 0부터 시작하므로 1을 빼줌
        Page<tb_news> page = NewsRepository.findAll(pageable);
        return page.getContent(); // getContent()로 실제 데이터를 가져옴
    }

	@Override
	public Page<tb_news> findPagedData(Pageable pageable) {
		// TODO Auto-generated method stub
		return  NewsRepository.findAll(pageable);
	}
	 @Override
	   public tb_news getNews(String newsNum) {
	      return NewsRepository.findById(newsNum).get();
	   }
    
    
}