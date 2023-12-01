<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!-- Spring Security 관련 태그라이브러리 -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- 로그인한 계정정보 -->
<c:set var="user" value="${SPRING_SECURITY_CONTEXT.authentication.principal}" />
<!-- 권한정보 -->
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}" />  
<!DOCTYPE html>
<html lang="en">

<head>

<style>
.content_wrapper{
min-height: 400px;
}
:root {
  --background-color: #fff;
  --selection-color: ;
}

html,
body {
  min-height: 100vh;

}



body {
  display: flex;
  flex-direction: column;
  align-items: center;
}

*,
*:before,
*:after {
  box-sizing: inherit;
}

a {
  color: inherit;
  text-decoration: none;
  
}

img,
svg {
  display: block;
  max-width: 100%;
  height: auto;
}

::selection {
  background: var(--selection-color);
  color: white;
  text-shadow: none;
}

:root {
  --background-color: #0B0B3B;
}

body {
  overflow: auto;
}

.wrapper {
    width: 100%;
    max-width: 650px;
    display: flex;
    grid-gap: 20px;
    margin: auto;
    grid-template-columns: repeat(6, 1fr);
    color: white;
    flex-wrap: wrap;
}

.card {
  cursor: pointer;
  overflow: hidden;
  border-radius: 12px;
  background: white;
  margin: 0;
  grid-column: span 3;
  box-shadow: 0 2.8px 2.2px rgba(0, 0, 0, 0.017), 0 6.7px 5.3px rgba(0, 0, 0, 0.024), 0 12.5px 10px rgba(0, 0, 0, 0.03), 0 22.3px 17.9px rgba(0, 0, 0, 0.036), 0 41.8px 33.4px rgba(0, 0, 0, 0.043), 0 100px 80px rgba(0, 0, 0, 0.06);
  height: 190px;
  padding: 20px;
  display: flex;
  justify-content: flex-end;
  flex-direction: column;
  position: relative;
  
}

.card:after {
  content: "";
  display: block;
  width: 50px;
  height: 50px;

  background-repeat: no-repeat;
  background-position: center center;
  background-size: contain;
  position: absolute;
  top: 20px;
  right: 20px;
  transition: 0.3s;
  transition-property: opacity, transform;
  opacity: 1; /* 수정된 부분: 항시로 보이도록 변경 */
  transform: translateY(0); /* 수정된 부분: 항시로 보이도록 변경 */
  border: 1px solid transparent;
}

.card__heading,
.card__text {
  height: 27px;
  width: 100%;
  border-radius: 4px;
  background-color: var(--background-color);
  font-size: 16px;
  padding-left: 6px;
  padding-right: 6px;
  display: flex;
  align-items: center;
  letter-spacing: 1px; /* 글자 간격을 조절할 수 있습니다. */
}

.card__heading {
  opacity: 0.5;
  width: fit-content; /* text 길이에 맞게 크기 조절*/
}

.card__text {
  opacity: 0.8;
  margin-top: 10px;
  
}

.card.is-active {
  grid-row: 1;
  grid-column: 1/span 6;
  height: 200px;
  order: 0;
}
.card.is-active:after {
  opacity: 1;
  transform: translateY(0);
}

.card.is-inactive {
  grid-column: span 2;
}

#mydiv {
  color: inherit;
  text-decoration: none;
  transition: color 0.3s ease; /* 부드러운 전환 효과를 추가할 수 있습니다. */
}

#mydiv:hover {
  background-color: #0B0B61;
  opacity: 1;

}

#mydiv {
  color: inherit;
  text-decoration: none;
  transition: color 0.3s ease; /* 부드러운 전환 효과를 추가할 수 있습니다. */
}

#mydiv:hover {
  background-color: #0B2161;
  opacity: 1;

}

#mydiv2 {
  color: inherit;
  text-decoration: none;
  transition: color 3s ease; /* 부드러운 전환 효과를 추가할 수 있습니다. */
}

#mydiv2:hover {
  background-color: #0B2161;
  font-color: #2E2E2E;
  opacity: 1;

}
#card1 {
  position: relative;
}

#card1::before {
  content: "";
  display: block;
  width: 50px;
  height: 50px;
  background-image: url("data:image/png;base64,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");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: contain;
  position: absolute;
  top: 20px;
  right: 20px;
  transition: 0.3s;
  transition-property: opacity, transform;
  opacity: 1;
  transform: translateY(0);
  border: 1px solid transparent;
}

#card2 {
  position: relative;
}

#card2::before {
  content: "";
  display: block;
  width: 50px;
  height: 50px;
  background-image: url("data:image/png;base64,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");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: contain;
  position: absolute;
  top: 20px;
  right: 20px;
  transition: 0.3s;
  transition-property: opacity, transform;
  opacity: 1;
  transform: translateY(0);
  border: 1px solid transparent;
}

#card3 {
  position: relative;
}

#card3::before {
  content: "";
  display: block;
  width: 50px;
  height: 50px;
  background-image: url("data:image/png;base64,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");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: contain;
  position: absolute;
  top: 20px;
  right: 20px;
  transition: 0.3s;
  transition-property: opacity, transform;
  opacity: 1;
  transform: translateY(0);
  border: 1px solid transparent;
}



</style>
<meta charset="utf-8">
    <title>Bridge To Be</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="${cpath }/resources/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500&family=Jost:wght@500;600;700&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
   
    <!-- Libraries Stylesheet -->
    <link href="${cpath }/resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${cpath }/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${cpath }/resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
   
    <!-- Customized Bootstrap Stylesheet -->
    <link href="${cpath }/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${cpath }/resources/css/style.css" rel="stylesheet">
    
   <link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet">
</head>

<body>
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


    <%@include file="/WEB-INF/header.jsp"%>

             <div class="container-xxl py-5 bg-primary hero-header">
            <div class="container my-5 py-5 px-lg-5">
               <div class="row g-5 py-5">
                  <div class="col-12 text-center">
                     <h1 class="text-white animated slideInDown">회원정보</h1>
                     
                  </div>
               </div>
            </div>
         </div>
      <!-- Navbar & Hero End -->

        <!-- Navbar & Hero End -->

        

        <!-- myPage Start -->

   <div class="content_wrapper" id="mycard">
      <div class='wrapper'>
      
         <div class='card' id="card1" style="width:315px;">
            <div class='card__heading'>${username}</div>
            <div class='card__text'>${userVo.com_name}</div>
         </div>
         
         <div class='card' id="card2" style="width:315px;">
            <div class='card__heading' id="mydiv" >
               <a href="${cpath}/member/update" style="color:#FFFFFF;">수정 페이지로 이동</a>
            </div>
            <div class='card__text' id="mydiv2">
               <a href="#" data-bs-toggle="modal" data-bs-target="#confirmModal" style="color:#A4A4A4" >회원 탈퇴</a>
            </div>
         </div>
         
      <div class='card' id="card3" style="width:650px;">
         <div class='card__heading' id="mydiv"><a href="${cpath}/collaboration/list" style="color:#FFFFFF;">최근 의뢰내역</a></div>
         <c:if test="${not empty request}">
            <div class='card__text' style="color:#FFFFFF;">
            <c:if test="${not empty request}">
             <c:set var="lastIndex" value="${fn:length(request) - 1}" />
             <c:if test="${lastIndex ge 0}">
                 <a href="${cpath}/collaboration/result?req_num=${request[lastIndex].req_num}" style="color:#FFFFFF;">${request[lastIndex].req_keyword}</a>
             </c:if>
         </c:if>
          </div>  
          <div class='card__text'>
                 <c:if test="${fn:length(request[lastIndex].req_content) < 42}">
                    ${request[lastIndex].req_content }
                 </c:if>
                 <c:if test="${fn:length(request[lastIndex].req_content) >= 42}">
                    ${fn:substring(request[lastIndex].req_content, 0, 42)}...
                 </c:if>
           </div>
         </c:if>
         <c:if test="${empty request}">
            <div class='card__text'>신청 내역이 없습니다.</div>
         </c:if>
      </div>
      </div>
   </div>
        <!-- Mypage End -->

   
        
   <!-- 회원 탈퇴 모달 -->
   <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
       <div class="modal-dialog">
           <div class="modal-content">
               <div class="modal-header">
                   <h5 class="modal-title" id="confirmModalLabel">회원 탈퇴 확인</h5>
                   <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body">
                   <p>기존 비밀번호를 입력하세요.</p>
                   <input type="password" id="currentPassword" class="form-control" required>
               </div>
               <div class="modal-footer">
                   <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                   <button type="button" class="btn btn-danger" id="confirmDeleteBtn">회원 탈퇴</button>
               </div>
           </div>
       </div>
   </div>

<%@include file="/WEB-INF/footer.jsp"%>
        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-secondary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>
    

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${cpath }/resources/lib/wow/wow.min.js"></script>
    <script src="${cpath }/resources/lib/easing/easing.min.js"></script>
    <script src="${cpath }/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="${cpath }/resources/lib/counterup/counterup.min.js"></script>
    <script src="${cpath }/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${cpath }/resources/lib/isotope/isotope.pkgd.min.js"></script>
    <script src="${cpath }/resources/lib/lightbox/js/lightbox.min.js"></script>


    <!-- Template Javascript -->
    <script src="${cpath }/resources/js/main.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/gsap.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/Flip.min.js"></script>
   

   <script type="text/javascript">

       $(document).ready(function() {
           // 회원 탈퇴 버튼 클릭 시
           $("#confirmDeleteBtn").click(function() {
               var currentPassword = $("#currentPassword").val();
   
               // Ajax 요청
               $.ajax({
                   type: "POST",
                   url: "${pageContext.request.contextPath}/member/delete",
                   data: { password: currentPassword },
                   success: function(response) {
                      console.log(response);
                       if (response === "success") {
                           alert("회원 탈퇴가 완료되었습니다.");
                           window.location.href = "${pageContext.request.contextPath}/";
                       } else {
                           alert("비밀번호가 일치하지 않습니다. 다시 시도해주세요.");
                       }
                   },
                   error: function() {
                       alert("오류가 발생하였습니다. 다시 시도해주세요.");
                   }
               });
           });
       });
       
       
       gsap.registerPlugin(Flip);

       const activeClass = "is-active";
       const inactiveClass = "is-inactive";
       const cards = document.querySelectorAll(".card");

       cards.forEach((card, idx) => {
           card.addEventListener("click", () => {
               const state = Flip.getState(cards);
               const isCardActive = card.classList.contains(activeClass);

               cards.forEach((otherCard, otherIdx) => {
                   otherCard.classList.remove(activeClass);
                   otherCard.classList.remove(inactiveClass);
                   if (!isCardActive && idx !== otherIdx)
                       otherCard.classList.add(inactiveClass);
               });

               if (!isCardActive) {
                   card.classList.add(activeClass);
               }

               Flip.from(state, {
                   duration: 1,
                   ease: "expo.out",
                   absolute: true
               });
           });
       });
   </script>
   
</body>
</html>