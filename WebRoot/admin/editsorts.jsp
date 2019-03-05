<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!doctype html>
<html lang="zh_CN">
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
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<!--For Development Only. Not required -->
<script>
	less = {
		env : "development",
		relativeUrls : false,
		rootpath : "/assets/"
	};
</script>
<link rel="stylesheet" href="assets/css/style-switcher.css">
<link rel="stylesheet/less" type="text/css"
	href="assets/less/theme.less">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.7.1/less.js"></script>
<script src="assets/lib/jquery/jquery.js"></script>
<!--Bootstrap -->
<script src="assets/lib/bootstrap/js/bootstrap.js"></script>
<!-- MetisMenu -->
<script src="assets/lib/metismenu/metisMenu.js"></script>
<!-- onoffcanvas -->
<script src="assets/lib/onoffcanvas/onoffcanvas.js"></script>
<!-- Screenfull -->
<script src="assets/lib/screenfull/screenfull.js"></script>
<!-- Metis core scripts -->
<script src="assets/js/core.js"></script>
<!-- Metis demo scripts -->
<script src="assets/js/app.js"></script>
<script src="assets/js/style-switcher.js"></script>


</head>

<body class="  ">
	<div class="bg-dark dk" id="wrap">
		<jsp:include page="nav.jsp"></jsp:include>
		<!-- /#top -->
		<jsp:include page="menu.jsp"></jsp:include>
		<!-- /#left -->
		<div id="content" style="margin-left: 255px;">
			<div class="outer">
				<div class="inner bg-light lter">
					<!--BEGIN INPUT TEXT FIELDS-->
					<div class="row">
						<div class="col-lg-12">
							<div class="box dark">
								<header>
									<h5>修改图书类型信息</h5>
								</header>
								<div id="div-1" class="body">
									<form class="form-horizontal" action="sorts/updateSorts.action"
										name="myform" onsubmit="return check()" method="post">
										<div class="form-group">
											<label for="text1" class="control-label col-lg-4">类型名称</label>
											<div class="col-lg-8">
												<input class="form-control" type="text"
													name="sorts.sortsname" id="sortsname" value="${map.sorts.sortsname }">
											</div>
										</div>
										<!-- /.form-group -->
										<div class="form-group">
											<label class="control-label col-lg-4">备注</label>
											<div class="col-lg-8">
												<input class="form-control" type="text"
													name="sorts.memo" id="memo" value="${map.sorts.memo }">
											</div>
										</div>
										<div class="col-sm-offset-4">
											<input type="hidden" name="sorts.sortsid" id="sortsid" value="${map.sorts.sortsid }">
											<input type="hidden" name="sorts.addtime" id="addtime" value="${map.sorts.addtime }">
											<button type="submit" class="btn btn-default">确认保存</button>
										</div>
										<!-- /.form-group -->
									</form>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /#wrap -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- /#footer -->
	<!-- #helpModal -->
</body>
</html>
