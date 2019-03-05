<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div id="top">
	<!-- .navbar -->
	<nav class="navbar navbar-inverse navbar-static-top">
		<div class="container-fluid">


			<!-- Brand and toggle get grouped for better mobile display -->
			<header class="navbar-header">

				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a href="index.html" class="navbar-brand"><img
					src="assets/img/logo.png" alt=""></a>

			</header>







			<div class="collapse navbar-collapse navbar-ex1-collapse"></div>
		</div>
		<!-- /.container-fluid -->
	</nav>
	<!-- /.navbar -->
	<!-- /.head -->
</div>