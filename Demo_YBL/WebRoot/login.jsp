<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
﻿<!DOCTYPE HTML>
<html>
  
  <head>
    <script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js"></script>
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="alternate" media="handheld" />
    <!-- end 云适配 -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>登录-医伯乐-最专业的医药招聘平台</title>
    <meta property="qc:admins" content="23635710066417756375" />
    <meta name="baidu-site-verification" content="QIQ6KC1oZ6" />
    <!-- <div class="web_root" style="display:none">h</div> -->
    <script type="text/javascript">var ctx = "h";
      console.log(1);</script>
    <link rel="Shortcut Icon" href="h/images/favicon.ico">
    <link rel="stylesheet" type="text/css" href="style/css/style.css" />
    <script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="style/js/jquery.lib.min.js"></script>
    <script type="text/javascript" src="style/js/core.min.js"></script>
    <script type="text/javascript">var youdao_conv_id = 271546;</script>
    <script type="text/javascript" src="style/js/conv.js"></script>
  </head>
  
  <body id="login_bg">
    <div class="login_wrapper">
      <div class="login_header">
        <a href="index.jsp">
          <img src="style/images/logo.png" width="285" height="62" alt="医伯乐" /></a>
        <div id="cloud_s">
          <img src="style/images/cloud_s.png" width="81" height="52" alt="cloud" /></div>
        <div id="cloud_m">
          <img src="style/images/cloud_m.png" width="136" height="95" alt="cloud" /></div>
      </div>
      <input type="hidden" id="resubmitToken" value="" />
      <div class="login_box">
        <form id="loginForm" action="LoginAction" method="post"> <!-- 若在数据库查询到有用户邮箱和密码存在，就跳转到首页界面！ !-->
          <input type="text" id="email" name="email" value="" tabindex="1" placeholder="请输入登录邮箱地址" />
          <input type="password" id="password" name="password" tabindex="2" placeholder="请输入密码" />
          <span class="error" style="display:none;" id="beError"></span>
          <label class="fl" for="remember">
            <input type="checkbox" id="remember" value="" checked="checked" name="autoLogin" />记住我</label>
			<!--若忘记密码，就跳转到reset界面！ !-->
          <a href="reset.jsp" class="fr" target="_blank">忘记密码？</a> 
		  
          <!--<input type="submit" id="submitLogin" value="登 &nbsp; &nbsp; 录" />-->
          <input type="submit" style="color:#fff;" class="submitLogin" title="登 &nbsp; &nbsp; 录" />
          <input type="hidden" id="callback" name="callback" value="" />
          <input type="hidden" id="authType" name="authType" value="" />
          <input type="hidden" id="signature" name="signature" value="" />
          <input type="hidden" id="timestamp" name="timestamp" value="" /></form>
        <div class="login_right">
          <div>还没有医伯乐帐号？</div>
          <a href="register.jsp" class="registor_now">立即注册</a>
          <div class="login_others">使用以下帐号直接登录:</div>
          <a href="h/ologin/auth/sina.jsp" target="_blank" class="icon_wb" title="使用新浪微博帐号登录"></a>
          <a href="h/ologin/auth/qq.jsp" class="icon_qq" target="_blank" title="使用腾讯QQ帐号登录"></a>
        </div>
      </div>
      <div class="login_box_btm"></div>
    </div>
    <script type="text/javascript">$(function() {
        //验证表单
        $("#loginForm").validate({
          /* onkeyup: false,
	    	focusCleanup:true, */
          rules: {
            email: {
              required: true,
              email: true
            },
            password: {
              required: true
            }
          },
          messages: {
            email: {
              required: "请输入登录邮箱地址",
              email: "请输入有效的邮箱地址，如：vivi@lagou.com"
            },
            password: {
              required: "请输入密码"
            }
          }
        });
      })</script>
  </body>
</html>
