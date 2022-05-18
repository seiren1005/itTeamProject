<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../includes/header.jsp" %>

	<div class="">
		<div class="">
			<h1>Board List</h1>
		</div>		
	</div>
	
	<div class="">
		<div class="">
			<div class="">
				<div class="">board list</div>
				
				<!-- 새 글 작성 버튼 -->
				<button id="regBtn" type="button" class="">
					새 글
				</button>
				<form method="get" class="purposeForm">
					<button data-oper="all" type="submit" 
						class="purposeBtn">ALL</button>
					<button data-oper="qna" type="submit" 
						class="purposeBtn">Q&A</button>
					<button data-oper="free" type="submit" 
						class="purposeBtn">FREE</button>
				</form>
				<div class="">
					<table class="">
						<thead>
							<tr>
								<th>BNo.</th>
								<th>TAG</th>
								<th>TITLE</th>
								<th>WRITER</th>
								<th>REGDATE</th>
								<th>MODDATE</th>
							</tr>						
						</thead>
						
						<!-- view all board -->
						<c:forEach items="${list }" var="board">
							<tr>
								<td><c:out value="${board.bno }" /></td>
								<td>
									<c:choose>
										<c:when test="${board.purpose eq 'Q' }">
											Q&A
										</c:when>
										<c:otherwise>
											FREE
										</c:otherwise>									
									</c:choose>								
								</td>
								<td>
									<a class="moveDetails" 
										href="<c:out value='${board.bno }' />">
										<c:out value="${board.title }" />
										<b>[<c:out value="${board.replyCnt }" />]</b>
									</a>
								</td>
								<td><c:out value="${board.writer }" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.regDate }" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.modDate }" /></td>
							</tr>						
						</c:forEach>
						<!-- /.view all board -->						
						
					</table>
					
					<div class="">
						<div class="">
							<form id="searchForm" action="/board/list" 
								method="get">
								<select name="searchType">
									<option value="T"
										<c:out value="${pageMaker.cri.searchType eq 'T' ? 
										'selected' : '' }" /> >TITLE
									</option>
									<option value="C"
										<c:out value="${pageMaker.cri.searchType eq 'C' ? 
										'selected' : '' }" /> >CONTENT
									</option>
									<option value="W"
										<c:out value="${pageMaker.cri.searchType eq 'W' ?
										'selected' : '' }" /> >WRITER
									</option>
									<option value="TC"
										<c:out value="${pageMaker.cri.searchType eq 'TC' ? 
										'selected' : '' }" /> >TITLE+CONTENT
									</option>
									<option value="TW"
										<c:out value="${pageMaker.cri.searchType eq 'TW' ? 
										'selected' : '' }" /> >TITLE+WRITER
									</option>
									<option value="CW"
										<c:out value="${pageMaker.cri.searchType eq 'CW' ? 
										'selected' : '' }" /> >CONTENT+WRITER
									</option>
									<option value="TCW"
										<c:out value="${pageMaker.cri.searchType eq 'CW' ? 
										'selected' : '' }" /> >TITLE+CONTENT+WRITER
									</option>
								</select>
								
								<input type="text" name="keyword" 
									value="<c:out value='${pagemaker.cri.keyword }' />" />
									
								<!-- page info -->
								<input type="hidden" name="pageNum" 
									value="${pageMaker.cri.pageNum }" />
								<input type="hidden" name= "amount" 
									value="${pageMaker.cri.amount }" />
								<button class="">SEARCH</button>							
							</form>
						</div>
					</div>
					
					<!-- Transport page date -->
					<form id="actionForm" 
						action="/board/list" method="get">
						
						<input type="hidden" name="pageNum" 
							value="<c:out 
								value='${pageMaker.cri.pageNum }' />" />
						<input type="hidden" name="amount" 
							value="<c:out 
								value='${pageMaker.cri.amount }' />" />
						<input type="hidden" name="searchType" 
							value="<c:out 
								value='${pageMaker.cri.searchType }' />" />
						<input type="hidden" name="keyword" 
							value="<c:out 
								value='${pageMaker.cri.keyword }' />" />
					</form>
					<!-- /.Transport page date -->
					
					<!-- Page number button -->
					<div class="">
						<ul class="">
						
							<!-- prev button -->
							<c:if test="${pageMaker.prev }">
								<li class="">
									<a href="${pageMaker.startPage - 1 }">
									PREV</a>
								</li>
							</c:if>
							
							<!-- page number -->
							<c:forEach var="num" 
								begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }">
								
								<li class="pageNumBtn">
									<a href="${num }">${num }</a>
								</li>	
							</c:forEach>
								
							<!-- next button -->
							<c:if test="${pageMaker.next }">
								<li class="">
									<a href="${pageMaker.endPage + 1 }">
									NEXT</a>							
								</li>
							</c:if>							
						</ul>
					</div>
					
					<!-- /.Page number button -->
					
				</div>
			</div>
		</div>	
	</div>
	
<script type="text/javascript">

	$(document).ready(function() {
		
		var result = "<c:out value='${result }' />";
		// BoardController register() 의 리턴값
		
		checkAlert(result);
		
		/* 중복된 글 도배 금지 기능 */
		function checkAlert(result)	{
			
			if(result == "") {
				
				return;
				
			}
			
			if(parseInt(result) > 0) {
				
				alert("게시글" + result + " 번이 등록되었습니다.");
				
			}					
			
		};
	/* /.중복된 글 도배 금지 기능 */
				
	
	
	
	
	/* reigster.jsp 페이지로 이동 */
	$("#regBtn").on("click", function() {
		self.location="/board/register";
		
	});	
	/* /.reigster.jsp 페이지로 이동 */
	
	
	/* Page processing */
		var actionForm = $("#actionForm");
		
		// add event to page button
		$(".pageNumBtn a").on("click", function(e) {
			
			e.preventDefault();
			
			// 클릭한 페이지 번호가 page info 의 hidden input tag
			// 내의 pageNum 에 저장
			actionForm.find("input[name='pageNum']")
				.val($(this).attr("href"));
			
			// 뒤로가기 시 파라미터가 계속 추가되는 현상 수정
			actionForm.attr("action", "/board/list");
			
			actionForm.submit();
						
		});
		
		
		/* qna and free tag */
		var purposeForm = $(".purposeForm");
		
		$(".purposeBtn").on("click", function(e) {
			
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			if(operation === "all") {
				
				purposetForm.att("action", "/board/list");
				
			} else if(operation === "qna") {
				
				purposeForm.attr("action", "/board/list/qna");
				
			} else if(operation === "free") {
				
				purposeForm.attr("action", "/board/list/free");
				
			}
			
			purposeForm.submit();
			
			
		});
		
		
		/* /.qna and free tag */
		
		
		/* /.Page processing */
		
		
		/* add event when click title */
		$(".moveDetails").on("click", function(e) {
			
			e.preventDefault();
			
			// page info 같이 전달
			// 뒤로 가기시 파라미터 추가되는 현상 수정
			if(actionForm.find("input[name='bno']").val() == null) {

				actionForm.append(
						"<input type='hidden' name='bno' value='"
						+ $(this).attr("href") + "' />");
				actionForm.attr("action", "/board/get");
				
				console.log($(this).attr("href"))
				
			} else {
				// 뒤로가기 시 input[name='bno'] 의 값을 현재
				// 선택한 게시물의 번호로 바꿔줌
				actionForm.find("input[name='bno']").val($(this).attr("href"));
				
			}
			
			console.log(actionForm.find("input[name='bno']").val());
			
			actionForm.submit();
			
		});		
		/* /.add event when click title */
		
		
		/* Add search event */
		var searchForm = $("#searchForm");
		
		$("#searchForm button").on("click", function(e) {
			
			e.preventDefault();
			
			// keyword check
			if(!searchForm.find("input[name='keyword']").val()) {
				// keyword 입력하지 않았을 경우
				alert("Please input keyword for search.");
				return false;
				
			}
			
			searchForm.find("input[name='pageNum']").val("1");

			searchForm.submit();
			
		});		
		/* /.Add search event */	

		
		
		
		
		
		
	}); // end $(document).ready()	
		
</script>
	
	
<%@ include file="../includes/footer.jsp" %>
