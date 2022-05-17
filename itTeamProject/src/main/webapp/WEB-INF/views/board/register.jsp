<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div class="">
	<div class="">
		<h1 class="">Board Register</h1>
	</div>
</div>

<div class="">
	<div class="">
		<div class="">
			<div class="">board register</div>
			<div class="">
			<!-- register form -->
				<form action="/board/register" method="post">
					<div class="">
						<label></label><input class="" name="title" />
					</div>
					<div class="">
						<label>CONTENT</label>
						<textarea class="" name="content" rows="3" >
						</textarea>
					</div>
					<div class="">
						<label>WRITER</label><input class="" name="writer" 
							value="" />
					</div>
					<button type="submit" class="">SUBMIT</button>
					<button type="reset" class="">RESET</button>				
				</form>			
			<!-- register form -->
			
			</div>
		</div>
	</div>
</div>

<%@ include file="../includes/footer.jsp" %>
