<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ToAo.GroupUserDTO" %>
<%@ page import="ToAo.GroupDTO" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>GROUPWEAR</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/groupwearfavicon2.png" rel="icon">
  <!-- <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon"> -->

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
  
  <link href="assets/vendor/glightbox/css/glightbox.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style_niceadmin.css" rel="stylesheet">
  <link href="assets/css/global.css" rel="stylesheet">
  
  <% 
	String filename = (String)session.getAttribute("fileName");
	String username = (String)session.getAttribute("userName");
	String userID = (String)session.getAttribute("userID");
	String useremail = (String)session.getAttribute("userEmail");
	
	//내가 가입된 그룹 리스트
	@SuppressWarnings("unchecked")
	ArrayList<GroupUserDTO> groupList = (ArrayList<GroupUserDTO>)session.getAttribute("groupList");
	//내가 가입된 그룹의 멤버 수
	@SuppressWarnings("unchecked")
	ArrayList<Integer> gmembercount = (ArrayList<Integer>)session.getAttribute("gmembercount");
	//내가 가입된 그룹의 세부업무 수
	@SuppressWarnings("unchecked")
	ArrayList<Integer> gworkcount = (ArrayList<Integer>)session.getAttribute("gworkcount");
	
	//내가 생성한 그룹 리스트
	@SuppressWarnings("unchecked")
	ArrayList<GroupDTO> createGroupList = (ArrayList<GroupDTO>)session.getAttribute("CreateGroupList");
	//내가 생성한 그룹의 멤버 수
	@SuppressWarnings("unchecked")
	ArrayList<Integer> cmembercount = (ArrayList<Integer>)session.getAttribute("cmembercount");
	//내가 생성한 그룹의 세부업무 수
	@SuppressWarnings("unchecked")
	ArrayList<Integer> cworkcount = (ArrayList<Integer>)session.getAttribute("cworkcount");
  %>
</head>

<body class="toggle-sidebar">

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="UserPage.jsp" class="logo d-flex align-items-center">
        <img src="assets/img/groupwearfavicon2.png" alt="">
        <span class="d-none d-lg-block">GROUPWEAR<span style="color: #106eea;">.</span></span>
      </a>
      <a href="CreateGroup.jsp" class="glightbox">
	      <i class="bi bi-plus-square create-group-btn" data-bs-toggle="tooltip" data-bs-placement="bottom" title="클릭하여 그룹을 만들 수 있습니다."></i>
      </a>
    </div><!-- End Logo -->

    <div class="search-bar col-4">
      <form class="search-form d-flex align-items-center" method="post" action="FindGroup.do">

        <div class="btn-group">
          <input type="radio" class="btn-check" name="searchname" id="btnradio1" value="그룹이름" autocomplete="off" checked>
          <label class="search-type-btn" for="btnradio1">그룹</label>  
          <input type="radio" class="btn-check" name="searchname" id="btnradio2" value="관리자" autocomplete="off">
          <label class="search-type-btn" for="btnradio2">관리자</label>
        </div>
        
        <input type="text" name="search" placeholder="Search Group" title="Enter search keyword">
        <button type="submit" title="Search"><i class="bi bi-search"></i></button>
      </form>
    </div><!-- End Search Bar -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center" style="padding-right: 20px;">

        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->

        <li class="nav-item dropdown">

          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            <i class="bi bi-bell"></i>
            <span class="badge bg-primary badge-number">0</span>
          </a><!-- End Notification Icon -->
        </li>

        <li class="nav-item dropdown">

          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            <i class="bi bi-chat-left-text"></i>
            <span class="badge bg-success badge-number">0</span>
          </a><!-- End Messages Icon -->
        </li>
        
        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="upload/<%= filename %>" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2">환영합니다! <%= username %>님</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6><%= username %></h6>
              <span><%= userID %><span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="MyPage.jsp">
                <i class="bi bi-person"></i>
                <span>프로필 설정</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="pages-faq.html">
                <i class="bi bi-question-circle"></i>
                <span>고객센터</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="Logout.jsp">
                <i class="bi bi-box-arrow-right"></i>
                <span>로그아웃</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

  <main id="main" class="main" style="padding-top: 70px;">

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-8">
          <div class="row">
            <div class="pagetitle">
              <h1 class="kr">MY GROUPS</h1>
              <nav>
                <ol class="breadcrumb">
                  <li class="breadcrumb-item kr" style="font-weight: 400;"><a href="">내가 생성한 비즈니스 그룹 목록</a></li>
                </ol>
              </nav>
            </div><!-- End Page Title -->
            
            <% 
            if (createGroupList == null || createGroupList.isEmpty()) { %>
                <div class="col visible-xs-block">
                	<p class="none-group">생성한 그룹이 없습니다, 상단 더하기 버튼을 눌러 그룹을 생성할 수 있습니다.</p>
              	</div>
            <%
            } else {
            	for(int i=0; i<createGroupList.size(); i++){
            		String groupName = createGroupList.get(i).getGroup_name();
            		String groupID = createGroupList.get(i).getGroup_id();
            		Integer totalUsers = cmembercount.get(i)-1;
            		Integer totalWorks = cworkcount.get(i);
            		
	            	String cardColor = "customers-card";
	            	
	            	if (totalUsers >= 1) {
	            		cardColor = "revenue-card";
	            	}
	            	if (totalUsers >= 10) {
	            		cardColor = "sales-card";
	            	} %>
	            	
	            	<!-- Start Card -->
		            <div class="col-lg-4 col-md-6 clearfix visible-xs-block" onclick="location.href='UserPage.do?group=<%= createGroupList.get(i).getGroup_id() %>'">
		              <div class="card info-card <%= cardColor %>">
		
		                <div class="filter">
		                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
		                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
		                    <li class="dropdown-header text-start">
		                      <h6>SETTING</h6>
		                    </li>
		                    <li><a class="dropdown-item" href="#">숨기기</a></li>
		                    <li><a class="dropdown-item" href="#">삭제하기</a></li>
		                  </ul>
		                </div>
		
		                <div class="card-body">
		                  <h5 class="card-title"><%= groupName %> <span>| <%= groupID %></span></h5>
		
		                  <div class="d-flex align-items-center">
		                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
		                      <i class="bi bi-people"></i>
		                    </div>
		                    <div class="ps-3">
		                      <h6><%= totalUsers %><span style="font-size: 20px; font-family: 'Open Sans', sans-serif;"> 그룹원</span></h6>
		                      <span class="text-success small pt-1 fw-bold">&nbsp<%= totalWorks %>개</span><span class="text-muted small pt-2 ps-1">세부 업무 내용</span>
		                    </div>
		                  </div>
		                </div>
		
		              </div>
		            </div><!-- End Card -->
			<% 
            	}
            } 
            %>
            
            <div class="pagetitle" style=" padding-top: 30px;">
              <h1 class="kr">JOIN GROUPS</h1>
              <nav>
                <ol class="breadcrumb">
                  <li class="breadcrumb-item kr" style="font-weight: 400;"><a href="">가입한 비즈니스 그룹 목록</a></li>
                  <!-- <li class="breadcrumb-item active">Dashboard</li> -->
                </ol>
              </nav>
            </div><!-- End Page Title -->
            
            <% 
            if (groupList == null || groupList.isEmpty()) { %>
           		<div class="col visible-xs-block">
		        	<p class="none-group">가입한 그룹이 없습니다, 상단 검색바에서 그룹을 찾아 가입할 수 있습니다.</p>
		    	</div>
            <%
            } else {
            	for(int i=0; i<groupList.size(); i++){
            		String groupName = groupList.get(i).getGroup_name();
            		String groupID = groupList.get(i).getGroup_id();
            		Integer totalUsers = gmembercount.get(i)-1;
            		Integer totalWorks = gworkcount.get(i);
            		
	            	String cardColor = "customers-card";
	            	
	            	if (totalUsers >= 1) {
	            		cardColor = "revenue-card";
	            	}
	            	if (totalUsers >= 10) {
	            		cardColor = "sales-card";
	            	} %>
		            
		          	<!-- Start Card -->
		            <div class="col-lg-4 col-md-6 clearfix visible-xs-block" onclick="location.href='UserPage.do?group=<%= groupList.get(i).getGroup_id() %>'">
		              <div class="card info-card <%= cardColor %>">
		
		                <div class="filter">
		                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
		                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
		                    <li class="dropdown-header text-start">
		                      <h6>SETTING</h6>
		                    </li>
		                    <li><a class="dropdown-item" href="#">숨기기</a></li>
		                    <li><a class="dropdown-item" href="#">삭제하기</a></li>
		                  </ul>
		                </div>
		
		                <div class="card-body">
		                  <h5 class="card-title"><%= groupName %> <span>| <%= groupID %></span></h5>
		
		                  <div class="d-flex align-items-center">
		                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
		                      <i class="bi bi-people"></i>
		                    </div>
		                    <div class="ps-3">
		                      <h6><%= totalUsers %><span style="font-size: 20px; font-family: 'Open Sans', sans-serif;"> 그룹원</span></h6>
		                      <span class="text-success small pt-1 fw-bold">&nbsp<%= totalWorks %>개</span><span class="text-muted small pt-2 ps-1">세부 업무 내용</span>
		                    </div>
		                  </div>
		                </div>
		
		              </div>
		            </div><!-- End Card -->
		    <% 
            	}
            } 
            %>
          </div>
        </div><!-- End Left side columns -->

        <!-- Right side columns -->
        <div class="col-lg-4">
          <div class="row">
            <div class="pagetitle col">
              <h1 class="kr" style="visibility: none;">BUISNESS WIDGET</h1>
              <nav>
                <ol class="breadcrumb">
                  <li class="breadcrumb-item kr" style="font-weight: 400;"><a href="">업무에 필요한 기능들의 위젯을 제공합니다</a></li>
                </ol>
              </nav>
            </div><!-- End Page Title -->
          </div>
          <div class="card">
            <div class="filter">
              <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
              <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                <li class="dropdown-header text-start">
                  <h6>Filter</h6>
                </li>

                <li><a class="dropdown-item" href="#">최근</a></li>
                <li><a class="dropdown-item" href="#">오래된 순</a></li>
                <li><a class="dropdown-item" href="#">가나다 순</a></li>
              </ul>
            </div>

            <div class="card-body">
              <h5 class="card-title" style="font-weight: 800;">나의 업무 <span>| 업무를 시간순으로 확인할 수 있습니다</span></h5>

              <div class="activity">

                <div class="activity-item d-flex">
                  <div class="activite-label">56 분</div>
                  <i class='bi bi-circle-fill activity-badge text-success align-self-start'></i>
                  <div class="activity-content">
                    그룹웨어 <a href="#" class="fw-bold text-dark">메인 페이지 제작</a> 완성
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">3 시간</div>
                  <i class='bi bi-circle-fill activity-badge text-danger align-self-start'></i>
                  <div class="activity-content">
                    메인 페이지 스크립트 작성
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">11시간</div>
                  <i class='bi bi-circle-fill activity-badge text-primary align-self-start'></i>
                  <div class="activity-content">
                    그룹 페이지 레이아웃 구상
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">1  일</div>
                  <i class='bi bi-circle-fill activity-badge text-info align-self-start'></i>
                  <div class="activity-content">
                    그룹웨어 <a href="#" class="fw-bold text-dark">그룹 페이지 제작</a> 완성
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">3  일</div>
                  <i class='bi bi-circle-fill activity-badge text-warning align-self-start'></i>
                  <div class="activity-content">
                    여기엔 자신이 해야할 업무가 표시됩니다
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">2  주</div>
                  <i class='bi bi-circle-fill activity-badge text-muted align-self-start'></i>
                  <div class="activity-content">
                    여기엔 자신이 해야할 업무가 표시됩니다
                  </div>
                </div><!-- End activity item-->

              </div>

            </div>
          </div>

          <div class="card">
            <div class="filter">
              <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-plus"></i></a>
            </div>

            <div class="card-body pb-0">
              <h5 class="card-title" style="font-weight: 800;">간편 메모 <span>| 간단한 메모를 추가할 수 있습니다</span></h5>
              <ul class="list-group list-group-flush">
                <li class="list-group-item lgi-padding">빠르고 간편하게 메모를 추가할 수 있는 간편메모 위젯</li>
                <li class="list-group-item lgi-padding">빠르고 간편하게 메모를 추가할 수 있는 간편메모 위젯</li>
                <li class="list-group-item lgi-padding">빠르고 간편하게 메모를 추가할 수 있는 간편메모 위젯</li>
                <li class="list-group-item lgi-padding">빠르고 간편하게 메모를 추가할 수 있는 간편메모 위젯</li>
                <li class="list-group-item lgi-padding">빠르고 간편하게 메모를 추가할 수 있는 간편메모 위젯</li>
              </ul>
              <div style="padding: 20px 0px 20px 0px;">
                <div class="quill-editor-default" style="font-size: 14px;">
                  <p>메모를 하시려면</p>
                  <p>여기에 <strong>간단한 메모</strong>를 작성해보세요.</p>
                </div>
                <button class="btn btn-primary submit">메모 추가하기</button>
              </div>
            </div>
          </div>
        </div><!-- End Right side columns -->

      </div>
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      Project by <a href="">WebApplication</a>
    </div>
  </footer><!-- End Footer -->

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
  
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/register.js"></script>
   	
  <% 
  String check = (String) session.getAttribute("gbox");
  if (check != null && check.equals("close")) { 
	  session.setAttribute("gbox", null);
  %>
	<script>
		localStorage.setItem('check','true');
	</script>
  <% } else { %>
  	<script>
	    const glightbox = GLightbox({
		  selector: '.glightbox',
		  width: 300. 
		});
	    
	    playAlert = setInterval(function() {
	    	
	    	if(localStorage.getItem("check") != null) {
	    		console.log(localStorage.getItem("check"));
	    		glightbox.close();
	    		localStorage.removeItem("check");
	    		window.location.reload();
	    	}
	   	}, 20);
    </script>
  <% } %>
</body>

</html>