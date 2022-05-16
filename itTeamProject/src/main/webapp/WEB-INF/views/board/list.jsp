<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../includes/header.jsp" %>

	<div class="">
		<div class="">
			<h1>Board</h1>
		</div>
		<div class="">
			<table class="">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>수정일</th>
					</tr>
				</thead>
				
				<!-- DB 에 등록된 모든 board 출력 -->
				<c:forEach items="${list }" var="board">
					<tr>
						<td><c:out value="${board.bno }" /></td>
						<td>
							<a class="" 
								href="<c:out value='${board.bno }' />">
								<c:out value="${board.title }" />
							</a>
						</td>
						<td><c:out value="${board.writer }" /></td>
						<td><fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/></td>
						<td><fmt:formatDate value="${board.modDate }" pattern="yyyy-MM-dd"/></td>
					</tr>							
				</c:forEach>
			</table>
		</div>
	</div>
	
<%@ include file="../includes/footer.jsp" %>
