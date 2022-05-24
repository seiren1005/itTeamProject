<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">${board.title} 에 대한 게시글</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">　</div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <div class="form-group">
                    <label>페이지 번호</label>
                    <input class="form-control" name="bno"
                           value='<c:out value ="${board.bno }"/>' readonly="readonly"/>
                </div>
                <div class="form-group">
                    <label>Title</label> <input class="form-control" name="title"
                                                value='<c:out value ="${board.title }"/>' readonly="readonly"/>
                </div>
                <div class="form-group">
                    <label>Text area</label>
                    <textarea class="form-control" rows="3" name="content"
                              readonly="readonly" id="inputbox">
                    <c:out value="${board.content }"/>
                    </textarea>
                </div>
                <div class="form-group">
                    <label>Writer</label><input class="form-control" name="writer"
                                                value='<c:out value="${board.writer}"/>' readonly="readonly">
                </div>
                <div class="form-group">
                    <label>조회수</label><input class="form-control" name="hit"
                                                value='<c:out value="${board.hit}"/>' readonly="readonly">
                </div>
                <button data-oper='modify' class="btn btn-danger"
                        onclick="location.href='/board/modify?bno=<c:out value="${board.bno}"/>'">수정/삭제
                </button>
                <button data-oper='list' class="btn btn-info"
                        onclick="location.href='/board/list'">목록
                </button>
                <!-- /.table-responsive -->
                <form id="operForm" action="/board/modify" method="get">
                    <input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno}"/>'>
                    <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
                    <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
                    <input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
                    <input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
                </form>
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class='row'>
    <div class="col-lg-12">
        <!-- /.panel -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-comments fa-fw"></i> 댓글
                <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>댓글 쓰기</button>
            </div>
            <!-- /.panel-heading -->
            
            <div class="panel-body">
                <ul class="chat">
                </ul>
                <!-- ./ end ul -->
            </div>
            <!-- /.panel .chat-panel -->
            <div class="panel-footer"></div>
        </div>

    </div>
    <!-- ./ end row -->
    <div class = 'bigPictureWrapper'>
    	<div class ='bigPicture'>
    	</div>	
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>Reply</label>
                    <input class="form-control" name='reply' value='New Reply!!!!'>
                </div>
                <div class="form-group">
                    <label>Replyer</label>
                    <input class="form-control" name='replyer' value='replyer'>
                </div>
                <div class="form-group">
                    <label>Reply Date</label>
                    <input class="form-control" name='replyDate' value='2018-01-01 13:13'>
                </div>
            </div>
            <div class="modal-footer">
                <button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
                <button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
                <button id='modalRegisterBtn' type="button" class="btn btn-primary">등록</button>
                <button id='modalCloseBtn' type="button" class="btn btn-default" data-dismiss='modal'>닫기</button>
                </div>
            </div>          
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

 <div class = "row">
 	<div class = "col-lg-12">
 		<div class = "panel panel-default">
 			<div class = "panel-heading">Files</div>
 				<div class= "panel-body">
 					<div class = "uploadResult">
 						<ul>
 						
 						</ul>
 					</div>
 				 </div><!--  end panel body -->
 		</div><!--  end panel-default-->
 	</div><!--  end col-lg-12 -->
 </div><!--  end "row" -->

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
	
	

	


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/reply2.js"></script>
<script>
    /*$(document).ready( function () {
            console.log("댓글 확인 js "+replyService);
    });*/
    /*    console.log("===============");
        console.log("JS TEST");*/
    //댓글 등록 테스트
    /*    replyService.add(
            {reply: "JS Test", replyer: "tester", bno: bnoValue}
            ,
            function (result) {
                alert("RESULT: " + result);
            }
        );*/
    //댓글 리스트 테스트
    /*   replyService.getList({bno: bnoValue, page: 1}, function (list) {
           for (var i = 0, len = list.length || 0; i < len; i++) {
               console.log(list[i]);
           }
       });*/
    //댓글 삭제 테스트
    /*    replyService.remove(88, function (count) {
            console.log(count);
            if (count === '성공') {
                alert("삭제 됐습니다!");
            }
        }, function (err) {
            alert('ERROR!!');
        });*/
    //댓글 수정
    /*  
    replyService.update({
          rno: 62,
          bno: bnoValue,
          reply: "댓글 수정!!"
      }, function (result) {
          alert("수정완료!");
      });
    replyService.get(90, function (data) {
        console.log(data);
    });
    */
    
</script>





<script>
    $(document).ready(function () {
        var bnoValue = '<c:out value="${board.bno}"/>';
        var replyUL = $(".chat");
        var pageNum = 1;
        var replyPageFooter = $(".panel-footer");
    
        showList(1);
        function showList(page) {
        	
            replyService.getList({bno: bnoValue, page: page || 1}, function (replyCnt,list) {
                
                if(page == -1){
                	pageNum = Math.ceil(replyCnt/10.0);
                	showList(pageNum);
                	return;
                }
                
                var str = "";
                
                if (list == null || list.length == 0) {
                    return;
                }
                for (var i = 0, len = list.length || 0; i < len; i++) {
                    str += "<li class='left clearfix' data-rno='" + list[i].rno + "'>";
                    str += "  <div><div class='header'><strong class='primary-font'>" + list[i].replyer + "</strong>";
                    str += "    <small class='pull-right text-muted'>" + replyService.displayTime(list[i].replyDate) + "</small></div>";
                    str += "    <p>" + list[i].reply + "</p></div></li>";
                }
                replyUL.html(str);
                showReplyPage(replyCnt);
                
                
            }); //end function
        }//end showList
        
        var modal = $(".modal");
        var modalInputReply = modal.find("input[name='reply']");
        var modalInputReplyer = modal.find("input[name='replyer']");
        var modalInputReplyDate = modal.find("input[name='replyDate']");
        
        var modalModBtn = $("#modalModBtn");
        var modalRemoveBtn = $("#modalRemoveBtn");
        var modalRegisterBtn = $("#modalRegisterBtn");
        
        $("#addReplyBtn").on("click", function(e) {
            modal.find("input").val("");
            modalInputReplyDate.closest("div").hide();
            modal.find("button[id !='modalCloseBtn']").hide();
            
            modalRegisterBtn.show();
            $(".modal").modal("show");
        });
        
        //새로운 댓글 추가 처리.
        modalRegisterBtn.on("click", function(e){
            var reply = {
                reply : modalInputReply.val(),
                replyer : modalInputReplyer.val(),
                bno : bnoValue
            };
            
            replyService.add(reply, function(result) {
                //alert(result);
                alert("댓글이 작성되었습니다.");
                modal.find("input").val("");
                modal.modal("hide");
                //showList(1);
                showList(-1);
            });
        });
        
       
        //댓글 조회 클릭 이벤트 처리
        $(".chat").on("click", "li", function(e) {
           var rno = $(this).data("rno");
           console.log("chat Click rno Test " + rno);
           replyService.get(rno, function(reply) {
        	   
        	   console.log("chat Click reply Test " + reply.reply);
        	   
              modalInputReply.val(reply.reply);
              modalInputReplyer.val(reply.replyer).attr("readonly","readonly");
              modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
              
              modal.data("rno", reply.rno);
              modal.find("button[id != 'modalCloseBtn']").hide();
              //modal.find("button[id != 'modalRegisterBtn']").hide();
              modalModBtn.show();
              modalRemoveBtn.show();
              $(".modal").modal("show");
           });
           console.log("댓글 클릭 이벤트 : " + rno);
        });
        
        modalModBtn.on("click", function(e){
			var reply = {rno:modal.data("rno"), reply: modalInputReply.val(), replyer : modalInputReplyer.val()};
			replyService.update(reply, function(result){
				//alert(result);
				alert("댓글이 수정되었습니다.");
				modal.modal("hide");
				showList(pageNum);
			});
        });
        
        modalRemoveBtn.on("click",function(e){
        	var rno = modal.data("rno");
        	replyService.remove(rno, function(result){
        		alert("댓글이 삭제되었습니다.");
        		modal.modal("hide");
        		showList(pageNum);
        	});
        });
        
        replyPageFooter.on("click", "li a", function(e){
        	e.preventDefault();
        	var targetPageNum = $(this).attr("href");
        	pageNum = targetPageNum;
        	showList(pageNum);
        });
        
        

        
        function showReplyPage(replyCnt){
        	
        	var endNum = Math.ceil(pageNum / 10.0) * 10;
        	var startNum = endNum - 9;
        	
        	var prev = startNum != 1;
        	var next = false;
        	
        	if(endNum * 10 >= replyCnt){
        		endNum = Math.ceil(replyCnt/10.0);
        	}
        	
        	if(endNum * 10 < replyCnt){
        		next = true;
        	}
        	
        	var str = "<ul class = 'pagination pull-right'>";
        	
        	if(prev){
        		str +="<li class = 'page-item'><a class = 'page-link' href='"+(startNum - 1)+"'>Previuos</a></li>";
        	}
        		for (var i = startNum; i <= endNum; i++){
        			var active = pageNum == i ? "active" : "";
        			
        			str += "<li class='page-item "+active+"  '><a class = 'page-link' href='"+i+"'>" +i+"</a></li>";
        		}
        		
        		if(next){
        			str = "<li class='page-item'><a class = 'page-link' href='"+(endNum + 1)+"'>Next</a></li>";
        		}
        		
        		str += "</ul></div>";
        		
        		replyPageFooter.html(str);
        		
        		
        	
        } 
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        var operForm = $("#operForm");
        $("button[data-oper='modify']").on("click", function (e) {
            operForm.attr("action", "/board/modify").submit();
        });
        $("button[data-oper='list']").on("click", function (e) {
            operForm.find("#bno").remove();
            operForm.attr("action", "/board/list");
            operForm.submit();
        });
    });
</script>

<script>
	$(document).ready(function(){
		(function(){
			var bno = '<c:out value="${board.bno}"/>';
			$.getJSON("/board/getAttachList", {bno:bno},function(arr){
				console.log(arr);
				
				var str = "";
				
				$(arr).each(function(i, attach){
					//image
					if (attach.fileType){
						var attachFN = attach.fileName.trim();
						var attachPath = attach.uploadPath.trim();
						var fileCallPath = encodeURIComponent(attachPath + "/s_" +attach.uuid + "_" + attachFN);
						
						str += "<li data-path ='"+attachPath+ "' data-uuid='" + attach.uuid + "' data-filename='" + attachFN +"' data-type = '" + attach.fileType + "'><div>";
						str += "<span>" + attach.fileName + "</span><br/>"
						str += "<img src = '/display?fileName="+fileCallPath+"'>";
						str += "</div>";
						str += "</li>";
					} else{
						str += "<li data-path ='" + attach.uploadPath +"' data-uuid = '" + attach.uuid +"' data-filename = '" + attach.fileName +"' data-type = '" + attach.fileType +"'><div>";
						str += "<span> " + attach.fileName + "</span><br/>";
						str += "<img src = '/resources/img/attach.jpg'></a>";
						str += "</div>";
						str += "</li>";
						}	
				}); //end func
				$(".uploadResult ul").html(str);
			});// end getjson
		})();
		
        $(".uploadResult").on("click", "li",function(e){
        	console.log("View Image");
        	var liObj = $(this);
        	var data_path = liObj.data("path").replace(/\s/gi, '');
        	var path = encodeURIComponent(data_path+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
        	console.log(path);
        	if(liObj.data("type")){
        		showImage(path);
        	}else{
        		//download
        		self.location = "/download?fileName="+path;
        	}
        });
        
        function showImage(fileCallPath){
    		alert(fileCallPath);
    		$(".bigPictureWrapper").css("display","flex").show();
    		$(".bigPicture").html("<img src = '/display?fileName="+fileCallPath+"'>").animate({width:'100%',height:'100%'},1000);
    	}
        
        $(".bigPictureWrapper").on("click",function(e){
        	$(".bigPicture").animate({width : '0%', height: '0%'}, 1000);
        	setTimeout(function(){
        		$(".bigPictureWrapper").hide();
        	},1000);
        });
	});
</script>

<%@include file="../includes/footer.jsp" %>
