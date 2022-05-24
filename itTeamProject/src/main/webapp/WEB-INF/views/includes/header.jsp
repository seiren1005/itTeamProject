<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- gnb부터 메뉴바까지 헤더로 묶어서 인클루드로 가져오기 -->
<div class="wrapper">
	<div class="wrap">
		<div class="top_gnb_area">
			<ul class="list">
				<li>
					<a href="/mainpage">메인화면</a>
				</li>
				<!-- 로그인 안했을 경우 로그인과 회원가입 표시 -->
				<c:if test = "${member == null} }">
					<li>
						<a href="/member/login">로그인</a>	
					</li>
					<li>
						<a href="/member/join">회원가입</a>
					</li>
				</c:if>
				<c:if test="${member != null}"> 
				<li>
					로그아웃
				</li>
				<li>
					마이페이지
				</li>
				</c:if>
			</ul>	
		</div>
		<div class="top_area">
			<div class="main_area">
				<a href="/mainpage"><img src="resources/img/Logo.png"></a>
				<!-- 메인으로 이동 -->
			</div>
			<div class="study_area">
				<div class="study_button"><a href="/study">게시판</a></div>
				<!-- 게시판으로 이동 -->
			</div>
			<div class="login_area">
				<div class="login_button"><a href="/member/login">로그인</a></div>
				<span><a href="/member/join">회원가입</a></span>
				<!-- 로그인,회원가입으로 이동 -->
			</div>
			<div class="clearfix"></div>			
		</div>
		<!-- 네비게이션 바 -->
		<div class="navi_bar_area">
			<div class="dropdown">
			    <button class="dropbtn">코딩사이트 
			      <i class="fa fa-caret-down"></i>
			    </button>
			    <div class="dropdown-content">
			    	<a href="#">테스트1</a>
			    	<a href="#">테스트2</a>
			    	<a href="#">테스트3</a>
			    	<a href="#">테스트4</a>
			    	<a href="#">테스트5</a>
			    	<a href="#">테스트6</a>	      		      		      
			    </div>			
			</div>
			<div class="dropdown">
			    <button class="dropbtn">게시판 
			      <i class="fa fa-caret-down"></i>
			    </button>
			    <div class="dropdown-content">
			    	<a href="#">테스트1</a>
			    	<a href="#">테스트2</a>
			    	<a href="#">테스트3</a>
			    	<a href="#">테스트4</a>
			    	<a href="#">테스트5</a>
			    	<a href="#">테스트6</a>	      		      		      
			    </div>	
			</div>
				<div class="info_button"><a href="/infopage">사이트 소개</a></div>			
		</div>
</body>
</html>