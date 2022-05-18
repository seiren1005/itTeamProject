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
				<form action="/board/register" method="post" class="registerForm">
					<div class="">
						<select name="purpose" class="purposeBox">
							<option value="N">=====</option>
							<option value="Q">Q&A</option>
							<option value="F">FREE</option>						
						</select>
					</div>
					<div class="">
						<label>TITLE</label><input class="" name="title" />
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
					<div class="">
						비밀글<input type="checkbox" name="secret" 
							class="secretBox" value="S" />
					</div>
					<button type="submit" class="registerBtn">SUBMIT</button>
					<button type="reset" class="">RESET</button>				
				</form>			
			<!-- register form -->
			
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	
	$(".registerBtn").on("click", function(e) {
		
		e.preventDefault();
		
		var registerForm = $(".registerForm");
		
		console.log(registerForm.find(".purposeBox").val());
		
		if(registerForm.find(".purposeBox").val() == "N") {
			
			alert("Please choose purpose of board.");
			return false;
			
		}
		
		registerForm.submit();
		
	});
		
		
});
</script>


<%@ include file="../includes/footer.jsp" %>
