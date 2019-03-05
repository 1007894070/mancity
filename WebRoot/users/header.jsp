<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<link href="templates/default/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="templates/default/js/index.js"></script>
<script type="text/javascript" src="templates/default/js/jquery-1.11.2.min.js"></script>



<div id="header" style="background-color:#232f3e;">
	<div id="top">
		<div class="main">
			<div class="left">
				<a href="Change.action?request_locale=en_US">English</a>|
				<a href="Change.action?request_locale=zh_CN">中文</a>
			</div>
			<div class="right">
				<s:if test="#session.userid == null">
					<s:text name="html.welcome"></s:text>！
				<s></s>&nbsp;
				<span> <a style="color: #26262C;" href="index/preLogin.action">[<s:text name="html.login"></s:text>]</a> <a
						style="color: #26262C;" href="index/preRegist.action">[<s:text name="html.regist"></s:text>]</a> </span>

				</s:if>
				<s:if test="#session.userid != null">
				你好 <b>${sessionScope.username }</b>
					<span> <a style="color: #26262C;" href="index/showcart.action">[<s:text name="html.cart"></s:text>]</a> <a
						style="color: #26262C;" href="index/showorder.action">[<s:text name="html.history"></s:text>]</a> <a
						style="color: #26262C;" href="index/exit.action">[<s:text name="html.exit"></s:text>] </a> </span>
				</s:if>
			</div>
		</div>
	</div>
	<div class="main">
		<div class="logo">
			<a href=""><img src="pic/logo1.png" /> </a>
		</div>
		<div class="search">
			<div class="form">
				<form id="form_search" method="post" action="index/query.action">
					<input class="text" name="name" type="text" maxlength="30" value="" />
					<input class="bt" type="submit" value="搜索" />
				</form>
			</div>

		</div>

	</div>
	<div id="nav">
		<div class="main">
			<div class="cat_head">
				<s:text name="html.cate"></s:text>
			</div>
			<a class="nav-a" href="index/index.action"><s:text name="html.home"></s:text> </a>
			<a class="nav-a" href="index/article.action"><s:text name="html.article"></s:text> </a>
			<a class="nav-a" href="index/special.action"><s:text name="html.special"></s:text> </a>
			<a class="nav-a" href="index/recommend.action"><s:text name="html.recommend"></s:text> </a>
			<a class="nav-a" href="index/all.action"><s:text name="html.all"></s:text> </a>
			<div class="clear"></div>
		</div>
	</div>
</div>
<!-- 新秀 -->