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
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Bridge To Be</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500&family=Jost:wght@500;600;700&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
<%--     <link href="${cpath}/resources/lib/animate/animate.min.css" rel="stylesheet"> --%>
    <link href="${cpath}/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${cpath}/resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${cpath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${cpath}/resources/css/style.css" rel="stylesheet">
    
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

        <!-- Navbar & Hero Start -->
        <div class="container-xxl py-5 bg-primary hero-header">
            <div class="container my-5 py-5 px-lg-5">
               <div class="row g-5 py-5">
                  <div class="col-12 text-center">
                     <h1 class="text-white animated slideInDown">의뢰내역</h1>
                     <hr class="bg-white mx-auto mt-0" style="width: 90px;">
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center">
                           <li class="breadcrumb-item"><a class="text-white" href="#">Request details</a></li>
                        </ol>
                     </nav>
                  </div>
               </div>
            </div>
         </div>
        <!-- Navbar & Hero End -->


   
                 <div class="container-xxl py-5">
                     <div class="container py-5 px-lg-5">
                       <div class="wow fadeInUp" data-wow-delay="0.1s">
                             <p class="section-title text-secondary justify-content-center"><span></span>request details
                             <span></span></p>
                             <h1 class="text-center mb-5">나의 의뢰 내역</h1>
                         </div>
                         <br>
                                                 
                   
                   
                   <div class="wrapper_card">
                    <div class="cols_card">
                    <c:choose>
                     <c:when test="${empty req_list}">
                <p>의뢰내역이 없습니다.</p>
            </c:when>
            <c:otherwise>
                       <c:forEach var="vo" items="${req_list}" varStatus="i">
                       
                         <div class="col_card" ontouchstart="this.classList.toggle('hover');"  data-reqat="${vo.req_at}" data-reqnum="${vo.req_num}" 
         data-reqkeyword="${vo.req_keyword}" data-content="${vo.req_content}">
                           <div class="container_card">
                             <div class="front_card">
                             
                           <div class="inner_card">
                                 <p>${vo.req_keyword}</p>
                                 <span><fmt:formatDate value="${vo.req_at}" pattern="yyyy-MM-dd"/></span>
                               </div> 
                             </div>
                             <div class="back_card">
                               <div class="inner_card">
                                 <div class="portfolio-overlay">
                                   <c:if test="${fn:length(vo.req_content) < 100}">
                                <p>${vo.req_content}</p>
                             </c:if>
                             <c:if test="${fn:length(vo.req_content) >= 100}">
                                <p> ${fn:substring(vo.req_content, 0, 100)}...</p>
                             </c:if>
                                 </div>
                               </div>
                             </div>
                           </div>
                         </div>
                       
                       </c:forEach>
                        </c:otherwise>
        </c:choose>
                    </div>
               </div>

                  </div>
                   </div>  
                 
             
                
        <!-- 모달부분 -->
        <div class="modal" id="myModal">
        <div class="modal-dialog">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">${msgType}</h4>
              <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
      
            <!-- Modal body -->
          
            <div class="modal-body">
              ${msg}
            </div>
      
            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
            </div>
      
          </div>
        </div>
       </div> 
                      
             
             <!-- 수정한 카드틀 -->
             
                
            
        
        <!-- Service End -->

        

        <%@include file="/WEB-INF/footer.jsp"%>


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-secondary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${cpath}/resources/lib/wow/wow.min.js"></script>
    <script src="${cpath}/resources/lib/easing/easing.min.js"></script>
    <script src="${cpath}/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="${cpath}/resources/lib/counterup/counterup.min.js"></script>
    <script src="${cpath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${cpath}/resources/lib/isotope/isotope.pkgd.min.js"></script>
    <script src="${cpath}/resources/lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="${cpath}/resources/js/main.js"></script>
   <script>
    $('.col_card').click(function () {
        var reqat = $(this).data('reqat');
        var reqnum = $(this).data('reqnum');
        var reqkeyword = $(this).data('reqkeyword');
        var content = $(this).data('content');

        openModal(reqat, reqnum, reqkeyword, content);
    });

    function openModal(reqat, reqnum, reqkeyword, content) {
    	
    	 // 날짜 문자열을 Date 객체로 변환
        var date = new Date(reqat);

        // 시간 부분을 00:00:00으로 설정하여 날짜만 남기기
        date.setHours(0, 0, 0, 0);

        // 날짜를 원하는 형식으로 변환 (예: YYYY년 MM월 DD일)
        var formattedDate = date.toLocaleDateString('ko-KR', {
            year: 'numeric',
            month: 'long',
            day: 'numeric'
        });
    	
    	
    	
        $('#myModal .modal-body').html(
            "<p><strong>날짜:</strong> " + formattedDate  + " </p>" +
            "<p><strong>의뢰내용:</strong> " + content + " </p>"
            // 필요한 데이터를 모달에 추가해주세요.
        );

        $('#myModal').data('reqnum', reqnum);
        $("#myModal").modal("show");
    }

    $('#myModal').on('hidden.bs.modal', function () {
        var req_num = $(this).data('reqnum');
        console.log(req_num);
        window.location = '${cpath}/collaboration/result?req_num=' + req_num;
    });
</script>
</body>

</html>