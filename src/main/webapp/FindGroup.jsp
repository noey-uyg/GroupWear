<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
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

  <!-- Template Main CSS File -->
  <link href="assets/css/style_niceadmin.css" rel="stylesheet">
  <link href="assets/css/global.css" rel="stylesheet">
  <style>
  	th, td {
  		text-align: center;
  	}
  	th {
  		font-size: 18px;
  		font-weight: bold;
  		padding-bottom: 35px;
  	}
  	td {
  		padding-top: 15px;
  		padding-bottom: 15px;
  		border-bottom: 1px solid rgba(0, 0, 0, 0.1);
  	}
  	
  	/* tr:nth-child(odd) {
		background-color: white;
	} */
 	tr:nth-child(even) {
		background-color: white;
	}
  </style>

    <%
	    @SuppressWarnings("unchecked")
	    ArrayList<GroupDTO> gDTO = (ArrayList<GroupDTO>)session.getAttribute("gDTO");
		String filename = (String)session.getAttribute("fileName");
		String username = (String)session.getAttribute("userName");
		String userID = (String)session.getAttribute("userID");
		String useremail = (String)session.getAttribute("userEmail");
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

    <section class="section d-flex justify-content-center">
    	<div class="col-lg-5 col-md-7 col-sm-10">
        	<div class="row">	
        		<%
					if(gDTO == null){
				%>
					<img src="assets/img/search-result-not-found.webp"/>
					<h3 style="text-align: center; padding-top: 20px; padding-bottom: 20px;">검색결과가 없습니다...</h3>
				<%}else if(gDTO.isEmpty()){%>
					<img src="assets/img/search-result-not-found.webp"/>
					<h3 style="text-align: center; padding-top: 20px; padding-bottom: 20px;">검색결과가 없습니다...</h3>
				<%}else {%>
					<table class="table_style">
						<tr>
							<th>그룹 이름</th>
							<th>관리자 이름</th>
						</tr>
					<% for(int i=0;i<gDTO.size();i++){ %>
						<tr>
							<td><%=gDTO.get(i).getGroup_name() %></td>
							<td><%=gDTO.get(i).getGroup_membername() %></td>
							<td><button class="btn btn-primary kr" style="width: 60%;" type="button" onclick="location.href='Groupjoin.do?joingroup=<%=gDTO.get(i).getGroup_id() %>'" formmethod="post" >가입</button></td>
						</tr>
					<%} %>
					</table>
				<%} %>
        	</div>
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

  <!-- Template Main JS File -->
  <script src="assets/js/register.js"></script>

</body>

</html>