<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>	
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<head>
<style>
  #header {
			background-color:lightgrey;
			height:100px;
		}
  #nav {
    background-color:#339999;
    color:white;
    width:300px;
    height:300px;
    float:left;
  }
  #result {
    background-color:#337e99;
    width:600px;
    height:200px;
    text-align:left;
    float:left;
    padding:10px;
  }
  #footer {
			background-color:#FFCC00;
			height:100px;
			clear:both;
		}
  #header, #nav, #result, #footer { text-align:center; }
  #nav, #result  { line-height:24px; }
</style>

<title>Recipe</title>

<script>
window.onload=function() {
 document.getElementById("preview").onclick=processText;
}

function processText() {
 var txtBox = document.getElementById("inputbox");
 var lines = txtBox.value.split("\n");

 // 택스트 lnnerhtml로 변환 resultString 결과 (String)파일 
 var resultString  = "<p>";
 for (var i = 0; i < lines.length; i++) {
   resultString += lines[i] + "<br />";
 }
 resultString += "</p>";


 var   blk   = document.getElementById("result");
 blk.innerHTML  =  resultString; 
}
</script>

</head>
<body>
  <div id="header">
		<h2>HEADER 영역</h2>
	</div>

  <div id="nav">
    <textarea id="inputbox" cols="20" rows="10"></textarea>
    <button id="preview">Run</button>
  </div>


<div id="section"  style="overflow:scroll; width:800px; height:350px;">
    <div id="result"></div>
  </div>

  <div id="footer">
		<h2>FOOTER 영역</h2>
	</div>
</body>
</head>