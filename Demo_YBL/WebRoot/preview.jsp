<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
﻿<!DOCTYPE html>
<html>
 <head> 
  <meta content="text/html; charset=utf-8" http-equiv="Content-Type" /> 
  <title>简历预览-我的简历-医伯乐-最专业的医药招聘平台</title> 
  <meta content="23635710066417756375" property="qc:admins" /> 
  <meta content="QIQ6KC1oZ6" name="baidu-site-verification" /> 
  <!-- <div class="web_root"  style="display:none">h</div> --> 
  <script type="text/javascript">
var ctx = "h";
console.log(1);
</script> 
  <link href="h/images/favicon.ico" rel="Shortcut Icon" /> 
  <link href="style/css/style.css" type="text/css" rel="stylesheet" /> 
  <link href="style/css/colorbox.min.css" type="text/css" rel="stylesheet" /> 
  <link href="style/css/popup.css" type="text/css" rel="stylesheet" /> 
  <script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script> 
  <script src="style/js/jquery.colorbox-min.js" type="text/javascript"></script> 
  <script>
$(function(){
	 $("body").on("click","a.btn_s",function(){
		$.colorbox.close();
		parent.jQuery.colorbox.close();
	});
	$(".inline").colorbox({
		inline:true
	});
});
</script> 
  <script src="style/js/ajaxCross.json" charset="UTF-8"></script>
 </head> 
 <body> 
  <div id="previewWrapper"> 
   <div class="preview_header"> 
    <h1 title="<s:property value="#request.detailsResume.employee.name"/>的简历"><s:property value="#request.detailsResume.employee.name"/>的简历</h1> 
    <a title="下载简历" class="inline cboxElement" href="#downloadOnlineResume">下载该简历</a> 
   </div>
   <!--end .preview_header--> 
   <div class="preview_content"> 
    <div class="profile_box" id="basicInfo"> 
     <h2>基本信息</h2> 
     <div class="basicShow"> 
     	<s:set name="SEX" value="{'男','女'}"></s:set>
      <span><s:property value="#request.detailsResume.employee.name"/> | 
      <s:property value="#SEX[#request.detailsResume.employee.sex]"/> | 
	  <s:set name="DEGREE" value="{'大专及以下','本科','硕士','博士'}"/>
      <s:property value="#DEGREE[#request.detailsResume.employee.degree]"/> | 
      <s:property value="#request.detailsResume.employee.experience"/>年工作经验 | 
      <s:property value="#request.detailsResume.employee.city"/><br />  
      <s:property value="#DEGREE[#request.detailsResume.employee.degree]"/> |  &middot; 
      <s:property value="#request.detailsResume.education.major"/> |  &middot; 
      <s:property value="#request.detailsResume.education.school.name"/><br /> 
      <s:property value="#request.detailsResume.employee.tel"/> | 
      <s:property value="#request.detailsResume.employee.birthday"/><br /> </span> 
      <div class="m_portrait"> 
       <div></div> 
       <img width="120" height="120" alt="jason" src="style/images/default_headpic.png" /> 
      </div> 
     </div>
     <!--end .basicShow--> 
    </div>
    <!--end #basicInfo--> 
    <div class="profile_box" id="expectJob"> 
     <h2>期望工作</h2> 
     <div class="expectShow">
      	 <s:property value="#request.detailsResume.employee.expCity"/>，
      	 <s:set name="TYPE" value="{'全职','兼职','实习'}"/>
      	 <s:property value="#TYPE[#request.detailsResume.employee.type]"/>，
      	 月薪<s:property value="#request.detailsResume.employee.expSalary"/>k，
      	 <s:property value="#request.detailsResume.employee.expJob"/>
     </div>
     <!--end .expectShow--> 
    </div>
    <!--end #expectJob--> 
    <div class="profile_box" id="workExperience"> 
     <h2>工作经历</h2> 
     <s:iterator value="#request.detailsResume.experiences" id="obj">
     	<div class="experienceShow"> 
     	 <ul class="wlist clearfix"> 
      	 <li class="clear"> <span class="c9"><s:property value="#obj.startTime"/>-
      	 <s:property value="#obj.endTime"/></span> 
       	 <div> 
       	  <img width="56" height="56" alt="<s:property value="#obj.companyName"/>" src="style/images/logo_default.png" /> 
        	 <h3><s:property value="#obj.department"/> </h3> 
        	 <h3><s:property value="#obj.duty"/> </h3> 
        	 <h4><s:property value="#obj.companyName"/></h4> 
        	</div> </li> 
     	 </ul> 
     	</div>
     </s:iterator>
     <!--end .experienceShow--> 
    </div>
    <!--end #workExperience--> 
    <div class="profile_box" id="projectExperience"> 
     <h2>项目经验</h2> 
     <div class="projectShow"> 
      <ul class="plist clearfix"> 
       <li class="noborder"> 
        <div class="projectList"> 
         <div class="f16 mb10">
          	<s:property value="#request.detailsResume.projectExperience"/>
         </div> 
         <div class="dl1"></div> 
        </div> </li> 
      </ul> 
     </div>
     <!--end .projectShow--> 
    </div>
    <!--end #projectExperience--> 
    <div class="profile_box" id="educationalBackground"> 
     <h2>教育背景</h2> 
     <div class="educationalShow"> 
      <ul class="elist clearfix"> 
       <li class="clear"> <span class="c9"><s:property value="#request.detailsResume.education.startTime"/>-
       <s:property value="#request.detailsResume.education.endTime"/></span> 
        <div> 
         <h3><s:property value="#request.detailsResume.education.school.name"/></h3> 
         <s:set name="DEGREE" value="{'大专及以下','本科','硕士','博士'}"/>
         <h4><s:property value="#DEGREE[#request.detailsResume.education.degree]"/>,</h4> 
        </div> </li> 
      </ul> 
     </div>
     <!--end .educationalShow--> 
    </div>
    <!--end #educationalBackground--> 
    <div class="profile_box" id="selfDescription"> 
     <h2>自我描述</h2> 
     <div class="descriptionShow">
		<s:property value="#request.detailsResume.evaluation"/>
     </div>
     <!--end .descriptionShow--> 
    </div>
    <!--end #selfDescription--> 
    <div class="profile_box" id="worksShow"> 
     <h2>论文展示</h2> 
     <div class="workShow"> 
      <ul class="slist clearfix"> 
       <li class="noborder"> 
        <div class="workList c7"> 
         <div class="f16">
         <s:property value="#request.detailsResume.paper"/>
         </div>
        </div> </li> 
      </ul> 
     </div>
     <!--end .workShow--> 
    </div>
    <!--end #worksShow--> 
   </div>
   <!--end .preview_content--> 
  </div>
  <!--end #previewWrapper--> 
  <!--弹窗lightbox -----------------------------------------> 
  <div style="display:none;"> 
   <!-- 下载简历 --> 
   <div class="popup" id="downloadOnlineResume"> 
    <table width="100%"> 
     <tbody>
      <tr> 
       <td class="c5 f18">请选择下载简历格式：</td> 
      </tr> 
      <tr> 
       <td> <a class="btn_s" href="h/resume/downloadResume?key=1ccca806e13637f7b1a4560f80f08057&amp;type=1">word格式</a> <a class="btn_s" href="h/resume/downloadResume?key=1ccca806e13637f7b1a4560f80f08057&amp;type=2">html格式</a> <a class="btn_s" href="h/resume/downloadResume?key=1ccca806e13637f7b1a4560f80f08057&amp;type=3">pdf格式</a> </td> 
      </tr> 
     </tbody>
    </table> 
   </div>
   <!--/#downloadOnlineResume--> 
  </div> 
  <!-- end -----------------------------------------> 
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
