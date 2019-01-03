<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
﻿<!DOCTYPE html>
<html xmlns:wb="http://open.weibo.com/wb">
 <head> 
  <script type="text/javascript" async="" src="style/js/conversion.js"></script>
  <script src="style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script>
  <style type="text/css"></style> 
  <meta content="no-siteapp" http-equiv="Cache-Control" /> 
  <link media="handheld" rel="alternate" /> 
  <!-- end 云适配 --> 
  <meta content="text/html; charset=utf-8" http-equiv="Content-Type" /> 
  <title>基本信息-招聘服务-医伯乐-最专业的医药招聘平台</title> 
  <meta content="23635710066417756375" property="qc:admins" /> 
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
 </head> 
 <body> 
  <div id="body"> 
   <div id="header"> 
    <div class="wrapper"> 
      <a class="logo" href="index.jsp"> <img width="229" height="43" alt="医伯乐-专注医疗招聘" src="style/images/logo.png" /> </a> 
     <ul id="navheader" class="reset"> 
      <li> <a href="index.jsp">首页</a></li> 
      <li class="current"><a href="companylist.jsp">公司</a></li> 
      <li> <a rel="nofollow" href="">简历管理</a> </li> 
      <li> <a rel="nofollow" href="create.jsp">发布职位</a></li> 
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
       <a href="jianli.jsp">我要找工作</a>
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
    <div style="" id="stepTip"> 
     <a></a> 
      <img width="803" height="59" src="style/images/tiponce.jpg" />  
    </div> 
    <div class="content_mid"> 
     <dl class="c_section c_section_mid"> 
      <dt> 
       <h2><em></em>填写公司信息</h2> 
      </dt> 
      <dd> 
       <form id="stepForm" action="dataCompany.action" method="post"> 
        <div class="c_text_1">
        	 基本信息为必填项，是求职者加速了解公司的窗口，认真填写吧！
        </div> 
<!--         <img width="668" height="56" class="c_steps" alt="第一步" src="style/images/step1.png" />  -->
        <h3>公司全称</h3>
        <input type="text" placeholder="请输入公司全称，如:医伯乐" value="${userInfo.name}" name="userInfo.name" id="name" class="valid" />  
        <h3>公司LOGO</h3> 
        <!--非必填改必填--> 
        <div class="c_logo c_logo_pos"> 
        
         <a title="上传公司LOGO" class="inline cboxElement" href="#logoUploader"> 
          <div id="logoNo"> 
           <span>上传公司LOGO</span> 
           <br /> 尺寸：190*190px 
           <br /> 大小：小于5M 
          </div> 
          <div class="dn" id="logoShow"> 
           <img width="190" height="190" alt="公司logo" src="" /> 
           <span>更换公司LOGO<br />190px*190px 小于5M</span> 
          </div> </a> 
          
        </div> 
        <h3>公司营业执照</h3> 
        <!--非必填改必填--> 
        <div class="c_logo c_logo_pos"> 
        
         <a title="上传公司营业执照" class="inline cboxElement" href="#logoUploader"> 
          <div id="logoNo"> 
           <span>上传公司营业执照</span> 
           <br /> 尺寸：190*190px 
           <br /> 大小：小于5M 
          </div> 
          <div class="dn" id="logoShow"> 
           <img width="190" height="190" alt="公司logo" src="" /> 
           <span>更换公司营业执照<br />190px*190px 小于5M</span> 
          </div> </a> 
          
        </div> 
        <h3>公司网址</h3> 
        <input type="text" placeholder="请输入公司网址" name="userInfo.website" value="${userInfo.website}" id="website" /> 
        <h3>所在城市</h3> 
        <input type="text" placeholder="请输入工作城市，如：北京" name="userInfo.location" value="${userInfo.location}" id="city" /> 
        <h3>公司详细地址</h3>
		<td> 
			<input type="text" placeholder="请输入公司详细地址" name="userInfo.map" value="" id="website">
            <!-- 
            <div class="work_place f14">
             	我们将在职位详情页以地图方式精准呈现给用户 
            <a id="mapPreview" href="javascript:;">预览地图</a>
            </div> 
             -->
        </td>
        <h3>行业领域</h3> 
        <div> 
         <input type="hidden" value="" name="select_industry_hidden" id="select_industry_hidden" /> 
         <input type="button" value="请选择行业领域" name="userInfo.field" value="${userInfo.field}" id="select_industry" class="select" /> 
         <div class="dn" id="box_industry" style="display: none;"> 
          <ul class="reset">
           <li>公立医院</li> 
           <li>民营医院</li> 
           <li>生物企业</li> 
           <li>医药企业</li> 
           <li>科研院校</li> 
           <li>诊所药房</li> 
           <li>其他单位</li> 
          </ul> 
         </div> 
        </div> 
        <h3>公司规模</h3> 
        <div> 
         <input type="hidden" value="" name="select_scale_hidden" id="select_scale_hidden" /> 
         <input type="button" value="请选择公司规模" name="userInfo.size" value="${userInfo.size}" id="select_scale" class="select" /> 
         <div class="dn" id="box_scale" style="display: none;"> 
          <ul class="reset"> 
           <li>少于15人</li> 
           <li>15-50人</li> 
           <li>50-150人</li> 
           <li>150-500人</li> 
           <li>500-2000人</li> 
           <li>2000人以上</li> 
          </ul> 
         </div> 
        </div> 
       
        
        <div class="dn" id="cloneInvest"> 
         <input type="hidden" class="select_invest_hidden" name="select_invest_hidden" /> 
         <input type="button" value="请选择发展阶段" class="select_short select_invest" /> 
         <div class="box_invest dn"> 
          <ul class="reset"> 
           <li>天使轮</li> 
           <li>A轮</li> 
           <li>B轮</li> 
           <li>C轮</li> 
           <li>D轮及以上</li> 
           <li>上市公司</li> 
          </ul> 
         </div> 
        
        </div> 
        <h3>公司介绍</h3> 
        <input type="text" placeholder="一句话概括公司亮点，如公司愿景、领导团队等，限50字" maxlength="50" name="userInfo.introduce"  value="${userInfo.introduce}" id="temptation" /> 
        <span style="display:none;" class="error" id="beError"></span> 
        <input type="hidden" id="companyId" name="companyId" value="25927" /> 
        <input type="hidden" id="companyName" name="companyName" value="常德医药有限公司" /> 
        <input type="submit" value="保存" id="stepBtn" class="btn_big fr" /> 
        
       </form> 
      </dd> 
     </dl> 
    </div> 
    <!--弹窗lightbox  -----------------------------------------> 
    <div style="display:none;"> 
     <!--图片上传--> 
     <div style="width:650px;height:470px;" class="popup" id="logoUploader"> 
      <object width="650" height="470" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id="FlashID"> <param value="../../flash/avatar.swf?url=http://www.lagou.com/cd/saveProfileLogo.json" name="movie"></param> <param value="high" name="quality"></param> <param value="opaque" name="wmode"></param> <param value="111.0.0.0" name="swfversion"></param> 
       <!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 --> <param value="../../Scripts/expressInstall.swf" name="expressinstall"></param> 
       <!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 --> 
       <!--[if !IE]>--> <object width="650" height="470" data="../../flash/avatar.swf?url=http://www.lagou.com/cd/saveProfileLogo.json" type="application/x-shockwave-flash"> 
        <!--<![endif]--> <param value="high" name="quality"></param> <param value="opaque" name="wmode"></param> <param value="111.0.0.0" name="swfversion"></param> <param value="../../Scripts/expressInstall.swf" name="expressinstall"></param> 
        <!-- 浏览器将以下替代内容显示给使用 Flash Player 6.0 和更低版本的用户。 --> 
        <div> 
         <h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4> 
         <p><a href="http://www.adobe.com/go/getflashplayer"><img width="112" height="33" src="style/images/get_flash_player.gif" alt="获取 Adobe Flash Player" /></a></p> 
        </div> 
        <!--[if !IE]>--> </object> 
       <!--<![endif]--> </object> 
     </div>
     <!-- #logoUploader --> 
    </div> 
    <!-- end -----------------------------------------> 
    <script src="style/js/step1.min.js" type="text/javascript"></script> 
    <script>
var avatar = {};
avatar.uploadComplate = function( data ){
	var result = eval('('+ data +')');
	if(result.success){
		jQuery('#logoShow img').attr("src",ctx+ '/'+result.content);
		jQuery.colorbox.close();
		jQuery('#logoNo').hide();
		jQuery('#logoShow').show();
	}
};
</script> 
    <div class="clear"></div> 
    <input type="hidden" value="13ae35fedd9e45cdb66fb712318d7369" id="resubmitToken" /> 
    <a rel="nofollow" title="回到顶部" id="backtop" style="display: none;"></a> 
   </div>
   <!-- end #container --> 
  </div>
  <!-- end #body --> 
  <div id="footer"> 
   <div class="wrapper"> 
    <a rel="nofollow" target="_blank" href="about.jsp">联系我们</a> 
    <a target="_blank" href="#">公司导航</a> 
    <a rel="nofollow" target="_blank" href="#">微博</a> 
    <a rel="nofollow" href="javascript:void(0)" >微信<i></i></a> 
    <div class="copyright">
     &copy;2017-2018
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
