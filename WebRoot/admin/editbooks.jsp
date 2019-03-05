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
									<h5>修改图书信息</h5>
								</header>
								<div id="div-1" class="body">
									<form class="form-horizontal" action="books/updateBooks.action"
										name="myform" onsubmit="return check()" method="post"
										enctype="multipart/form-data">
										<div class="form-group">
											<label for="text1" class="control-label col-lg-4">图书名称</label>
											<div class="col-lg-8">
												<input class="form-control" type="text"
													name="books.booksname" id="booksname"
													value="${map.books.booksname }">
											</div>
										</div>
										<div class="form-group">
											<label for="text1" class="control-label col-lg-4">出版社</label>
											<div class="col-lg-8">
												<input class="form-control" type="text"
													name="books.publisher" id="publisher"
													value="${map.books.publisher }">
											</div>
										</div>
										<div class="form-group">
											<label for="text1" class="control-label col-lg-4">作者</label>
											<div class="col-lg-8">
												<input class="form-control" type="text" name="books.author"
													id="author" value="${map.books.author }">
											</div>
										</div>
										<div class="form-group">
											<label for="text1" class="control-label col-lg-4">原价</label>
											<div class="col-lg-8">
												<input class="form-control" type="text"
													name="books.marketprice" id="marketprice"
													value="${map.books.marketprice }">
											</div>
										</div>
										<div class="form-group">
											<label for="text1" class="control-label col-lg-4">现价</label>
											<div class="col-lg-8">
												<input class="form-control" type="text" name="books.price"
													id="price" value="${map.books.price }">
											</div>
										</div>
										<div class="form-group">
											<label for="text1" class="control-label col-lg-4">图书类型</label>
											<div class="col-lg-8">
												<select class="form-control" name="books.sortsid"
													id="sortsid">
													<s:iterator value="map.sortsList">
														<option value="${sortsid }">${sortsname }</option>
													</s:iterator>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label for="text1" class="control-label col-lg-4">是否推荐</label>
											<div class="col-lg-8">
												<select class="form-control" name="books.recommend"
													id="recommend">
													<option value="是">是</option>
													<option value="否">否</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label for="text1" class="control-label col-lg-4">是否特价</label>
											<div class="col-lg-8">
												<select class="form-control" name="books.special"
													id="special">
													<option value="是">是</option>
													<option value="否">否</option>
												</select>
											</div>
										</div>
										<!-- /.form-group -->
										<div class="form-group">
											<label for="pass1" class="control-label col-lg-4">图片
											</label>
											<div class="col-lg-8">
												<input type="file" name="image" class="form-control"
													id="image">
											</div>
										</div>
										<!-- /.form-group -->
										<!-- /.form-group -->
										<div class="form-group">
											<label class="control-label col-lg-4">内容</label>
											<div class="col-lg-8">
												<textarea class="form-control" name="books.comments"
													id="comments" style="height: 120px">${map.books.comments }</textarea>
											</div>
										</div>
										<div class="col-sm-offset-4">
											<input type="hidden" name="books.booksid" id="booksid"
												value="${map.books.booksid }">
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
