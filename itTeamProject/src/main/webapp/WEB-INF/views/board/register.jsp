<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/header.jsp" %>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Tables</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           	매일 매일 공부한 내용을 쌓아가자!
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        
                            <form role="registerForm" action="/board/register" method="POST">
                            
                            	<div class="form-group">
                                   <label>Title</label>
                                   <input class="form-control" name = "title">
                                </div>                                                         
                                
								<div class="form-group" >
                                   <label>Content</label>
                                   <textarea class="form-control" rows="5" cols="50" name="content" id="inputbox" ></textarea>
                                </div>                                                         
                                
                               	<div class="form-group">
                                   <label>Writer</label>
                                   <input class='form-control' name ='writer' >
                                </div>
									<button type="submit" class="btn btn-default">작성</button>
                            		<button type = "button" class="btn btn-info listbtn">목록</button>
                            		<button type="reset" class="btn btn-danger">초기화</button>
                            </form>
                           
                        
                            <form id="actionForm" action="/board/list" method="get">
                            	<input type ="hidden" name="pageNum" value="${cri.pageNum }">
							   	<input type ="hidden" name="amount" value="${cri.amount }">
                            </form>
                            	
							<script>
	                        	var actionForm = $("#actionForm");
	                        	
	                        	$(".listbtn").click(function(e){
	                        		e.preventDefault();
	                        		actionForm.submit();
	                        	});
                        	</script>
                        	
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <!--  File attach -->
            <div class = "row">
            	<div class = "col-lg-12">
            		<div class = "panel panel-default">
            			<div class = "panel-heading">File Attach</div>
            				<div class= "panel-body">
            					<div class = "form-group uploadDiv">
            						<input type="file" name="uploadFile" multiple>
            					</div>
            					
            					<div class = "uploadResult">
            						<ul>
            						
            						</ul>
            					</div>
            				 </div><!--  end panel body -->
            				
            		</div><!--  end panel-default-->
            	</div><!--  end col-lg-12 -->
            </div><!--  end "row" -->
            
            <!-- HTML -->
           <!--  <div class = "row">
            	<div class = "col-lg-12">
            		<div class = "panel panel-default">
            			<div class = "panel-heading">HTML TEST</div>
            
            
            <div id="nav">
   					<textarea id="inputbox" class="form-control" rows="5" cols="50" name="content"></textarea>
  				</div>
  					</div>
  				</div>
  			</div>
  				  -->
  				
            
               <div class = "row">
            	<div class = "col-lg-12">
            		<div class = "panel panel-default">
            			<div class = "panel-heading">html 확인해보기
   					<button id="preview">Run</button>
            </div>
            
            <div id="section"  style="overflow:scroll; width:952px; height:350px;">
    			<div id="result"></div>
  			</div>
  			
            		</div>
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
		padding : 10px;
	}
	
	.uploadResult ul li img{
		width : 100px;
	}
	
	.uploadResult ul li span{
		color : white;
	}
	.bigPicutreWrapper{
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
		width:100px;
	}
	
</style>
<!-- end style -->           
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(e){
		
		var formObj = $("form[role='registerForm']");
		
		$("button[type='submit']").on("click",function(e){
			e.preventDefault();
			console.log("submit clicked");
			
			var str = "";
			
			$(".uploadResult ul li").each(function(i, obj){
				var jobj = $(obj);
				console.dir("jobj : " + jobj);
				
				str += "<input type = 'hidden' name = 'attachList["+i+"].fileName' value= '" +jobj.data("filename")+"'>";
				str += "<input type = 'hidden' name = 'attachList["+i+"].uuid' value= '" +jobj.data("uuid")+"'>";
				str += "<input type = 'hidden' name = 'attachList["+i+"].uploadPath' value= '" +jobj.data("path")+"'>";
				str += "<input type = 'hidden' name = 'attachList["+i+"].fileType' value= '" +jobj.data("type")+"'>";
			});
			formObj.append(str).submit();
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
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/" +obj.uuid + "_" + obj.fileName);
						console.log("uploadResultArr " + fileCallPath);
						str += "<li data-path ='" +obj.uploadPath + "'";
						str += "data-uuid='"+ obj.uuid +"'data-filename='"+ obj.fileName +" 'data-type = '" + obj.image +"'";
						str += "> <div>";
						str += "<span> " + obj.fileName + "</span>";
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
						str += "<img src = '/resources/img/attach.jpg' width="+"100px"+" height="+ "80px" +"'>";
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
		
		$(".uploadResult").on("click", "button",function(e){
			console.log("delete file");
			
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			
			var targetLi = $(this).closest("li");
			
			$.ajax({
				url:'/deleteFile',
				data:{fileName:targetFile, type:type},
				dataType : 'text',
				type:'POST',
				success:function(result){
					alert(result);
					targetLi.remove();
				}
			});//end delete ajax
		})
	});
	
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
           
          
  
  <%@include file="../includes/footer.jsp" %>
