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
<meta charset="UTF-8">
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
<style>
.conpx {
   display: flex;
   flex-direction: column;
   align-items: center;
   text-align: center;
}


.bordered-div {
   border: 2px solid #333; /* 테두리의 두께와 색상을 설정합니다. */
   padding: 10px; /* 내용과 테두리 간격을 조절합니다. */
   border-radius:4px;
   
}

.label-style {
   margin-top: 10px;
   color: #848484; /* 폰트 색상을 파란색으로 설정합니다. */
   font-weight: 3px; /* 폰트를 굵게 설정합니다. (선택 사항) */
   border-radius:3px;
   padding:5px;
}

#modify {
   border:none;
   margin-top:7px;
   background-color:#2D316C;
   border: 1px solid #2D316C;
   color:white;
   border-radius:5px;
   line-height: 25px;
   padding-top: 4px;
   transition: background-color 0.3s ease, box-shadow 0.3s ease; /* 부드러운 변화를 위한 transition */
}

#modify:hover {
   background-color:#5858FA;
   border: 3px solid #CEECF5;
}
   
</style>
</head>

<body>
   <div class="container container-xxl bg-white p-0">
     
 

       
       
      <%@include file="/WEB-INF/header.jsp"%>

            
             <div class="container-xxl py-5 bg-primary hero-header">
            <div class="container my-5 py-5 px-lg-5">
               <div class="row g-5 py-5">
                  <div class="col-12 text-center">
                     <h1 class="text-white animated slideInDown">회원정보 수정</h1>
                     
                  </div>
               </div>
            </div>
         </div>
          <!-- Navbar & Hero End -->
        
        
        <!-- update start -->
            <div class="container-xxl py-5">
               <div class="container py-5 px-lg-5 conpx">
                  <div class="wow fadeInUp" data-wow-delay="0.1s">
                     <p class="section-title text-secondary justify-content-center">
                     </p>
                   
                   
                  </div>

   <div class="bordered-div" >
    <form action="${cpath}/member/update" method="post" style="margin:20px;">
       <input type="hidden" value="${userVo.username}" name="username">
       <input type="hidden" value="${userVo.bno}" name="bno">
       <input type="hidden" value="${userVo.industry}" name="industry">
       <input type="hidden" value="${userVo.com_name}" name="com_name">
        <label for="username" class="label-style">아이디:</label>
        <label for="username" class="label-style" style="border: 1px solid #A4A4A4;">${userVo.username}</label>
        <!-- readonly 속성을 추가하여 수정 불가능하게 만듭니다. -->
        <br>
        <br>
        <!-- 비밀번호 수정폼 -->
      <label for="password">비밀번호 : </label>
      <input type="password" id="password" name="password" required>
      <br>
      <br>
      <!-- 비밀번호 확인 입력란 및 메시지 표시 -->
      <label for="passwordConfirm">비밀번호 확인 : </label>
      <input type="password" id="passwordConfirm" name="passwordConfirm" oninput="passwordCheck()" required>
      <p id="passMessage" style="color:red;"></p>
    
        <input type="submit" value="  수정  " id="modify" >
    </form>
    </div>
    
    <br>
    <a href="${cpath}/member/mypage" style="color:#FAAC58; text-decoration: underline; font-size:15px; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);">마이페이지로 돌아가기</a>
               </div>
            </div>



        
        <!-- update end -->
          <%@include file="/WEB-INF/footer.jsp"%>

        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-secondary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>
    
   </div>
   
   
    <!-- Modal -->
     <div class="modal fade" id="myModal" role="dialog">
       <div class="modal-dialog">
         <!-- Modal content-->
         <div id="checkType" class="modal-content">
           <div class="modal-header panel-heading">
             <button type="button" class="close" data-dismiss="modal">&times;</button>
             <h4 class="modal-title">메세지 확인</h4>
           </div>
           <div class="modal-body">
             <p id="checkMessage"></p>
           </div>
           <div class="modal-footer">
             <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
           </div>
         </div>
       </div>
     </div>
  
   
      <!-- 회원가입 실패시 띄워줄 모달 -->
     <div class="modal fade" id="myMessage" role="dialog">
       <div class="modal-dialog">
         <!-- Modal content-->
         <div id="messageType" class="modal-content">
           <div class="modal-header panel-heading">
             <button type="button" class="close" data-dismiss="modal">&times;</button>
             <h4 class="modal-title">${msgType}</h4>
           </div>
           <div class="modal-body">
             <p id="">${msg}</p>
           </div>
           <div class="modal-footer">
             <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
           </div>
         </div>
       </div>
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
          
   <script type="text/javascript">
   
   function passwordCheck() {
       var memPassword = $("#password").val();
       var memPasswordConfirm = $("#passwordConfirm").val();

       if (memPassword !== memPasswordConfirm) {
           $("#passMessage").html("비밀번호가 서로 일치하지 않습니다.");
       } else {
           $("#passMessage").html("");
       }
   }
      
      $(document).ready(function(){
         if(${not empty msgType}){
            if(${msgType eq "실패메세지"}){
               $("#messageType").attr("class","modal-content panel-warning");
            }
            $("#myMessage").modal("show");
         }
         
      });
      
      
      
   
   </script>
   
</body>
</html>