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
    <link href="${cpath}/resources/img/favicon.ico" rel="icon">

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
    <style>
    @import url("https://rsms.me/inter/inter.css");
:root {
   --color-light: white;
   --color-dark: #212121;
   --color-signal: #fab700;
   --color-text: var(--color-dark);
   --color-accent: var(--color-signal);
   --size-bezel: .5rem;
   --size-radius: 4px;
   line-height: 1.4;
   font-family: 'Inter', sans-serif;
   font-size: calc(.6rem + .4vw);
   color: var(--color-text);
   background: var(--color-background);
   font-weight: 300;
   padding: 0 calc(var(--size-bezel) * 3);
}

h1, h2, h3 {
   font-weight: 900;
}

mark {
   background: var(--color-accent);
   color: var(--color-text);
   font-weight: bold;
   padding: 0 0.2em;
}

.card {
   background: var(--color-background);
   padding: calc(4 * var(--size-bezel));
   margin-top: calc(4 * var(--size-bezel));
   border-radius: var(--size-radius);
   border: 3px solid var(--color-shadow, currentColor);
   box-shadow: 0.5rem 0.5rem 0 var(--color-shadow, currentColor);
}

.card--inverted {
   --color-background: var(--color-dark);
   color: var(--color-light);
   --color-shadow: var(--color-accent);
}

.card--accent {
   --color-background: var(--color-signal);
   --color-accent: var(--color-light);
   color: var(--color-dark);
}

.card *:first-child {
   margin-top: 0;
}
/* 
.l-design-widht {
   max-width: 40rem;
   padding: 1rem;
} */

.input {

   position: relative;
    width: 600px;
}

.input__label {
   position: absolute;
   left: 0;
   top: 0;
   padding: calc(var(--size-bezel) * 0.95) calc(var(--size-bezel) * .5);
   margin: calc(var(--size-bezel) * 0.85 + 4px) calc(var(--size-bezel) * .5);
   background: pink;
   white-space: nowrap;
   transform: translate(0, 0);
   transform-origin: 0 0;
   background: var(--color-background);
   transition: transform 120ms ease-in;
   font-weight: bold;
   line-height: 1;
   opacity: .6;
}

.input__field {
   box-sizing: border-box;
   display: block;
   width: 100%;
   border: 2.5px solid currentColor;
   padding: calc(var(--size-bezel) ) var(--size-bezel);
   color: currentColor;
   background: transparent;
   border-radius: var(--size-radius);
}

.input__field:focus + .input__label, .input__field:not(:placeholder-shown) + .input__label {
   transform: translate(0.25rem, -92%) scale(0.9);
   color: var(--color-accent);
}

.hidden {
   display: none;
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
                            <h1 class="text-white animated slideInDown">기업리스트</h1>
                            <hr class="bg-white mx-auto mt-0" style="width: 90px;">
                            <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center">
                           <li class="breadcrumb-item"><a class="text-white" href="#">Enterprise</a></li>
                        </ol>
                     </nav>
                        </div>
                    </div>
                </div>
            </div>
        
        <!-- Navbar & Hero End -->


        <!-- Projects Start -->
        <div class="container-xxl py-5">
            <div class="container py-5 px-lg-5">
                <div class="wow fadeInUp" data-wow-delay="0.1s">
                    <p class="section-title text-secondary justify-content-center"><span></span>Enterprise<span></span></p>
                    <h1 class="text-center mb-5">Our Enterprise</h1>
                </div>
                <div class="row mt-n2 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="col-12 text-center">
                        <ul class="list-inline mb-5" id="portfolio-flters">
                            <li class="mx-2 active" data-filter="*">All</li>
                            <li class="mx-2" data-filter=".first">제조</li>
                            <li class="mx-2" data-filter=".second">전문·과학및기술서비스</li>
                            <li class="mx-2" data-filter=".third">금융·보험</li>
                            <li class="mx-2" data-filter=".four">교육서비스</li>
                            <li class="mx-2" data-filter=".five">도매·소매</li>
                            <br>
                            <li class="mx-2" data-filter=".six">숙박·음식점</li>
                            <li class="mx-2" data-filter=".seven">사업시설관리·사업지원및임대서비스</li>
                            <li class="mx-2" data-filter=".eight">정보통신</li>
                            <li class="mx-2" data-filter=".nine">광업</li>
                            <li class="mx-2" data-filter=".ten">운수·창고</li>
                     
                        </ul>
              <br>
                 <!-- 기업검색 -->
						<form onsubmit="searchCompanies(); return false;" style="margin-bottom: 20px; display: flex; align-items: center;">
    <label class="input" style="flex: 1;">
        <input class="input__field" type="text" id="companySearch" name="companyName" placeholder=" ">
        <span class="input__label">기업 이름을 입력하세요</span>
    </label>
    <button type="submit" class="btn btn-primary" style="margin-left: 5px; padding: 3px 8px;">검색</button>
    <button id="resetSearch" class="btn btn-primary" style="margin-left: 5px; padding: 3px 8px;">초기화</button>
</form>



					</div>
                </div>
                
                
                <div class="row g-4 portfolio-container">

               <c:forEach var="vo" items="${list}" varStatus="i">
                  <c:set var="portfolioClass" value="" />
                  <c:set var="portfolioImage" value="" />
                  <c:choose>
                     <c:when test="${vo.industry == '제조'}">
                        <c:set var="portfolioClass" value="first" />
                        <c:set var="portfolioImage" value="portfolio-6.jpg" />
                     </c:when>
                     <c:when test="${vo.industry == '전문·과학및기술서비스'}">
                        <c:set var="portfolioClass" value="second" />
                        <c:set var="portfolioImage" value="portfolio-2.jpg" />
                     </c:when>
                     <c:when test="${vo.industry == '금융·보험'}">
                        <c:set var="portfolioClass" value="third" />
                        <c:set var="portfolioImage" value="portfolio-3.jpg" />
                     </c:when>
                     <c:when test="${vo.industry == '교육서비스'}">
                        <c:set var="portfolioClass" value="four" />
                        <c:set var="portfolioImage" value="portfolio-1.jpg" />
                     </c:when>
                     <c:when test="${vo.industry == '도매·소매'}">
                        <c:set var="portfolioClass" value="five" />
                        <c:set var="portfolioImage" value="portfolio-5.jpg" />
                     </c:when>
                     <c:when test="${vo.industry == '숙박·음식점'}">
                        <c:set var="portfolioClass" value="six" />
                        <c:set var="portfolioImage" value="portfolio-12.jpg" />
                     </c:when>
                     <c:when test="${vo.industry == '사업시설관리·사업지원및임대서비스'}">
                        <c:set var="portfolioClass" value="seven" />
                        <c:set var="portfolioImage" value="portfolio-7.jpg" />
                     </c:when>
                     <c:when test="${vo.industry == '정보통신'}">
                        <c:set var="portfolioClass" value="eight" />
                        <c:set var="portfolioImage" value="portfolio-4.jpg" />
                     </c:when>
                     <c:when test="${vo.industry == '광업'}">
                        <c:set var="portfolioClass" value="nine" />
                        <c:set var="portfolioImage" value="portfolio-9.jpg" />
                     </c:when>
                     <c:when test="${vo.industry == '운수·창고'}">
                        <c:set var="portfolioClass" value="ten" />
                        <c:set var="portfolioImage" value="portfolio-10.jpg" />
                     </c:when>
                     
                     <c:when test="${vo.industry == '전기·가스·증기·공기조절공급'}">
                        <c:set var="portfolioClass" value="ten2" />
                        <c:set var="portfolioImage" value="portfolio-4.jpg" />
                     </c:when>
                     
                  </c:choose>
                  <!-- 나머지 산업 분야에 대한 설정 추가 -->
                  <!-- ... -->
                  <c:set var="portfolioItemHTML">
                     <c:if test="${not empty portfolioClass}">
                        <div
                           class="col-lg-4 col-md-6 portfolio-item ${portfolioClass} fadeInUp">
                           <div class="rounded overflow-hidden">
                              <div class="position-relative overflow-hidden">
                                 <img class="img-fluid w-100" style="width: 100%; height: 280px; object-fit: cover;"
                                    src="${cpath}/resources/img/${portfolioImage}" alt="">
                                 <div class="portfolio-overlay">
                                    <a
                                       class="btn btn-square btn-outline-light mx-1" href=""
                                       data-industry="${vo.industry}"
                                       data-company="${vo.com_name}" data-addr="${vo.com_addr}"
                                       data-scale="${vo.com_type}"><i class="fa fa-eye"></i></a>
                                 </div>
                              </div>

                              <div class="bg-light p-4">
                                 <p class="text-primary fw-medium mb-2">${vo.industry}</p>
                                 <h5 class="lh-base mb-0">${vo.com_name}</h5>
                              </div>
                           </div>
                        </div>
                     </c:if>
                  </c:set>

             ${portfolioItemHTML}
               </c:forEach>

               
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
             <div id="map" style="width: 100%; height: 400px;"></div>
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
     
        <!-- Projects End -->


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
<script src="${cpath}/resources/js/main.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6d222eefd3278a8d9470378244c58b31&libraries=services"></script>
<script>
window.onload = function() {
    // 페이지 로드 시, 검색어 초기화
    document.getElementById('companySearch').value = '';

 // 초기화 버튼 클릭 시, 검색어 초기화
    resetSearch.addEventListener('click', function() {
        companySearch.value = '';
    });
};
$(document).ready(function() {
    var mapVisible = false;
    var map; // 전역 변수로 맵 객체 선언
    var infowindow; // 전역 변수로 인포윈도우 객체 선언

    $('.btn-square').on('click', function(e) {
        e.preventDefault();
        var industry = $(this).data('industry');
        var companyName = $(this).data('company');
        var addr = $(this).data('addr');
        var scale = $(this).data('scale');

        $('#myModal .modal-title').text(companyName);
        $('#myModal .modal-body').html(
            "<p><strong>Industry:</strong> " + industry + " </p>" +
            "<p><strong>Addr:</strong> " + addr + " </p>" +
            "<p><strong>com_type:</strong> " + scale + " </p>"
        );

        $('#myModal').modal('show');

        if (!map) { // 맵 객체가 없는 경우에만 새로 생성
            var container = document.getElementById('map');
            var options = {
                center: new kakao.maps.LatLng(33.450701, 126.570667),
                level: 3
            };

            map = new kakao.maps.Map(container, options);
        }

        var geocoder = new kakao.maps.services.Geocoder();
        geocoder.addressSearch(addr, function(result, status) {
            try {
                if (status === kakao.maps.services.Status.OK && result.length > 0) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords
                    });

                    if (!infowindow) {
                        infowindow = new kakao.maps.InfoWindow({
                            content: '<div style="width:150px;text-align:center;padding:6px;font-size:13px;">'+companyName+'</div>'
                        });
                    } else {
                        infowindow.close(); // 이미 열린 인포윈도우가 있으면 닫음
                        infowindow = new kakao.maps.InfoWindow({
                            content: '<div style="width:150px;text-align:center;padding:6px;font-size:13px;">'+companyName+'</div>'
                        });
                    }

                    infowindow.open(map, marker);
                    map.setCenter(coords);

                    if (!mapVisible) {
                        document.getElementById('map').style.display = 'block';
                        mapVisible = true;
                    }
                } else {
                    console.log('해당 주소를 찾을 수 없습니다.');
                    document.getElementById('map').style.display = 'none';
                    mapVisible = false;
                }
            } catch (error) {
                console.error('좌표를 가져올 수 없습니다.', error);
                console.log('result:', result); // result 배열의 내용을 출력
                document.getElementById('map').style.display = 'none';
                mapVisible = false;
            }
        });

    });
});
let timer;

document.addEventListener('input', e => {
  const el = e.target;

  if( el.matches('[data-color]') ) {
    clearTimeout(timer);
    timer = setTimeout(() => {
      document.documentElement.style.setProperty(`--color-${el.dataset.color}`, el.value);
    }, 100)
  }
});

</script>


</body>

</html>