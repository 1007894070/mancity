<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div id="left">
	<!-- #menu -->
	<ul id="menu" class="bg-blue dker">
		<li class="nav-header">管理菜单</li>
		<li class=""><a href="javascript:;"> <i class="fa fa-pencil"></i>
				<span class="link-title">管理员信息</span> <span class="fa arrow"></span>
		</a>
			<ul class="collapse">
				<li><a href="admin/createAdmin.action"> <i class="fa fa-angle-right"></i>新增管理员</a></li>
				<li><a href="admin/getAllAdmin.action"> <i class="fa fa-angle-right"></i>管理员信息列表</a></li>
			</ul></li>
		<li class=""><a href="javascript:;"> <i class="fa fa-pencil"></i>
				<span class="link-title">用户信息</span> <span class="fa arrow"></span>
		</a>
			<ul class="collapse">
				<li><a href="users/getAllUsers.action"> <i class="fa fa-angle-right"></i>用户信息列表</a></li>
			</ul></li>
		<li class=""><a href="javascript:;"> <i class="fa fa-pencil"></i>
				<span class="link-title">网站公告信息</span> <span class="fa arrow"></span>
		</a>
			<ul class="collapse">
				<li><a href="article/createArticle.action"> <i class="fa fa-angle-right"></i>新增网站公告</a></li>
				<li><a href="article/getAllArticle.action"> <i class="fa fa-angle-right"></i>网站公告信息列表</a></li>
			</ul></li>
		<li class=""><a href="javascript:;"> <i class="fa fa-pencil"></i>
				<span class="link-title">图书类型信息</span> <span class="fa arrow"></span>
		</a>
			<ul class="collapse">
				<li><a href="sorts/createSorts.action"> <i class="fa fa-angle-right"></i>新增图书类型</a></li>
				<li><a href="sorts/getAllSorts.action"> <i class="fa fa-angle-right"></i>图书类型信息列表</a></li>
			</ul></li>
		<li class=""><a href="javascript:;"> <i class="fa fa-pencil"></i>
				<span class="link-title">图书信息</span> <span class="fa arrow"></span>
		</a>
			<ul class="collapse">
				<li><a href="books/createBooks.action"> <i class="fa fa-angle-right"></i>新增图书</a></li>
				<li><a href="books/getAllBooks.action"> <i class="fa fa-angle-right"></i>图书信息列表</a></li>
			</ul></li>
		<li class=""><a href="javascript:;"> <i class="fa fa-pencil"></i>
				<span class="link-title">订单信息</span> <span class="fa arrow"></span>
		</a>
			<ul class="collapse">
				<li><a href="orders/getAllOrders.action"> <i class="fa fa-angle-right"></i>订单信息列表</a></li>
			</ul></li>
	</ul>
	<!-- /#menu -->
</div>