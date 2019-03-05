<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>" />
		<title>${title }</title>
	</head>

	<body>
		<jsp:include page="header.jsp"></jsp:include>
		<div id="main" class="user_center">
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
			<div class="block" id="flow_cart">
				<div class="head">
					<span>您所选购的图书</span>
				</div>
				<div class="main">
					<table class="table">
						<tr class="head">
							<td width="180px">
								<b>图书名称</b>
							</td>
							<td>
								<b>本店价</b>
							</td>
							<td width="80px">
								<b>购买数量</b>
							</td>
							<td>
								<b>小计</b>
							</td>
							<td>
								<b>操作</b>
							</td>
						</tr>
						<s:iterator value="map.cartList">
							<tr>
								<td>
									<div class="img">
										<a href="index/detail.action?id=${booksid }" target="_blank"><img src="${image }"
												onload="picresize(this,130,130)" /> </a>
									</div>
									<div class="title">
										<a href="index/detail.action?id=${booksid }" target="_blank">${booksname }</a>
									</div>
								</td>
								<td>
									¥${price }元
								</td>
								<td>
									${num }
								</td>
								<td>
									¥${num*price }元
								</td>
								<td>
									<a
										href="javascript:if (confirm('您确实要把该图书移出购物车吗？')) location.href='<%=basePath%>index/deletecart.action?id=${cartid}'; "
										class="icon-close">删除</a>
								</td>
							</tr>
						</s:iterator>
					</table>
					<table class="count_bt">
						<tr align="right">
							<td>
								图书总额:${map.total}元
							</td>
						</tr>
					</table>
					<table class="big_bt">
						<tr>
							<td>
								<a href="index.jsp">继续购物</a>
							</td>
							<td class="c"></td>
							<td>
								<a href="<%=basePath%>index/preCheckout.action">结算中心</a>
							</td>
						</tr>
					</table>
				</div>
			</div>


			<!-- 新秀 -->
		</div>



		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>
