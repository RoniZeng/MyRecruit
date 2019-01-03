<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
<script src="style/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script>
function TOU(id){
	$.post("sendResume.action",{
		"reciritmentId":id
	},
	function(data){
		alert("投递成功！");
	}
	);
}
function NOT(id){
	$.post("deleteFavors.action",{
		"reciritmentId":id
	},
	function(data){
		$("#A"+id).text("已取消收藏！");
	}
	);
}
</script>
<form id="collectionsForm">
	<ul class="reset my_collections">
		<s:iterator value="#request.recList" id="obj">
		<li>
		<a title="<s:property value="#obj.company.name"/>" target="_blank"
			href="tmp.jsp?fid=0&nid=<s:property value="#obj.id"/>"> <img alt="携程旅行网"
				src="<s:property value="#obj.company.logo"/>" /> </a>
			<div class="co_item">
				<h2 title="<s:property value="#obj.position.name"/>">
					<a target="_blank" href="tmp.jsp?fid=0&nid=<s:property value="#obj.id"/>">
					 <em><s:property value="#obj.position.name"/></em> 
					 <span>（<s:property value="#obj.minSalary"/>k-<s:property value="#obj.maxSalary"/>k）</span>
					</a>
				</h2>
				<span class="co_time">发布时间：<s:property value="#obj.sendDate"/></span>
				<div class="co_cate">
					<s:property value="#obj.company.name"/> / 
					<s:property value="#obj.city"/> / 
					<s:set name="JOBEXP" value="{'工作经验不限','应届生','1年以下','1-3年','3-5年','5-10年','10年以上'}"/>
					<s:property value="#JOBEXP[#obj.jobExperience]"/> / 
					<s:set name="DEGREE" value="{'不限','大专','本科','硕士','博士'}"/>
					<s:property value="#DEGREE[#obj.degree]"/></div>
				<span class="co_youhuo c7">
					<s:property value="#obj.tag"/> / 
					<s:property value="#obj.description"/>
				</span> <a class="collection_link"
					target="_blank" onclick="TOU(<s:property value="#obj.id"/>);">投个简历</a>
					 <i></i> <a
					class="collectionCancel collection_link collected" 
					id="A<s:property value="#obj.id"/>"
					href="javascript:;" onclick="NOT(<s:property value="#obj.id"/>);"> 取消收藏  </a>
			</div></li>
	 	</s:iterator>
	</ul>
</form>