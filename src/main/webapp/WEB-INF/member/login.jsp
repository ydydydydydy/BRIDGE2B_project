<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bridge To Be</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<style >
@import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');

* {
  box-sizing: border-box;
}

body {
  background: #f6f5f7;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  font-family: 'Montserrat', sans-serif;
  height: 100vh;
  margin: -20px 0 50px;
}

h1 {
  font-weight: bold;
  margin: 0;
}

h2 {
  text-align: center;
}

p {
  font-size: 14px;
  font-weight: 100;
  line-height: 20px;
  letter-spacing: 0.5px;
  margin: 20px 0 30px;
}

span {
  font-size: 12px;
}

a {
  color: #333;
  font-size: 14px;
  text-decoration: none;
  margin: 15px 0;
}

button {
  border-radius: 20px;
  border: 1px solid #fc9a07;
  background-color: #fc9a07;
  color: #000000;
  font-size: 12px;
  font-weight: bold;
  padding: 12px 45px;
  letter-spacing: 1px;
  text-transform: uppercase;
  transition: transform 80ms ease-in;
}

button:active {
  transform: scale(0.95);
}

button:focus {
  outline: none;
}

button.ghost {
  background-color: #fc9a07;
  border: 2px solid #FFFFFF;
  color: #000000;
}

button.ghost:hover {
  background-color: #FF8000;
  border: 2px solid #FFFFFF;
  color: #000000;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
}

#UserButton {
  background-color: #0B0B3B;
  color: #FFFFFF;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
}

#UserButton:hover {
  background-color: #FFA500; /* 예시로 주황색 배경색을 사용합니다. */
  color: #000000; /* 예시로 흰색 텍스트 색상을 사용합니다. */
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* 그림자 효과를 추가할 수도 있습니다. */
}

form {
  background-color: #FFFFFF;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  padding: 0 50px;
  height: 100%;
  text-align: center;
}

input {
  background-color: #F2F2F2;
  border: 1px solid #BDBDBD;
  border-radius: 5px;
  padding: 12px 15px;
  margin: 8px 0;
  width: 100%;
  
}

input:hover {
  background-color: #D8D8D8;
  color: #000000;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
}

.container {
  background-color: #fff;
  border-radius: 10px;
    box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
      0 10px 10px rgba(0,0,0,0.22);
  position: relative;
  overflow: hidden;
  width: 950px;
  max-width: 100%;
  min-height: 640px;
}

.form-container {
  position: absolute;
  top: 0;
  height: 100%;
  transition: all 0.6s ease-in-out;
}

.sign-in-container {
  left: 0;
  width: 50%;
  z-index: 2;
}

.container.right-panel-active .sign-in-container {
  transform: translateX(100%);
}

.sign-up-container {
  left: 0;
  width: 50%;
  opacity: 0;
  z-index: 1;
}

.container.right-panel-active .sign-up-container {
  transform: translateX(100%);
  opacity: 1;
  z-index: 5;
  animation: show 0.6s;
}

@keyframes show {
  0%, 49.99% {
    opacity: 0;
    z-index: 1;
  }
  
  50%, 100% {
    opacity: 1;
    z-index: 5;
  }
}

.overlay-container {
  position: absolute;
  top: 0;
  left: 50%;
  width: 50%;
  height: 100%;
  overflow: hidden;
  transition: transform 0.6s ease-in-out;
  z-index: 100;
}

.container.right-panel-active .overlay-container{
  transform: translateX(-100%);
}

.overlay {
  background: #FF416C;
  background: -webkit-linear-gradient(to right, #0B0B3B, #FF416C);
  background: linear-gradient(to right, #A4A4A4, #0B0B3B);
  background-repeat: no-repeat;
  background-size: cover;
  background-position: 0 0;
  color: #FFFFFF;
  position: relative;
  left: -100%;
  height: 100%;
  width: 200%;
    transform: translateX(0);
  transition: transform 0.6s ease-in-out;
}

.container.right-panel-active .overlay {
    transform: translateX(50%);
}

.overlay-panel {
  position: absolute;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  padding: 0 40px;
  text-align: center;
  top: 0;
  height: 100%;
  width: 50%;
  transform: translateX(0);
  transition: transform 0.6s ease-in-out;
}

.overlay-left {
  transform: translateX(-20%);
}

.container.right-panel-active .overlay-left {
  transform: translateX(0);
}

.overlay-right {
  right: 0;
  transform: translateX(0);
}

.container.right-panel-active .overlay-right {
  transform: translateX(20%);
}

.social-container {
  margin: 20px 0;
}

.social-container a {
  border: 1px solid #DDDDDD;
  border-radius: 50%;
  display: inline-flex;
  justify-content: center;
  align-items: center;
  margin: 0 5px;
  height: 40px;
  width: 40px;
}

footer {
    background-color: #222;
    color: #fff;
    font-size: 14px;
    bottom: 0;
    position: fixed;
    left: 0;
    right: 0;
    text-align: center;
    z-index: 999;
}

footer p {
    margin: 10px 0;
}

footer i {
    color: red;
}

footer a {
    color: #3c97bf;
    text-decoration: none;
}

.fadeIn.fourth {
  border: none;
  background-color: #fc9a07;
  border-radius: 20px;
  border: 3px solid #ffffff;
  font-family: 'Montserrat';
  font-weight: bold;
}

.fadeIn.fourth:hover {
  background-color: #FF8000;
  color: #000000;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
  font-weight: bold;
}

.modal-dialog {
  display: flex;
  justify-content: center; /* 가로로 가운데 정렬 */
  align-items: center; /* 세로로 가운데 정렬 */
  height: 80vh; /* 화면 높이만큼 모달을 중앙에 배치합니다. */
}

.modal-title {
  color: #000000; /* 텍스트 색상 설정 */
  padding: 10px; /* 내부 여백 설정 */
  font-size: 17px;
}

.form-select.error-border {
        
        border-color:red;
} 
#bno{
   margin-right: 10px;
   width:60%;
}
#bnoBtn{

   width:150px;
   height:45px;
}
.form-select {
    --bs-form-select-bg-icon: none;
    /* 다른 원하지 않는 스타일을 변경할 수 있습니다. */
}
</style>
<title>Insert title here</title>
</head>

<body>
        <!-- Navbar & Hero Start -->
        <div class="container-xxl position-relative p-0">
              <nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0 justify-content-center">
                <a href="${cpath}/home" class="navbar-brand p-0" >
                    <h1 class="m-0" >Bridge To Be</h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
               
                
            </nav>
        </div>



   <div class="container" id="container">
     <div class="form-container sign-up-container">
         <form action="${cpath}/member/join" method="post" class="was-validated" id="joinForm">
         <h1>Create Account</h1>
        
         <input type="email" placeholder="업무용 이메일" name="username" id="username" onkeyup="registerCheck()" required/>
         <div class="valid-feedback"></div>
         <div class="invalid-feedback"></div>
         <span id="emailMessage"></span>
        
         <input type="password" placeholder="비밀번호" name="password" id="password" onkeyup="passwordCheck()" required/>
         <div class="valid-feedback"></div>
         <div class="invalid-feedback"></div>
         <input type="password" placeholder="비밀번호확인" name="passwordConfrim" id="passwordConfrim" onkeyup="passwordCheck()" required/>
         <div class="valid-feedback"></div>
         <div class="invalid-feedback"></div>
         <span id="passMessage" style="color:red;"></span>
           
         
         
          <select class="form-select" style="border-color:red; --bs-form-select-bg-icon: none; box-shadow:none;" id="sel1" name="industry" onchange="checkSelection()">
             <option selected>업종을 선택해주세요.</option>
            <option>제조업</option>
            <option>도소매업</option>
            <option>정보통신업</option>
            <option>과학기술서비스,연구</option>
            <option>건설업</option>
            <option>부동산업</option>
            <option>사업관리,임대</option>
            <option>기타</option>
          </select>
         
         <div class="d-flex align-items-center">
         <input type="text" oninput="this.value = this.value.replace(/[^0-9]/g, '');" placeholder="사업자번호" name="bno" id="bno" required/>
         <button type="button" id="bnoBtn" onclick="businessCheck()">진위여부</button>
         </div>
         
         <div class="valid-feedback"></div>
         <div class="invalid-feedback"></div>
         
         
         <input type="text" placeholder="회사명" name="com_name" required/>
         <div class="valid-feedback"></div>
         <div class="invalid-feedback"></div>
         <button id="join" type="button" onclick="clickEvent()">Sign Up</button>
       </form>

     </div>
     <div class="form-container sign-in-container">
     
        
       <form action="${cpath}/member/login" method="post">
       
          <h1 style="color:#1E274D;">Login</h1>
          <br>
         <input id="username" name="username" type="email" placeholder="Email" />
         <input id="password" name="password" type="password" placeholder="Password" />
         <a href="#">Forgot your password?</a>
         <input type="submit" class="fadeIn fourth" value="Log In">
         
       </form>
       
     </div>
     <!-- 회원가입 성공시 Modal -->
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

    <div class="modal" id="myModal1">
        <div class="modal-dialog">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header" id="checkType">
              <h4 class="modal-title">로그인 실패</h4>
              <!-- <button type="button" class="btn-close" data-bs-dismiss="modal"></button>  -->
            </div>
      
            <!-- Modal body -->
            <div class="modal-body" >
              <p id="checkMessage1"> <h6 class="modal-body">아이디 또는 비밀번호를 잘못 입력하셨습니다.</h6></p>
            </div>
      
            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
            </div>
      
          </div>
        </div>
      </div>
      
    <div class="modal" id="checkModal">
        <div class="modal-dialog">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header" id="checkType">
              <h4 class="modal-title">메세지 확인</h4>
            </div>
      
            <!-- Modal body -->
            <div class="modal-body" >
              <p id="checkMessage"></p>
            </div>
      
            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
            </div>
      
          </div>
        </div>
      </div>

     <div class="overlay-container">
       <div class="overlay">
         <div class="overlay-panel overlay-left">
           <h1>Welcome Back!</h1>
           <p>To keep connected with us please login with your personal info</p>
         <button class="ghost" id="signIn">Log In</button>
         </div>
         <div class="overlay-panel overlay-right">
           <h1>Bridge to we</h1>
           <p>Enter your personal details and start journey with us</p>
           <button class="ghost" id="signUp">Sign Up</button>
         </div>
       </div>
     </div>
   </div>



   <script type="text/javascript">
      const signUpButton = document.getElementById('signUp');
      const signInButton = document.getElementById('signIn');
      const container = document.getElementById('container');
   
      signUpButton.addEventListener('click', () => {
        container.classList.add("right-panel-active");
      });
   
      signInButton.addEventListener('click', () => {
        container.classList.remove("right-panel-active");
      });
      
      
      $(document).ready(function(){
          if(${not empty msgType}){
             //회원가입성공
             if(${msgType eq "성공메세지"}){
                $("#messageType").attr("class", "modal-content panel-success");
             }
             $("#myModal").modal("show");
          }
          //로그인실패
          if (window.location.href.endsWith("login?error")) {
               // URL이 "localhost:8080/boot/login?error"와 같은 패턴인 경우
               // 로그인 실패 모달 창을 띄우는 코드를 여기에 작성합니다.
                 $("#checkMessage").text("이미 사용중인 이메일 입니다.");
                   $("#checkType").attr("class","modal-content panel-warning");
             $("#myModal1").modal("show");
             }

       });
      
      let isEmailChecked = false;
      let isBusinessValid = false;
      let isPasswordChecked = false;
      
      // 모달 표시 함수
      function showMessage(message) {
          $("#checkMessage").text(message); // 모달에 메세지 표시
          $("#checkModal").modal("show"); // 모달 보이기
      }
      
      function registerCheck(){
          var username = $("#username").val();
          $.ajax({
             url : "${cpath}/member/registerCheck",
             type : "get", 
             data : {"username" : username},
             success : function(data){
                // 중복유무 확인 -> (data=1 사용가능 data=0 사용불가능)
                if(data){
                   $("#emailMessage").html("이미 사용중인 이메일 입니다.");
                   $("#emailMessage").attr('style', 'color: red');
                   isEmailChecked = false;
                }else{
                   $("#emailMessage").html("사용할 수 있는 이메일 입니다.");
                   $("#emailMessage").attr('style', 'color: green');
                   isEmailChecked = true;
                }
             },
             error : function(){alert("error");}
          });
       }
       
       
       function passwordCheck(){
          var password = $("#password").val();
          var passwordConfrim = $("#passwordConfrim").val();
          
          if(password != passwordConfrim){
             $("#passMessage").html("비밀번호가 서로 일치하지 않습니다.");
             isPasswordChecked = false;
          }else{
             $("#passMessage").html("");
             isPasswordChecked = true;
             //check();
          }
       }
       
       function businessCheck(){ // 예시 사업자등록번호 : 6948102044
          var businessNumber = $("#bno").val();
       console.log(businessNumber);
          var data = {
                 "b_no": [businessNumber] // 사업자번호 "xxxxxxx" 로 조회 시,
                }; 
          $.ajax({
             url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=t3yqqSdPU84m8Cqhi7cl%2BNCRNn9x237g%2FV32UbaM5G%2FEUlx8dJtNawws2jgNYpmppv1bm7B8Moo43FZn4leuOg%3D%3D&returnType=JSON",  // serviceKey 값을 xxxxxx에 입력
             type: "POST",
             data: JSON.stringify(data),// json 을 string으로 변환하여 전송
             dataType: "JSON",
             contentType: "application/json",
             accept: "application/json",
             success: function(result) {
                console.log(data);
                 console.log(result["data"][0]["tax_type"]);
                 if(result["data"][0]["tax_type"] == "국세청에 등록되지 않은 사업자등록번호입니다."){
                    showMessage(result["data"][0]["tax_type"]);
                 }else{
                    showMessage("정상적인 사업자등록번호입니다.");
                       isBusinessValid = true;
                 }
             },
             error:function(result){alert("error");console.log(result.responseText); }
           });
        }
       
       function checkSelection(select) {
           const sel = document.getElementById('sel1');
           const selectedIndex = sel.selectedIndex;

           if (selectedIndex === 0) {
              sel.style.borderColor = 'red'; // 초기 상태로 복원
              //sel.style.bs-form-select-bg-icon = none;
           } else {
              sel.style.borderColor = ''; // 초기 상태로 복원
           }
       }

    function clickEvent(){
       const sel = document.getElementById('sel1'); // select 태그 가져오기
        const selectedIndex = sel.selectedIndex; // 선택된 옵션의 인덱스 가져오기
        console.log(selectedIndex);
        if(selectedIndex === 0){
           showMessage("업종을 선택해주세요."); // 모달에 업종 선택 메시지 표시
        }else if (!isBusinessValid) {
            showMessage("사업자 진위여부를 확인해주세요."); // 모달에 사업자 확인 메세지 표시
        }else if (!isPasswordChecked) {
            showMessage("비밀번호를 확인해주세요."); // 모달에 비밀번호 확인 메세지 표시
        }else if (isEmailChecked && isBusinessValid && isPasswordChecked) { // 첫 번째 옵션 선택 시
           document.getElementById('joinForm').submit(); 
        }
    }
    
    

    
    
   </script>


   
</body>
</html>