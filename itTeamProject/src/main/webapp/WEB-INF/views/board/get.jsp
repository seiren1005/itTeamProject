<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div class="">
	<div class="">
		<h1 class="">Board</h1>
	</div>
</div>

<div class="">
	<div class="">
		<div class="">
			<div class="">Board2</div>
			
			<div class="">
				<div class="">
					<label>Bno.	</label>
					<input class="" name="bno" 
						value="<c:out value='${board.bno }' />" 
						readonly />
				</div>
				<div class="">
					<label>TITLE</label>
					<input class="" name="title" 
						value="<c:out value='${board.title }' />" 
						readonly />
				</div>
				<div class="">
					<label>CONTENT</label>
					<textarea class="" name="content"
						rows="3" readonly >
						<c:out value='${board.bno }' />
					</textarea>
				</div>
				<div class="">
					<label>WRITER</label>
					<input class="" name="writer" 
						value="<c:out value='${board.writer }' />" 
						readonly />
				</div>
				
				<!-- Button for locating to modify.jsp -->
				<button data-oper="update" class="">MODIFY</button>
				
				<!-- Button for going back to list.jsp -->
				<button data-oper="list" class="">LIST</button>
				
				<!-- Hidden information -->
				<form id="operForm" action="board/modify" method="get">
					<input type="hidden" id="bno" name="bno" 
						value="<c:out value='${board.bno }' />" />
					
					<!-- Information for paging processing -->
					<input type="hidden" name="pageNum" 
						value="<c:out value='${cri.pageNum }' />" />
					<input type="hidden" name="amount" 
						value="<c:out value='${cri.amount }' />" />
						
					<!-- Ramain search information -->
					<input type="hidden" name="searchType" 
						value="<c:out value='${cri.searchType }' />" />
					<input type="hidden" name="keyword" 
						value="<c:out value='${cri.keyword }' />" />
				</form>
				<!-- /.Hidden information -->					
				
			</div>
		</div>
	</div>
</div>

<!-- Reply lists in board -->
<div class="">
	<div class="">
		<div class="">
		
		<div class="">
			<!-- icon tag -->
			<i class=""></i>REPLY			
		</div>
			<!-- Register reply form -->
			<div class="replyForm">
				<i class=""></i>
				<input class="reply_replyer" name="replyer"
					placeholder="replyer" />
				<input class="" name="reply" 
					placeholder="New reply!" />		
				<button id="registerReplyBtn" type="button" class="">REGISTER</button>
			</div>
			<!-- /.Register reply form -->
		
		<!-- Reply lists -->
		<div class="chat">
			<ul>
			
			</ul>
		</div>
		<!-- /.Reply lists -->
		
		<!-- Page button for reply -->
		<div class="panel-footer">
		
		</div>
		<!-- /.Page button for reply -->
		
		<!-- Button for a reply -->
		<div class="">
			<button id="updateReplyBtn" type="button" class="">UPDATE</button>
			<button id="deleteReplyBtn" type="button" class="">REMOVE</button>
		</div>
		<!-- /.Button for a reply -->
		
		</div>
	</div>
</div>
<!-- /.Reply lists in board -->


<!-- Add javascript tag and source for reply -->
<script type="text/javascript" src="/resources/js/app.js"></script>

<script type="text/javascript">
	
	/* function for reply */
	var replyUL = $(".chat");
	
	$(document).ready(function() {
		
		var bnoValue = '<c:out value="${board.bno}" />';
		
		showList(1);
		
		/* Dynamic reply lists */
		function showList(page)	{
			
			replyService.getList(
				{
					bno: bnoValue,
					page: page || 1
					// page 가 있으면 page 값으로 없으면 1 로
				},
				function(replyCnt, list) {
					// success 시 callback ㅎ마수에 replyCnt, list 받아옴
					console.log("replyCnt: " + replyCnt);
					console.log("list: " + list);
					
					// 페이지 번호가 -1 일 경우 마지막 페이지로 이동
					if(page == -1) {
						
						pageNum = Math.ceil(replyCnt/10.0);
						showList(pageNum);
						return;
						// 마지막 페이지로 이동하고 function 종료
						
					}
					
					var comments="";
					
					if (list == null || list.length == 0) {
						// 게시물에 댓글 X -> html 코드 조립 필요 없음
						replyUL.html(comments);
						return;
						// exit function
					}
					
					// exist reply
					for (let i = 0; i < list.length; i++) {
						
						comments += "<li class='' data-rno='" + list[i].rno + "'>";
						comments += "<div>";
						comments += "<div class=''>";
						comments += "<string class=''>" + list[i].replyer + "</strong>";
						comments += "<small class=''>";
						comments += replyService.displayTime(list[i].replyRegDate);
						comments += "</small></div>";
						comments += "<p>" + list[i].reply + "</p></div></li>";
						
					}
					
					replyUL.html(comments);
					showReplyPage(replyCnt);
					
				} // end function(replyCnt, list)
				
			) // end replyService.getReplyList()
			
		} // end function showList()
		
		/* /.Dynamic reply lists */
		
	

	/* /.function for reply */


	/* Add page button for reply */
	var replyPageFooter = $(".panel-footer");
	var pageNum = 1;
	
	function showReplyPage(replyCnt) {
		
		var endNum = Math.ceil(pageNum / 10.0) * 10;
		var startNum = endNum - 9;
		
		// 앞 페이지가 있으면
		let prev = startNum != 1; // 1 이 아니면 true
		
		// 댓글은 처음 작성한 댓글부터 보이므로 (마지막 페이지)
		// next 의 default 는 false 로
		let next = false;
		
		// 마지막 페이지 포함 댓글 개수가 실제 댓글 개수보다
		// 많을 경우
		if (endNum * 10 >= replyCnt) {
			
			endNum = Math.ceil(replyCnt / 10.0);
			
		}
		
		// endNum 이 댓글 개수보다 적으면 다음 페이지 존재
		if (endNum * 10 < replyCnt) {
			
			next = true;
			
		} 
		
		// 댓글 페이지 html 코드 조립
		let pageHtml = "<ul class=''>";
		
		// prev 보이기 여부
		if (prev) {
			
			pageHtml += "<li class=''>";
			pageHtml += "<a class='' href='" + (startNum - 1) + "'>";
			pageHtml += "PREV</a></li>";
			
		}
		
		// 페이지 넘버 버튼
		for(let i = startNum; i <= endNum; i++) {
			// active: 현재 클릭한 페이지 번호
			let active = pageNum == i ? "active" : "";
			pageHtml += "<li class='" + active + "'>";
			pageHtml += "<a class='' href='" + (endNum + 1) + "'>";
			pageHtml += "NEXT</a></li>";
			
		}
		
		pageHtml += "</ul>";
		
		// html 코드 삽입
		replyPageFooter.html(pageHtml);		
		
	}; // end showReplyPage(replyCnt)

	/* /.Add page button for reply */


	// replyForm div 가져오기
	var replyForm = $(".replyForm");
	
	// name 속성이 reply 인 input
	var formInputReply = replyForm.find("input[name='reply']");
	var formInputReplyer = replyForm.find("input[name='replyer']");
	
	// register reply
	$("#registerReplyBtn").on("click", function(e) {
		// 게시글 번호 bno 가져와서 reply 객체 생성후 
		// 댓글 달기 기능 실행
		
		var reply = {
				reply: formInputReply.val(),
				replyer: formInputReplyer.val(),
				bno: bnoValue
		};
		
		replyService.add(reply, function(result) {
			
			alert(result);
			replyForm.find("input").val("");
			
			showList(-1);
			
		});
		
	}); // end register reply
	
	
	/* update reply */
		
	$("updateReplyBtn").on("click", function(e) {
		// 댓글 수정
		
		let originalReplyer = formInputReplyer.val();
		
		var reply = {
				rno: replyForm.data("rno"),
				reply: formInputReply.val(),
				replyer: originalReplyer
		}
		
		if (replyer != originalReplyer) {
			
			alert("Couldn't update a reply.");
			return;
			
		}
		
		replyService.update(reply, function(result) {
			
			alert(result);
			
			showList(pageNum);
			replyForm.find("input").val("");
			
		});
		
		
	});
		// 나중에 동적으로 생기는 li tag 에 이벤트 대상 변경
		
	/* /.update a reply */
	
	
	/* Delete a reply */
	$("#deleteReplyBtn").on("click", function(e) {
		
		let originalReplyer = formInputReplyer.val();
		
		if(replyer != originalReplyer) {
			
			alert("Couldn't delete a reply.")
			return;
			
		}
		
	replyService.remove(rno, originalReplyer, function(result) {
		
		alert(result);
		
		showList(pageNum);
		
	});		
		
	});
	
	/* /.Delete a reply */
	
	
	/* event delegation */
	// 동적으로 생성된 태그에는 직접 이벤트를 달아줄 수 없음
	// 상위나 형제 tag 에 달아주고 나중에 이벤트 대상을 변경
	
	replyPageFooter.on("click", "li a", function(e)	{
		// remove a tag event
		e.preventDefault();
		
		let target = $(this).attr("href");
		pageNum = target;
		showList(pageNum);
		
	});
	
	/* /.event delegation */
	
	}); // end ready(function())
	
</script>

<script type="text/javascript">
	$(document).ready(function() {
		
		var operForm = $("operForm");
		
		$("button[data-oper='update']").on("click", function() {
			operForm.submit();
		});
		
		$("button[data-oper='list']").on("click", function() {
			
			operForm.find("#bno").remove();
			operForm.attr("action", "board/list");
			operform.submit();
						
		});
		
	}); // end $(document).ready

</script>

<!-- /.Add javascript tag and source for reply -->

<%@ include file="../includes/footer.jsp" %>
