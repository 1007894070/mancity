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


	<div id="main">
		<div class="section_1">
			<div class="goods_tree">
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


			<!-- 新秀 -->

			<script type="text/javascript" src="templates/default/js/focus.js"></script>
			<div id="focus">
				<ul style="box-shadow: 0 4px 20px rgba(0,0,0,.2);">
					<li><img src="pic/1.png" /></li>
					<li><img src="pic/2.png" /></li>
					<li><img src="pic/3.png" /></li>
					<li><img src="pic/4.png" /></li>
					<li><img src="pic/5.png" /></li>
				</ul>
			</div>
			<!-- 新秀 -->

			<div class="right">
				<div class="art_list">
					<div class="inner">
						<div class="head">
							<div class="tag on">
								<s:text name="html.article"></s:text>
							</div>
						</div>
						<div class="main">
							<div class="tag tag_1">
								<s:iterator value="map.articleList">
									<div>
										<a href="index/read.action?id=${articleid }" title="${title }"
											target="_blank">${title }</a>
									</div>
								</s:iterator>
							</div>
						</div>
					</div>
				</div>

				<!-- 新秀 -->

			</div>
		</div>

		<!-- 循环开始 -->
		<s:iterator value="map.frontList">
			<div class="img_list" style="padding: 0 0 20px 0">
				<div class="head">
					<div class="name">${sortsname }</div>
					<a class="more" href="index/cate.action?id=${sortsid }"><s:text
							name="html.more"></s:text> </a>
				</div>
				<div class="main">
					<s:iterator value="booksList" status="index">
						<div class="unit">
							<div class="inner">
								<div class="img">
									<table>
										<tr>
											<td><a href="index/detail.action?id=${booksid }"
												target="_blank"><img src="${image }"
													onload="picresize(this,280,320)" /> </a></td>
										</tr>
									</table>
								</div>
								<div class="info">
									<div class="title">
										<a href="index/detail.action?id=${booksid }" target="_blank">${booksname }</a>
									</div>
									<div class="price">
										<span class="shop_price">￥&nbsp;&nbsp;<span>${price }</span>元
										</span>
									</div>
								</div>
							</div>
						</div>
					</s:iterator>
					<!-- 循环结束 -->
					<div class="clear"></div>
				</div>
			</div>
		</s:iterator>
		<!-- 循环结束 -->
		<!-- 新秀 -->
		<!-- 新秀 -->
		<!-- 新秀 -->
		<!-- 新秀 -->

		<script language="javascript">
			$(".img_list .unit .inner").mousemove(function() {
				$(this).addClass("on");
			});
			$(".img_list .unit .inner").mouseout(function() {
				$(this).removeClass("on");
			});
		</script>

		<!-- 新秀 -->
	</div>






	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
