<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!doctype html>
<html lang="zh_CN" class="fullscreen-bg">
<head>
<base href="<%=basePath%>" />
<title>欢迎使用网站后台管理系统</title>
<!-- Bootstrap -->
<link rel="stylesheet" href="assets/lib/bootstrap/css/bootstrap.css">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="assets/lib/font-awesome/css/font-awesome.css">

<!-- Metis core stylesheet -->
<link rel="stylesheet" href="assets/css/main.css">

<!-- metisMenu stylesheet -->
<link rel="stylesheet" href="assets/lib/metismenu/metisMenu.css">

<!-- onoffcanvas stylesheet -->
<link rel="stylesheet" href="assets/lib/onoffcanvas/onoffcanvas.css">

<!-- animate.css stylesheet -->
<link rel="stylesheet" href="assets/lib/animate.css/animate.css">
<!--jQuery -->
<script src="assets/lib/jquery/jquery.js"></script>

<!--Bootstrap -->
<script src="assets/lib/bootstrap/js/bootstrap.js"></script>


<script type="text/javascript">
	(function($) {
		$(document).ready(function() {
			$('.list-inline li > a').click(function() {
				var activeForm = $(this).attr('href') + ' > form';
				//console.log(activeForm);
				$(activeForm).addClass('animated fadeIn');
				//set timer to 1 seconds, after that, unload the animate animation
				setTimeout(function() {
					$(activeForm).removeClass('animated fadeIn');
				}, 1000);
			});
		});
	})(jQuery);
</script>

<script type="text/javascript">
	function checkLogin() {
		var username = document.myform.username.value;
		var password = document.myform.password.value;
		if (username == '') {
			alert('请输入用户名');
			document.myform.username.focus();
			return false;
		}
		if (password == '') {
			alert('请输入密码');
			document.myform.password.focus();
			return false;
		}
	}
</script>
</head>

<body class="login" style="background-image: url(assets/img/wrapper.jpg);height: 100%;object-fit: cover;">

	<div class="form-signin">
		<div class="text-center">
			<img src="assets/img/logo1.png" alt="Metis Logo">
		</div>
		<hr>
		<div class="tab-content">
			<div id="login" class="tab-pane active">
				<form action="admin/login.action" name="myform"
					method="post" onsubmit="return checkLogin()">
					<p class="text-muted text-center">请输入用户名密码</p>
					<input type="text" placeholder="请输入用户名" class="form-control top" name="username" id="username">
					<input type="password" placeholder="请输入密码" class="form-control bottom" name="password" id="password">
					<div class="checkbox">
						<label>&nbsp; </label>
					</div>
					<button class="btn btn-lg btn-primary btn-block" type="submit">确&nbsp;认&nbsp;登&nbsp;录&nbsp;</button>
				</form>
			</div>
		</div>
		<hr>
		<div class="text-center">
			<ul class="list-inline">
				<li><a class="text-muted" href="#login" data-toggle="tab">&nbsp;</a></li>
				<li><a class="text-muted" href="#forgot" data-toggle="tab">&nbsp;</a></li>
				<li><a class="text-muted" href="#signup" data-toggle="tab">&nbsp;</a></li>
			</ul>
		</div>
	</div>



</body>
</html>
