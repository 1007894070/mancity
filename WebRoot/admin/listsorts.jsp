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
					<!--Begin Datatables-->
					<div class="row">
						<div class="col-lg-12">
							<div class="box">
								<header>
									<h5>图书类型信息列表</h5>
								</header>
								<div id="collapse4" class="body">
									<table id="dataTable"
										class="table table-bordered table-condensed table-hover table-striped">
										<thead>
											<tr>
												<th>类型名称</th>
												<th>创建日期</th>
												<th style="width: 10%">操作</th>
											</tr>
										</thead>
										<tbody>
											<s:iterator value="sortsList" status="t">
												<tr>
													<td>${sortsname }</td>
													<td>${addtime }</td>
													<td><s:a
															href="sorts/getSortsById.action?id=%{sortsid}">
															编辑
														</s:a>&nbsp;&nbsp;&nbsp;<s:a
															href="sorts/deleteSorts.action?id=%{sortsid}"
															onclick="{if(confirm('确定要删除吗?')){return true;}return false;}">
															删除
														</s:a></td>
												</tr>
											</s:iterator>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<!-- /.row -->
					<!--End Datatables-->

				</div>
				<!-- /.inner -->
			</div>
			<!-- /.outer -->
		</div>
		<!-- /#content -->

	</div>
	<!-- /#wrap -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- /#footer -->
	<!-- #helpModal -->

</body>
</html>
