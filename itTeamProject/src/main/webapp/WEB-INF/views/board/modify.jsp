<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div class="">
	<div class="">
		<h1 class="">Update board</h1>
	</div>
</div>

<div class="">
	<form role="form" action="/board/modify" method="post">
	
	<!-- hidden input tag -->
	<input type="hidden" name="pageNum"	value="<c:out value='${cri.pageNum }' />" />
	<input type="hidden" name="amount" value="<c:out value='${cri.amount }' />" />
	<input type="hidden" name="purpose" value="<c:out value='${cri.purpose }' />" />

	<input type="hidden" name="searchType" value="<c:out value='${cri.searchType }' />" />
	<input type="hidden" name="keyword" value="<c:out value='${cri.keyword }' />" />
	<!-- /.hidden input tag -->
	
	<div class="">
		<label>BNo. </label> <input id="back-bno" class="" name="bno" 
			value="<c:out value='${board.bno }' />" readonly />
	</div>
	<div class="">
		<label>TITLE</label> <input id="" class="" name="" 
			value="<c:out value='${board.title }' />" />
	</div>
	<div class="">
		<label>CONTENT</label> 
		<textarea class="" name="content" rows="3" >
			<c:out value='${board.content }' />
		</textarea>
	</div>
	<div class="">
		<label>WRITER</label> <input id="" class="" name="writer" 
			value="<c:out value='${board.writer }' />" />
	</div>
	<div class="">
		<label>REGDATE</label> <input id="" class="" name="regDate" 
			pattern="<fmt:formatDate pattern='yyyy/MM/dd HH:mm:ss' 
			value='${board.regDate }' />" readonly />
	</div>
	<div class="">
		<label>MODDATE</label> <input id="" class="" name="modDate" 
			pattern="<fmt:formatDate pattern='yyyy/MM/dd HH:mm:ss' 
			value='${board.modDate }' />" readonly />
	</div>
	
	<button data-oper="update" type="submit" class="">UPDATE</button>
	<button data-oper="delete" type="submit" class="">DELETE</button>
	<button data-oper="get" type="submit" class="">GO BACK</button>
	<button data-oper="list" type="submit" class="">LIST</button>
		
	</form>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		// 어떤 submit 눌렀는지 확인 후 종류에 맞는 요청을 보냄
		
		let formObj = $("form");
		
		// Add event to button
		$("button").on("click", function(e) {
			
			e.preventDefault();
			
			var operation = $(this).data("oper");
			// click event 가 일어난 버튼의 data-oper 속성 가져오기
			
			if (operation === "update") {
				// 기존 action 그대로
				
			} else if (operation === "delete") {
				
				formObj.attr("action", "/board/remove");
				// 기존 action 대신 새 action attribute 지정 
				
			} else if (operation === "get") {
				
				var back_bno = $("back-bno").val();
				
				// url 로 파라미터 전달
				$(location).attr("href", "/board/get?bno=" + back_bno);
				return;
				
			} else if (operation === "list") {
				// 이동만 하면 됨
				formObj.attr("action", "/board/list").attr("method", "get");
				
				// page processing
				var pageNumTag = $("input[name='pageNum']").clone();
				// tag 자체를 복사
				var amountTag = $("input[name='amount']").clone();
				
				var searchTypeTag = $("input[name='searchType']").clone();
				
				var keywordTag = $("input[name='keyword']").clone();
				
				var purposeTag = $("input[name='purpose']").clone();
				
				formObj.empty();
				// formObj 입력 정보 초기화
				
				// 모두 지운 상태에서 page 정보 가진 input tag 만 추가
				formObj.append(pageNumTag).append(amountTag)
					.append(searchTypeTag)
					.append(keywordTag)
					.append(purposeTag)
					
			}
			
			// submit
			formObj.submit();
						
		});
		
		
	}); // end $(document).ready
	
</script>

<%@ include file="../includes/footer.jsp" %>
