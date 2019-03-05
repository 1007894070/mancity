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
			<div class="block" id="reg_login">
				<div class="head">
					<span>收货人信息</span>
				</div>
				<div class="main">
					<form name="form_user_login" method="post" action="index/checkout.action">
						<table>
							<tr>
								<td class="l">
									收货人姓名：
								</td>
								<td>
									<input type="text" class="text"  name="name" placeholder="请输入收货人姓名" value="" />
								</td>
							</tr>
							<tr>
								<td class="l">
									送货地址：
								</td>
								<td>
									<input type="text" class="text"  name="cond" placeholder="请输入送货地址" value="" />
								</td>
							</tr>
							<tr>
								<td class="l">
									联系方式：
								</td>
								<td>
									<input type="text" class="text" name="msg" placeholder="请输入联系方式" value="" />
								</td>
							</tr>
							<tr>
								<td class="l"></td>
								<td>
									<input class="button" type="submit" value="确定" />
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>

		</div>



		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>
