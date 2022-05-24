
 
var replyService = (function () {
 	console.log("replyService Test.............");
    //댓글 등록 처리
    function add(reply, callback, error) {
        console.log("add reply...............");
 
        $.ajax({
            type: 'post',
            url: '/replies/new',
            data: JSON.stringify(reply),
            contentType: "application/json; charset=utf-8",
            success: function (result, status, xhr) {
                if (callback) {
                    callback(result);
                }
            },
            error: function (xhr, status, er) {
                if (error) {
                    error(er);
                }
            }
        })
    }
 
    //댓글 목록 처리
    function getList(param, callback, error) {
 		console.log("getList..............")
        var bno = param.bno;
        var page = param.page || 1;
 
        $.getJSON("/replies/pages/" + bno + "/" + page + ".json",
            function (data) {
                if (callback) {
                    //callback(data);
                    callback(data.replyCnt, data.list); //댓글 숫자와 목록을 가져오는 경우
                }
            }).fail(function (xhr, status, err) {
            if (error) {
                error();
            }
        });
    }
 
    //댓글 삭제
    function remove(rno, callback, error) {
        $.ajax({
            type: 'delete',
            url: '/replies/' + rno,
            success: function (deleteResult, status, xhr) {
                if (callback) {
                    //callback(data);
                    callback(deleteResult); //댓글 숫자와 목록을 가져오는 경우
                }
            },
            error: function (xhr, status, er) {
                if (error) {
                    error(er);
                }
            }
        });
    }
 
    //댓글 수정
    function update(reply, callback, error) {
 
        console.log("댓글 번호 rno : " + reply.rno);
 
        $.ajax({
            type: 'put',
            url : '/replies/' + reply.rno,
            data : JSON.stringify(reply),
            contentType : "application/json; charset=utf-8",
            success : function (result, status, xhr) {
                if (callback) {
                    callback(result);
                }
            },
            error : function (xhr, status, er) {
                if (error) {
                    error(er);
                }
            }
        });
    }
 
    //댓글 조회 처리
    function get(rno, callback, error) {
        $.get("/replies/" + rno + ".json", function (result) {
            if (callback) {
                callback(result);
            }
        }).fail(function (xhr, status, err) {
            if (error) {
                error();
            }
        });
    }
 
    function displayTime(timeValue) {
 
        var today = new Date();
        var gap = today.getTime() - timeValue;
        var dateObj = new Date(timeValue);
        var str = "";
 
        if(gap < (1000 * 60 * 60 * 24)){
            var hours = dateObj.getHours();
            var minutes = dateObj.getMinutes();
            var seconds = dateObj.getSeconds();
 
            return [(hours > 9 ? '' : '0') + hours, ':', (minutes > 9 ? '' : '0')+minutes,':',(seconds > 9 ? '' : '0')+seconds].join('');
        }else{
            var yy = dateObj.getHours();
            var mm = dateObj.getMonth() +1;
            var dd = dateObj.getDate();
 
            return [yy,'/',(mm > 9 ? '' : '0')+mm, '/', (dd > 9 ? '' : '0')+dd].join('');
        }
    }
 
 
 
    return {
        add: add,
        get : get,
        getList: getList,
        remove: remove,
        update: update,
        displayTime : displayTime
    };
})();
