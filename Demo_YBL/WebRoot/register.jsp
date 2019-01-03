<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
  <head>
    <script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js"></script>
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="alternate" media="handheld" />
    <script type="text/javascript">var ctx = "h";
      console.log(1);
	</script>
    <link rel="Shortcut Icon" href="h/images/favicon.ico">
    <link rel="stylesheet" type="text/css" href="style/css/style.css" />
    <script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="style/js/jquery.lib.min.js"></script>
    <script type="text/javascript" src="style/js/core.min.js"></script>
    <script type="text/javascript">var youdao_conv_id = 271546;</script>
    <script type="text/javascript" src="style/js/conv.js"></script>
  </head>
  
  <body id="login_bg">
    <div class="login_wrapper" style="padding-top:20px;">
      <div class="login_header" >
        <a href="h/">
          <img src="style/images/logo.png" width="285" height="62" alt="医伯乐招聘" /></a>
        <div id="cloud_s">
          <img src="style/images/cloud_s.png" width="81" height="52" alt="cloud" /></div>
        <div id="cloud_m">
          <img src="style/images/cloud_m.png" width="136" height="95" alt="cloud" /></div>
      </div>
      <input type="hidden" id="resubmitToken" value="9b207beb1e014a93bc852b7ba450db27" />
      <div class="login_box" >
        <form id="loginForm" action="regist3.action" method="post"> <!-- form表单跳转 !-->
  
          <ul class="register_radio clearfix">
            <li>找工作
              <input type="radio" value="0" name="identity" /></li>
            <li>招人
              <input type="radio" value="1" name="identity" /></li></ul>
          <input type="text" class="email"  id="email" name="registinfo.email" tabindex="1" placeholder="请输入常用邮箱地址" />
          <!-- <span class="error" style="display:none;" id="beError" for="registinfo.email"></span> -->
         
          <input type="password" id="password"  name="registinfo.password" tabindex="2" placeholder="请输入密码" />
     	 <input type="password"  id="repassword" class="password" name="repassword" placeholder="请重复输入密码" />
     	 <input type="text" id="code" name="code"  class="password" tabindex="1" placeholder="请输入验证码" style="width:150px;"/>
     	 <a id="check_btn" > 发送验证码</a>
     	 <span id="send_msg"></span>
          <label class="fl registerJianJu" for="checkbox">
          <input type="checkbox" id="checkbox" name="checkbox" checked class="checkbox valid" />我已阅读并同意用户协议
          <a href="h/privacy.jsp" target="_blank">《用户协议》</a>
          </label>
          <input type="submit" id="submitLogin" value="注 &nbsp; &nbsp; 册" />
          <input type="hidden" id="callback" name="callback" value="" />
          <input type="hidden" id="authType" name="authType" value="" />
          <input type="hidden" id="signature" name="signature" value="" />
          <input type="hidden" id="timestamp" name="timestamp" value="" />
		  </form>
        <div class="login_right" >
          <div>已有医伯乐帐号</div>
          <a href="login.jsp" class="registor_now">直接登录</a>
          <br>
          <img src="style/images/companylist_qr.png" width="150" height="150" alt="微信公众号二维码" /> 
		  <div class="login_others">使用以下帐号直接登录:</div>
          <a href="" target="_blank" class="icon_wb" title="使用新浪微博帐号登录"></a>
          <a href="" class="icon_qq" target="_blank" title="使用腾讯QQ帐号登录"></a>
        </div>
      </div>
      <div class="login_box_btm"></div>
    </div>
    <script type="text/javascript">$(document).ready(function(e) {
   		 $("#check_btn").click(function() {
					var userEmail = $("#email").val().trim();
					if (userEmail.length>0) {
						if(userEmail.indexOf('@')==-1||userEmail.indexOf('.')==-1){
							alert("邮箱格式错误!");
						}else{
							$.post("regist2.action",{"registinfo.email":userEmail},function(response){
								alert("发送成功!");
							});
						}
					}else{
						alert("请输入邮箱!");
					}
				});
        $('.register_radio li input').click(function(e) {
          $(this).parent('li').addClass('current').append('<em></em>').siblings().removeClass('current').find('em').remove();
        });
        $('#email').focus(function() {
          $('#beError').hide();
        });
        //验证表单
        $("#loginForm").validate({
          rules: {
            identity: {
              required: true
            },
            "registinfo.email": {
              required: true,
              email: true
            },
            "registinfo.password": {
              required: true,
              rangelength: [6, 16]
            },
            repassword:{
            	required:true,
            	equalTo: "#password"
            },
            code:{
            		required:true,
            		rangelength: [6, 6]
            },
            checkbox: {
              required: true
            }
          },
          messages: {
            identity: {
              required: "请选择使用医伯乐的目的：找工作/招人"
            },
            "registinfo.email": {
              required: "请输入常用邮箱地址",
              email: "请输入有效的邮箱地址，如：zrl@ybl.com"
            },
             "registinfo.password": {
              required: "请输入密码",
              rangelength: "请输入6-16位密码，字母区分大小写"
            },
            repassword:{
            	required: "请输入密码",
                equalTo: "两次密码输入不一致"
            },
            code:{
            		required:"请输入验证码",
            		rangelength: "验证码为六位"
            },
            checkbox: {
              required: "请接受用户协议"
            }
          },
        });
      });</script>
  </body>
</html>