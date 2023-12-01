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
import kr.spring.service.CompanyService;

@Controller
@RequestMapping("/company/*")
public class CompanyController {
   
   @Autowired
   private CompanyService companyService;
   
   
   
   @GetMapping("/list")
   public String list(Model model, @RequestParam(required = false) String companyName,Pageable pageable, Criteria cri) {
       List<tb_company> list;
       
       if (companyName != null && !companyName.isEmpty()) {
           // 검색어가 전달된 경우 검색 결과를 가져옴
           list = companyService.searchByCompanyName(companyName);
       } else {
           // 검색어가 없는 경우 전체 목록을 가져옴
           list = companyService.getList();
          
       }
       
       model.addAttribute("list", list);
       model.addAttribute("companyName", companyName); // 검색어를 다시 전달하여 검색어 표시
 
       return "company/list";
   } 
  


}