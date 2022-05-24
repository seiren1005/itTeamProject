<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@include file="../includes/header.jsp" %>

	<meta charset="EUC-KR">
	<title>TCP스쿨 소개</title>
    <link rel="stylesheet" type="text/css" href="reset.css" />
    <style>
      .img-concert {
        width: 200px;
        height: 100px;
      }
    </style>
  </head>
  <body>
  <h1>코드 사이트 소개</h1>
  
  
 <a href="#" target='_black' onclick=test() id="TCP">
    <img class="img-concert" src="http://www.tcpschool.com/img/logo.png" />
  </a>
  </body>
  
  <script>
    function test() {
        if (!confirm("공부 일기장과 같이 이동 하시겠습니까?")) {
            alert("취소(아니오)를 누르셨습니다.");
            window.location = '/deteil/diteil-TCP';
        } else {
            alert("공부 일기장으로 이동합니다.");
            window.open("http://www.tcpschool.com/");
            window.location = '/board/list';
        }
        
        
   // var valueById = $('#TCP').val();  
    //	alert();
    //	window.location = '/board/list';	
    }
</script>

<%@include file="../includes/footer.jsp" %>