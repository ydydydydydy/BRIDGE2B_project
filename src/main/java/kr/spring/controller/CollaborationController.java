          package kr.spring.controller;

import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.entity.tb_request;
import kr.spring.entity.tb_solution;
import kr.spring.service.CollaborationService;

@Controller
@RequestMapping("/collaboration/*")
public class CollaborationController {
   
   @Autowired
   private CollaborationService collaborationService;
   
      
   @RequestMapping("/request")
   public String request() {
      return "collaboration/request";
   }

   @PostMapping("/request")
   public @ResponseBody String request(tb_request vo,Model model) {
	   collaborationService.request(vo);
	   Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	      String username = authentication.getName(); // 현재 로그인한 사용자의 username
	      Long req_num = collaborationService.findLargestPostNumberByUsername(username);
      model.addAttribute("req_num", req_num);
     System.out.println(req_num);
      return String.valueOf(req_num);
   }
   
   @RequestMapping("/list")
   public String getList(Model model) { // 게시글 전체조회 
      Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
      String username = authentication.getName(); // 현재 로그인한 사용자의 username
      
      List<tb_request> list = collaborationService.getList(username);
      model.addAttribute("req_list", list);
      return "collaboration/req_list";
   }
   
   @RequestMapping("/result")
   public String result(@RequestParam("req_num") tb_request req_num, Model model) {
      List<tb_solution> list = collaborationService.getSolList(req_num);
      tb_request req_content = collaborationService.getReqContent(req_num.getReq_num());
      model.addAttribute("is_paid",req_content.is_paid());
      model.addAttribute("result_list", list);
      model.addAttribute("req_content", req_content);
      return "collaboration/result";
   }
   
   @RequestMapping("/payment")
   public @ResponseBody String payment(@RequestParam("req_num") Long req_num){
      tb_request request = collaborationService.getReqContent(req_num);
      if (request != null) {
         request.set_paid(true);
         collaborationService.request(request);
         return "success";
      }else {
         return "fail";
      }
   }
   
   @RequestMapping("/remove")
   public @ResponseBody void remove(@RequestParam("req_num") String req_num) {
      Long requestId = Long.parseLong(req_num);
      collaborationService.remove(requestId);
   }
   
   @RequestMapping("/modify")
   public @ResponseBody void modify(@RequestParam("req_num") tb_request req_num, @RequestParam("caseData") String caseData) {
      System.out.println(req_num);
      collaborationService.modify(req_num, caseData);
   }
   
}