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
					<span>我的订单</span>
				</div>
				<div class="main">
					<table class="table">
						<thead>
							<tr>
								<th width='*'>
									订单号
								</th>
								<th width='80'>
									总金额
								</th>
								<th width='100'>
									订单日期
								</th>
								<th width='70'>
									收货人
								</th>
								<th width='70'>
									联系方式
								</th>
								<th width='140'>
									送货地址
								</th>
								<th width='100'>
									操作
								</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="map.ordersList">
								<tr>
									<td width='*' style="padding-top: 10px; vertical-align: top;">
										${ordersid }
									</td>
									<td width='80'>
										${total }
									</td>
									<td width='100' style="padding-top: 10px; vertical-align: top;">
										${addtime }
									</td>
									<td width='70'>
										${receiver }
									</td>
									<td width='70'>
										${contact }
									</td>
									<td width='140'>
										${address }
									</td>
									<td width='100' align="center">
										<a href="index/orderdetail.action?id=${ordercode }">查看</a>
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
