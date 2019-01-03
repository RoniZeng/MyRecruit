<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html xmlns:wb="http://open.weibo.com/wb">
	<head>
		<script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js"></script>
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link rel="alternate" media="handheld" />
		<!-- end 云适配 -->
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>关于我们-医伯乐-最专业的医药招聘平台</title>
		<meta property="qc:admins" content="23635710066417756375" />
		<meta content="医伯乐是医药领域招聘网站,医药职业机会尽在医伯乐" name="description">
		<meta content="医伯乐, 医伯乐招聘, 跳槽, 高薪职位,  医药招聘, 职场招聘, 猎头招聘,O2O招聘, LBS招聘, 社交招聘, 校园招聘, 校招,社会招聘,社招" name="keywords">
		<meta name="baidu-site-verification" content="QIQ6KC1oZ6" />


		<script type="text/javascript">
			var ctx = "#";
			console.log(1);
		</script>
		<link rel="Shortcut Icon" href="">
		<link rel="stylesheet" type="text/css" href="style/css/style.css" />
		<link rel="stylesheet" type="text/css" href="style/css/external.min.css" />
		<link rel="stylesheet" type="text/css" href="style/css/popup.css" />
		<script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="style/js/jquery.lib.min.js"></script>
		<script src="style/js/ajaxfileupload.js" type="text/javascript"></script>
		<script type="text/javascript" src="style/js/additional-methods.js"></script>

		<script type="text/javascript">
			var youdao_conv_id = 271546;
		</script>
		<script type="text/javascript" src="style/js/conv.js"></script>
	</head>
	<body>
		<div id="body">
			<div id="header">
				<div class="wrapper">
					<a href="index.jsp" class="logo">
						<img src="style/images/logo.png" width="229" height="43" alt="医伯乐招聘-专注医药招聘" />
					</a>
					<ul class="reset" id="navheader">
						<li><a href="index.jsp">首页</a></li>
						<li><a href="companylist.jsp">公司</a></li>
						<li><a href="jianli.jsp" rel="nofollow">我的简历</a></li>
						<li><a href="create.jsp" rel="nofollow">发布职位</a></li>
					</ul>
				<s:if test="#session.userIdentity==0">
					<ul class="loginTop">
						<li><a href="jianli.jsp" rel="nofollow"> 个人中心 </a></li>
					</ul>
				</s:if>
				<s:elseif test="#session.userIdentity==1">
					<ul class="loginTop">
						<li><a href="create.jsp" rel="nofollow"> 个人中心 </a></li>
					</ul>
				</s:elseif>
				<s:else>
					<ul class="loginTop">
						<li><a href="login.jsp" rel="nofollow"> 登录 </a></li>
						<li>|</li>
						<li><a href="register.jsp" rel="nofollow"> 注册 </a></li>
					</ul>
				</s:else>
			</div>
			</div><!-- end #header -->
			<div id="container">
				<div class="content_mid">
					<dl class="c_section c_section_mid">
						<dt>
							<h2><em></em>联系我们</h2>
						</dt>
						<dd class="aboutus">
							<img alt="医伯乐团队" src="style/images/aboutus.png" width="186" height="186" />
							<div>
								<span>医伯乐（隶属于医伯乐有限公司）是专注医药职业机会的招聘网站，以众多优质医药资源为依托，发布圈内招聘信息，为求职者提供人性化、个性化、专业化的信息服务，以让优质人才和优秀企业及时相遇为己任。</span>
								<span>我们是一个年轻团队，我们用责任来做这件事情，致力于打造最专业的医药招聘平台。</span>
							</div>
							<ul class="reset contact_box">
								<li class="cli1">
									<p>商务合作：</p>
									邮箱：<a href="1611456615@qq.com">RoniZeng@ybl.com</a>
									地址：长沙市岳麓区学士街
								</li>
								<li class="cli2">
									增值服务：<br />
									邮箱：<a href="1611456615@qq.com">lrm@ybl.com</a><br />
								</li>
								<li class="cli3">
									客服邮箱：<a href="mailto:vivi@lby.com">ly@ybl.com</a><br />
									电话：010-159357199(9:30-21:00)<br />
									<span>
										<!-- WPA Button Begin -->
										<script charset="utf-8" type="text/javascript" src="http://wpa.b.qq.com/cgi/wpa.php?key=XzgwMDA1NjM3OV8xNDUzODBfODAwMDU2Mzc5Xw"></script>
										<!-- WPA Button End -->
									</span>
								</li>
							</ul>
						</dd>
					</dl>
				</div>
				<div class="clear"></div>
				<input type="hidden" id="resubmitToken" value="" />
				<a id="backtop" title="回到顶部" rel="nofollow"></a>
			</div><!-- end #container -->
		</div><!-- end #body -->
		<div id="footer">
			<div class="wrapper">
				<a href="about.html" target="_blank" rel="nofollow">联系我们</a>
				<a href="javascript:void(alert('正在建设中...'))" target="_blank">公司导航</a>
				<a href="javascript:void(alert('正在建设中...'))" target="_blank" rel="nofollow">微博</a>
				<a href="javascript:void(alert('正在建设中...'))" rel="nofollow">微信<i></i></a>
				<div class="copyright">&copy;2018-2020 <a target="_blank" href="http://www.miitbeian.gov.cn/state/outPortal/loginPortal.action">京ICP备14023790号-2</a></div>
			</div>
		</div>

		<script type="text/javascript" src="style/js/core.min.js"></script>
		<script type="text/javascript" src="style/js/popup.min.js"></script>
		<script type="text/javascript" src="style/js/tongji.js"></script>
		<!--  -->
		<script type="text/javascript" src="style/js/analytics.js"></script>
	</body>
</html>
