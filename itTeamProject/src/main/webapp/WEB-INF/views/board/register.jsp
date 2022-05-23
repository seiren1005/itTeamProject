<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>


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
					
					<input type="hidden" id="pathInput" />
					
					<div class="">
						<select name="purpose" class="purposeBox">
							<option value="N">=====</option>
							<option value="Q">Q&A</option>
							<option value="F">FREE</option>						
						</select>
					</div>
					<div class="">
						<label>TITLE</label><input class="boardTitle" name="title" />
					</div>
					<div class="">
						비밀글<input type="checkbox" name="secret" 
							class="secretBox" value="yes" />
					</div>
					<div class="">
						<label>WRITER</label><input class="boardWriter" name="writer" 
							value="" />
					</div>
					<div class="">
						<label>CONTENT</label>
						<textarea class="boardContent" name="content" rows="3" >
						</textarea>
					</div>
					<div class="uploadDiv">
						<label>FILE UPLOAD</label>
						<input type="file" id="uploadInput" name="attachFile" multiple />
						<button id="uploadBtn">UPLOAD</button>
					</div>
					<div id="uploadResult">
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
		
	/* 업로드 파일 삭제 */
	$("#uploadResult").on("click", "span", function(e){				
		//삭제 대상 파일
		let targetFile = $(this).data("file");
		
		//삭제 대상 파일의 타입
		let type = $(this).data("type");
		
		$.ajax({
			url: '/deleteFile',
			type: 'POST',
			data : {fileName:targetFile, type:type},
			dataType : 'text',
			success : function(result){
				alert(result);
				
			}
			
		})
		
		$(this).closest("li").remove();
				
	})	
	/* /.업로드 파일 삭제 */
		
		
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
		
		/* upload file and show */
			// 파일 확장자 제한
			let regex = new RegExp("(.*?)\(exe|sh|zip|alz)$");
			
			let maxSize = 5242880; // 파일 크기 5 mb 로 제한
			
			var cloneObj = $(".uploadDiv").clone();
			
			var uploadResult = $("#uploadResult ul");
			
				
		function showUploadFile(uploadArr) {			
			
			let uploadHtml = "";
			let infoValue = "";
			
			// 업로드 파일 한개 당 li tag 한 개
			for(let i = 0; i < uploadArr.length; i++) {
				
				if(uploadArr[i].image == false) {
					// 이미지 파일이 아님
					// li tag 앞에 파일 아이콘
					let fileCallPath = encodeURIComponent("/" + uploadArr[i].uuid
							+ "_" + uploadArr[i].fileName);
					
					uploadHtml += "<li class='uploadLi'>"
						+ "<img src='/resources/img/file_icon2.png'>"
						+ uploadArr[i].fileName
						+ "<span data-file=\'" + fileCallPath + "\' data-type='file'>"
						+ " x </span>"
						+ "</li>";
						
					infoValue += "{" + "uuid:" + uploadArr[i].uuid
					+ "_" + ",filename:" + uploadArr[i].fileName + "}/";
					
					
				} else {
					
					// 이미지 파일
					// thumbnail 이미지 사용
					let fileCallPath = encodeURIComponent("/s_" + uploadArr[i].uuid
							+ "_" + uploadArr[i].fileName);
					
					let originPath = uploadArr[i].uuid + "_" + uploadArr[i].fileName;
					
					originPath = originPath.replace(new RegExp(/\\/g), "/");
					
					uploadHtml += "<li class='uploadLi'>"
							+ uploadArr[i].fileName
							+ "<img src='/display?fileName=" + fileCallPath + "'>"
							+ "<span data-file=\'" + fileCallPath + "\' data-type='image'>"
							+ " x </span></li>";
							
					infoValue += "{" + "uuid:" + uploadArr[i].uuid
					+ "_" + ",filename:" + uploadArr[i].fileName + "}/";
					
				}
				
				uploadResult.append(uploadHtml);
				$("#pathInput").val(infoValue);
				
				
			}
			
		} // end function showUploadFile()
		
		
		/* inpect files */
		function checkFile(fileName, fileSize) {
			// 파일 크기 검사
			if(fileSize > maxSize) {
				
				alert("파일 최대 크기 초과");
				return false;
				
			}
			
			// 파일 확장자 검사 ( 정규식과 파일 이름이 일치하는 패턴이면 false)
			if(regex.test(fileName)) {
				
				alert("해당 종류의 파일은 업로드 불가");
				return false;
				
			}
			
			return true;
			
		}
		
		
		$("#uploadBtn").on("click", function(e) {
			
			e.preventDefault();
			
			// form tag 없이 form 보내기
			let formData = new FormData();
			
			// input tag 가져오기
			let file = $("input[name='attachFile']");
			let files = file[0].files;
								
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

</script>


<%@ include file="../includes/footer.jsp" %>
