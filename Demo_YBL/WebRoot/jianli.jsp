<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
﻿<!DOCTYPE html>
<html xmlns:wb="http://open.weibo.com/wb">
 <head>  
  <script type="text/javascript" async="" src="style/js/conversion.js"></script> 
  <script src="style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script> 
  <style type="text/css">
</style> 
  <meta content="no-siteapp" http-equiv="Cache-Control" /> 
  <link media="handheld" rel="alternate" /> 
  <!-- end 云适配 --> 
  <meta content="text/html; charset=utf-8" http-equiv="Content-Type" /> 
  <title>我的简历-医伯乐-最专业的医药招聘平台</title> 
  <meta content="23635710066417756375" property="qc:admins" /> 
  <meta content="QIQ6KC1oZ6" name="baidu-site-verification" /> 
  <!-- <div class="web_root"  style="display:none">h
</div>
 --> 
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
  $.post("myResume.action",{},function(data){$("#show").html(data);});
  </script>
 </head> 
 <body id="show"> 
 
 </body>
</html>
