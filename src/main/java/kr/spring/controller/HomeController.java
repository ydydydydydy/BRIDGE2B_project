package kr.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.entity.tb_news;
import kr.spring.service.NewsService;

@Controller
public class HomeController {
	   @Autowired
	   private NewsService newsService;
	   
	   
	@RequestMapping("/")
	public String index(Model model) {
		 List<tb_news> news = newsService.getList();
	       model.addAttribute("newsVo", news);       
	       // lastIndex를 설정하는 코드 추가 (예: 마지막 인덱스)
	       int lastIndex = news.size() - 1;
	       model.addAttribute("lastIndex", lastIndex);   
		return "index";
	}
	@RequestMapping("/about")
	public String about() {
		return "about";
	}
	
	@RequestMapping("/home")
	public String home() {
		return "index";
	}
//  ajax로 불러오기
   @RequestMapping("/data")
   public String getData() {
       return "main";
   }
   @GetMapping("/home")
   public String list(Model model) {
       List<tb_news> news = newsService.getList();
       model.addAttribute("newsVo", news);       
       // lastIndex를 설정하는 코드 추가 (예: 마지막 인덱스)
       int lastIndex = news.size() - 1;
       model.addAttribute("lastIndex", lastIndex);      
       return "index";
   }
}
