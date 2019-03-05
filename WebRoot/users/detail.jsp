<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
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
		<div class="here">
			<span class="name">${map.detail.booksname }</span>
			<div class="link">
				<a href="index.jsp">首页</a> -&gt;&nbsp; <a
					href="index/cate.action?id=${map.detail.sortsid }">${map.detail.sortsname }</a>-&gt;&nbsp;
				${map.detail.booksname }
			</div>
		</div>
		<!-- 新秀 -->
		<div id="goods">
			<form action="index/addcart.action" method="post" name="ECS_FORMBUY"
				id="ECS_FORMBUY">
				<div class="goods_info">
					<div class="imgs">
						<div class="big_img">
							<table>
								<tr>
									<td><a href="${map.detail.image }"
										title="${map.detail.booksname }" target="_blank"><img
											src="${map.detail.image }" onload="picresize(this,330,330)" />
									</a></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="info">
						<div class="title">${map.detail.booksname }</div>
						<div class="sn">图书货号：${map.detail.booksid }</div>
						<div class="shop_price">
							原&nbsp;价： <span>￥<strike>${map.detail.marketprice }</strike></span>
						</div>
						<div class="shop_price">
							现&nbsp;价： <span>￥${map.detail.price }</span>
						</div>
						<div class="hits">出版社：${map.detail.publisher }</div>
						<div class="hits">作者：${map.detail.author }</div>
						<div class="buy_num">
							购买数量： <input type="text" class="quantity-input" name="cart.num"
								value="1" /> <input type="hidden" name="cart.booksid"
								value="${map.detail.booksid }" />
								<input type="hidden" name="cart.price"
								value="${map.detail.price }" />
						</div>
						<table>
							<tr>
								<td class="bt_row"><input class="button" type="submit"
									value="加入购物车" /></td>
							</tr>
						</table>
					</div>
					<!-- 新秀 -->
					<div class="clear"></div>
				</div>
			</form>
			<div class="space"></div>
			<div class="block">
				<div class="head">
					<span>图书描述</span>
				</div>
				<div class="main goods_text">

					<style type="text/css">
.a_title, .a_text {
	font-family: "微软雅黑", "宋体";
	line-height: 200%;
	padding: 0 0 15px 0;
}

.a_title {
	font-size: 16px;
	padding: 10px 0 0 0;
	font-weight: bold;
}

.a_text {
	font-size: 14px;
}

.a_img {
	padding: 10px 0;
	padding: 0 0 15px 0;
	text-align: center;
}
</style>
					<div class="a_text">${map.detail.comments }</div>

				</div>
			</div>
			<div class="space"></div>
			<!-- 新秀 -->
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
