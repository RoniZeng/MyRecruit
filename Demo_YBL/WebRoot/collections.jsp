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
		<title>我收藏的职位-医伯乐-最专业的医药招聘平台</title>
		<meta content="23635710066417756375" property="qc:admins" />
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
		<script>
	
		$(document).ready(function(){
			$.post("selectFavors.action",{},function(data){$("#show").html(data);});
		});
		</script>
	</head>
	<body>
		<div id="body">
			<div id="header">
				<div class="wrapper">
					 <a href="index.jsp" class="logo"> <img src="style/images/logo.png" width="229" height="43" alt="拉勾招聘-专注互联网招聘" /> </a> 
     <ul id="navheader" class="reset"> 
      <li><a href="index.jsp">首页</a></li> 
      <li class="current"><a rel="nofollow" href="jianli.jsp">我的简历</a></li> 
      <li ><a rel="nofollow" href="list.jsp">找工作</a></li> 
     </ul> 
     <dl class="collapsible_menu"> 
      <dt> 
       <span>个人中心</span> 
       <i></i> 
      </dt> 
      <dd> 
       <a href="list.jsp">找工作</a> 
      </dd> 
      <dd> 
       <a rel="nofollow" href="jianli.jsp">我的简历</a> 
      </dd> 
      <dd> 
       <a href="collections.jsp">我收藏的职位</a> 
      </dd> 
      
      <!-- 
      <dd> 
       <a href="delivery.jsp">我投递的职位 <span id="noticeNo" class="red dn">(0)</span></a> 
      </dd>  -->
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
				<div class="clearfix">
					<div class="content_l">
						<dl class="c_collections">
							<dt>
								<h1><em></em>我收藏的职位</h1>
							</dt>
							<dd id="show">
							</dd>
						</dl>
					</div>
					<div class="content_r">
						
						</div>
						<!--end #myInfo-->
						<div class="greybg qrcode mt20">
							<img width="242" height="242" alt="微信公众号二维码" src="style/images/qr_delivery.png" />
							<span class="c7">扫描二维码，微信轻松搜工作</span>
						</div>
					</div>
				</div>
				<script src="style/js/collections.min.js"></script>
				<script>
					$(function(){
	$('.Pagination').pager({
	      currPage: 1,
	      pageNOName: "pageNo",
	      form: "collectionsForm",
	      pageCount: 1,
	      pageSize:  5
	});
});
</script>
				<div class="clear"></div>
				<input type="hidden" value="4c6ae41d8c254f91becdb5f9ef2d4394" id="resubmitToken" />
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
					&copy;2017-2018
					<a href="http://www.miitbeian.gov.cn/state/outPortal/loginPortal.action" target="_blank">京ICP备14023790号-2</a>
				</div>
			</div>
		</div>
		<script src="style/js/core.min.js" type="text/javascript"></script>
		<script src="style/js/popup.min.js" type="text/javascript"></script>
		<!--  -->
		<script type="text/javascript">
			$(function() {
				$('#noticeDot-1').hide();
				$('#noticeTip a.closeNT').click(function() {
					$(this).parent().hide();
				});
			});
			var index = Math.floor(Math.random() * 2);
			var ipArray = new Array('42.62.79.226', '42.62.79.227');
			var url = "ws://" + ipArray[index] + ":18080/wsServlet?code=314873";
			var CallCenter = {
				init: function(url) {
					var _websocket = new WebSocket(url);
					_websocket.onopen = function(evt) {
						console.log("Connected to WebSocket server.");
					};
					_websocket.onclose = function(evt) {
						console.log("Disconnected");
					};
					_websocket.onmessage = function(evt) {
						//alert(evt.data);
						var notice = jQuery.parseJSON(evt.data);
						if (notice.status[0] == 0) {
							$('#noticeDot-0').hide();
							$('#noticeTip').hide();
							$('#noticeNo').text('').show().parent('a').attr('href', ctx + '/mycenter/delivery.jsp');
							$('#noticeNoPage').text('').show().parent('a').attr('href', ctx + '/mycenter/delivery.jsp');
						} else {
							$('#noticeDot-0').show();
							$('#noticeTip strong').text(notice.status[0]);
							$('#noticeTip').show();
							$('#noticeNo').text('(' + notice.status[0] + ')').show().parent('a').attr('href', ctx +
								'/mycenter/delivery.jsp');
							$('#noticeNoPage').text(' (' + notice.status[0] + ')').show().parent('a').attr('href', ctx +
								'/mycenter/delivery.jsp');
						}
						$('#noticeDot-1').hide();
					};
					_websocket.onerror = function(evt) {
						console.log('Error occured: ' + evt);
					};
				}
			};
			CallCenter.init(url);
		</script>
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
