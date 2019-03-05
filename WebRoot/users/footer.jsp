<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!-- 新秀 -->
<div id="footer">
	<div class="nav">
		<div class="main">
			<a href="index/index.action"><s:text name="html.home"></s:text> </a>
			<a href="index/article.action"><s:text name="html.article"></s:text> </a>
			<a href="index/special.action"><s:text name="html.special"></s:text> </a>
			<a href="index/recommend.action"><s:text name="html.recommend"></s:text> </a>
			<a href="index/all.action"><s:text name="html.all"></s:text> </a>
		</div>
	</div>

	<div class="main">
		<div class="info">
			Powered by ${title }
			<a href="admin_login.jsp" target="_blank">管理员入口</a>
		</div>
	</div>
</div>
<!-- 新秀 -->
