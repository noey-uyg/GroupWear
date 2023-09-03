<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <%
    String errMsg = (String)session.getAttribute("errMsg");
  %>

  <title>GROUPWEAR</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/groupwearfavicon2.png" rel="icon">
  <!-- <link href="assets/img/apple-touch-icon.png" rel="assets/img/groupwearfavicon2.png"> -->

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style_niceadmin.css" rel="stylesheet">
  <link href="assets/css/global.css" rel="stylesheet">

  <!-- Font API -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>

<body>

  <main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center align-items-center py-4 flex-column">
                <a href="LoginPage.jsp" class="d-flex align-items-center w-auto">
                  <h1 class="custom-logo"><a href="LoginPage.jsp">GROUPWEAR<span>.</span></a></h1>
                  <p class="kr" style="text-align: center;">비즈니스에 상상을 더하다</p>
                </a>
              </div><!-- End Logo -->

              <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-4 pb-2 kra">
                    <h5 class="card-title text-center pb-0 fs-4" style="font-weight: 600; width: 100%;">서비스 가입하기</h5>
                    <p class="text-center small">계정을 생성하여 그룹웨어의 다양한 서비스를 경험해보세요</p>
                  </div>

                  <form action="SignupPage.do" method="post" class="row g-3 needs-validation" novalidate>

                    <div class="col-12">
                      <label for="yourName" class="form-label kr">이름</label>
                      <input type="text" name="signname" class="form-control" id="yourName" required>
                      <div class="invalid-feedback kr">실명을 입력해주세요!</div>
                    </div>

                    <div class="col-12">
                      <label for="yourBirth" class="form-label kr">생년월일</label>
                      <input type="date" name="signdate" class="form-control" id="yourBirth" required>
                      <div class="invalid-feedback kr">생년월일을 선택해주세요!</div>
                    </div>

                    <div class="col-12">
                      <label for="yourEmail" class="form-label kr">이메일</label>
                      <div class="input-group has-validation">
                        <span class="input-group-text" id="inputGroupPrepend">@</span>
                        <input type="email" name="signemail" class="form-control" id="yourEmail" required>
                        <div class="invalid-feedback kr">유효한 메일 주소를 입력해주세요!</div>
                      </div>
                    </div>

                    <% if(errMsg == null) { %>
                      <div class="col-12">
                        <label for="yourID" class="form-label kr">아이디</label>
                        <input type="text" name="signid" class="form-control" id="yourID" required>
                        <div class="invalid-feedback kr">사용하실 계정 아이디를 입력해주세요!</div>
                      </div>
                    <% } else { %>
                      <div class="col-12 was-validated">
                        <label for="yourID" class="form-label kr">아이디</label>
                        <input type="text" name="signid" class="form-control" id="yourID" required>
                        <div class="invalid-feedback kr"><%= errMsg %></div>
                      </div>
                    <% } %>

                    <div class="col-12">
                      <label for="yourPassword" class="form-label kr">비밀번호</label>
                      <input type="password" name="signpw" class="form-control" id="yourPassword" required>
                      <div class="invalid-feedback kr">사용하실 계정 비밀번호를 입력해주세요!</div>
                    </div>

                    <div class="col-12" id="repw">
                      <label for="yourRePassword" class="form-label kr">비밀번호 재입력</label>
                      <input type="password" name="signcheckpw" class="form-control" id="yourRePassword" required>
                      <div class="invalid-feedback kr">비밀번호가 같지 않습니다!</div>
                    </div>

                    <div class="col-12">
                      <div class="form-check">
                        <input class="form-check-input" name="terms" type="checkbox" value="" id="acceptTerms" required>
                        <label class="form-check-label kr" for="acceptTerms">본 서비스 이용 약관에 대한 내용을 <a href="">전부 동의합니다.</a></label>
                        <div class="invalid-feedback kr">이용 약관 동의를 체크해주셔야합니다!</div>
                      </div>
                    </div>
                    <div class="col-12">
                      <button class="btn btn-primary w-100 kr" type="submit">회원가입</button>
                    </div>
                    <div class="col-12">
                      <p class="small mb-0 kr">이미 계정이 있으신가요? <a href="LoginPage.jsp#signin">로그인</a></p>
                    </div>
                  </form>

                </div>
              </div>

              <div class="credits">
                Project by <a href="">WebApplication</a>
              </div>

            </div>
          </div>
        </div>

      </section>

    </div>
  </main><!-- End #main -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.min.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.min.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/register.js"></script>

  <script>
    var password = document.getElementById("yourPassword")
      , confirm_password = document.getElementById("yourRePassword");

    function validatePassword(){
      if(password.value != confirm_password.value) {
        confirm_password.setCustomValidity("Passwords Don't Match");
      } else {
        confirm_password.setCustomValidity(''); // 오류가 없으면 메시지를 빈 문자열로 설정해야한다. 오류 메시지가 비어 있지 않은 한 양식은 유효성 검사를 통과하지 않고 제출되지 않는다.
      }
    }

    password.onchange = validatePassword;
    password.onkeyup = validatePassword;
    confirm_password.onchange = validatePassword;
    confirm_password.onkeyup = validatePassword;

    var container = document.getElementById('repw');
    function test() {
      if(password.value != confirm_password.value) {
        if(container.classList.contains("was-validated") == false) {
          container.classList.add("was-validated");
        }
      }
    }
    confirm_password.addEventListener('input', test);
  </script>

</body>

</html>