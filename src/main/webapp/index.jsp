<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>轻笔记主页</title>

		<meta charset="UTF-8">

		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

		<!-- Google Webfonts and our stylesheet -->

		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=PT+Sans+Narrow" />

		<link rel="stylesheet" href="/resources/css/home/styles.css" />

		<link rel="stylesheet" href="/resources/css/home/demo.css" />

		<!-- JavaScript includes -->
		<script src="/resources/js/jquery-1.7.1.min.js"></script>

		<script src="/resources/js/ipresenter.packed.js"></script>
		<script>
			$(document).ready(function(){
				$('#ipresenter').iPresenter({
					timerPadding: -1,
					controlNav: true,
					controlNavThumbs: true,
					controlNavNextPrev: false
				});
			});
		</script>

	</head>

	<body>

	<ul class="examples">
		<li class="logo">轻笔记</li>
		<li><a href="/user/adminView" class="active">管理员</a></li>
		<li><a href="/user/signUp" class="active">注册</a></li>
		<li><a href="/user/loginView" class="active">登陆</a></li>
	</ul>

	<div class="container">
		<div id="ipresenter">
			<div id="intro" class="step" data-x="0" data-y="0" data-thumbnail="/resources/source/img/home/thumbnails/img1.png">
				<img src="/resources/source/img/home/img1.png" />
				<h2>随时随地 想看就看</h2>
				<p>
					无论是PC，网页，还是手机客户端，都可以访问所有资料。免费离线阅读功能让你在任何情况下都能轻松查看。
				</p>
			</div>

			<div id="capture" class="step" data-x="1100" data-y="1200" data-scale="1.8" data-rotate="180" data-thumbnail="/resources/source/img/home/thumbnails/img2.png">
				<img src="/resources/source/img/home/img2.png" />
				<h2>一站式记录</h2>
				<p>
					在这里不仅可以专注写作，记下一切；还能轻松收集网页，微博，微信等众多平台上的精彩内容，搭建你的知识宝库。
				</p>
			</div>

			<div id="view" class="step" data-x="-300" data-y="600" data-scale="0.2" data-rotate="270" data-thumbnail="/resources/source/img/home/thumbnails/img3.png">
				<img src="/resources/source/img/home/img3.png" />
				<h2>无限未来等你探索</h2>
				<p>
					文字，图片，录音，手写，涂鸦，更丰富的记录方式。微博，邮件，朋友圈，更多选择的分享方式。更多可能，等你来发现。
				</p>
			</div>
		</div>
	</div>

	<%
		if(session.getAttribute("info")!=null){

			out.print("<script type='text/javascript'>alert('"+session.getAttribute("info")+"');</script>");
			session.setAttribute("info",null);
		}
	%>

	</body>

</html>