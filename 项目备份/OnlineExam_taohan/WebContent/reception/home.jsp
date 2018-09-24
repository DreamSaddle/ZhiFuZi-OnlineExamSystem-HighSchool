<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Insert title here</title>
	<%
    	String path = request.getContextPath();
	    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    %>
	<c:set var="path" value="<%=basePath %>"></c:set>
 	<link href="${path }/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
</head>
<body style="background-color: #EEEEEE;">
	<div class="jumbotron" style="height: 630px;padding-top: 100px; padding-bottom: 0px; margin-bottom: 0px;">
		<div style="padding-left: 20px;">
			<h1>
				智夫子在线考试系统
			</h1>
			<p>
				&emsp;&emsp;一个专注于高中在线考试系统<br />
			</p>
			<p>
				&emsp;&emsp;有一段青春，留作永恒。剪一段时光，放在最美的段落。好好保存留作永远，时间过去岁月的路过。只是多了一道曾经，流年一路改变了我们的模样。送走了我们的青春，留给了我们曾经。这样的夜别样的心情，倒影的年华。深夜想用文字表达我内心的段落，可是终究写不出整个心情。背着这些流年在岁月里流浪，终究没有安静的场所。来安放我这沉淀的一切，似乎不能放也不能放。因为只有装进心里，才最为合适。也没有地方比装进心里，更安全。就这样让这段流年，从此埋在心里。不再提起，让时间的尽头。留作无声的永恒，
			</p>
			<p>
　　			有一段青春，埋葬的时间。总有一些人拼了命的，挽留最终还是留不住。总有一些话始终未能说出口，直至最后再也不必说出口。埋葬过去，我们有着太多的沉默。像是在时间的路刚好遇见，只是你装做什么也没看见。很多年过去了，我始终在这里执着。时间走过这里并没有，我想要的段落。也许下一段时光，会遇见一个更好的彼岸。流年划过陌路，我们终于渐行渐远。来不及说再见，也来不及为那段。往事而伤心哭泣，一切要走都是上天。许早准备好的，只待我们路过此地。
			</p>
			<p>
				<a class="btn btn-primary btn-large" href="https://www.baidu.com">Learn more</a>
			</p>
		</div>
	</div>

	<!-- js引入 -->
    <script src="${path }/js/jquery.js"></script>
    <script src="${path }/js/bootstrap/bootstrap.min.js"></script>
</body>
</html>