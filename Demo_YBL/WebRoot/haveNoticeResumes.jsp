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
  <title>医伯乐-最专业的医药招聘平台</title> 
  <meta content="23635710066417756375" property="qc:admins" /> 
  <meta content="QIQ6KC1oZ6" name="baidu-site-verification" /> 
  <!-- <div class="web_root"  style="display:none">http://www.lagou.com</div> --> 
  <script type="text/javascript">
var ctx = "http://www.lagou.com";
console.log(1);
</script> 
  <link href="http://www.lagou.com/images/favicon.ico" rel="Shortcut Icon" /> 
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
  	$.post("selectResume.action",{"status":0},
  			function(data){
  			$("#show").html(data);
	});
  });
  </script>
    
 </head> 
 <body> 
  <div id="body"> 
   <div id="header"> 
    <div class="wrapper"> 
     <a class="logo" href="index.jsp"> <img width="229" height="43"  src="style/images/logo.png" /> </a> 
     <ul id="navheader" class="reset"> 
       <li><a href="index.jsp">首页</a></li>
						<li ><a href="myhome.jsp">公司</a></li>
						<li class="current"> <a rel="nofollow" href="toHandleResumes.jsp">简历管理</a> </li>
						<li><a rel="nofollow" href="create.jsp">发布职位</a></li>
					</ul>
					<dl class="collapsible_menu">
						<dt><!-- 修改： 改成动态显示用户名 -->
							<span>个人中心</span>
							<span class="red dn" id="noticeDot-1"></span>
							<i></i>
						</dt>
						<dd>
       <a href="create.jsp">我要招人</a>
      </dd> 
      <dd>
       <a href="myhome.jsp">我的主页</a>
      </dd>
      <dd>
       <a href="toHandleResumes.jsp">我收到的简历</a>
      </dd>
      <dd>
       <a href="positions.jsp">招聘管理</a>
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
    <div class="sidebar"> 
     <a class="btn_create" href="create.jsp">发布新职位</a> 
     <dl class="company_center_aside"> 
      <dt>
      	 我收到的简历
      </dt> 
      <dd> 
       <a href="toHandleResumes.jsp">待处理简历</a> 
      </dd> 
      <dd > 
       <a href="canInterviewResumes.jsp">待定简历</a> 
      </dd> 
      <dd class="current"> 
       <a href="haveNoticeResumes.jsp">已通知面试简历</a> 
      </dd> 
      <dd> 
       <a href="haveRefuseResumes.jsp">不合适简历</a> 
      </dd> 
      <dd class="btm"> 
       <a href="autoFilterResumes.jsp">自动过滤简历</a> 
      </dd> 
     </dl> 
     <dl class="company_center_aside"> 
      <dt>
       我发布的职位
      </dt> 
      <dd> 
       <a href="positions.jsp">有效职位</a> 
      </dd> 
      <dd> 
       <a href="nopositions.jsp">已下线职位</a> 
      </dd> 
     </dl> 
    </div>
    <!-- end .sidebar --> 
    <div class="content" id="show"> 
     <!-- end .company_center_content --> 
    </div>
    <!-- end .content --> 
    <!-- 弹窗lightbox -----------------------------------------> 
    <div style="display:none;"> 
     <!--通知面试弹窗--> 
     <div style="overflow:auto;" class="popup" id="noticeInterview"> 
      <form id="noticeInterviewForm"> 
       <table width="100%" class="f16"> 
        <tbody>
         <tr> 
          <td width="20%" align="right" class="c9">收件人 </td> 
          <td width="80%"> <span class="c9" id="receiveEmail"></span> <input type="hidden" value="" name="email" /> </td> 
         </tr> 
         <tr> 
          <td align="right"><span class="redstar">*</span>主题</td> 
          <td> <input type="text" placeholder="公司：职位名称面试通知" name="subject" /> </td> 
         </tr> 
         <tr> 
          <td align="right"><span class="redstar">*</span>面试时间</td> 
          <td> <input type="text" id="datetimepicker" name="interTime" class="hasDatepicker" /> </td> 
         </tr> 
         <tr> 
          <td align="right"><span class="redstar">*</span>面试地点</td> 
          <td> <input type="text" name="interAdd" /> </td> 
         </tr> 
         <tr> 
          <td align="right">联系人</td> 
          <td> <input type="text" name="linkMan" /> </td> 
         </tr> 
         <tr> 
          <td align="right"><span class="redstar">*</span>联系电话</td> 
          <td> <input type="text" name="linkPhone" /> </td> 
         </tr> 
         <tr> 
          <td valign="top" align="right">补充内容</td> 
          <td> <textarea name="content"></textarea> </td> 
         </tr> 
         <tr> 
          <td></td> 
          <td> <input type="submit" value="发送" class="btn" /> <a class="emailPreview" href="javascript:;">预览</a> </td> 
         </tr> 
        </tbody>
       </table> 
       <input type="hidden" value="" name="name" /> 
       <input type="hidden" value="" name="positionName" /> 
       <input type="hidden" value="" name="companyName" /> 
       <input type="hidden" value="" name="deliverId" /> 
      </form> 
     </div>
     <!--/#noticeInterview--> 
     <!--预览通知面试弹窗--> 
     <div class="popup" id="noticeInterviewPreview"> 
      <div class="f18">
       医伯乐：产品经理面试通知 
      </div> 
      <div class="c9">
       发给：
       <span>vivi@lagou.com</span>
      </div> 
      <div id="emailText"></div> 
      <input type="button" value="提交" class="btn fl" /> 
      <a title="通知面试" class="inline fl cboxElement" href="#noticeInterview">返回修改</a> 
     </div>
     <!--/#noticeInterviewPreview--> 
     <!--通知面试成功弹窗--> 
     <div class="popup" id="noticeInterviewSuccess"> 
      <table width="100%" class="f16"> 
       <tbody>
        <tr> 
         <td align="center" class="f16"> 面试通知已发送成功<br /> 该简历已进入“已通知面试简历”列表 </td> 
        </tr> 
        <tr> 
         <td align="center"> <input type="button" value="确认" class="btn" /> </td> 
        </tr> 
       </tbody>
      </table> 
     </div>
     <!--/#noticeInterviewSuccess--> 
     <!--转发简历弹窗--> 
     <div class="popup" id="forwardResume"> 
      <form id="forwardResumeForm"> 
       <table width="100%" class="f16"> 
        <tbody>
         <tr> 
          <td width="20%" align="right">收件人</td> 
          <td width="80%"> <input type="text" placeholder="最多可添加两个邮箱，用“；”隔开" id="recipients" name="recipients" /> <span id="forwardResumeError" style="display:none" class="beError"></span> </td> 
         </tr> 
         <tr> 
          <td align="right">主题</td> 
          <td> <input type="text" value="" name="title" /> </td> 
         </tr> 
         <tr> 
          <td valign="top" align="right">正文</td> 
          <td> <textarea name="content"></textarea> <span style="display:none;" class="beError error"></span> </td> 
         </tr> 
         <tr> 
          <td></td> 
          <td> <input type="submit" value="发送" class="btn" /> <a class="emial_cancel" href="javascript:;">取消</a> </td> 
         </tr> 
        </tbody>
       </table> 
       <input type="hidden" value="" name="resumeKey" /> 
       <input type="hidden" value="" name="positionId" /> 
       <input type="hidden" value="" name="deliverId" /> 
      </form> 
     </div>
     <!--/#forwardResume--> 
     <!--转发简历成功弹窗--> 
     <div class="popup" id="forwardResumeSuccess"> 
      <table width="100%" class="f16"> 
       <tbody>
        <tr> 
         <td align="center" class="f16">简历已转发成功 </td> 
        </tr> 
        <tr> 
         <td align="center"> <input type="button" value="确认" class="btn" /> </td> 
        </tr> 
       </tbody>
      </table> 
     </div>
     <!--/#forwardResumeSuccess--> 
     <!--确认不合适弹窗--> 
     <div style="height:400px;" class="popup" id="confirmRefuse"> 
      <form id="refuseMailForm"> 
       <table width="100%"> 
        <tbody>
         <tr> 
          <td> 
           <div class="refuse_icon"> 
            <h3>确认这份简历不合适吗？</h3> 
            <span>确认后，系统将自动发送以下内容至用户邮箱</span> 
           </div> </td> 
         </tr> 
         <tr> 
          <td> <textarea name="content">非常荣幸收到您的简历，在我们仔细阅读您的简历之后，却不得不很遗憾的通知您： 您的简历与该职位的定位有些不匹配，因此无法进入面试。 但您的信息已录入我司人才储备库，当有合适您的职位开放时我们将第一时间联系您，希望在未来我们有机会成为一起拼搏的同事； 再次感谢您对我们的信任，祝您早日找到满意的工作。</textarea> </td> 
         </tr> 
         <tr> 
          <td> <input type="submit" value="确认不合适" class="btn" /> <a class="emial_cancel" href="javascript:;">取消</a> </td> 
         </tr> 
        </tbody>
       </table> 
       <input type="hidden" value="" name="deliverId" /> 
      </form> 
     </div>
     <!--/#confirmRefuse--> 
     <!--拒绝email成功弹窗--> 
     <div class="popup" id="refuseMailSuccess"> 
      <table width="100%" class="f16"> 
       <tbody>
        <tr> 
         <td align="center" class="f16"> 不合适通知已发送成功<br /> 该简历已进入“不合适简历”列表 </td> 
        </tr> 
        <tr> 
         <td align="center"> <input type="button" value="确认" class="btn" /> </td> 
        </tr> 
       </tbody>
      </table> 
     </div>
     <!--/#refuseMailSuccess--> 
    </div> 
    <!-- end -----------------------------------------> 
    <script src="style/js/jquery.ui.datetimepicker.min.js" type="text/javascript"></script> 
    <script src="style/js/received_resumes.min.js" type="text/javascript"></script> 
    <script>
</script> 
    <div class="clear"></div> 
    <input type="hidden" value="b4bc225f0d084ee5b8d045f9c98a49ff" id="resubmitToken" /> 
    <a rel="nofollow" title="回到顶部" id="backtop"></a> 
   </div>
   <!-- end #container --> 
  </div>
  <!-- end #body --> 
  <div id="footer"> 
   <div class="wrapper"> 
    <a rel="nofollow" target="_blank" href="about.jsp">联系我们</a> 
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
$(function(){
	$('#noticeDot-1').hide();
	$('#noticeTip a.closeNT').click(function(){
		$(this).parent().hide();
	});
});
var index = Math.floor(Math.random() * 2);
var ipArray = new Array('42.62.79.226','42.62.79.227');
var url = "ws://" + ipArray[index] + ":18080/wsServlet?code=314873";
var CallCenter = {
		init:function(url){
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
				if(notice.status[0] == 0){
					$('#noticeDot-0').hide();
					$('#noticeTip').hide();
					$('#noticeNo').text('').show().parent('a').attr('href',ctx+'/mycenter/delivery.jsp');
					$('#noticeNoPage').text('').show().parent('a').attr('href',ctx+'/mycenter/delivery.jsp');
				}else{
					$('#noticeDot-0').show();
					$('#noticeTip strong').text(notice.status[0]);
					$('#noticeTip').show();
					$('#noticeNo').text('('+notice.status[0]+')').show().parent('a').attr('href',ctx+'/mycenter/delivery.jsp');
					$('#noticeNoPage').text(' ('+notice.status[0]+')').show().parent('a').attr('href',ctx+'/mycenter/delivery.jsp');
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
  <div class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" id="ui-datepicker-div"></div>
 </body>
</html>