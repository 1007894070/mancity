<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>" />
		<title>${title }</title>
	</head>

	<body>
		<jsp:include page="header.jsp"></jsp:include>
		<div id="main">
			<div class="section_2">
				<div class="goods_tree goods_tree_2">
					<div class="inner">
						<s:iterator value="map.cateList">
							<div class="unit">
								<div class="cat_1">
									<a href="index/cate.action?id=${cateid }">${catename }</a>
								</div>
							</div>
						</s:iterator>
					</div>
				</div>

				<script language="javascript">
	$("#nav .cat_head,.goods_tree_2").mouseover(function() {
		$(".goods_tree_2").show();
	});
	$("#nav .cat_head,.goods_tree_2").mouseout(function() {
		$(".goods_tree_2").hide();
	});
	$(".goods_tree .unit").mouseover(function() {
		if ($(this).children(".cat_2").html().indexOf("<") != -1) {
			$(this).addClass("on");
		}
	});
	$(".goods_tree .unit").mouseout(function() {
		if ($(this).children(".cat_2").html().indexOf("<") != -1) {
			$(this).removeClass("on");
		}
	});
</script>

				<!-- 新秀 -->

			</div>
			<div class="here">
				<span class="name">${map.article.title }</span>
				<div class="link">
					<a href="index.jsp">首页</a> -&gt;&nbsp;
					<a href='index/article.action'><s:text name="html.article"></s:text> </a> -&gt;&nbsp; ${map.article.title }
				</div>
			</div>
			<!-- 新秀 -->
			<div id="article">
				<div class="title">
					<h2>
						${map.article.title }
					</h2>
				</div>
				<div class="message">
					作者/来源：网站管理员&nbsp;&nbsp;&nbsp;发表时间：${map.article.addtime }
				</div>
				<div class="main">
					<center>
						<img src="${map.article.image }" alt="" width="450" height="450" />
					</center>
					${map.article.contents }
					<div class="clear"></div>
				</div>
			</div>


			<!-- 新秀 -->
			<!-- 新秀 -->
		</div>
		<div class="clear"></div>



		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>
