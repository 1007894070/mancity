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
		<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"
        charset="utf-8"></script>
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
					<span>注册新用户</span>
				</div>
				<div class="main">
					<form name="form_register" method="post" action="index/regist.action">
						<table>
							<tr>
								<td class="l">
									用户名：
								</td>
								<td>
									<input class="text" name="users.username" type="text" />
								</td>
							</tr>
							<tr>
								<td class="l">
									密码：
								</td>
								<td>
									<input name="users.password" type="password" size="25" class="text" id="password" />
								</td>
							</tr>
							<tr>
								<td class="l">
									姓名：
								</td>
								<td>
									<input name="users.realname" type="text" size="25" class="text" id="realname" />
								</td>
							</tr>
							<tr>
								<td class="l">
									联系方式：
								</td>
								<td>
									<input name="users.contact" type="text" size="25" class="text" id="contact" />
								</td>
							</tr>
							<tr>
								<td class="l">
									联系地址：
								</td>
								<td>
									<input name="users.address" type="text" size="25" class="text" id="address" />
								</td>
							</tr>
							<tr>
								<td class="l"></td>
								<td>
									<input class="button" type="submit" value="提交" />
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
