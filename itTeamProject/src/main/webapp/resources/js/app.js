
var replyService = (function () {
	
	// 댓글 추가 기능
	function add(reply, callback, error) {
		
		console.log("add a reply.");
		
		$.ajax({
			type: 'post',
			url: '/replies/new',
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr) {
				
				if(callback) {
					
					callback(result);
					
				}
				
			},
			error: function(xhr, staus, err) {
				
				if(error) {
					
					error(err);
					
				}
			}
			
		})		
		
	}; // end add
	
	
	// 댓글 목록 불러오기
	// 필요한 페이지 정보는 param 으로 전달
	function getList(param, callback, error) {
		
		var page = param.page || 1;
		var bno = param.bno;
		
//		console.log("param.bno: " + bno);
		
		// 페이지 처리된 리스트
		$.getJSON("/replies/pages/" + bno + "/" + page + ".json", 
			function(data) {
			
//			console.log("app list: " + data.replyList);
			
			if(callback) {
//				console.log("app.js checkValue: " + data.checkValuecheckValue)
				callback(data.replyCnt, data.replyList, data.checkValue);				
			}
						
		}).fail(function(xhr, status, err) { 
			
			if (error) {
				error(err);
				console.log("do error occurs?");
			}
			
		}); // end getJSON()
				
	}; // end getList
	
	
	// 댓글 지우기
	// 댓글 번호 (rno) 필요
	function remove(rno, replyer, callback, error) {
		
		// console.log("remove rno: " + rno);
		
		$.ajax({
			type: 'delete',
			url: '/replies/' + rno,			
			data: JSON.stringify({
				rno: rno,
				replyer: replyer
			}),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr) {
				
				if(callback) {
					
					callback(result);
					
				}
			},
			error: function(xhr, status, err) {
				
				if(error) {
					
					error(err);
					
				}
			}
			
		});		
		
	}; // end remove
	
	
	// 댓글 수정
	function update(reply, callback, error) {
		
		console.log("rno: " + reply.rno);
		
		$.ajax({
			type: 'put',
			url: '/replies/' + reply.rno,
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr) {
				
				if(callback) {
					
					callback(result);
					
				}
			},
			error: function(xhr, status, err) {
				
				if(error) {
					
					error(err);
					
				}
			}			
			
		});		
		
	}; // end update
	
	
	// 댓글 하나 조회
	function get(rno, callback, error) {
		
		$.get("/replies/" + rno + ".json", 
			function(result) {
			
				if(callbak) {
					
					callback(result);
					
				}
				
		}).fail(function(xhr, status, err) {
			
			if(error) {
				
				error(err);
				
			}
		});
		
	}; // end get
	
	
	// 시간 포맷 설정
	function displayTime(timeValue) {
		
		// 오늘 작성 댓글은 시간으로 표시
		// 어제 이전에 작성한 댓글은 날짜
		
		var today = new Date();
		
		// 댓글 날짜
		var dateObj	= new Date(timeValue);
		var gapYear = today.getFullYear() - dateObj.getFullYear();
		var gapMonth = today.getMonth() - dateObj.getMonth();
		var gapDate = today.getDate() - dateObj.getDate();
		
		let str = "";
		
		if (gapYear == 0 && gapMonth == 0 && gapDate == 0) {
			// 시간
			var hh = dateObj.getHours();
			// 분
			var mi = dateObj.getMinutes();
			// 초
			var ss = dateObj.getSeconds();
			
			// 현재 시간이 9 이하이면 앞에 0 붙임
			str = [(hh > 9 ? '' : '0') + hh, ':' , 
					(mi > 9 ? '' : '0') + mi, ':',
					(ss > 9 ? '' : '0') + ss].join("");
			// join() 배열 안 원소들 이어 붙이기
			
		} else {
			// 24 시간 이전 작성 댓글
			var yy = dateObj.getFullYear();
			// 월
			var mm = dateObj.getMonth() + 1;
			// 컴퓨터는 달을 0부터 셈.
			var dd = dateObj.getDate();
			
			str += yy + "/";
			str += (mm > 9 ? '' : '0') + mm + "/";
			str += (dd > 9 ? '' : '0') + dd;	
			
		}
		
		return str;
		
	}; // end displayTime
	
	
	return {
		add: add,
		getList: getList,
		remove: remove,
		update: update,
		get: get,
		displayTime: displayTime		
	};	
	
})();
