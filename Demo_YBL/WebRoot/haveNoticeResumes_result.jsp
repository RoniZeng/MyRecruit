<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script> 
<script src="style/js/jquery.colorbox-min.js" type="text/javascript"></script> 
<script>
function changeStatus(obj,id,status){
	document.getElementById("form"+obj+id).remove();
	$.post("changeStatus.action",
		{
			"companyGetResumeIdList[0].resId":obj,
			"companyGetResumeIdList[0].recId":id,
			"statusChangeTo":status
		},function(data){});
}
</script>
<dl class="company_center_content"> 
      <dt> 
       <h1> <em></em> 已通知面试简历 <span>（共<s:property value="#request.comGresList.size()" />份）</span> </h1> 
      </dt> 
      <dd> 
 	<s:set name="SEX" value="{'男','女'}"/>
	<s:set name="DEGREE" value="{'大专及以下','本科','硕士','博士'}"/>
	<s:set name="RANK" value="{'未定级','初级','中级','副高','高级'}"/>
	<s:set name="CTFC" value="{'无','执业医师','执业药师','执业医师/执业药师','执业护士','执业医师/执业护士','执业药师/执业护士','执业医师/执业药师/执业护士'}"/>
      <s:iterator value="#request.comGresList" id="obj">
      	<form action="canInterviewResumes.jsp" method="get" id="form<s:property value="#obj.resume.id"/><s:property value="#obj.reciritment.id"/>"> 
        <!-- end .filter_options --> 
        <ul class="reset resumeLists"> 
         <li data-id="1686182" class="onlineResume">
          <div class="resumeShow"> 
           <a title="预览在线简历" target="_blank" class="resumeImg" href="tmp.jsp?fid=1&nid=<s:property value="#obj.resume.id"/>"> <img src="style/images/default_headpic.png" /> </a> 
           <div class="resumeIntro"> 
            <h3 class="unread">
             <a target="_blank" title="预览<s:property value="#obj.resume.employee.name" />的简历" href="tmp.jsp?fid=1&nid=<s:property value="#obj.resume.id"/>"> <s:property value="#obj.resume.employee.name" />的简历 </a> <em></em> </h3> 
          
            <div>
                <s:property value="#obj.resume.employee.name" /> / 
              	<s:property value="#SEX[#obj.resume.employee.sex]" /> / 
              	<s:property value="#DEGREE[#obj.resume.employee.degree]" /> / 
              	<s:property value="#obj.resume.employee.experience" />年  / 
              	<s:property value="#obj.resume.employee.expCity" />
             <br />
             	 <s:property value="#obj.resume.employee.expCity" /> &middot; 
             	 <s:property value="#obj.resume.education.school.name" /> | 
             	 <s:property value="#DEGREE[#obj.resume.rank]" /> &middot; 
             	 <s:property value="#CTFC[#obj.resume.certificate]" />
            </div> 
            <div class="jdpublisher"> 
             <span> 应聘职位：<a title="随便写" target="_blank" href="http://www.lagou.com/jobs/149594.jsp">
             	<s:property value="#obj.reciritment.position.name" />
			</a> </span> 
            </div> 
           </div> 
           <div class="links"> 
            <a class="resume_notice" onclick="changeStatus(<s:property value="#obj.resume.id"/>,<s:property value="#obj.reciritment.id"/>,0);">通知面试</a> 
            <a class="resume_refuse" onclick="changeStatus(<s:property value="#obj.resume.id"/>,<s:property value="#obj.reciritment.id"/>,3);">不合适</a> 
          </div> 
          </div> 
          <div class="contactInfo"> 
           <span class="c9">电话：</span><s:property value="#obj.resume.employee.tel" /> &nbsp;&nbsp;&nbsp; 
           <span class="c9">邮箱：</span>
           <a></span><s:property value="#obj.resume.employee.email" /></a> 
          </div> </li> 
        </ul>
        <!-- end .resumeLists --> 
       </form> 
      </s:iterator>
      </dd> 
     </dl>