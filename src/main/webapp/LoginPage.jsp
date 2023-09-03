<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <%
    String errMsg = (String)session.getAttribute("errMsg");
    if(errMsg == null) errMsg="";
		
      session.invalidate();
  %>

  <title>GROUPWEAR</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/groupwearfavicon2.png" rel="icon">
  <!-- <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon"> -->

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  <link href="assets/css/global.css" rel="stylesheet">

  <!-- Font API -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>

<body>

  <!-- ======= Top Bar ======= -->
  <section id="topbar" class="d-flex align-items-center">
    <div class="container d-flex justify-content-center justify-content-md-between">
      <div class="contact-info d-flex align-items-center">
        <i class="bi bi-box d-flex align-items-center"><a href="mailto:kimjuy0913@likelion.org" class="kr">&nbsp비즈니스에 상상을 더하다</a></i>
      </div>
      <div class="social-links d-none d-md-flex align-items-center">
        <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
        <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
        <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
        <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></i></a>
      </div>
    </div>
  </section>

  <!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">

      <h1 class="logo"><a href="LoginPage.jsp">GROUPWEAR<span>.</span></a></h1>

      <nav id="navbar" class="navbar kra">
        <ul>
          <li><a class="nav-link scrollto active" href="#hero">시작</a></li>
          <li><a class="nav-link scrollto" href="#signin">로그인</a></li>
          <li><a class="nav-link scrollto" href="#services">서비스</a></li>
          <li><a class="nav-link scrollto" href="#team">팀 소개</a></li>
          <li><a class="nav-link scrollto " href="#pricing">요금제</a></li>
          <li><a class="nav-link scrollto" href="#faq">자주 묻는 질문</a></li>
          <li class="dropdown"><a href="#"><span>바로가기</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">바로가기 1</a></li>
              <li><a href="#">바로가기 2</a></li>
              <li><a href="#">바로가기 3</a></li>
              <li><a href="#">바로가기 4</a></li>
              <!-- <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li> -->
            </ul>
          </li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">
    <div class="container" data-aos="zoom-out" data-aos-delay="100">
      <h1>Welcome to <span>GROUPWEAR</span></h1>
      <h2 class="kr">당신의 비즈니스를 위한 올 인원 협업 툴, 지금 시작하세요.</h2>
      <div class="d-flex">
        <a href="#signin" class="btn-get-started scrollto kr" style="font-weight: bold;">로그인</a>
        <a href="SignupPage.jsp" class="btn-watch-video"><i class="bi bi-check2-circle"></i><span class="kr">서비스 가입하기</span></a>
        <!-- <a href="SignupPage.jsp" class="glightbox btn-watch-video"><i class="bi bi-check2-circle"></i><span class="kr">서비스 가입하기</span></a> -->
      </div>
    </div>
  </section><!-- End Hero -->

  <main id="main">

    <!-- ======= Featured Services Section ======= -->
    <section id="featured-services" class="featured-services">
      <div class="container" data-aos="fade-up">

        <div class="row">
          <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="100">
              <div class="icon"><i class="bx bxl-dribbble"></i></div>
              <h4 class="title kr"><a href="">비즈니스와 일상 분리</a></h4>
              <p class="description kr">개인 메신저나 SNS는 업무 외 많은 정보들이 노출 되어 있기 때문에 업무를 위한 앱과 일상용 앱의 분리 필요</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="200">
              <div class="icon"><i class="bx bx-file"></i></div>
              <h4 class="title kr"><a href="">업무사항 관리와 보고</a></h4>
              <p class="description kr">해야 할 업무를 목록화 하고, 수행한 업무 내용과 진행 사항을 그룹간 확인하여 업무 세부 내용을 게시물 형태로 보고 가능</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="300">
              <div class="icon"><i class="bx bx-tachometer"></i></div>
              <h4 class="title kr"><a href="">빠른 자료 전달과 업로드</a></h4>
              <p class="description kr">쉽고 빠르게 개인간의 자료 전달과 업로드 기능을 통한 그룹간 자료 공유</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="400">
              <div class="icon"><i class="bx bx-world"></i></div>
              <h4 class="title kr"><a href="">비즈니스 효율 향상</a></h4>
              <p class="description kr">여러가지 비즈니스 도구의 필요한 기능들을 한 곳에 모아 하나의 비즈니스 도구만을 사용할 수 있어 업무 효율 상승</p>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Featured Services Section -->

    <!-- ======= About Section ======= -->
    <section id="signin" class="signin section-bg">
      <div class="container kr" data-aos="fade-up">

        <div class="section-title">
          <h2>로그인</h2>
          <h3>GROUPWEAR의 회원이시라면 <span>로그인</span>해주세요</h3>
          <p>계정이 없다면 <a href="SignupPage.jsp">여기</a>를 클릭하여 회원가입 후 서비스를 이용하실 수 있습니다</p>
        </div>

        <div class="container loginfm" style="padding-top: 10px;">
          <form class="row g-3" action="LoginPage.do" method="post">
            <div class="col-12">
              <label for="inputAccount" class="form-label">사용자 아이디</label>
              <input type="text" class="form-control" id="inputAccount" name="loginid">
            </div>
            <div class="col-12">
              <label for="inputPassword" class="form-label">계정 비밀번호</label>
              <input type="password" class="form-control" id="inputPassword" name="loginpw">
            </div>
            <div class="text-center" style="padding-top: 15px;">
              <button type="submit" class="btn btn-primary">로그인</button>
              <button type="reset" class="btn btn-secondary">다시 입력</button>
            </div>
          </form><!-- Vertical Form -->
          <div class="errMsg kr" style="text-align: center; margin-top: 30px; font-weight: 900; color: #dc3545;"><%= errMsg %></div>
        </div>
      </div>
    </section><!-- End About Section -->

    <!-- ======= Clients Section ======= -->
    <section id="clients" class="clients section-bg">
      <div class="container" data-aos="zoom-in" data-aos-offset="-50">

        <div class="row">

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="assets/img/clients/client-1.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="assets/img/clients/client-2.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="assets/img/clients/client-3.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="assets/img/clients/client-4.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="assets/img/clients/client-5.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="assets/img/clients/client-6.png" class="img-fluid" alt="">
          </div>

        </div>

      </div>
    </section><!-- End Clients Section -->

    <!-- ======= Services Section ======= -->
    <section id="services" class="services">
      <div class="container" data-aos="fade-up">

        <div class="section-title kra">
          <h2>서비스</h2>
          <h3>필요한 기능만, 다양한 <span>업무 서비스</span></h3>
          <p>성장해가는 GROUPWEAR 서비스의 이용자와 그들이 진행했던 프로젝트들, 그리고 업무에 필요한 다양한 기능들을 확인해보세요</p>
        </div>
            <!-- ======= Counts Section ======= -->
        <section id="counts" class="counts">
          <div class="container" data-aos="fade-up">

            <div class="row">

              <div class="col-lg-3 col-md-6">
                <div class="count-box">
                  <i class="bi bi-people"></i>
                  <span data-purecounter-start="0" data-purecounter-end="8710" data-purecounter-duration="1" class="purecounter"></span>
                  <p class="kr">이용자 수</p>
                </div>
              </div>

              <div class="col-lg-3 col-md-6 mt-5 mt-md-0">
                <div class="count-box">
                  <i class="bi bi-diagram-3"></i>
                  <span data-purecounter-start="0" data-purecounter-end="521" data-purecounter-duration="1" class="purecounter"></span>
                  <p class="kr">비즈니스 그룹</p>
                </div>
              </div>

              <div class="col-lg-3 col-md-6 mt-5 mt-lg-0">
                <div class="count-box">
                  <i class="bi bi-calendar4-week"></i>
                  <span data-purecounter-start="0" data-purecounter-end="1463" data-purecounter-duration="1" class="purecounter"></span>
                  <p class="kr">생성된 프로젝트</p>
                </div>
              </div>

              <div class="col-lg-3 col-md-6 mt-5 mt-lg-0">
                <div class="count-box">
                  <i class="bi bi-journal-richtext"></i>
                  <span data-purecounter-start="0" data-purecounter-end="3682" data-purecounter-duration="1" class="purecounter"></span>
                  <p class="kr">상세 업무 내용</p>
                </div>
              </div>

            </div>

          </div>
        </section><!-- End Counts Section -->

        <div class="row">
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100">
            <div class="icon-box">
              <div class="icon"><i class="bx bxl-dribbble"></i></div>
              <h4><a class="kr">프로젝트</a></h4>
              <p>비즈니스 그룹 내 수행 할 프로젝트를 생성하여 프로젝트에 대한 수행 목표와 세부 일정을 설정할 수 있습니다.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0" data-aos="zoom-in" data-aos-delay="200">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-file"></i></div>
              <h4><a class="kr">일정 관리</a></h4>
              <p>비즈니스 그룹 내 수행 할 프로젝트를 생성하여 프로젝트에 대한 수행 목표와 세부 일정을 설정할 수 있습니다.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0" data-aos="zoom-in" data-aos-delay="300">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-tachometer"></i></div>
              <h4><a class="kr">그룹 채팅</a></h4>
              <p>비즈니스 그룹 내 수행 할 프로젝트를 생성하여 프로젝트에 대한 수행 목표와 세부 일정을 설정할 수 있습니다.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="100">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-world"></i></div>
              <h4><a class="kr">파일 전송</a></h4>
              <p>비즈니스 그룹 내 수행 할 프로젝트를 생성하여 프로젝트에 대한 수행 목표와 세부 일정을 설정할 수 있습니다.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="200">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-slideshow"></i></div>
              <h4><a class="kr">차팅</a></h4>
              <p>비즈니스 그룹 내 수행 할 프로젝트를 생성하여 프로젝트에 대한 수행 목표와 세부 일정을 설정할 수 있습니다.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="300">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-arch"></i></div>
              <h4><a class="kr">업무 게시판</a></h4>
              <p>비즈니스 그룹 내 수행 할 프로젝트를 생성하여 프로젝트에 대한 수행 목표와 세부 일정을 설정할 수 있습니다.</p>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Services Section -->

    <!-- ======= Team Section ======= -->
    <section id="team" class="team section-bg">
      <div class="container kr" data-aos="fade-up">

        <div class="section-title">
          <h2>팀 소개</h2>
          <h3><span>GROUPWEAR</span>를 성장시킬 팀</h3>
          <p>우리는 팀을 이뤄 프로젝트를 진행할 때 협업에 필요한 업무 분담과 일정 관리 그리고 소통에 어려움을 겪어, 이런 불편함을 해소하기 위해 꼭 필요한 기능만을 갖춘 올 인원 비즈니스 도구를 개발하게 되었습니다</p>
        </div>

        <div class="row d-flex aline-items-center justify-content-center">

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
            <div class="member">
              <div class="member-img">
                <img src="assets/img/team/team-gy.png" class="img-fluid" alt="">
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
              <div class="member-info">
                <h4>위 규연</h4>
                <span>프로젝트 총괄, 백엔드 개발, 데이터베이스 설계</span>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="200">
            <div class="member">
              <div class="member-img">
                <img src="assets/img/team/team-jy.png" class="img-fluid" alt="">
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
              <div class="member-info">
                <h4>김 주영</h4>
                <span>프론트 개발, UIUX 디자인, 프레젠테이션</span>
              </div>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End Team Section -->

    <!-- ======= Pricing Section ======= -->
    <section id="pricing" class="pricing">
      <div class="container" data-aos="fade-up">

        <div class="section-title kra">
          <h2>요금제</h2>
          <h3>이제 원하는 <span>멤버십</span>을 선택하세요</h3>
          <p>서비스를 사용할 준비가 되셨나요? 원하는 멤버십을 선택하세요 멤버십은 언제든지 변경 또는 해지 가능합니다</p>
        </div>

        <div class="row">

          <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="100">
            <div class="box featured">
              <h3>무료</h3>
              <h4><sup>₩</sup>0<span> / 월</span></h4>
              <ul>
                <li>30GB 저장공간</li>
                <li>5개의 비즈니스 그룹 생성 가능</li>
                <li>30명의 그룹원 추가 가능</li>
                <li class="na">1:1 채팅 상담</li>
                <li class="na">협업 솔루션 제공</li>
              </ul>
              <div class="btn-wrap">
                <a class="btn-buy">계정 만들기</a>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 mt-4 mt-md-0" data-aos="fade-up" data-aos-delay="200">
            <div class="box">
              <span class="advanced">가장 추천</span>
              <h3>학생 / 교육기관</h3>
              <h4><sup>₩</sup>9,900<span> / 월</span></h4>
              <ul>
                <li>500GB 저장공간</li>
                <li>30개의 비즈니스 그룹 생성 가능</li>
                <li>150명의 그룹원 추가 가능</li>
                <li class="na">1:1 채팅 상담</li>
                <li class="na">협업 솔루션 제공</li>
              </ul>
              <div class="btn-wrap">
                <a class="btn-buy">구독하기</a>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 mt-4 mt-lg-0" data-aos="fade-up" data-aos-delay="300">
            <div class="box">
              <h3>기업</h3>
              <h4><sup>₩</sup>49,000<span> / 월</span></h4>
              <ul>
                <li>4TB 저장공간</li>
                <li>무제한 비즈니스 그룹 생성 가능</li>
                <li>무제한 그룹원 추가 가능</li>
                <li>1:1 채팅 상담</li>
                <li class="na">협업 솔루션 제공</li>
              </ul>
              <div class="btn-wrap">
                <a class="btn-buy">구독하기</a>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 mt-4 mt-lg-0" data-aos="fade-up" data-aos-delay="400">
            <div class="box">
              <h3>무제한</h3>
              <h4><sup>₩</sup>99,000<span> / 월</span></h4>
              <ul>
                <li>무제한 저장공간</li>
                <li>무제한 비즈니스 그룹 생성 가능</li>
                <li>무제한 그룹원 추가 가능</li>
                <li>1:1 채팅 상담</li>
                <li>협업 솔루션 제공</li>
              </ul>
              <div class="btn-wrap">
                <a class="btn-buy">구독하기</a>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Pricing Section -->

    <!-- ======= Frequently Asked Questions Section ======= -->
    <section id="faq" class="faq section-bg">
      <div class="container kra" data-aos="fade-up">

        <div class="section-title">
          <h2>자주 묻는 질문</h2>
          <h3><span>원하시는 답변</span>을 빠르게 찾아보세요</h3>
          <p>본 서비스 이용 관련 고객님들의 질문 중 가장 빈도수가 높은 질문들을 모아, 친절한 답변과 함께 제공해드리고 있습니다</p>
        </div>

        <div class="row justify-content-center">
          <div class="col-xl-10">
            <ul class="faq-list">

              <li>
                <div data-bs-toggle="collapse" class="collapsed question" href="#faq1">비즈니스 협업툴이 뭘 하는 건가요?<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
                <div id="faq1" class="collapse" data-bs-parent=".faq-list">
                  <p>
                    팀 내에서 업무 전체를 협업할 수 있는 도구로 기본적으로는 소프트웨어형 클라우드 서비스를 기반으로 커뮤니케이션, 일정관리, 파일공유, 노트작성, 프로젝트 관리 등 일반적으로 지식 노동자들의 원활한 업무를 도와주는 서비스를 말합니다.
                  </p>
                </div>
              </li>

              <li>
                <div data-bs-toggle="collapse" href="#faq2" class="collapsed question">서비스를 사용하고 싶어요 프로그램은 어디서 다운받을 수 있나요?<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
                <div id="faq2" class="collapse" data-bs-parent=".faq-list">
                  <p>
                    답변 상태 : 처리 대기
                  </p>
                </div>
              </li>

              <li>
                <div data-bs-toggle="collapse" href="#faq3" class="collapsed question">제가 가입하고자 하는 비즈니스 그룹이 안 보여요!<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
                <div id="faq3" class="collapse" data-bs-parent=".faq-list">
                  <p>
                    답변 상태 : 처리 대기
                  </p>
                </div>
              </li>

              <li>
                <div data-bs-toggle="collapse" href="#faq4" class="collapsed question">저장용량이 더 높은 플랜의 멤버십을 사용하고 싶어요 어떤 멤버십를 선택하는게 좋을까요?<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
                <div id="faq4" class="collapse" data-bs-parent=".faq-list">
                  <p>
                    답변 상태 : 처리 대기
                  </p>
                </div>
              </li>
            </ul>
          </div>
        </div>

      </div>
    </section><!-- End Frequently Asked Questions Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" style="padding-top: 250px;">
    <div class="container py-4" style="background-color: #F6F9FE;">
      <div class="container py-4" style="background-color: #F6F9FE;">
        <div class="copyright">
          <strong><span>Honam University</span></strong>
        </div>
        <div class="credits">
          Project by <a href="">WebApplication</a>
        </div>
      </div>
  </footer><!-- End Footer -->

  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>