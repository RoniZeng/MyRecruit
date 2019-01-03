<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns:wb="http://open.weibo.com/wb">
	<head>
		<script type="text/javascript" async="" src="style/js/conversion.js"></script>
		<script src="style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script>
		<style type="text/css"></style>
		<meta content="no-siteapp" http-equiv="Cache-Control" />
		<link media="handheld" rel="alternate" />
		<!-- end 云适配 -->
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
		<title>医伯乐-最专业的医药人才招聘平台</title>
		<meta content="23635710066417756375" property="qc:admins" />
		<meta content="QIQ6KC1oZ6" name="baidu-site-verification" />
		<!-- <div class="web_root"  style="display:none">http://www.lagou.com</div> -->
<!-- 		<script type="text/javascript"> -->
<!-- 			var ctx = "http://www.lagou.com"; -->
<!-- 			console.log(1); -->
<!-- 		</script> -->
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
<script>

	$(document).ready(function(){

		$.post("selectReciritment",{},
			function(results){
				var data= jQuery.parseJSON(results);
    			if(undefined==data.comRecName1){
    				$("#NoHaveCR").show();$("#CRForm1").hidden();$("#CRForm2").hidden();$("#CRForm3").hidden();
    				return;
				}	
				var Degree=["学历不限","大专","本科","硕士","博士"];
				var Job=["工作经验不限","应届生","1年以下","1-3年","3-5年","5-10年"];
				$("#NoHaveCR").hide();
				$("#Ccid1").text(data.comRecName1);
				$("#CcLocation1").text(data.comRecLocation1);
				$("#CcRTime1").text("发布时间："+data.comRecSendDate1);
				$("#CcRMsg1").text(Job[data.comRecJobExperience1]+" / "+data.comRecMinSalary1+"k - "+data.comRecMaxSalary1+"k / "+Degree[data.comRecDegree1]);
				$("#CRForm1").show();
				if(undefined==data.comRecName2){
    				$("#CRForm2").hidden();$("#CRForm3").hidden();
    				return;
				}	
				$("#Ccid2").text(data.comRecName2);
				$("#CcLocation2").text(data.comLocation2);
				$("#CcRTime2").text("发布时间："+data.comRecSendDate2);
				$("#CcRMsg2").text(Job[data.comRecJobExperience2]+" / "+data.comRecMinSalary2+"k - "+data.comRecMaxSalary2+"k / "+Degree[data.comRecDegree2]);
				$("#CRForm2").show();
				if(undefined==data.comRecName3){
    				$("#CRForm3").hidden();
    				return;
				}	
				$("#Ccid3").text(data.comRecName3);
				$("#CcLocation3").text(data.comRecLocation3);
				$("#CcRTime3").text("发布时间："+data.comRecSendDate3);
				$("#CcRMsg3").text(Job[data.comRecJobExperience3]+" / "+data.comRecMinSalary3+"k - "+data.comRecMaxSalary3+"k / "+Degree[data.comRecDegree3]);
				$("#CRForm3").show();				
			},
			"json");
		
		$.post("companyHome",{},
			function(results){
				var data= jQuery.parseJSON(results); 
				//alert(data.comName);
					$("#CcomIntroduce").text(data.comIntroduce);$("#tcomIntroduce").attr("value",data.comIntroduce);
					$("#CcomLogo").attr("src",data.comLogo);
					$("#CcomName").text(data.comName);$("#tcomName").attr("value",data.comName);
					$("#CcomName2").text(data.comName);
					
					if(data.comisOk=="true"){
						$("#CcomStatusTrue").show();$("#CcomStatusFalse").hide();
					}else{
						$("#CcomStatusFalse").show();$("#CcomStatusTrue").hide();
					}
					$("#CcomLocation").text(data.comLocation);$("#tcomLocation").attr("value",data.comLocation);
					$("#CcomField").text(data.comField);$("#tcomField").attr("value",data.comField);
					$("#CcomSize").text(data.comSize);$("#tcomSize").attr("value",data.comSize);
			
					$("#CcomWebSite").text(data.comWebSite);$("#tcomWebSite").attr("value",data.comWebSite);
					$("#CcomWebSite").attr("href",data.comWebSite);
			},
			"json");
			$("#submitComIntroduce").click(function(){
			
				$.post("updateIntroduce.action",{"userInfo.introduce":$("#tcomIntroduce").val()},function(response){
								
								$("#CcomIntroduce").text($("#tcomIntroduce").val());
								$("#CIForm").hide();
								location.reload(); 
							},"json");
			});
			$("#submitComName").click(function(){
				alert($("#tcomName").val());
				$.post("updateName.action",{"userInfo.name":$("#tcomName").val()},function(response){
							location.reload(); 
							$("#CcomName").text($("#tcomName").val());
							},"json");
			});
			$("#submitCom").click(function(){
				$.post("updateLSW.action",{
				"userInfo.location":$("#tcomLocation").val(),
				"userInfo.size":$("#tcomSize").val(),
				"userInfo.website":$("#tcomWebSite").val()
				},function(response){
						$("#Ccomlocation").text($("#tcomLocation").val());
						$("#CcomSize").text($("#tcomSize").val());
						$("#CcomWebSite").text($("#tcomWebSite").val());
						location.reload();
						
				},"json");
			});
	});
	</script>		
	</head>
	<body>
		<div id="body">
			<div id="header">
				<div class="wrapper">
					<a class="logo" href="index.jsp"> <img width="229" height="43" src="style/images/logo.png" />
					</a>
					<ul id="navheader" class="reset">
						<li><a href="index.jsp">首页</a></li>
						<li class="current"><a href="myhome.jsp">公司</a></li>
						<li> <a rel="nofollow" href="toHandleResumes.jsp">简历管理</a> </li>
						<li><a rel="nofollow" href="create.jsp">发布职位</a></li>
					</ul>
					<dl class="collapsible_menu">
						<dt><!-- 修改： 改成动态显示用户名 -->
							<span>个人中心</span>
							<span class="red dn" id="noticeDot-1"></span>
							<i></i>
						</dt>
						<dd>
       <a href="create.jsp">我要招人</a>
      </dd> 
      <dd>
       <a href="myhome.jsp">我的主页</a>
      </dd>
      <dd>
       <a href="toHandleResumes.jsp">我收到的简历</a>
      </dd>
      <dd>
       <a href="positions.jsp">招聘管理</a>
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
				<!-- <script src="style/js/swfobject_modified.js" type="text/javascript"></script> -->
				<div class="clearfix">
					<div class="content_l">
						<div class="c_detail">
							<div style="background-color:#fff;" class="c_logo">
							<!-- 修改： 弹出一个弹窗，弹窗上要有 s:file name="upload" 用来上传图片 -->
								<a title="上传公司LOGO" id="logoShow" class="inline cboxElement" href="#logoUploader"> <img width="190" height="190"
									 alt="公司logo"  id="CcomLogo"  src="style/images/logo_default.png" /> <span>更换公司图片<br />190px*190px 小于5M</span> </a>
							
							</div>
							
							<!-- 修改： 下面的公司名称都应该动态显示 -->
							<div class="c_box companyName">
								<h2 id="CcomName"></h2>
								<em class="unvalid"></em>
								<div id="CcomStatusFalse" hidden>
									<span class="va dn" id="">未认证企业</span>
									<a target="_blank" class="applyC" href="auth.jsp">申请认证</a>
								</div>
								<div id="CcomStatusTrue" hidden>
									<span class="va dn" id="">认证企业</span>
									<a target="_blank" class="applyC" >已认证</a>
								</div>
								<div class="clear"></div>
								<h1 title="" class="fullname" id="CcomName2"></h1>
								<div class="clear editDetail dn" id="editDetailForm">
									<input type="text" placeholder="请输入公司名称" maxlength="15" id="tcomName" name="userInfo.name" />
									
									<input type="hidden" value="25927" id="companyId" name="companyId" />
									<input type="submit" value="保存" id="submitComName" class="btn_small" />
									<a id="cancelDetail" class="btn_cancel_s">取消</a>
								</div>
								<div class="dn" id="addLabels">
									<a id="changeLabels" class="change" href="javascript:void(0)">换一换</a>
									<input type="hidden" value="1" id="labelPageNo" />
									<input type="submit" value="贴上" class="fr" id="add_label" />
									<input type="text" placeholder="添加自定义标签" name="label" id="label" class="label_form fr" />
									<div class="clear"></div>
									<ul class="reset clearfix">
									</ul>
									<a id="saveLabels" class="btn_small" href="javascript:void(0)">保存</a>
									<a id="cancelLabels" class="btn_cancel_s" href="javascript:void(0)">取消</a>
								</div>
							</div>
							<a title="编辑基本信息" class="c_edit" id="editCompanyDetail" href="javascript:void(0);"></a>
							<div class="clear"></div>
						</div>
						<div class="c_breakline"></div>
						
						<!-- end #Product -->
						<div id="Profile">
							<div class="profile_wrap" >
								<!--无介绍 -->
								<dl class="c_section dn">
									<dt>
										<h2><em></em>公司介绍</h2>
									</dt>
									<dd>
										<div class="addnew">
											详细公司的发展历程、让求职者更加了解你!
											<br />
											<a id="addIntro" href="javascript:void(0)">+添加公司介绍</a>
										</div>
									</dd>
								</dl>
								<!--编辑介绍-->
								<dl class="c_section newIntro dn">
									<dt>
										<h2><em></em>公司介绍</h2>
									</dt>
									<dd>
										<div id="companyDesForm" >
					
												<textarea placeholder="请分段详细描述公司简介、企业文化等" name="userInfo.introduce" id="tcomIntroduce">***</textarea>
												<div class="word_count fr">
												你还可以输入
												<span>500</span> 字
												</div>
												<div class="clear"></div>
												<input type="submit" value="保存" id="submitComIntroduce" class="btn_small" />
												<a id="delProfile" class="btn_cancel_s" href="javascript:void(0)">取消</a>

										</div>
									</dd>
								</dl>
								<!--有介绍-->
								<dl class="c_section">
									<dt>
										<h2><em></em>公司介绍</h2>
									</dt>
									<dd>
										<div class="c_intro" id="CcomIntroduce">
											***
										</div>
										<a title="编辑公司介绍" id="editIntro" class="c_edit" href="javascript:void(0)"></a>
									</dd>
								</dl>
							</div>
						</div>
						<!-- end #Profile -->
						<!--[if IE 7]> <br /> <![endif]-->
						<!--无招聘职位-->
						<dl id="noJobs" class="c_section">
							<dt>
								<h2><em></em>招聘职位</h2>
							</dt>
							<dd>
								<form id="CRForm1" hidden> 
							        <input type="hidden" value="Publish" name="type" /> 
							        <ul class="reset my_jobs"> 
							         <li data-id="149594"> <h3> <a target="_blank" id="Ccid1" href="http://www.lagou.com/jobs/149594.jsp">随便写</a> <span id="Cclocation1">[上海]</span> </h3>
							          <div id="CcRMsg1">
							           兼职 / 1k-2k / 1-3年 / 硕士及以上
							          </div> 
							          <div class="c9" id="CcRTime1">
							           发布时间： 2014-07-01 17:07:01
							          </div> 
							          </li> 
							        </ul> 
							   </form> 
							   <form id="CRForm2" hidden> 
							        <input type="hidden" value="Publish" name="type" /> 
							        <ul class="reset my_jobs"> 
							         <li data-id="149594"> <h3> <a target="_blank" id="Ccid2" href="http://www.lagou.com/jobs/149594.jsp">随便写</a> <span id="Cclocation2">[上海]</span> </h3>
							          <div id="CcRMsg2">
							           兼职 / 1k-2k / 1-3年 / 硕士及以上
							          </div> 
							          <div class="c9" id="CcRTime2">
							           发布时间： 2014-07-01 17:07:01
							          </div> 
							          </li> 
							        </ul> 
							   </form> 
							   <form id="CRForm3" hidden> 
							        <input type="hidden" value="Publish" name="type" /> 
							        <ul class="reset my_jobs"> 
							         <li data-id="149594"> <h3> <a target="_blank" id="Ccid3" href="http://www.lagou.com/jobs/149594.jsp">随便写</a> <span id="Cclocation3">[上海]</span> </h3>
							          <div id="CcRMsg3">
							           兼职 / 1k-2k / 1-3年 / 硕士及以上
							          </div> 
							          <div class="c9" id="CcRTime3">
							           发布时间： 2014-07-01 17:07:01
							          </div> 
							          </li> 
							        </ul> 
							   </form> 
								<div class="addnew">
								<div id="NoHaveCR" hidden>发布需要的人才信息，让伯乐和千里马尽快相遇……</div>
									<br />
									<a href="create.jsp">+添加招聘职位</a>
								</div>
							</dd>
						</dl>
						<input type="hidden" value="" name="hasNextPage" id="hasNextPage" />
						<input type="hidden" value="" name="pageNo" id="pageNo" />
						<input type="hidden" value="" name="pageSize" id="pageSize" />
						<div id="flag"></div>
					</div>
					<!-- end .content_l -->
					<div class="content_r">
						<div id="Tags">
							<div id="c_tags_show" class="c_tags solveWrap">
								<table>
									<tbody>
										<tr>
											<td width="45">地点</td>
											<td id="CcomLocation"></td>
										</tr>
										<tr>
											<td>领域</td>
											<!-- 支持多选 -->
											<td id="CcomField"></td>
										</tr>
										<tr>
											<td>规模</td>
											<td id="CcomSize"></td>
										</tr>
										<tr>
											<td>主页</td>
											<td> <a rel="nofollow" title="http://www.weimob.com" target="_blank" id="CcomWebSite" href="http://www.weimob.com"></a>
											</td>
										</tr>
									</tbody>
								</table>
								<a id="editTags" class="c_edit" href="javascript:void(0)"></a>
							</div>
							<div id="c_tags_edit" class="c_tags editTags dn">
								<div id="tagForms">
									<table>
										<tbody>
											<tr>
												<td>地点</td>
												<td> <input type="text" placeholder="请输入地点" value="上海" name="userInfo.location" id="tcomLocation" /> </td>
											</tr>
											<tr>
												<td>领域</td>
												<!-- 支持多选 -->
												<td> 
												 <input type="text"  disable="disable"  value="移动互联网" id="tcomField" name="userInfo.field" disabled/>
												</td>
											</tr>
											<tr>
												<td>规模</td>
												<td>  <input type="text" value="1000" id="tcomSize" name="userInfo.size"/>
												</td>
											</tr>
											<tr>
												<td>主页</td>
												<td> <input type="text" placeholder="请输入网址" value="http://www.weimob.com" name="userInfo.webSite" id="tcomWebSite" />
												</td>
											</tr>
										</tbody>
									</table>
									<input type="hidden" id="comlocation" value="上海" />
									<input type="hidden" id="comInd" value="移动互联网" />
									<input type="hidden" id="comSize" value="150-500人" />
									<input type="hidden" id="comUrl" value="http://www.zmtpost.com" />
									<input type="submit" value="保存" id="submitCom" class="btn_small" />
									<a id="cancelFeatures" class="btn_cancel_s" href="javascript:void(0)">取消</a>
									<div class="clear"></div>
								</div>
							</div>
						</div>
						<!-- 公司发布的招聘信息  -->
						<div id="Reported">
							<dl class="c_section c_reported">
								<dt>
									<h2><em></em>公司招聘信息</h2>
								</dt>
								
							</dl>
							<!-- end .c_reported 
						</div>
						<!-- end #Tags -->
						<!-- <dl class="c_section c_stages">
							<dt>
								<h2><em></em>融资阶段</h2>
								<a title="编辑融资阶段" class="c_edit" href="javascript:void(0)"></a>
							</dt>
							<dd>
								<ul class="reset stageshow">
									<li>目前阶段：<span class="c5">天使轮</span></li>
								</ul> -->
								<!-- <form class="dn" id="stageform">
									<div class="stageSelect">
										<label>目前阶段</label>
										<input type="hidden" value="天使轮" id="financeStage" name="financeStage" />
										<input type="button" value="天使轮" id="select_fin" class="select_tags_short fl" />
										<div class="selectBoxShort dn" id="box_fin" style="display: none;">
											<ul class="reset">
												<li>未融资</li>
												<li class="current">天使轮</li>
												<li>A轮</li>
												<li>B轮</li>
												<li>C轮</li>
												<li>D轮及以上</li>
												<li>上市公司</li>
											</ul>
										</div>
									</div>
									<ul id="stagesList" class="reset">
										<li> <label>融资阶段</label> <input type="hidden" class="select_invest_hidden" name="select_invest_hidden" />
											<input type="button" value="融资阶段" class="select_tags_short select_invest" />
											<div class="selectBoxShort dn" style="display: none;">
												<ul class="reset">
													<li>天使轮</li>
													<li>A轮</li>
													<li>B轮</li>
													<li>C轮</li>
													<li>D轮及以上</li>
													<li>上市公司</li>
												</ul>
											</div> <label>投资机构</label> <input type="text" placeholder="如真格基金" name="stageorg" value="" />
										</li>
									</ul>
									<input type="submit" value="保存" class="btn_small" />
									<a id="cancelStages" class="btn_cancel_s" href="javascript:void(0)">取消</a>
									<div class="clear"></div>
									<div class="dn" id="cloneInvest">
										<label>融资阶段</label>
										<input type="hidden" class="select_invest_hidden" name="select_invest_hidden" />
										<input type="button" value="发展阶段" class="select_tags_short select_invest" />
										<div class="selectBoxShort dn" style="display: none;">
											<ul class="reset">
												<li>天使轮</li>
												<li>A轮</li>
												<li>B轮</li>
												<li>C轮</li>
												<li>D轮及以上</li>
												<li>上市公司</li>
											</ul>
										</div>
										<label>投资机构</label>
										<input type="text" placeholder="如真格基金" name="stageorg" />
									</div>
								</form> -->
						<!-- 	</dd>
						</dl> -->
						<!-- end .c_stages -->
					<!--  -->
						<!-- end #Member -->
						<!--公司深度报道
						<div id="Reported">
							<dl class="c_section c_reported">
								<dt>
									<h2><em></em>公司深度报道</h2>
									<a title="添加报道" class="c_add" href="javascript:void(0)"></a>
								</dt>
								<dd>
									<!-- 编辑报道 
									<ul class="reset">
										<li> <a style="" class="article" title="随便写" target="_blank" href="http://www.baidu.com">随便写</a> <a title="编辑报道"
											 class="c_edit dn" href="javascript:;" style="display: inline;"></a>
											<form class="reportForm dn">
												<input type="text" placeholder="请输入文章标题" value="" name="articleTitle" class="valid" />
												<input type="text" placeholder="请输入文章链接" value="" name="articleUrl" class="valid" />
												<span for="articleUrl" generated="true" class="error" style="display: none;">请输入有效的文章链接</span>
												<input type="submit" value="保存" class="btn_small" />
												<a class="btn_cancel_s report_delete" href="javascript:;">删除</a>
												<input type="hidden" value="5235" class="article_id" />
											</form>
										</li>
										<li> <a style="" class="article" title="随便写" target="_blank" href="http://www.baidu.com">随便写</a> <a title="编辑报道"
											 class="c_edit dn" href="javascript:;" style="display: inline;"></a>
											<form class="reportForm dn">
												<input type="text" placeholder="请输入文章标题" value="" name="articleTitle" class="valid" />
												<input type="text" placeholder="请输入文章链接" value="" name="articleUrl" class="valid" />
												<input type="submit" value="保存" class="btn_small" />
												<a class="btn_cancel_s report_delete" href="javascript:;">删除</a>
												<input type="hidden" value="5236" class="article_id" />
											</form>
										</li>
									</ul>
									<!-- 无报道 
									<div class="addnew_right reported_info dn">
										展示外界对公司的深度报道，
										<br />便于求职者了解公司！
										<br />
										<a class="report_edit" href="javascript:void(0)">+添加报道</a>
									</div>
									<ul class="newReport dn">
										<li> <a style="display:none;" class="article" title="" target="_blank"></a> <a title="编辑报道" class="c_edit dn"
											 href="javascript:;"></a>
											<form class="reportForm">
												<input type="text" placeholder="请输入文章标题" value="" name="articleTitle" />
												<input type="text" placeholder="请输入文章链接" value="" name="articleUrl" />
												<input type="submit" value="保存" class="btn_small" />
												<a class="btn_cancel_s report_cancel" href="javascript:;">取消</a>
												<input type="hidden" value="" class="article_id" />
											</form>
										</li>
									</ul>
								</dd>
							</dl>
							<!-- end .c_reported 
						</div>
						<!-- end #Reported 
					</div>
				</div>
				-->
				<!--弹窗lightbox  
				<div style="display:none;">
					<div style="width:650px;height:470px;" class="popup" id="logoUploader">
						<object width="650" height="470" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id="FlashID">
							<param value="../../flash/avatar.swf?url=http://www.lagou.com/cd/saveProfileLogo.json" name="movie">
							</param>
							<param value="high" name="quality">
							</param>
							<param value="opaque" name="wmode">
							</param>
							<param value="111.0.0.0" name="swfversion">
							</param>
							<!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 
							<param value="../../Scripts/expressInstall.swf" name="expressinstall">
							</param>
							<!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->
							<!--[if !IE]> <object width="650" height="470" data="../../flash/avatar.swf?url=http://www.lagou.com/cd/saveProfileLogo.json"
							 type="application/x-shockwave-flash">
								<!--<![endif]
								<param value="high" name="quality">
								</param>
								<param value="opaque" name="wmode">
								</param>
								<param value="111.0.0.0" name="swfversion">
								</param>
								<param value="../../Scripts/expressInstall.swf" name="expressinstall">
								</param>
								<!-- 浏览器将以下替代内容显示给使用 Flash Player 6.0 和更低版本的用户。 
								<div>
									<h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>
									<p><a href="http://www.adobe.com/go/getflashplayer"><img width="112" height="33" src="style/images/get_flash_player.gif"
											 alt="获取 Adobe Flash Player" /></a></p>
								</div>
								<!--[if !IE]>
							</object>
							<!--<![endif] </object>
					</div>
					<!-- #logoUploader 
				</div>
				<!-- end ----------------------------------------->
				<script src="style/js/company.min.js" type="text/javascript"></script>
				<script>
					var avatar = {};
avatar.uploadComplate = function( data ){
	var result = eval('('+ data +')');
	if(result.success){
		jQuery('#logoShow img').attr("src",ctx+ '/'+result.content);
		jQuery.colorbox.close();
	}
};
</script>
				<div class="clear"></div>
				<input type="hidden" value="d1035b6caa514d869727cff29a1c2e0c" id="resubmitToken" />
				<a rel="nofollow" title="回到顶部" id="backtop" style="display: inline;"></a>
			</div>
			<!-- end #container -->
		</div>
		<!-- end #body -->
		<div id="footer">
			<div class="wrapper">
				<a rel="nofollow" target="_blank" href="about.jsp">联系我们</a>
				<a target="_blank" href="#">公司导航</a>
				<a rel="nofollow" target="_blank" href="#">微博</a>
				<a rel="nofollow" href="javascript:void(0)">微信<i></i></a>
				<div class="copyright">
					&copy;2018-2020
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
