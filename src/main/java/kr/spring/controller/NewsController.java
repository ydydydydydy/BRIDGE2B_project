package kr.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Page;
import kr.spring.entity.Criteria;
import kr.spring.entity.PageMaker;
import org.springframework.data.domain.PageRequest;
import kr.spring.entity.tb_company;
import kr.spring.entity.tb_news;
import kr.spring.service.CompanyService;
import kr.spring.service.NewsService;

@Controller
@RequestMapping("/news/*")
public class NewsController {
   
   @Autowired
   private NewsService newsService;
   
   
   @GetMapping("/news")
   public String list(Model model,Pageable pageable, Criteria cri) {
       List<tb_news> list;
       
       
           // 검색어가 없는 경우 전체 목록을 가져옴
           list = newsService.getList();
           Page<tb_news> page = newsService.findPagedData(PageRequest.of(cri.getPage() - 1, cri.getPerPageNum()));
           list = page.getContent();
           PageMaker pageMaker = new PageMaker(cri, newsService.totalCount());
           model.addAttribute("pageMaker", pageMaker);
       
       
       model.addAttribute("list", list);
    
 
       return "news/news";
   } 
   @GetMapping("/detail")
  public @ResponseBody tb_news detail(@RequestParam("newsNum") String newsNum) {
      tb_news newsDetail = newsService.getNews(newsNum);
   return newsDetail;
      
   }


}