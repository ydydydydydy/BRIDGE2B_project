<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="cpath" value="${pageContext.request.contextPath}" />
<!-- Spring Security 관련 태그라이브러리 -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- 로그인한 계정정보 -->
<c:set var="user" value="${SPRING_SECURITY_CONTEXT.authentication.principal}" />
<!-- 권한정보 -->
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bridge To Be</title>
<!-- Template Stylesheet -->
<link href="${cpath}/resources/css/style.css" rel="stylesheet">
<link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet">
<style>
.navsize{
   height:100px;
}

</style>
</head>
<body>
   <!-- Navbar & Hero Start -->
      <div class="container-xxl position-relative p-0">
         <nav
            class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0 navsize">
            <a href="${cpath}/home" class="navbar-brand p-0">
               <img src="${cpath}/resources/img/logo.png" alt="Logo" >
            </a>
            <button class="navbar-toggler" type="button"
               data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
               <span class="fa fa-bars"></span>
            </button>


            <div class="collapse navbar-collapse" id="navbarCollapse">
               <div class="navbar-nav mx-auto py-0">
                  <a href="${cpath}/news/news" class="nav-item nav-link">뉴스룸</a>
                  <a href="${cpath}/company/list" class="nav-item nav-link">기업리스트</a>
                  <a href="${cpath}/collaboration/request" class="nav-item nav-link">의뢰하기</a>
                  <a href="${cpath}/collaboration/list" class="nav-item nav-link">의뢰 내역</a>
                  </div>
                  
               </div>
               <c:if test="${empty user}">
                  <a href="${cpath}/member/login"
                     class="btn rounded-pill py-2 px-4 ms-3 d-none d-lg-block">Log
                     in</a>
               </c:if>
               <c:if test="${not empty user}">
               <div class="navbar-nav ">
                  <a href="${cpath}/member/mypage" class="nav-link"
                     style=" text-decoration: none; display: flex; flex-direction: column; align-items: center; margin-right:0; ">
                     <i class="bi bi-person-circle" style="font-size: 24px;margin-bottom: -2px; "></i> <span
                     style="font-size: 9px;">회원정보</span>
                  </a>
               </div>
                  <form action="${cpath}/member/logout">
                     <button type="submit"
                        class="btn rounded-pill py-2 px-4 ms-3 d-none d-lg-block">Log
                        out</button>
                  </form>
                  
               </c:if>
            </div>
         </nav>
</body>
</html>