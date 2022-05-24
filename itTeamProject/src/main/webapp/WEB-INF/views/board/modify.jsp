<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Modify/Delete</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Board Read
                        </div>
                        <!-- /.panel-heading -->
                       
                        <div class="panel-body">
                        
	                         <form action="/board/modify" method="POST">
	                         	<input type='hidden' name ='pageNum' value ='<c:out value="${cri.pageNum }"/>'>
	                         	<input type='hidden' name ='amount' value ='<c:out value="${cri.amount }"/>'>
	                        	<div class="form-group">
	                                <label>BNO</label>
	                                <input class="form-control" name = "bno"  readonly= "readonly" value='<c:out value ="${board.bno }"/>'>
	                             </div>
	                         	<div class="form-group">
	                                <label>Title</label>
	                                <input class="form-control" name = "title" value='<c:out value ="${board.title }"/>'>
	                             </div>
	                             
								<div class="form-group">
	                                <label>Content</label>
	                                <textarea class="form-control" rows="5" cols="50" name="content"> <c:out value ="${board.content }"/> </textarea>
	                             </div>
	                             
	                            	<div class="form-group">
	                                <label>Writer</label>
	                                <input class="form-control" name = "writer"  readonly= "readonly" value='<c:out value ="${board.writer }"/>'>
	                             </div>
									<button type="button" class="btn btn-default "data-oper="modify">수정</button>
									<button type="button" class="btn btn-info" data-oper="list">목록</button>
	                          		<button type="button" class="btn btn-danger " data-oper="remove">삭제</button>
	                        </form>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
			 <div class = "row">
			 	<div class = "col-lg-12">
			 		<div class = "panel panel-default">
			 		
			 			<div class = "panel-heading">Files</div>
			 				<div class= "panel-body">
			 					<div class="form-group uploadDiv">
			 						<input type="file" name = "uploadFile" multiple="multiple">
			 					</div>
			 					<div class = "uploadResult">
			 						<ul>
			 						</ul>
			 					</div>
			 				 </div><!--  end panel body -->
			 		</div><!--  end panel-default-->
			 	</div><!--  end col-lg-12 -->
			 </div><!--  end "row" -->
			 
			 <div class='bigPictureWrapper'>
			 	<div class= 'bigPicture'>
			 	</div>
			 </div>
<!-- style -->
	<style>
	
	.uploadResult{
		width: 100%;
		background-color : gray;
	}
	
	.uploadResult ul{
		display:flex;
		flex-flow :row;
		justify-content : center;
		align-items : center;
	}
	
	.uploadResult ul li{
		list-style : none;
		padding 10px;
	}
	
	.uploadResult ul li img{
		width : 100px;
	}
	
	.uploadResult ul li span{
		color : white;
	}
	.bigPictureWrapper{
		position: absolute;
		display: none;
		justify-content: center;
		aligin-items: center;
		top:0%;
		width:100%;
		height:100%;
		background-color : grey;
		z-index : 100;
		background:rgba(255,255,255,0.5);
	}
	.bigPicture{
		position: relative;
		display: felx;
		justify-content: center;
		align-items: center;
	}
	.bigPicture img{
		width : 600px;
	}
	
	</style>
<!-- end style -->            
<script>
 $(document).ready(function(){
	 
	 var formObj = $("form");
	 
	 $('.btn').click(function(e){
		 
		e.preventDefault();
		
		var operation = $(this).data("oper")
		
		console.log(operation);
		
		if(operation ==='list'){
			formObj.attr("action", "/board/list").attr("method","get");
			var pageNumTag=$("input[name='pageNum']").clone();
			var amountTag=$("input[name='amount']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.submit();
		}else if(operation === 'remove'){
			console.log("remove clicked");
			formObj.attr("action","/board/remove");
			//.attr("method","post");
			formObj.submit();
			
		}else if(operation === 'modify'){
			console.log("modify clicked");
			var str = "";
			
			$(".uploadResult ul li").each(function(i,obj){
				var jobj = $(obj);
				console.dir(jobj);
				
				str += "<input type = 'hidden' name = 'attachList[" +i +"].fileName' value= '" +jobj.data("filename")+"'>";
				str += "<input type = 'hidden' name = 'attachList[" +i +"].uuid' value= '" +jobj.data("uuid")+"'>";
				str += "<input type = 'hidden' name = 'attachList[" +i +"].uploadPath' value= '" +jobj.data("path")+"'>";
				str += "<input type = 'hidden' name = 'attachList[" +i +"].fileType' value= '" +jobj.data("type")+"'>";
				});
			formObj.append(str).submit();
		}
	 });

		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880;
		
		function checkExtension(fileName, fileSize){
			
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			
			if(regex.test(fileName)){
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
		
		$("input[type='file']").change(function(e){
			
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			
			for(var i = 0; i < files.length; i++){
				if(!checkExtension(files[i].name, files[i].size) ){
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			
			// 업로드 이미지&파일 표출
			function showUploadResult(uploadResultArr){
				if(!uploadResultArr || uploadResultArr.length == 0){return;}
				var uploadUL = $(".uploadResult ul");
				var str = "";
				
				$(uploadResultArr).each(function(i, obj){
					//image type
					if(obj.image){
						var objFN = obj.fileName.trim();
						var objPath = obj.uploadPath.replace(/^\s+|\s+$/gm,'');
						console.log("objFN :" + objFN);
						console.log("objPath :" + objPath);
						
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/" +obj.uuid + "_" +obj.fileName);
						str += "<li data-path ='" +obj.uploadPath + "'";
						str += "data-uuid='"+ obj.uuid +"'data-filename='"+ obj.fileName +" 'data-type = '" + obj.image +"'";
						str += "> <div>";
						str += "<span>"+obj.fileName+"</span>";
						str += "<button type = 'button'  data-file=\'" + fileCallPath + "\' data-type = 'image' class = 'btn btn-waring btn-circle'><i class = 'fa fa-times'></i></button><br>";
						str += "<img src = '/display?fileName=" + fileCallPath +"'>";
						str += "</div>";
						str += "</li>";
					// not Image type
					}else{
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/" +obj.uuid + "_" + obj.fileName);
						var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
						
						str += "<li data-path = '" + obj.uploadPath + "' data-uuid='"+obj.uuid+"'data-filename='"+obj.fileName+"'data-type='"+obj.image+ "'><div>";
						str += "<span> " + obj.fileName + "</span>";
						str += "<button type = 'button' data-file=\'" + fileCallPath + "\' data-type = 'file'"
						str += "class = 'btn btn-waring btn-circle'><i class = 'fa fa-times'></i></button><br>";
						str += "<img src = '/resources/img/attach.jpg' width="+"80px"+" height="+ "80px" +"'>";
						str += "</div>";
						str += "</li>";
					}
				});
				uploadUL.append(str);
			}
			
			$.ajax({
				url : '/uploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				success : function(result){
					console.log(result);
					// 업로드 이미지 표출
					showUploadResult(result);
					//$(".uploadDiv").html(cloneObj.html());
				}
			}); //uploadAjaxAction $.ajax
	 	});
	 	
	 });
</script>  

<script>
	$(document).ready(function(){
		<!-- 
		(function(){
			var bno = '<c:out value="${board.bno}"/>';
			$.getJSON("/board/getAttachList", {bno:bno},function(arr){
				console.log(arr);
				var str = "";
				$(arr).each(function(i, attach){
					//image
					if (attach.fileType){
						//fileName공백발생 -> trim()으로 제거 
						var attachFN = attach.fileName.trim();
						var attachPath = attach.uploadPath.trim();
						var fileCallPath = encodeURIComponent(attachPath + "/s_" +attach.uuid + "_" + attachFN);
						str += "<li data-path ='" +attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attachFN +"' data-type = '" + attach.fileType + "'><div>";
						str += "<span> " + attachFN + "</span><br/>";
						str += "<button type='button' data-file=\'" + fileCallPath +"\' data-type='image' class='btn btn=warning btn-circle'><i class='fa fa-times'></i></button>";
						str += "<img src = '/display?fileName=" + fileCallPath +"'>";
						str += "</div>";
						str += "</li>";
					}else{
						str += "<li data-path = '" + attach.uploadPath +"' data-uuid = '" + attach.uuid +"' data-filename = '" + attach.fileName +"' data-type = '" + attach.fileType +"'><div>";
						str += "<span> " + attach.fileName + "</span><br/>";
						str += "<button type='button' data-file=\'" + fileCallPath +"\' data-type='file' class='btn btn=warning btn-circle'><i class='fa fa-times'></i></button>";
						str += "<img src = '/resources/img/attach.jpg'></a>";
						str += "</div>";
						str += "</li>";
						}	
				}); //end func
				$(".uploadResult ul").html(str);
			});// end getjson
		})();//end function
		
		$(".uploadResult").on("click", "button",function(e){
			console.log("delete file");
			if(confirm("Remove this file ?")){
				var targetLi = $(this).closest("li");
				targetLi.remove();
			}
		});
	});
</script>
          
  
  <%@include file="../includes/footer.jsp" %>
