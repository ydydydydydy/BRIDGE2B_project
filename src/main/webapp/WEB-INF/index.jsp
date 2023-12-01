<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!-- Spring Security 관련 태그라이브러리 -->
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<!-- 로그인한 계정정보 -->
<c:set var="user"
   value="${SPRING_SECURITY_CONTEXT.authentication.principal}" />
<!-- 권한정보 -->
<c:set var="auth"
   value="${SPRING_SECURITY_CONTEXT.authentication.authorities}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Bridge To Be</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="resources/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500&family=Jost:wght@500;600;700&display=swap"
   rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
   rel="stylesheet">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
   rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="resources/lib/animate/animate.min.css" rel="stylesheet">
<link href="resources/lib/owlcarousel/assets/owl.carousel.min.css"
   rel="stylesheet">
<link href="resources/lib/lightbox/css/lightbox.min.css"
   rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="resources/css/style.css" rel="stylesheet">

<link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet">

<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<style>
@import
   url('https://fonts.googleapis.com/css?family=Noto+Serif|Playfair+Display|Roboto:300,400,700')
   ;

@import url(https://fonts.googleapis.com/earlyaccess/notosanskr.css);

/* reset.css by hyejin */
*, *:before, *:after {
   box-sizing: border-box;
}

body {
   -webkit-font-smoothing: antialiased;
   -moz-osx-font-smoothing: grayscale;
}

body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, form,
   fieldset, p, button, table, th, td, input {
   margin: 0;
   padding: 0;
}

input, fieldset, img, iframe {
   border: 0;
}

ul, ol {
  display: flex;
  justify-content: center; /* 리스트 아이템을 오른쪽으로 정렬 */
}

a {
   color: inherit;
   text-decoration: none;
   outline: none;
   cursor: pointer;
}

a:hover, a:focus {
   color: inherit;
   text-decoration: none;
}

.hidden {
   display: none !important;
}

button {
   border: none;
   background: none;
   cursor: pointer;
   outline: none;
}

button:disabled, button:disabled:hover {
   cursor: default;
}

/* style */
body {
   background: #000;
}

h1 {
   color: #fff;
}

ul {
   overflow: hidden;
}

li {
   padding: 15px;
   width: 220px
   background: #fff;
   text-align: center;
   list-style-type: none; /* 마커를 비활성화 */
}
}


li:nth-child(2) .card-cover {
   
}

li:nth-child(3) .card-cover {
   
}

li:nth-child(4) .card-cover {

}

.card-header {
  width: 250px;
  height:620px;
  border: 1px solid #848484;
  line-height: 2;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
}

.card-cover {
  width: 100%;
  height: 200px;
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
  transition: transform 0.3s ease; /* 추가: 호버 효과를 자연스럽게 만들기 위한 트랜지션 */

  &:hover {
    transform: scale(1.1); /* 추가: 확대 효과 */
  }
}

.album-info {
   padding: 10px;
}

.album-title {
   font-family: 'GmarketSans', sans-serif;
   color: #0B0B3B;
   font-weight: 600;
   margin-top: 4px;
   margin-bottom:10px;
   height:90px;
}

.album-date {
   font-size: 12px;
   margin-bottom: 8px;
}

::marker {
   display: none;
   
}

</style>
</head>
<body>
   <div class="container-xxl bg-white p-0">
      <!-- Spinner Start -->
      <div id="spinner"
         class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
         <div class="spinner-grow text-primary"
            style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
         </div>
      </div>
      <!-- Spinner End -->

<%@include file="/WEB-INF/header.jsp"%>
   

         <div class="container-xxl bg-primary hero-header" style="
    padding-bottom: 150px;
    padding-top: 150px;
    margin-bottom: 0px;
">
            <div class="container px-lg-5">
               <div class="row g-5 align-items-end">
                  <div class="col-lg-6 text-center text-lg-start">
            
                  </div>
                  <div class="swiper mySwiper">
                     <div class="swiper-wrapper">
                      
                      <div class="swiper-slide" style="background : #0B0B3B; color:#fff;  font-size:1.3em;">
                         <div style="margin: 0px 0px 0px 100px;">
                            <h1 class="text-white mb-4 animated slideInDown">새로운 파트너십을 연결하며 혁신적인<br> 발전을 이끄는 B2B 플랫폼</h1>
                           <p class="text-white pb-3 animated slideInDown"  style="font-size:20px;"> <span class="text-white" style="font-weight:bold;font-size:30px;">BRIDGE2B</span> 와 함께 더 높고 더 멀리, 더 멋진 성장을 함께하세요</p>
                        </div>
                     <div>
                        <img src="resources/img/swiper2.png" style="width:100%; height:100%;  margin: 0px 0px 0px 50px;">
                     </div>
                     </div>
                      <div class="swiper-slide" style="background : #0B0B3B; color:#fff; font-size:1.3em;" >
                       <div style="margin: 0px 0px 0px 50px;">
                          <h1 class="text-white mb-4 animated slideInDown">Special corporate matching <br>B2B services</h1>
                        <p class="text-white pb-3 animated slideInDown"  style="font-size:20px;">B2B 서비스란 기업이 제품이나 서비스를 다른 기업에 판매하거나 다양한 사업적 상호작용을 하는 서비스를 말합니다.</p>
                     </div>
                     <div>
                        <img src="resources/img/b2b.png" style="width:80%; height:80%;  margin: 0px 0px 0px 50px;"></div>
                     </div>
                      
                     </div>
                     <div class="swiper-button-next"></div>
                     <div class="swiper-button-prev"></div>
                     <div class="swiper-pagination"></div>
                   </div>
                   
               
                   
                   <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
               
                   <!-- Initialize Swiper -->
                   <script>
                     var swiper = new Swiper(".mySwiper", {
                       spaceBetween: 30,
                       centeredSlides: true,
                       autoplay: {
                         delay: 5000,
                         disableOnInteraction: false,
                       },
                       pagination: {
                         el: ".swiper-pagination",
                         clickable: true,
                       },
                       navigation: {
                         nextEl: ".swiper-button-next",
                         prevEl: ".swiper-button-prev",
                       },
                     });
               
                   </script>
               <!-- 스와이퍼슬라이드 종료 --> 
               </div>
               
            </div>
         </div>
            <div class="container-xxl py-5">
         <div class="container py-5 px-lg-5">
            <div class="row g-4">
               <div class="col-lg-4" data-wow-delay="0.1s">
                  <div class="feature-item bg-light rounded text-center p-4" style=" height:260px;">
                     <img src="${cpath}/resources/img/collabo.png" style="width: 63px; height:57px;">
                     <br>
                     <br>
                     <h5 class="mb-3">협업하세요</h5>
                     <p class="m-0">우리의 플랫폼은 기업 간 협력의 이점을 파악하여, 회원님의 콜라보레이션에서 시너지를 창출해냅니다. </p>
                  </div>
               </div>
               <div class="col-lg-4 " data-wow-delay="0.3s">
                  <div class="feature-item bg-light rounded text-center p-4"  style=" height:260px;">
                     <i class="fa fa-3x fa-search text-primary mb-4"></i>
                     <h5 class="mb-3">결과를 검색하세요</h5>
                     <p class="m-0">원하는 결과를 검색해보세요. 기업의 이익을 상승시키는 사례를 찾아 검색어에 맞는 검색결과를 한눈에 알려드립니다!</p>
                  </div>
               </div>
               <div class="col-lg-4 " data-wow-delay="0.5s">
                  <div class="feature-item bg-light rounded text-center p-4" style=" height:260px;">
                     <i class="fa fa-3x fa-laptop-code text-primary mb-4"></i>
                     <h5 class="mb-3">원하는 기업을 확인하세요</h5>
                     <p class="m-0">여러분의 기업과 협업을 원하는 기업을 찾아보세요! 다양한 기업 프로필을 살펴보고 목표에 부합하는 파트너 기업을 선택해 성공을 위한 첫걸음을 내딛어보세요.</p>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- Navbar & Hero End -->


      <!-- Feature Start -->
      <div class="container-xxl">
      	<img src="${cpath}/resources/img/b2bmain.png" style="max-width: 100%; height: auto;">
      	</div>
      	
      	
      	       <!-- Facts Start -->
      <div class="container-xxl bg-primary fact py-5 wow fadeInUp"
         data-wow-delay="0.1s" style="visibility: visible;animation-delay: 0.1s;margin-top: 0px;">
         <div class="container py-5 px-lg-5">
            <div class="row g-4">
               <div class="col-md-6 col-lg-3 text-center wow fadeIn"
                  data-wow-delay="0.1s">
                  <i class="fa fa-certificate fa-3x text-secondary mb-3"></i>
                  <h1 class="text-white mb-2" data-toggle="counter-up">30000</h1>
                  <p class="text-white mb-0">30000건 이상의 뉴스데이터</p>
               </div>
               <div class="col-md-6 col-lg-3 text-center wow fadeIn"
                  data-wow-delay="0.3s">
                  <i class="fa fa-users-cog fa-3x text-secondary mb-3"></i>
                  <h1 class="text-white mb-2" data-toggle="counter-up">5</h1>
                  <p class="text-white mb-0">Team Members</p>
               </div>
               <div class="col-md-6 col-lg-3 text-center wow fadeIn"
                  data-wow-delay="0.5s">
                  <i class="fa fa-users fa-3x text-secondary mb-3"></i>
                  <h1 class="text-white mb-2" data-toggle="counter-up">3000</h1>
                  <p class="text-white mb-0">3000건 이상의 기업데이터</p>
               </div>
               <div class="col-md-6 col-lg-3 text-center wow fadeIn"
                  data-wow-delay="0.7s">
                  <i class="fa fa-check fa-3x text-secondary mb-3"></i>
                  <h1 class="text-white mb-2" data-toggle="counter-up">60</h1>
                  <p class="text-white mb-0">1분 안에 결과확인가능</p>
               </div>
            </div>
         </div>
      </div>
      <!-- Facts End -->
      	
      	
      	
      	 <div class="container-xxl">
         <img src="${cpath}/resources/img/main1.png" style="width: 1200px; display: block; margin: 0 auto;">
         <img src="${cpath}/resources/img/main2.png" style="width: 1200px; display: block; margin: 0 auto;">
         <img src="${cpath}/resources/img/main3.png" style="width: 1200px; display: block; margin: 0 auto;">
      </div>          
      <!-- Feature End -->

      
      <h1><li style="font-size: 33px; padding:0px; margin-top: 50px; text-align: center; color:#0B0B3B;">
      최근  주목할  news
      </li>
      </h1>
<ul>
       <li>
           <div class="card-header" style="background-color:#FFFFFF; border-radius: 0px 0px 0 0; border-bottom: 1px solid #000000;">
               <div class="card-cover" id="dynamicImage4" style="background-image: url('https://www.bigkinds.or.kr/resources/images/${newsVo[lastIndex].news_id}/${newsVo[lastIndex].news_date}/${newsVo[lastIndex].news_num}.01.jpg');">
                  
               </div>
               <div class="album-info">
                   <p class="album-title">
                       <c:out value="${newsVo[lastIndex].news_title}" />
                   </p>
                   <p class="album-date">
                       <c:set var="content" value="${newsVo[lastIndex].news_content}" />
                       <c:choose>
                           <c:when test="${fn:length(content) > 200}">
                               <c:set var="shortenedContent" value="${fn:substring(content, 0, 200)}" />
                               <c:out value="${shortenedContent} ..." />
                               <!-- 추가적인 스타일이나 더 많은 내용을 표시할 수 있도록 처리 -->
                           </c:when>
                           <c:otherwise>
                               <c:out value="${content}" />
                           </c:otherwise>
                       </c:choose>
                   </p>
               </div>
           </div>
       </li>
       
       <li>
        <div class="card-header" style="background-color:#FFFFFF; border-radius: 0px 0px 0 0; border-bottom: 1px solid #000000;">
            <div class="card-cover"  style="background-image: url('https://www.bigkinds.or.kr/resources/images/${newsVo[lastIndex-1].news_id}/${newsVo[lastIndex-1].news_date}/${newsVo[lastIndex-1].news_num}.01.jpg');">
            </div>
            <div class="album-info">
                <p class="album-title">
                    <c:out value="${newsVo[lastIndex-1].news_title}" />
                </p>
                <p class="album-date">
                    <c:set var="content" value="${newsVo[lastIndex-1].news_content}" />
                    <c:choose>
                        <c:when test="${fn:length(content) > 200}">
                            <c:set var="shortenedContent" value="${fn:substring(content, 0, 200)}" />
                            <c:out value="${shortenedContent} ..." />
                        </c:when>
                        <c:otherwise>
                            <c:out value="${content}" />
                        </c:otherwise>
                    </c:choose>
                </p>
            </div>
        </div>
       </li>
      <li>
        <div class="card-header" style="background-color:#FFFFFF; border-radius: 0px 0px 0 0; border-bottom: 1px solid #000000;">
           <div class="card-cover"  style="background-image: url('https://www.bigkinds.or.kr/resources/images/${newsVo[lastIndex-2].news_id}/${newsVo[lastIndex-2].news_date}/${newsVo[lastIndex-2].news_num}.01.jpg');">
            </div>
            <div class="album-info">
                <p class="album-title">
                    <c:out value="${newsVo[lastIndex-2].news_title}" />
                </p>
                <p class="album-date">
                    <c:set var="content" value="${newsVo[lastIndex-2].news_content}" />
                    <c:choose>
                        <c:when test="${fn:length(content) > 200}">
                            <c:set var="shortenedContent" value="${fn:substring(content, 0, 200)}" />
                            <c:out value="${shortenedContent} ..." />
                        </c:when>
                        <c:otherwise>
                            <c:out value="${content}" />
                        </c:otherwise>
                    </c:choose>
                </p>
            </div>
        </div>
       </li>
       <li>
        <div class="card-header" style="background-color:#FFFFFF; border-radius: 0px 0px 0 0; border-bottom: 1px solid #000000;">
            <div class="card-cover"  style="background-image: url('https://www.bigkinds.or.kr/resources/images/${newsVo[lastIndex-3].news_id}/${newsVo[lastIndex-3].news_date}/${newsVo[lastIndex-3].news_num}.01.jpg');">
            </div>
            <div class="album-info">
                <p class="album-title">
                    <c:out value="${newsVo[lastIndex-3].news_title}" />
                </p>
                <p class="album-date">
                    <c:set var="content" value="${newsVo[lastIndex-3].news_content}" />
                    <c:choose>
                        <c:when test="${fn:length(content) > 200}">
                            <c:set var="shortenedContent" value="${fn:substring(content, 0, 200)}" />
                            <c:out value="${shortenedContent} ..." />
                        </c:when>
                        <c:otherwise>
                            <c:out value="${content}" />
                        </c:otherwise>
                    </c:choose>
                </p>
            </div>
        </div>
       </li>
</ul>

     


      
      <!-- Testimonial End -->


      


      


      <!-- Back to Top -->
      <a href="#" class="btn btn-lg btn-secondary btn-lg-square back-to-top"><i
         class="bi bi-arrow-up"></i></a>
<%@include file="/WEB-INF/footer.jsp"%>
   </div>
   <!-- JavaScript Libraries -->
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
   <script src="resources/lib/wow/wow.min.js"></script>
   <script src="resources/lib/easing/easing.min.js"></script>
   <script src="resources/lib/waypoints/waypoints.min.js"></script>
   <script src="resources/lib/counterup/counterup.min.js"></script>
   <script src="resources/lib/owlcarousel/owl.carousel.min.js"></script>
   <script src="resources/lib/isotope/isotope.pkgd.min.js"></script>
   <script src="resources/lib/lightbox/js/lightbox.min.js"></script>

   <!-- Template Javascript -->
   <script src="resources/js/main.js"></script>
   
        
      <!-- Swiper JS -->
       <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
   
       <!-- Initialize Swiper -->
      
   
</body>
</html>