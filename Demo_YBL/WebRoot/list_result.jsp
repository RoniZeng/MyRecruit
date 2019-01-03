<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script> 
<script src="style/js/jquery.colorbox-min.js" type="text/javascript"></script> 
<s:iterator value="#request.recList" id="obj">
   <li class="clearfix"> 
       <div class="hot_pos_l"> 
        <div class="mb10"> 
         <a href="tmp.jsp?fid=0&nid=<s:property value="#obj.id"/>" title="<s:property value="#obj.position.name"/>" target="_blank"><s:property value="#obj.position.name"/></a> &nbsp; 
         <span class="c9">[<s:property value="#obj.city"/>]</span> 
        </div> 
        <span><em class="c7">月薪：</em><s:property value="#obj.minSalary"/>k-<s:property value="#obj.maxSalary"/>k</span> 
        <s:set name="JOBEXP" value="{'工作经验不限','应届生','1年以下','1-3年','3-5年','5-10年','10年以上'}"/>
        <span><em class="c7">经验：</em><s:property value="#JOBEXP[#obj.jobExperience]"/></span>
        <s:set name="DEGREE" value="{'不限','大专及以下','本科','硕士','博士'}"/> 
        <span><em class="c7">最低学历： </em><s:property value="#DEGREE[#obj.degree]"/></span> 
        <br /> 
        <span><em class="c7">职位描述：</em><s:property value="#obj.description"/></span> 
        <br /> 
        <span><s:property value="#obj.sendDate"/>发布</span> 
       </div> 
       <div class="hot_pos_r"> 
        <div class="apply"> 
         <a href="tmp.jsp?fid=0&nid=<s:property value="#obj.id"/>" target="_blank">投个简历</a> 
        </div> 
        <div class="mb10">
         <a href="h/c/7626.jsp" title="<s:property value="#obj.company.name"/>" target="_blank"><s:property value="#obj.company.name"/></a>
        </div> 
        <span><em class="c7">领域： </em><s:property value="#obj.company.field"/></span>  
        <s:set name="SIZE" value="{'0','15','50','150','500','2000'}"></s:set>
        <span><em class="c7">规模： </em><s:property value="#SIZE[#obj.company.field]"/>人</span> 
        <br>
        <span><em class="c7">地址： </em><s:property value="#obj.company.location"/></span>  
        <ul class="companyTags reset"> 
          <s:property value="#obj.company.tag"/>
        </ul> 
       </div>
        </li> 
</s:iterator>
