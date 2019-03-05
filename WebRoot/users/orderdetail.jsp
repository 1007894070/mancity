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
					<span>订单明细</span>
				</div>
				<div class="main">
					<table class="table">
						<thead>
							<tr>
								<th>
									订单号
								</th>
								<th>
									商品
								</th>
								<th>
									数量
								</th>
								<th>
									价格
								</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="map.itemsList">
								<tr>
									<td>
										${ordercode }
									</td>
									<td>
										<a href="index/detail.action?id=${booksid }">${booksname }</a>
									</td>
									<td>
										${num }
									</td>
									<td>
										${price }
									</td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
				</div>
			</div>


			<!-- 新秀 -->
		</div>



		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>
