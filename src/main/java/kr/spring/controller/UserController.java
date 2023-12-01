package kr.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.spring.entity.CustomUser;
import kr.spring.entity.tb_request;
import kr.spring.entity.tb_user;
import kr.spring.service.CollaborationService;
import kr.spring.service.UserService;

@Controller
@RequestMapping("/member/*")
public class UserController {
   
   @Autowired
   private UserService userService;
   
   @Autowired
   private CollaborationService collaborationService;
   
   @PostMapping("/join")
   public String join(tb_user vo, RedirectAttributes rttr, HttpSession session) {
	  userService.join(vo);
      rttr.addFlashAttribute("msgType", "성공메세지");
      rttr.addFlashAttribute("msg", "회원가입에 성공했습니다.");
      return "redirect:/member/login";
   }
   
   @GetMapping("/login")
   public String login(tb_user vo) {
      return "member/login";
   }
   
   @GetMapping("/join")
   public String join() {
      return "member/join";
   }
   
   @RequestMapping("/registerCheck")
   public @ResponseBody boolean registerCheck(String username) {
      return userService.select(username);
   
   }
   @GetMapping("/mypage")
   public String mypage(tb_user vo, Model model) {
      Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
      String username = authentication.getName(); // 현재 로그인한 사용자의 username
      List<tb_request> requestList = collaborationService.getRequestsByUsername(username);
      model.addAttribute("request", requestList);
      
      tb_user user= userService.getList(username);
      model.addAttribute("userVo", user);
      System.out.println(user);
      model.addAttribute("username", username);
      return "member/mypage";
   }
   
   @PostMapping("/update")
   public String update(tb_user vo, RedirectAttributes rttr, HttpSession session) {
     userService.update(vo);
      return "redirect:/member/mypage";
   }
   
   @GetMapping("/update")
   public String updateForm(Model model) {
       tb_user authenticatedUser = getAuthenticatedUser();
       model.addAttribute("userVo", authenticatedUser);
       return "member/update";
   }
   
   private tb_user getAuthenticatedUser() {
       Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
       if (authentication != null && authentication.getPrincipal() instanceof CustomUser) {
           CustomUser customUser = (CustomUser) authentication.getPrincipal();
           return customUser.getMember();
       }
       return null;
   }
   
   @PostMapping("/delete")
   public @ResponseBody String delete(@RequestParam("password") String password, Model model, RedirectAttributes rttr) {
       Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
       String username = authentication.getName(); // 현재 로그인한 사용자의 username

       // 비밀번호 확인
       int check = userService.checkPassword(username, password);

       if (check == 1) { 
          userService.delete(username);
          SecurityContextHolder.getContext().setAuthentication(null);
          return "success";
       }else {
          return "fail";
       }
       
   }

}