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
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500&family=Jost:wght@500;600;700&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${cpath}/resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${cpath}/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${cpath}/resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${cpath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${cpath}/resources/css/style.css" rel="stylesheet">
	<link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet">
    <script
            type="text/javascript"
            src="https://code.jquery.com/jquery-1.12.4.min.js"
    ></script>
    <!-- iamport.payment.js -->
    <script
            type="text/javascript"
            src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"
    ></script>
    <script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
<style>
.blurry-section {
    filter: blur(15px);
}

#market_pre{
width:100%;
overflow-x:hidden;
overflow-y:auto;
 white-space: pre-wrap; /* 줄 바꿈 허용 */
 font-family: "GmarketSans";
 font-size:17px;
}
 
</style> 

    
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
                            <h1 class="text-white animated slideInDown">Solution</h1>
                            <hr class="bg-white mx-auto mt-0" style="width: 90px;">
                            <nav aria-label="breadcrumb">
                              <ol class="breadcrumb justify-content-center">
                           <li class="breadcrumb-item"><a class="text-white" href="#">Trend</a></li>
                           <li class="breadcrumb-item"><a class="text-white" href="#">Recommend</a></li>
                        </ol>
                             
                                
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
  
        <!-- Navbar & Hero End -->
  <div class="container-xxl py-5">
            <div class="container py-5 px-lg-5">
                     <h6 style="color:#A4A4A4; text-align: center;">${req_content.req_keyword}</h6>
             <div class="wow fadeInUp" data-wow-delay="0.1s">
                    <p class="section-title text-secondary justify-content-center"><span></span>Trend<span></span></p>
                   </div>
                <br>
                <div class="row g-4" >
                        <div class="col-lg-4 wow fadeInUp" data-wow-delay="0.1s"style="width: 100%;">
                        <div class="feature-item bg-light rounded text-center p-4" >
                   
                            <pre id="market_pre"class="mb-3"> ${result_list[0].marketing_cases} </pre>
                         
                        </div>
                       </div>
                </div>
            </div>
        </div>

      

   <div class="blurry-section">
    <!-- 블러 처리할 내용 -->
        <!-- About Start -->
        <div class="container-xxl py-5" >
            <div class="container py-5 px-lg-5">
                <div class="row g-5 align-items-center">
                    <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                        <p class="section-title text-secondary">Recommend industry<span></span></p>
                        <h1 class="mb-5">추천 업종</h1>
                        <p class="mb-4" style="color:#A4A4A4;">AI 매칭을 통한 추천 업종은 고객의 요구사항과 기업의 서비스를 인공지능이 분석하여, 최적화된 세 가지 업종을 추천합니다</p>
                        
                        <c:forEach var="vo" items="${result_list}" varStatus="i">
                        <div class="skill mb-4">
                            <%-- <div class="d-flex justify-content-between">
                                <p class="mb-2">${vo.reco_industry }</p>
                            </div> --%>
                              <%-- <div class="progress">
                           <c:if test="${i.index % 2 == 0}">
                              <div class="progress-bar bg-primary" role="progressbar" aria-valuenow="7" aria-valuemin="0" aria-valuemax="100"></div>
                          </c:if>
                          <c:if test="${i.index % 2 != 0}">
                              <div class="progress-bar bg-secondary" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                          </c:if> 
                            </div> --%>
                        </div>
                        
                    
                         <p class="mb-2" >${vo.reco_industry} : ${vo.sol_content }</p>  
                  
                    	
                    
                    </c:forEach>
                    </div>
<div class="col-lg-6">
                        <img class="img-fluid wow zoomIn" data-wow-delay="0.5s" src="${cpath}/resources/img/about.png">
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->
        </div>
<input type="hidden" id="username" value="${user.username}"/>

        <button type="button" id="paymentButton" onclick="KGpay()" class="btn btn-primary py-sm-3 px-sm-5 rounded-pill mt-3" style="display: block; margin: 0 auto;" >결제하기</button>
<div class="blurry-section">
       <!-- Feature Start -->
        <div class="container-xxl py-5">
            <div class="container py-5 px-lg-5">
             <div class="wow fadeInUp" data-wow-delay="0.1s">
                    <p class="section-title text-secondary justify-content-center"><span></span>RECOMMEND SUMMARY<span></span></p>
                   </div>
                <br>
                <div class="row g-4">
                    <c:forEach var="vo" items="${result_list}" varStatus="i">
                        <div class="col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="feature-item bg-light rounded text-center p-4" onclick="scrollToTeamSection(event,${i.index})"data-company1="${vo.company1}"
             data-company2="${vo.company2}"
             data-company3="${vo.company3}"
             data-industry="${vo.reco_industry}"
             data-marketingstrategy="${vo.marketing_strategy }"
             data-solution1="${vo.sol_content}"
             >
                        <%-- <div id="company1" data-companies="${result_list[i.index].company1}"></div>
                        <div id="company2" data-companies="${result_list[i.index].company2}"></div>
                        <div id="company3" data-companies="${result_list[i.index].company3}"></div> --%>
                            <i class="fa fa-3x fa-search text-primary mb-4"></i>
                            <h5 class="mb-3">추천업종: ${vo.reco_industry } </h5>
                           <p class="mb-3">${vo.marketing_strategy }</p>
                            <input type="hidden" id="req_num" value="${vo.req_num.req_num}" />
                         <i class="bi bi-hand-index-thumb" style="font-size:25px;"></i>
                        </div>
                       </div>
                   </c:forEach>
                </div>
            </div>
        </div>
        <!-- Feature End -->
        

        <!-- Team Start -->
        <div class="container-xxl py-5" id="team-section">
            <div class="container py-5 px-lg-5">
                <div class="wow fadeInUp" data-wow-delay="0.1s">
                    <p class="section-title text-secondary justify-content-center"id="title_name"><span></span>RECOMMEND LIST<span></span></p>
                    <h1 class="text-center mb-5">추천 기업</h1>
                </div>
                <br>
                <div class="row g-4">
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="team-item bg-light rounded">
                            <div class="text-center border-bottom p-4">
                               
                                <h5 id="company">${result_list[0].company1}</h5>
                                <span></span>
                            </div>
                            
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="team-item bg-light rounded">
                            <div class="text-center border-bottom p-4">
                              
                                <h5 id="company_2">${result_list[0].company2}</h5>
                                <span></span>
                            </div>
                           
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="team-item bg-light rounded">
                            <div class="text-center border-bottom p-4">
                               
                                <h5 id="company_3">${result_list[0].company3}</h5>
                               <span></span>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Team End -->
    </div> 

        
<%@include file="/WEB-INF/footer.jsp"%>


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-secondary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>
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
    
    <script type="text/javascript">
    
    $(document).ready(function() {
        var is_paid = ${is_paid}; // 여기에 is_paid의 상태를 가져와 설정하세요.
		console.log(is_paid);
        // is_paid가 true이면 블러 효과 제거
        if (is_paid) {
            $('.blurry-section').removeClass('blurry-section');
            $('#paymentButton').hide();
        }
    });
         
       function scrollToTeamSection(event,idx) {
           // team-section 섹션으로 스크롤
            const clickedElement = event.currentTarget;
		    const company1 = clickedElement.dataset.company1;
		    const company2 = clickedElement.dataset.company2;
		    const company3 = clickedElement.dataset.company3;
		    const industry = clickedElement.dataset.industry;
           
		  
			$('#company').html(company1);
			$('#company_2').html(company2);
			$('#company_3').html(company3);
			$('#company_3').html(company3);
			$('#title_name').html("<span></span><span></span>"+industry+"<span></span><span></span>");
           
			// team-section 섹션으로 스크롤
		    document.getElementById('team-section').scrollIntoView({
		        behavior: 'smooth'
		    });
       }
       
       
       
       function KGpay(username){
           var IMP = window.IMP;
           IMP.init("imp22805075");
           var username = document.getElementById('username').value;

           IMP.request_pay({
                  pg : 'html5_inicis',
                  pay_method : 'card',
                  merchant_uid: username+'_'+new Date().getTime(),
                  name :'Bridge To Be 유료서비스',
                  amount : 100,
                  buyer_email : username,
                  buyer_name : username
              }, function(rsp) {
                  if (rsp.success) {
                      $.ajax({
                          url: "${cpath}/collaboration/payment",
                          type: 'POST',
                          data: {"req_num": `${req_content.req_num}`},
                          success: function (data) {
                             alert(data);
                              var msg = '결제가 완료되었습니다.';
                              msg += '\n고유ID : ' + rsp.imp_uid;
                              msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                              msg += '\결제 금액 : ' + rsp.paid_amount;
                              msg += '카드 승인번호 : ' + rsp.apply_num;
   
                              alert(msg);
                        location.reload();
                          },
                          error: function(error) {
                             alert("전송실패"+error);
                              console.log("결제 정보 전송 실패", error);
                          }
                      });
                  } else {
                      var msg = '결제에 실패하였습니다.';
                      msg += "\n" + rsp.error_msg;
   
                      alert(msg);
                  }
              }
          );
       }
    </script>
    
</body>

</html>