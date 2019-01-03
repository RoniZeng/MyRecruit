<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script> 
<script src="style/js/jquery.colorbox-min.js" type="text/javascript"></script> 
<script>
</script>
<dl class="company_center_content">
	<dt>
		<h1>
			<em></em> 下线职位 <span>（共<i style="color:#fff;font-style:normal"
				id="positionNumber"><s:property value="#request.recList.size()" />
			</i>个）</span>
		</h1>
	</dt>
	<dd>
	<s:set name="JOBTYPE" value="{'全职','兼职','实习'}"/>
	<s:set name="JOBEXP" value="{'工作经验不限','应届生','1年以下','1-3年','3-5年','5-10年','10年以上'}"/>
	<s:set name="DEGREE" value="{'不限','大专','本科','硕士','博士'}"/>
		<s:iterator value="#request.recList" id="obj">
			<form action="tmee.actions" method="post" id="form<s:property value="#obj.id"/>">
				
				<input type="hidden" value="<s:property value="#obj.id"/>" name="type" />
				<ul class="reset my_jobs">
					<li data-id="149594">
						<h3>
							<a title="<s:property value="#obj.position.name"/>"
								href="tmp.jsp?fid=0&nid=<s:property value="#obj.id"/>"><s:property value="#obj.position.name"/></a>
								 <span>[<s:property value="#obj.city"/>]</span>
						</h3>
						<div>
							<s:property value="#JOBTYPE[#obj.jobType]"/>/
							<s:property value="#obj.minSalary"/>k-<s:property value="#obj.maxSalary"/>k /
							<s:property value="#JOBEXP[#obj.jobExperience]"/> /
							<s:property value="#DEGREE[#obj.degree]"/>
						</div>
						<div class="c9">发布时间：<s:property value="#obj.sendDate"/></div>
						
					</li>
				</ul>
			</form>
		</s:iterator>
	</dd>
</dl>
