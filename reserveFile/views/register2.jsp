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
				<form action="/board/register" method="post" 
					class="registerForm" enctype="multipart/form-data">
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
						비밀글<input type="checkbox" name="secret" 
							class="secretBox" value="yes" />
					</div>
					<div class="">
						<label>WRITER</label><input class="" name="writer" 
							value="" />
					</div>
					<div class="">
						<label>CONTENT</label>
						<textarea class="" name="content" rows="3" >
						</textarea>
					</div>
					<div class="uploadDiv">
						<label>FILE UPLOAD</label>
						<input type="file" name="attachFile" multiple />
						<button id="uploadBtn" >UPLOAD</button>
					</div>
					<div class="uploadResult">
						<ul>
							<!-- view upload files -->
						</ul>
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
			
			// console.log(registerForm.find(".purposeBox").val());
			
			if(registerForm.find(".purposeBox").val() == "N") {
				
				alert("Please choose purpose of board.");
				return false;
				
			}
			
		registerForm.submit();

		}); // end $(".registerBtn").on()
		
			
		/* File upload restrict */
		
		// 정규식 사용해 확장자 제한 (exe, zip...)
		let regex = new RegExp("(.*?)\.(exe|zip|alz)$");
				
		// 파일 크기 제한
		let maxSize = 524880;
		
		// 파일 선택 안한 상태의 div 를 복사해둠
		var cloneObj = $(".uploadDiv").clone();
		
		// 업로드 결과를 보여줄 div tag 안에 ul tag 찾아오기
		var uploadResult = $(".uploadResult ul");
		
		/* /.File upload restrict */
		
		
		function showUploadFile(uploadArr) {
			
			let uploadHtml = "";
			
			// 업로드 파일 한개 당 li tag 한 개
			for(let i = 0; i < uploadArr.length; i++) {
				
				if(uploadArr[i].image == false) {
					// 이미지 파일이 아님
					// li tag 앞에 파일 아이콘
					let fileCallPath = encodeURIComponent("/" 
							+ uploadArr[i].uuid + "_" + uploadArr[i].filename);
					
					uploadHtml += "<li>"
						+ "<a href='/download?fileName=" + fileCallPath + "'>"
						+ uploadArr[i].fileName + "</a>"
						+ "<span data-file=\'" + fileCallPath + "\' data-type='file'>"
						+ " x </span>"
						+ "</li>";
					
				} else {
					
					// 이미지 파일
					// thumbnail 이미지 사용
					let faileCallPath = encodeURIComponent(
							"/s_" + uploadArr[i].uuid + "_" + uploadArr[i].fileName);
					
					let originalPath = originalPath.replace(new RegEx(/\\/g), "/");
					
					uploadHtml += "<li><a href=\"javascript:showImage(\'"
							+ originalPath + "\')\">"
							+ "<img src='/display?fileName=" + fileCallpath + "'></a>"
							+ "<span data-file=\'" + fileCallPath + "\' data-type='image'>"
							+ " x </span></li>"
					
				}
				
				uploadResult.append(uploadHtml);
				
			}
			
		} // end function showUploadFile()
		
		
		$("#uploadBtn").on("click", function(e) {
			
			e.preventDefault();
			
			// form tag 없이 form 보내기
			let formData = new FormData();
			
			// input tag 가져오기
			let files = files[0].files;
								
			// formData 에 파일 추가
			for(let i = 0; i < files.length; i++) {
				// 파일 검사 중에 false 가 나오면 파일 업로드 중단
				if(checkFile(files[i].name, files[i].size) == false) {
					
					return false;
					
				}
				
				formData.append("uploadFile", files[i]);
				
			}
			
			
			/* File upload and initialize input tag */
			$.ajax({
				url: "/uploadAjaxAction",
				processData: false,
				// 데이터 속성이 query string 으로 변경되지 않게 false
				contentType: false,
				// contentType: false -> multipart
				data: formData,
				type: "POST",
				success: function(result) {
					
					alert(result);
					
					// li tag 추가
					showUploadFile(result);
					
					// 요청 보내고 성공하면 input tag initialize
					$(".uploadDiv").html(cloneObj.html());
					
				}
			})
			
			/* /.File upload and initialize input tag */
			
						
		}); // end $("#uploadBtn").on()	
		
			
	}); // end $(document).ready()
	
	

	/* Delete upload file */ 
	$(".uploadResult").on("click", "span", function(e) {
		// 삭제 대상 파일
		let targetFile = $(this).data("file");
		
		// 삭제 대상 파일의 타입
		let type = $(this).data("type");
		
		$.ajax({
			url: '/deleteFile',
			type: 'POST',
			data: {
				fileName: targetFile,
				type: type
			},
			success: function(result) {
				
				alert(result);
									
			}
		})
		
	}) // end $(".uploadResult").on()
	
	/* Delete upload file */

</script>


<%@ include file="../includes/footer.jsp" %>
