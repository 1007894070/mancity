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
									<a href="index/cate.action?id=${sortsid }">${sortsname }</a>
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
				<span class="name">商品列表</span>
			</div>
			<!-- 新秀 -->
			<div class="img_list">
				<div class="main">
					<s:iterator value="map.booksList">
						<div class="unit">
							<div class="inner">
								<div class="img">
									<table>
										<tr>
											<td>
												<a href="index/detail.action?id=${booksid }" target="_blank"><img src="${image }"
														onload="picresize(this,280,320)" /> </a>
											</td>
										</tr>
									</table>
								</div>
								<div class="info">
									<div class="title">
										<a href="index/detail.action?id=${booksid }" target="_blank">${booksname }</a>
									</div>
									<div class="price">
										<span class="shop_price">￥&nbsp;&nbsp;<span>${price }</span>元 </span>
									</div>
								</div>
							</div>
						</div>
					</s:iterator>
					<div class="clear"></div>
				</div>
			</div>

			<script language="javascript">
	$(".img_list .unit .inner").mousemove(function() {
		$(this).addClass("on");
	});
	$(".img_list .unit .inner").mouseout(function() {
		$(this).removeClass("on");
	});
</script>

			<!-- 新秀 -->
			<!-- 新秀 -->

		</div>



		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>
