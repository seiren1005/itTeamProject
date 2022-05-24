<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>

<body>
<h1>
	Hello world!  
</h1>
        <h1>YouTube player api</h1>
        <div id="player"></div>
		

<P>  The time on the server is ${serverTime}. </P>

<a href="/deteil/diteil-lifeCoding">life</a>
<a href="/deteil/diteil-TCP">TCP</a>
<a href="/deteil/diteil-Tohoho">Tohoho</a>



     <script>
            var tag = document.createElement('script');

            tag.src = "https://www.youtube.com/iframe_api";
            var firstScriptTag = document.getElementsByTagName('script')[0];
            firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
            
            var player;
            function onYouTubeIframeAPIReady() {
            player = new YT.Player('player', {
                height: '360',
                width: '640',
                videoId: '1ttLx9MbrCI',
                });
            }
   // https://www.googleapis.com/youtube/v3/search?part=snippet&q=kpop+music&key={본인의_API_KEY}
            
            var tag = document.createElement('script');
            tag.src = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=kpop+music&key={AIzaSyANd2dm_Qc_MgAUQbURDceYgMOaPrMoPuo}"
            		
    </script>
    
</body>
</html>
