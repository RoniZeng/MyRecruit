<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns:wb="http://open.weibo.com/wb">
	<head>
		<script type="text/javascript" async="" src="style/js/conversion.js"></script>
		<script src="style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script>
		<style type="text/css"></style>
		<meta content="no-siteapp" http-equiv="Cache-Control" />
		<link media="handheld" rel="alternate" />
		<!-- end 云适配 -->
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
		<title>开通招聘服务-拉医伯乐-最专业的医药招聘平台</title>
		<meta content="23635710066417756375" property="qc:admins" />
		<meta name="description" content="拉勾网是3W旗下的互联网领域垂直招聘网站,互联网职业机会尽在拉勾网" />
		<meta content="QIQ6KC1oZ6" name="baidu-site-verification" />
		<!-- <div class="web_root"  style="display:none">h</div> -->
		<script type="text/javascript">
			var ctx = "h";
			console.log(1);
		</script>
		<link href="h/images/favicon.ico" rel="Shortcut Icon" />
		<link href="style/css/style.css" type="text/css" rel="stylesheet" />
		<link href="style/css/external.min.css" type="text/css" rel="stylesheet" />
		<link href="style/css/popup.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
		<script src="style/js/jquery.lib.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="style/js/ajaxfileupload.js"></script>
		<script src="style/js/additional-methods.js" type="text/javascript"></script>
		<!--[if lte IE 8]>
    <script type="text/javascript" src="style/js/excanvas.js"></script>
<![endif]-->
		<script type="text/javascript">
			var youdao_conv_id = 271546;
		</script>
		<script src="style/js/conv.js" type="text/javascript"></script>
		<script src="style/js/ajaxCross.json" charset="UTF-8"></script>
	</head>
	<body>
		<div id="body">
			<div id="header">
				<div class="wrapper">
					<a class="logo" href="h/"> <img width="229" height="43" alt="医伯乐招聘-专注医药招聘" src="style/images/logo.png" /> </a>
					<ul id="navheader" class="reset">
						<li><a href="index.jsp">首页</a></li>
						<li class="current"><a href="companylist.jsp">公司</a></li>
						<!-- <li><a target="_blank" href="h/toForum.jsp">论坛</a></li> -->
						<li> <a rel="nofollow" href="positions.jsp">简历管理</a> </li>
						<li><a rel="nofollow" href="create.jsp">发布职位</a></li>
					</ul>
					<dl class="collapsible_menu">
						<dt>
							<span>jason&nbsp;</span>
							<span class="red dn" id="noticeDot-1"></span>
							<i></i>
						</dt>
						<dd>
							<a href="positions.jsp">我发布的职位</a>
						</dd>
						<dd>
							<a href="positions.jsp">我收到的简历</a>
						</dd>
						<dd class="btm">
							<a href="myhome.jsp">我的公司主页</a>
						</dd>
						<dd>
							<a href="list.jsp">我要找工作</a>
						</dd>
						<dd>
							<a href="accountBind.jsp">帐号设置</a>
						</dd>
						<dd class="logout">
							<a rel="nofollow" href="login.jsp">退出</a>
						</dd>
					</dl>
				</div>
			</div>
			<!-- end #header -->
			<div id="container">
				<div class="content_mid">
					<!--form-->
					<dl class="c_section c_section_service">
						<dt>
							<h2><em></em>开通招聘服务</h2>
						</dt>
						<dd>
							<div class="os_step_1"></div>
							
							<form action="bindStep2.jsp" class="corp_form" id="bindForm">
								<input type="hidden" value="a517d13d23f5432eab682688151c3673" id="resubmitToken" />
								<h3><em class="redstar">*</em>联系电话 <span>（请填写真实有效的电话号码，方便系统校验使用）</span></h3>
								<input type="text" value="" placeholder="请输入你的手机号码或座机号码" maxlength="49" name="tel" id="tel" />
								<h3><em class="redstar">*</em>接收简历邮箱 <span>（该邮箱为公司邮箱，审核通过后不可更改）</span></h3>
								<input type="text" value="" placeholder="请输入你的公司邮箱作为接收简历邮箱" name="email" id="email" />
								<span id="beError" style="display:none;" class="error"></span>
								<input type="submit" value="下一步" id="bindSubmit" />
<!-- 								<a style="color:#fff;" href="bindStep2.jsp" class="submitLogin" title="登 &nbsp; &nbsp; 录" />登 &nbsp; &nbsp; 录</a> -->
							</form>
							
							<div class="contactus">
								<table>
									<tbody>
										<tr>
											<td colspan="2">常见问题：</td>
										</tr>
										<tr>
											<td valign="top">问：</td>
											<td>填写个人邮箱可以么？</td>
										</tr>
										<tr>
											<td valign="top">答：</td>
											<td>不可以。为了保证每个职位的真实性，严格要求招聘方必须提供公司邮箱。（公司邮箱是指以你的公司网址为后缀的免费公司邮箱，例如医伯乐的公司邮箱后缀是@ybl.com）即使是初创公司也必须提供公司邮箱才允许开通招聘。</td>
										</tr>
										<tr>
											<td valign="top">问：</td>
											<td>公司没有公司邮箱怎么办？</td>
										</tr>
										<tr>
											<td valign="top">答：</td>
											<td>推荐使用免费、稳定的腾讯企业邮箱（网址：<a href="http://exmail.qq.com">http://exmail.qq.com</a>），根据邮箱申请指南进行操作，很快就可以拥有以你的公司网址为后缀的免费公司邮箱。</td>
										</tr>
									</tbody>
								</table>
							</div>
						</dd>
					</dl>
				</div>
				<script src="style/js/services.min.js" type="text/javascript"></script>
				<div class="clear"></div>
				<input type="hidden" value="a517d13d23f5432eab682688151c3673" id="resubmitToken" />
				<a rel="nofollow" title="回到顶部" id="backtop"></a>
			</div>
			<!-- end #container -->
		</div>
		<!-- end #body -->
		<div id="footer">
			<div class="wrapper">
				<a rel="nofollow" target="_blank" href="h/about.jsp">联系我们</a>
				<a target="_blank" href="#">公司导航</a>
				<a rel="nofollow" target="_blank" href="#">微博</a>
				<a rel="nofollow" href="javascript:void(0)">微信<i></i></a>
				<div class="copyright">
					&copy;2018-2020
					<a href="http://www.miitbeian.gov.cn/state/outPortal/loginPortal.action" target="_blank">京ICP备14023790号-2</a>
				</div>
			</div>
		</div>
		<script src="style/js/core.min.js" type="text/javascript"></script>
		<script src="style/js/popup.min.js" type="text/javascript"></script>
		<!--  -->
		<div id="cboxOverlay" style="display: none;"></div>
		<div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;">
			<div id="cboxWrapper">
				<div>
					<div id="cboxTopLeft" style="float: left;"></div>
					<div id="cboxTopCenter" style="float: left;"></div>
					<div id="cboxTopRight" style="float: left;"></div>
				</div>
				<div style="clear: left;">
					<div id="cboxMiddleLeft" style="float: left;"></div>
					<div id="cboxContent" style="float: left;">
						<div id="cboxTitle" style="float: left;"></div>
						<div id="cboxCurrent" style="float: left;"></div>
						<button type="button" id="cboxPrevious"></button>
						<button type="button" id="cboxNext"></button>
						<button id="cboxSlideshow"></button>
						<div id="cboxLoadingOverlay" style="float: left;"></div>
						<div id="cboxLoadingGraphic" style="float: left;"></div>
					</div>
					<div id="cboxMiddleRight" style="float: left;"></div>
				</div>
				<div style="clear: left;">
					<div id="cboxBottomLeft" style="float: left;"></div>
					<div id="cboxBottomCenter" style="float: left;"></div>
					<div id="cboxBottomRight" style="float: left;"></div>
				</div>
			</div>
			<div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div>
		</div>
	</body>
</html>
