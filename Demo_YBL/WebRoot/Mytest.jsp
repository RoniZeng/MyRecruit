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
 </head> 
 <body> 
  <div id="body">  
   <!-- end #header --> 
   <div id="container"> 
    <div class="clearfix"> 
     <div class="content_l"> 
       
      <!--end #resume_name--> 
   
      <!--end #lastChangedTime--> 
      
      <!--end #resumeScore--> 
      <div class="profile_box" id="basicInfo"> 
       <h2>基本信息</h2> 
       <span class="c_edit"></span> 
       <div class="basicShow"> 
        <span><s:property value="#request.myResume.employee.name"/> | 
        <s:set name="SEX" value="{'男','女'}"></s:set>
        <s:property value="#SEX[#request.myResume.employee.sex]"/> | 
        <s:set name="DEGREE" value="{'大专及以下','本科','硕士','博士'}"/>
        <s:property value="#DEGREE[#request.myResume.employee.degree]"/>| 
        <s:property value="#request.myResume.employee.experience"/>年工作经验<br />
        <s:property value="#request.myResume.employee.tel"/><br /></span> 
        <div class="m_portrait"> 
         <div> 
         </div> 
         <img width="120" height="120" alt="<s:property value="#request.myResume.employee.name"/>" src="style/images/default_headpic.png" /> 
        </div> 
       </div> 
       <!--end .basicShow--> 
       <div class="basicEdit dn"> 
        <div id="profileForm" action="submitMsg()"> 
         <table> 
          <tbody> 
           <tr> 
            <td valign="top"> <span class="redstar">*</span> </td> 
            <td> <input type="text" placeholder="姓名" value="<s:property value="#request.myResume.employee.name"/>" name="name" id="name" /> </td> 
            <td valign="top"> </td> 
            <td> 
             <ul class="profile_radio clearfix reset"> 
              <li class="current"> 男 <em></em> <input type="radio" checked="checked" name="gender" value="0" /> </li> 
              <li> 女 <em></em> <input type="radio" name="gender" value="1" /> </li> 
             </ul> </td> 
           </tr> 
           <tr> 
            <td valign="top"> <span class="redstar">*</span> </td> 
            <td> <input type="hidden" id="topDegree" value="大专" name="topDegree" /> <input type="button" value="大专" id="select_topDegree" class="profile_select_190 profile_select_normal" /> 
             <div class="boxUpDown boxUpDown_190 dn" id="box_topDegree" style="display: none;"> 
              <ul> 
               <li>大专</li> 
               <li>本科</li> 
               <li>硕士</li> 
               <li>博士</li> 
              </ul> 
             </div> </td> 
            <td valign="top"> <span class="redstar">*</span> </td> 
            <td> <input type="hidden" id="workyear" value="" name="workyear" /> <input type="button" value="" id="select_workyear" class="profile_select_190 profile_select_normal" /> 
             <div class="boxUpDown boxUpDown_190 dn" id="box_workyear" style="display: none;"> 
              <ul> 
               <li>应届毕业生</li> 
               <%  	
               		for(int id=1;id<=50;id++)  
               		 out.println("<li>"+id+"年</li> ");  
    			%>  
              </ul> 
             </div> </td> 
           </tr> 
           <tr> 
            <td valign="top"> <span class="redstar">*</span> </td> 
            <td colspan="3"> <input type="text" placeholder="手机号码" value="<s:property value="#request.myResume.employee.tel"/>" name="tel" id="tel" /> </td> 
           </tr> 
           <tr> 
           
            <td> </td> 
            <td colspan="3"> <input type="submit" onclick="submitMsg();" value="保 存" class="btn_profile_save" /> <a class="btn_profile_cancel" href="javascript:;">取 消</a> </td> 
            <script>
            	function submitMsg(){
            		var degree=$("#topDegree").val();
            		if(degree=="大专") degree=0;
            		else if(degree=="本科") degree=1;
            		else if(degree=="硕士") degree=2;
            		else if(degree=="博士") degree=3;

            		var workyear=$("#workyear").val(); 
            		if(workyear.charAt(0)=='应') workyear=0;
            		else if(isNaN(workyear.charAt(1))) workyear=workyear.charAt(0);
            		else workyear=workyear.substring(0,2);
            	 
            		$.post("updateBasic.action",{
            		"myResume.employee.name":$("#name").val(),
            		"myResume.employee.sex":$('input:radio[name="gender"]:checked').val(),
            		"myResume.employee.degree":degree,
            		"myResume.employee.experience":workyear,
            		"myResume.employee.tel":$("#tel").val()
            		},function(data){ 
            			window.location.href="jianli.jsp";
            		});
            	}
            </script>
           </tr> 
          </tbody> 
         </table> 
        </div>
        <script>
            	function loadImg(){
				    //获取文件
				    var file = $("#imgForm").find("input")[0].files[0];
				 
				    //创建读取文件的对象
				    var reader = new FileReader();
				 
				    //创建文件读取相关的变量
				    var imgFile;
				 
				    //为文件读取成功设置事件
				    reader.onload=function(e) {
				        alert('文件读取完成');
				        imgFile = e.target.result;
				        console.log(imgFile);
				        $("#imgContent").attr('src', imgFile);
				    };
				 
				    //正式读取文件
				    reader.readAsDataURL(file);
				}
            </script>
        <!--end #profileForm--> 
        <div class="new_portrait"> 
         <div class="portrait_upload" id="portraitNo"> 
          <span>上传自己的头像</span> 
         </div> 
         <div class="portraitShow dn" id="portraitShow"> 
          <img width="120" height="120" src="" /> 
          <span>更换头像</span> 
         </div> 
         <form id="imgForm">
         <input type="file" value="" title="支持jpg、jpeg、gif、png格式，文件小于5M" onchange="loadImg()" name="headPic" id="headPic" class="myfiles" /> 
         </form>
         <!-- <input type="hidden" id="headPicHidden" /> --> 
         <em> 尺寸：120*120px <br /> 大小：小于5M </em> 
         <span style="display:none;" id="headPic_error" class="error"></span> 
        </div> 
        <!--end .new_portrait--> 
       </div> 
       <!--end .basicEdit--> 
       <input type="hidden" id="nameVal" value="<s:property value="#request.myResume.employee.name"/>" /> 
       <input type="hidden" id="genderVal" value="<s:property value="#SEX[#request.myResume.employee.sex]"/>" /> 
       <input type="hidden" id="topDegreeVal" value="<s:property value="#DEGREE[#request.myResume.employee.degree]"/>" /> 
       <input type="hidden" id="workyearVal" value="<s:property value="#request.myResume.employee.experience"/>年" /> 
       <input type="hidden" id="telVal" value="<s:property value="#request.myResume.employee.tel"/>" /> 
      </div> 
      <!--end #basicInfo--> 
      <div class="profile_box" id="expectJob"> 
       <h2>期望工作</h2> 
       <span class="c_edit dn"></span> 
       <div class="expectShow dn"> 
        <span></span> 
       </div> 
       <!--end .expectShow--> 
       <div class="expectEdit dn"> 
        <div id="expectForm"> 
         <table> 
          <tbody> 
           <tr> 
            <td colspan="2"> <input type="submit" onclick="submitJOBEXPECT();" value="保 存" class="btn_profile_save" /> <a class="btn_profile_cancel" href="javascript:;">取 消</a> </td> 
           	 <script>
            	function submitJOBEXPECT(){ 
            		var expectCity=$("#expectCity").val();
            		var type=$('input:radio[name="type"]:checked').val();
            		var expectPosition=$("#expectPosition").val();
            		var expectSalary=$("#expectSalary").val();
            		expectSalary=expectSalary.substring(0,expectSalary.indexOf('k'));
            		
            		$.post("updateExpectation.action",{
            		"myResume.employee.expCity":expectCity,
            		"myResume.employee.type":type,
            		"myResume.employee.expJob":expectPosition,
            		"myResume.employee.expSalary":expectSalary
            		},function(data){ 
            			window.location.href="jianli.jsp";
            		});
            	}
            </script>
           </tr> 
          </tbody> 
         </table> 
        </div> 
        <!--end #expectForm--> 
       </div> 
       <!--end .expectEdit--> 
       <div class="expectAdd pAdd">  
       		<s:property value="#request.myResume.employee.expJob"/>  <s:property value="#request.myResume.employee.expSalary"/>K<br/>
       		<s:property value="#request.myResume.employee.expCity"/> 
       		<s:set name="TYPE" value="{'全职','兼职','实习'}"/>
      		<s:property value="#TYPE[#request.myResume.employee.type]"/>
        <span>修改期望工作</span> 
       </div> 
       <!--end .expectAdd--> 
       <input type="hidden" id="expectJobVal" value="" /> 
       <input type="hidden" id="expectCityVal" value="" /> 
       <input type="hidden" id="typeVal" value="" /> 
       <input type="hidden" id="expectPositionVal" value="" /> 
       <input type="hidden" id="expectSalaryVal" value="" /> 
      </div> 
      <!--end #expectJob--> 
      <div class="profile_box" id="workExperience"> 
       <h2>工作经历 <span> （投递简历时必填）</span></h2> 
       <span class="c_add dn"></span> 
       <div class="experienceShow dn"> 
        <div class="experienceForm borderBtm dn"> 
         <table> 
          <tbody> 
           <tr> 
            <td valign="top"> <span class="redstar">*</span> </td> 
            <td> <input type="text" placeholder="公司名称" name="companyName" class="companyName" /> </td> 
            <td valign="top"> <span class="redstar">*</span> </td> 
            <td> <input type="text" placeholder="职位名称，如：产品经理" name="positionName" class="positionName" /> </td> 
           </tr> 
           <tr> 
            <td valign="top"> <span class="redstar">*</span> </td> 
            <td> 
             <div class="fl"> 
              <input type="hidden" class="companyYearStart" value="" name="companyYearStart"/> 
              <input type="button" value="开始年份" class="profile_select_139 profile_select_normal select_companyYearStart" /> 
              <div class="box_companyYearStart boxUpDown boxUpDown_139 dn" style="display: none;"> 
               <ul>  <%
               	for(int i=2019;i>=1970;i--)
               		out.println("<li>"+i+"</li>");
               	 %> 
               </ul> 
              </div> 
             </div> 
             <div class="fl"> 
              <input type="hidden" class="companyMonthStart" value="" name="companyMonthStart" /> 
              <input type="button" value="开始月份" class="profile_select_139 profile_select_normal select_companyMonthStart" /> 
              <div style="display: none;" class="box_companyMonthStart boxUpDown boxUpDown_139 dn"> 
               <ul> 
                <li>01</li> 
                <li>02</li> 
                <li>03</li> 
                <li>04</li> 
                <li>05</li> 
                <li>06</li> 
                <li>07</li> 
                <li>08</li> 
                <li>09</li> 
                <li>10</li> 
                <li>11</li> 
                <li>12</li> 
               </ul> 
              </div> 
             </div> 
             <div class="clear"> 
             </div> </td> 
            <td valign="top"> <span class="redstar">*</span> </td> 
            <td> 
             <div class="fl"> 
              <input type="hidden" class="companyYearEnd" value="" name="companyYearEnd" /> 
              <input type="button" value="结束年份" class="profile_select_139 profile_select_normal select_companyYearEnd" /> 
              <div class="box_companyYearEnd boxUpDown boxUpDown_139 dn" style="display: none;"> 
               <ul> 
                <%
               	for(int i=2019;i>=1970;i--)
               		out.println("<li>"+i+"</li>");
               	 %> 
               </ul> 
              </div> 
             </div> 
             <div class="fl"> 
              <input type="hidden" class="companyMonthEnd" value="" name="companyMonthEnd"/> 
              <input type="button" value="结束月份" class="profile_select_139 profile_select_normal select_companyMonthEnd" /> 
              <div style="display: none;" class="box_companyMonthEnd boxUpDown boxUpDown_139 dn"> 
               <ul> 
                <li>01</li> 
                <li>02</li> 
                <li>03</li> 
                <li>04</li> 
                <li>05</li> 
                <li>06</li> 
                <li>07</li> 
                <li>08</li> 
                <li>09</li> 
                <li>10</li> 
                <li>11</li> 
                <li>12</li> 
               </ul> 
              </div> 
             </div> 
             <div class="clear"> 
             </div> </td> 
           </tr> 
           <tr> 
            <td> </td> 
            <td colspan="3"> <input type="submit" value="保 存" class="btn_profile_save" /> <a class="btn_profile_cancel" href="javascript:;">取 消</a> </td> 
 
           </tr> 
          </tbody> 
         </table> 
         <input type="hidden" class="expId" value="" /> 
        </div> 
        <!--end .experienceForm--> 
        <ul class="wlist clearfix"> 
        </ul> 
       </div> 
       <!--end .experienceShow--> 
       <div class="experienceEdit dn"> 
        <div class="experienceForm"> 
         <table> 
          <tbody> 
           <tr> 
            <td valign="top"> <span class="redstar">*</span> </td> 
            <td> <input type="text" placeholder="公司名称" name="companyName" class="companyName" id="CNAME"/> </td> 
            <td valign="top"> <span class="redstar">*</span> </td> 
            <td> <input type="text" placeholder="职位名称，如：产品经理" name="positionName" class="positionName" id="PNAME"/> </td> 
           </tr> 
           <tr> 
            <td valign="top"> <span class="redstar">*</span> </td> 
            <td> 
             <div class="fl"> 
              <input type="hidden" class="companyYearStart" value="" name="companyYearStart" id="STARTYY"/> 
              <input type="button" value="开始年份" class="profile_select_139 profile_select_normal select_companyYearStart" /> 
              <div class="box_companyYearStart boxUpDown boxUpDown_139 dn" style="display: none;"> 
               <ul> 
                <%
               	for(int i=2019;i>=1970;i--)
               		out.println("<li>"+i+"</li>");
               	 %> 
               </ul> 
              </div> 
             </div> 
             <div class="fl"> 
              <input type="hidden" class="companyMonthStart" value="" name="companyMonthStart" id="STARTMM"/> 
              <input type="button" value="开始月份" class="profile_select_139 profile_select_normal select_companyMonthStart" /> 
              <div style="display: none;" class="box_companyMonthStart boxUpDown boxUpDown_139 dn"> 
               <ul> 
                <li>01</li> 
                <li>02</li> 
                <li>03</li> 
                <li>04</li> 
                <li>05</li> 
                <li>06</li> 
                <li>07</li> 
                <li>08</li> 
                <li>09</li> 
                <li>10</li> 
                <li>11</li> 
                <li>12</li> 
               </ul> 
              </div> 
             </div> 
             <div class="clear"> 
             </div> </td> 
            <td valign="top"> <span class="redstar">*</span> </td> 
            <td> 
             <div class="fl"> 
              <input type="hidden" class="companyYearEnd" value="" name="companyYearEnd" id="ENDYY"/> 
              <input type="button" value="结束年份" class="profile_select_139 profile_select_normal select_companyYearEnd" /> 
              <div class="box_companyYearEnd boxUpDown boxUpDown_139 dn" style="display: none;"> 
               <ul> 
               	<%
               	for(int i=2019;i>=1970;i--)
               		out.println("<li>"+i+"</li>");
               	 %> 
               </ul> 
              </div> 
             </div> 
             <div class="fl"> 
              <input type="hidden" class="companyMonthEnd" value="" name="companyMonthEnd" id="ENDMM"/> 
              <input type="button" value="结束月份" class="profile_select_139 profile_select_normal select_companyMonthEnd" /> 
              <div style="display: none;" class="box_companyMonthEnd boxUpDown boxUpDown_139 dn"> 
               <ul> 
                <li>01</li> 
                <li>02</li> 
                <li>03</li> 
                <li>04</li> 
                <li>05</li> 
                <li>06</li> 
                <li>07</li> 
                <li>08</li> 
                <li>09</li> 
                <li>10</li> 
                <li>11</li> 
                <li>12</li> 
               </ul> 
              </div> 
             </div> 
             <div class="clear"> 
             </div> </td> 
           </tr> 
           <tr> 
            <td> </td> 
            <td colspan="3"> <input type="submit" onclick="submitJOBE();" value="保 存" class="btn_profile_save" /> 
            <a class="btn_profile_cancel" href="javascript:;">取 消</a> </td> 
          		 <script>
            	function submitJOBE(){
            		var CNAME=$("#CNAME").val();
            		var PNAME=$("#PNAME").val();
            		var STARTYY=$("#STARTYY").val();
            		var STARTMM=$("#STARTMM").val();
            		var ENDYY=$("#ENDYY").val();
            		var ENDMM=$("#ENDMM").val(); 
            	 
            		$.post("insertExperience.action",{
            		"experience.companyName":CNAME,
            		"experience.duty":PNAME,
            		"experience.startTime.year":STARTYY,
            		"experience.startTime.month":STARTMM,
            		"experience.endTime.year":ENDYY,
            		"experience.endTime.month":ENDMM
            		},function(data){ 
            			window.location.href="jianli.jsp";
            		});
            	}
            </script>
           </tr> 
          </tbody> 
         </table> 
         <input type="hidden" class="expId" value="" /> 
        </div> 
        <!--end .experienceForm--> 
       </div> 
       <!--end .experienceEdit--> 
       <div class="experienceAdd pAdd">
      		 
        <span>修改工作经历</span> 
       </div> 
       <!--end .experienceAdd--> 
      </div> 
      <!--end #workExperience--> 
      <div class="profile_box" id="projectExperience"> 
       <h2>项目经验</h2> 
       <span class="c_add dn"></span> 
       <div class="projectShow dn"> 
        <ul class="plist clearfix"> 
        </ul> 
       </div> 
       <!--end .projectShow--> 
       <div class="projectEdit dn"> 
        <div class="projectForm"> 
				<textarea placeholder="请分段详细描述项目经验" name="userinfo.introduce" id="experience"><s:property value="#request.myResume.projectExperience"/></textarea>
				<div class="clear"></div>
				<input type="submit" value="保存" onclick="submitEXPER();" class="btn_small" />
				<script>
				function submitEXPER(){
					var projectExperience=$("#experience").val();
					$.post("updateProjectExperience.action",{
            		"myResume.experience":projectExperience
            		},function(data){ 
            			window.location.href="jianli.jsp";
            		});
				}
				</script>
				 <a class="btn_profile_cancel" href="javascript:;">取 消</a> 
			
        </div>
        <!--end .projectForm--> 
       </div> 
       <!--end .projectEdit--> 
       <div class="projectAdd pAdd">
        	<s:property value="#request.myResume.projectExperience"/>
        <span>修改项目经验</span> 
       </div> 
       <!--end .projectAdd--> 
      </div> 
      <!--end #projectExperience--> 
      <div class="profile_box" id="educationalBackground"> 
       <h2>教育背景<span>（投递简历时必填）</span></h2> 
       <span class="c_add dn"></span> 
       <div class="educationalShow dn"> 
        <div class="educationalForm borderBtm dn"> 
         <table> 
          <tbody> 
           <tr> 
            <td valign="top"> <span class="redstar">*</span> </td> 
            <td> <input type="text" placeholder="学校名称" name="schoolName" class="schoolName" /> </td> 
            <td valign="top"> <span class="redstar">*</span> </td> 
            <td> <input type="hidden" class="degree" value="" name="degree" /> <input type="button" value="学历" class="profile_select_287 profile_select_normal select_degree" /> 
             <div class="box_degree boxUpDown boxUpDown_287 dn" style="display: none;"> 
              <ul> 
               <li>大专</li> 
               <li>本科</li> 
               <li>硕士</li> 
               <li>博士</li> 
               <li>其他</li> 
              </ul> 
             </div> </td> 
           </tr> 
           <tr> 
            <td valign="top"> <span class="redstar">*</span> </td> 
            <td> <input type="text" placeholder="专业名称" name="professionalName" class="professionalName" /> </td> 
            <td valign="top"> <span class="redstar">*</span> </td> 
            <td> 
             <div class="fl"> 
              <input type="hidden" class="schoolYearStart" value="" name="schoolYearStart" /> 
              <input type="button" value="开始年份" class="profile_select_139 profile_select_normal select_schoolYearStart" /> 
              <div class="box_schoolYearStart boxUpDown boxUpDown_139 dn" style="display: none;"> 
               <ul> 
               <%
               	for(int i=2019;i>=1970;i--)
               		out.println("<li>"+i+"</li>");
               	 %> 
               </ul> 
              </div> 
             </div> 
             <div class="fl"> 
              <input type="hidden" class="schoolYearEnd" value=""  name="schoolYearEnd" /> 
              <input type="button" value="结束年份" class="profile_select_139 profile_select_normal select_schoolYearEnd" /> 
              <div style="display: none;" class="box_schoolYearEnd boxUpDown boxUpDown_139 dn"> 
               <ul> 
                <%
               	for(int i=2019;i>=1970;i--)
               		out.println("<li>"+i+"</li>");
               	 %> 
               </ul> 
              </div> 
             </div> 
             <div class="clear"> 
             </div> </td> 
           </tr> 
           <tr> 
            <td> </td> 
            <td colspan="3"> <input type="submit"  value="保 存" class="btn_profile_save" /> <a class="btn_profile_cancel" href="javascript:;">取 消</a> </td> 
          
           </tr> 
          </tbody> 
         </table> 
         <input type="hidden" class="eduId" value="" /> 
        </div> 
        <!--end .educationalForm--> 
        <ul class="elist clearfix"> 
        </ul> 
       </div> 
       <!--end .educationalShow--> 
       <div class="educationalEdit dn"> 
        <form class="educationalForm"> 
         <table> 
          <tbody> 
           <tr> 
            <td valign="top"> <span class="redstar">*</span> </td> 
            <td> <input type="text" placeholder="学校名称" name="schoolName" class="schoolName" id="SNAME"/> </td> 
            <td valign="top"> <span class="redstar">*</span> </td> 
            <td> <input type="hidden" class="degree" value="" name="degree" id="DEGREE" /> <input type="button" value="学历" class="profile_select_287 profile_select_normal select_degree" /> 
             <div class="box_degree boxUpDown boxUpDown_287 dn" style="display: none;"> 
              <ul> 
               <li>大专</li> 
               <li>本科</li> 
               <li>硕士</li> 
               <li>博士</li> 
               <li>其他</li> 
              </ul> 
             </div> </td> 
           </tr> 
           <tr> 
            <td valign="top"> <span class="redstar">*</span> </td> 
            <td> <input type="text" placeholder="专业名称" name="professionalName" id="MAJOR" class="professionalName" /> </td> 
            <td valign="top"> <span class="redstar">*</span> </td> 
            <td> 
             <div class="fl"> 
              <input type="hidden" class="schoolYearStart" value="" name="schoolYearStart"  /> 
              <input type="button" value="开始年份" id="STARTY" class="profile_select_139 profile_select_normal select_schoolYearStart" /> 
              <div class="box_schoolYearStart boxUpDown boxUpDown_139 dn" style="display: none;"> 
               <ul> 
                <%
               	for(int i=2019;i>=1970;i--)
               		out.println("<li>"+i+"</li>");
               	 %> 
               </ul> 
              </div> 
             </div> 
             <div class="fl"> 
              <input type="hidden" class="schoolYearEnd" value="" name="schoolYearEnd"   /> 
              <input type="button" value="结束年份" id="ENDY" class="profile_select_139 profile_select_normal select_schoolYearEnd" /> 
              <div class="box_schoolYearEnd boxUpDown boxUpDown_139 dn" style="display: none;"> 
               <ul> 
                <%
               	for(int i=2019;i>=1970;i--)
               		out.println("<li>"+i+"</li>");
               	 %> 
               </ul> 
              </div> 
             </div> 
             <div class="clear"> 
             </div> </td> 
           </tr> 
           <tr> 
            <td> </td> 
            <td colspan="3"> <input type="submit" onclick="submitEDU();" value="保 存" class="btn_profile_save" /> <a class="btn_profile_cancel" href="javascript:;">取 消</a> </td> 
           
           	<script>
          	function submitEDU(){
					var SNAME=$("#SNAME").val();
					var DEGREE=$("#DEGREE").val();
					if(DEGREE.charAt(0)=='大') DEGREE=0;
					else if(DEGREE.charAt(0)=='本') DEGREE=1;
					else if(DEGREE.charAt(0)=='硕') DEGREE=2;
					else if(DEGREE.charAt(0)=='博') DEGREE=3;
					var MAJOR=$("#MAJOR").val();
					var STARTY=$("#STARTY").val();
					var ENDY=$("#ENDY").val();
					alert(SNAME);
					alert(DEGREE);
					alert(MAJOR);
					alert(STARTY);
					alert(ENDY);
					
					
					$.post("updateEducation.action",{
            		"myResume.education.school.name":SNAME,
            		"myResume.education.degree":DEGREE,
            		"myResume.education.major":MAJOR,
            		"myResume.education.startTime.year":STARTY,
            		"myResume.education.endTime.year":ENDY
            		
            		},function(data){ 
            			window.location.href="jianli.jsp";
            		});
				}
          	
          	</script>
           </tr> 
          </tbody> 
         </table> 
         <input type="hidden" class="eduId" value="" /> 
        </form> 
        <!--end .educationalForm--> 
       </div> 
       <!--end .educationalEdit--> 
       <div class="educationalAdd pAdd">
        	<s:property value="#request.myResume.education.school.name"/>,
        	<s:property value="#request.myResume.education.degree"/>,
        	<s:property value="#request.myResume.education.major"/><br>
        	<s:property value="#request.myResume.education.startTime.year"/>-
        	<s:property value="#request.myResume.education.endTime.year"/><br>
        <span>修改教育经历</span> 
       </div> 
       <!--end .educationalAdd--> 
      </div> 
      <!--end #educationalBackground--> 
      <div class="profile_box" id="selfDescription"> 
       <h2>自我描述</h2> 
       <span class="c_edit dn"></span> 
       <div class="descriptionShow dn"> 
       </div> 
       <!--end .descriptionShow--> 
       <div class="descriptionEdit dn"> 
        <div class="descriptionForm"> 
         <table> 
          <tbody> 
           <tr> 
            <td colspan="2"> <textarea class="selfDescription s_textarea" id="SELF" name="selfDescription" placeholder=""></textarea> 
             <div class="word_count">
               		你还可以输入 
              <span>500</span> 字 
             </div> </td> 
           </tr> 
           <tr> 
            <td colspan="2"> <input type="submit" onclick="submitSELF();" value="保 存" class="btn_profile_save" /> <a class="btn_profile_cancel" href="javascript:;">取 消</a> </td> 
           	<script>
           		function submitSELF(){
					$.post("updateEvaluation.action",{
            		"myResume.evaluation":$("#SELF").val() 
            		},function(data){ 
            			window.location.href="jianli.jsp";
            		});
           		}
           	</script>
           	</tr> 
          </tbody> 
         </table> 
        </div> 
        <!--end .descriptionForm--> 
       </div> 
       <!--end .descriptionEdit--> 
       <div class="descriptionAdd pAdd">
			<s:property value="#request.myResume.evaluation"/>
        <span>修改自我描述</span> 
       </div> 
       <!--end .descriptionAdd--> 
      </div> 
      <!--end #selfDescription--> 
      <div class="profile_box" id="worksShow"> 
       <h2>论文展示</h2> 
       <span class="c_add dn"></span> 
       <div class="workShow dn"> 
        <ul class="slist clearfix"> 
        </ul> 
       </div> 
       <!--end .workShow--> 
       <div class="workEdit dn"> 
        <form class="workForm"> 
         <table> 
         <tbody> 
           <tr> 
            <td colspan="2"> <textarea class="selfDescription s_textarea" id="PRO" name="selfDescription" placeholder=""></textarea> 
             <div class="word_count">
               		你还可以输入 
              <span>500</span> 字 
             </div> </td> 
           </tr> 
           <tr> 
            <td colspan="2"> <input type="submit" onclick="submitPRO();" value="保 存" class="btn_profile_save" /> <a class="btn_profile_cancel" href="javascript:;">取 消</a> </td> 
           	<script>
           		function submitPRO(){
					$.post("updateProjectExperience.action",{
            		"myResume.projectExperience":$("#PRO").val() 
            		},function(data){ 
            			window.location.href="jianli.jsp";
            		});
           		}
           	</script>
           	</tr> 
          </tbody> 
         </table> 
         <input type="hidden" class="showId" value="" /> 
        </form> 
        <!--end .workForm--> 
       </div> 
       <!--end .workEdit--> 
       <div class="workAdd pAdd">
 		<s:property value="#request.myResume.paper"/>
        <span>修改论文展示</span> 
       </div> 
       <!--end .workAdd--> 
      </div> 
      <!--end #worksShow--> 
      <input type="hidden" id="resumeId" value="268472" /> 
     </div> 
     <!--end .content_l--> 
     <div class="content_r"> 
      <div class="mycenterR" id="myInfo"> 
       <h2>我的信息</h2> 
       <a target="_blank" href="collections.jsp">我收藏的职位</a> 
       <br /> 
      </div> 
      <!--end #myInfo--> 
      <div class="mycenterR" id="myResume"> 
       <h2>我的附件简历 <a title="上传附件简历" href="#uploadFile" class="inline cboxElement">上传简历</a> </h2> 
       <div class="resumeUploadDiv">
         暂无附件简历 
       </div> 
      </div> 
      <!--end #myResume--> 
      <div class="mycenterR" id="resumeSet"> 
       <h2>投递简历设置 <span>修改设置</span></h2> 
       <!-- -1 (0=附件， 1=在线， 其他=未设置) --> 
       <div class="noSet set0 dn">
         默认使用
        <span>附件简历</span>进行投递 
       </div> 
       <div class="noSet set1 dn">
         默认使用
        <span>在线简历</span>进行投递 
       </div> 
       <div class="noSet">
         暂未设置默认投递简历 
       </div> 
       <input type="hidden" class="defaultResume" value="-1" /> 
       <form class="dn" id="resumeSetForm"> 
        <label><input type="radio" value="1" class="resume1" name="resume" />默认使用<span>在线简历</span>进行投递</label> 
        <label><input type="radio" value="0" class="resume0" name="resume" />默认使用<span>附件简历</span>进行投递</label> 
        <span class="setTip error"></span> 
        <div class="resumeTip">
          设置后投递简历时将不再提醒 
        </div> 
        <input type="submit" value="保 存" class="btn_profile_save" /> 
        <a class="btn_profile_cancel" href="javascript:;">取 消</a> 
       </form> 
      </div> 
      <!--end #resumeSet--> 
      <div class="mycenterR" id="myShare"> 
       <h2>当前每日投递量：10个</h2> 
       <a target="_blank" href="h/share/invite.jsp">邀请好友，提升投递量</a> 
      </div> 
      <!--end #myShare--> 
      <div class="greybg qrcode mt20"> 
       <img width="242" height="242" alt="拉勾微信公众号二维码" src="style/images/qr_resume.png" /> 
       <span class="c7">微信扫一扫，轻松找工作</span> 
      </div> 
     </div> 
     <!--end .content_r--> 
    </div> 
    <input type="hidden" id="userid" name="userid" value="314873" />
    <!--弹窗lightbox -----------------------------------------> 
    <div style="display:none;"> 
     <!-- 上传简历 --> 
     <div class="popup" id="uploadFile"> 
      <table width="100%"> 
       <tbody> 
        <tr> 
         <td align="center"> 
          <form> 
           <a class="btn_addPic" href="javascript:void(0);"> <span>选择上传文件</span> <input type="file" onchange="file_check(this,'h/nearBy/updateMyResume.json','resumeUpload')" class="filePrew" id="resumeUpload" name="newResume" size="3" title="支持word、pdf、ppt、txt、wps格式文件，大小不超过10M" tabindex="3" /> </a> 
          </form> </td> 
        </tr> 
        <tr> 
         <td align="left"> 支持word、pdf、ppt、txt、wps格式文件<br /> 文件大小需小于10M </td> 
        </tr> 
        <tr> 
         <td align="left" style="color:#dd4a38; padding-top:10px;"> 注：若从其它网站下载的word简历，请将文件另存为.docx格式后上传 </td> 
        </tr> 
        <tr> 
         <td align="center"> <img width="55" height="16" alt="loading" style="visibility: hidden;" id="loadingImg" src="style/images/loading.gif" /> </td> 
        </tr> 
       </tbody> 
      </table> 
     </div> 
     <!--/#uploadFile--> 
     <!-- 简历上传成功 --> 
     <div class="popup" id="uploadFileSuccess"> 
      <h4>简历上传成功！</h4> 
      <table width="100%"> 
       <tbody> 
        <tr> 
         <td align="center"> <p> 你可以将简历投给你中意的公司了。 </p> </td> 
        </tr> 
        <tr> 
         <td align="center"> <a class="btn_s" href="javascript:;">确&nbsp;定</a> </td> 
        </tr> 
       </tbody> 
      </table> 
     </div> 
     <!--/#uploadFileSuccess--> 
     <!-- 没有简历请上传 --> 
     <div class="popup" id="deliverResumesNo"> 
      <table width="100%"> 
       <tbody> 
        <tr> 
         <td align="center"> <p class="font_16"> 你在医伯乐还没有简历，请先上传一份 </p> </td> 
        </tr> 
        <tr> 
         <td align="center"> 
          <form> 
           <a class="btn_addPic" href="javascript:void(0);"> <span>选择上传文件</span> <input type="file" onchange="file_check(this,'h/nearBy/updateMyResume.json','resumeUpload1')" class="filePrew" id="resumeUpload1" name="newResume" size="3" title="支持word、pdf、ppt、txt、wps格式文件，大小不超过10M" /> </a> 
          </form> </td> 
        </tr> 
        <tr> 
         <td align="center"> 支持word、pdf、ppt、txt、wps格式文件，大小不超过10M </td> 
        </tr> 
       </tbody> 
      </table> 
     </div> 
     <!--/#deliverResumesNo--> 
     <!-- 上传附件简历操作说明-重新上传 --> 
     <div class="popup" id="fileResumeUpload"> 
      <table width="100%"> 
       <tbody> 
        <tr> 
         <td> 
          <div class="f18 mb10">
            请上传标准格式的word简历 
          </div> </td> 
        </tr> 
        <tr> 
         <td> 
          <div class="f16">
            操作说明： 
           <br /> 打开需要上传的文件 - 点击文件另存为 - 选择.docx - 保存 
          </div> </td> 
        </tr> 
        <tr> 
         <td align="center"> <a title="上传附件简历" href="#uploadFile" class="inline btn cboxElement">重新上传</a> </td> 
        </tr> 
       </tbody> 
      </table> 
     </div> 
     <!--/#fileResumeUpload--> 
     <!-- 上传附件简历操作说明-重新上传 --> 
     <div class="popup" id="fileResumeUploadSize"> 
      <table width="100%"> 
       <tbody> 
        <tr> 
         <td> 
          <div class="f18 mb10">
            上传文件大小超出限制 
          </div> </td> 
        </tr> 
        <tr> 
         <td> 
          <div class="f16">
            提示： 
           <br /> 单个附件不能超过10M，请重新选择附件简历！ 
          </div> </td> 
        </tr> 
        <tr> 
         <td align="center"> <a title="上传附件简历" href="#uploadFile" class="inline btn cboxElement">重新上传</a> </td> 
        </tr> 
       </tbody> 
      </table> 
     </div> 
     <!--/#deliverResumeConfirm--> 
    </div> 
    <!-- end -----------------------------------------> 
    <script src="style/js/Chart.min.js" type="text/javascript"></script> 
    <script src="style/js/profile.min.js" type="text/javascript"></script> 
    <!-- <div id="profileOverlay">
</div>
 --> 
    <div class="" id="qr_cloud_resume" style="display: none;"> 
     <div class="cloud"> 
      <img width="134" height="134" src="" /> 
      <a class="close" href="javascript:;"></a> 
     </div> 
    </div> 
    <script>
$(function(){
	$.ajax({
        url:ctx+"/mycenter/showQRCode",
        type:"GET",
        async:false
   	}).done(function(data){
        if(data.success){
             $('#qr_cloud_resume img').attr("src",data.content);
        }
   	}); 
	var sessionId = "resumeQR"+314873;
	if(!$.cookie(sessionId)){
		$.cookie(sessionId, 0, {expires: 1});
	}
	if($.cookie(sessionId) && $.cookie(sessionId) != 5){
		$('#qr_cloud_resume').removeClass('dn');
	}
	$('#qr_cloud_resume .close').click(function(){
		$('#qr_cloud_resume').fadeOut(200);
		resumeQR = parseInt($.cookie(sessionId)) + 1;
		$.cookie(sessionId, resumeQR, {expires: 1});
	});
});
</script> 
    <div class="clear"> 
    </div> 
    <input type="hidden" value="97fd449bcb294153a671f8fe6f4ba655" id="resubmitToken" />
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
  <div id="cboxOverlay" style="display: none;"> 
  </div> 
  <div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;"> 
   <div id="cboxWrapper"> 
    <div> 
     <div id="cboxTopLeft" style="float: left;"> 
     </div> 
     <div id="cboxTopCenter" style="float: left;"> 
     </div> 
     <div id="cboxTopRight" style="float: left;"> 
     </div> 
    </div> 
    <div style="clear: left;"> 
     <div id="cboxMiddleLeft" style="float: left;"> 
     </div> 
     <div id="cboxContent" style="float: left;"> 
      <div id="cboxTitle" style="float: left;"> 
      </div> 
      <div id="cboxCurrent" style="float: left;"> 
      </div> 
      <button type="button" id="cboxPrevious"></button>
      <button type="button" id="cboxNext"></button>
      <button id="cboxSlideshow"></button> 
      <div id="cboxLoadingOverlay" style="float: left;"> 
      </div> 
      <div id="cboxLoadingGraphic" style="float: left;"> 
      </div> 
     </div> 
     <div id="cboxMiddleRight" style="float: left;"> 
     </div> 
    </div> 
    <div style="clear: left;"> 
     <div id="cboxBottomLeft" style="float: left;"> 
     </div> 
     <div id="cboxBottomCenter" style="float: left;"> 
     </div> 
     <div id="cboxBottomRight" style="float: left;"> 
     </div> 
    </div> 
   </div> 
   <div style="position: absolute; width: 9999px; visibility: hidden; display: none;"> 
   </div> 
  </div>  
 </body>
</html>
