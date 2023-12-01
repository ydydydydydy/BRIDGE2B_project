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
<link href="${cpath}/resources/css/style.css" rel="stylesheet">
<link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet">
</head>
<body>
<!-- Footer Start -->
		<div class="container-fluid bg-primary text-light footer wow fadeIn"
			data-wow-delay="0.1s">
			<div class="container py-5 px-lg-5">
				<div class="row g-5">
					<div class="col-md-6 col-lg-3">
						<p class="section-title text-white h5 mb-4">
							Address<span></span>
						</p>
						<p>
							<i class="fa fa-map-marker-alt me-3"></i>광주광역시 동구 제봉로 92
						</p>
						<p>
							<i class="fa fa-phone-alt me-3"></i>+062 213 4567
						</p>
						<p>
							<i class="fa fa-envelope me-3"></i>admin@naver.com
						</p>
						
					</div>
					<div class="col-md-6 col-lg-3">
						<p class="section-title text-white h5 mb-4">
							Quick Link<span></span>
						</p>
						<a href="${cpath}/news/news" class="btn btn-link">뉴스룸</a>
                  <a href="${cpath}/company/list" class="btn btn-link">기업리스트</a>
                  <a href="${cpath}/collaboration/request" class="btn btn-link">의뢰하기</a>
                  <a href="${cpath}/collaboration/list" class="btn btn-link">의뢰 내역</a>
						
					</div>
					<div class="col-md-6 col-lg-3">
						<p class="section-title text-white h5 mb-4">
							Gallery<span></span>
						</p>
						<div class="row g-2">
							<div class="col-4">
								<img class="img-fluid" src="${cpath}/resources/img/portfolio-9.jpg"
									alt="Image">
							</div>
							<div class="col-4">
								<img class="img-fluid" src="${cpath}/resources/img/portfolio-7.jpg"
									alt="Image">
							</div>
							<div class="col-4">
								<img class="img-fluid" src="${cpath}/resources/img/portfolio-3.jpg"
									alt="Image">
							</div>
							<div class="col-4">
								<img class="img-fluid" src="${cpath}/resources/img/portfolio-4.jpg"
									alt="Image">
							</div>
							<div class="col-4">
								<img class="img-fluid" src="${cpath}/resources/img/portfolio-10.jpg"
									alt="Image">
							</div>
							<div class="col-4">
								<img class="img-fluid" src="${cpath}/resources/img/portfolio-12.jpg"
									alt="Image">
							</div>
						</div>
					</div>
					
				</div>
			</div>
			<div class="container px-lg-5">
				<div class="copyright">
					<div class="row">
						<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
							&copy; <a class="border-bottom" href="#">Bridge To Be</a>, All
							Right Reserved.

							<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
							Designed By <a class="border-bottom" href="https://htmlcodex.com">ApengMa</a><br>
							
						</div>
						<div class="col-md-6 text-center text-md-end">
							<div class="footer-menu">
								<a href="">Home</a><a href="">Help</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer End -->
</body>
</html>