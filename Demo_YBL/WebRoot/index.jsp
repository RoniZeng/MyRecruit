<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
﻿<!DOCTYPE html>
<html xmlns:wb="http://open.weibo.com/wb">
 <head> 
  <script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js">
    </script> 
  <meta http-equiv="Cache-Control" content="no-siteapp" /> 
  <link rel="alternate" media="handheld" /> 
  <!-- end 云适配 --> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
  <title>
      医伯乐-最专业的医药招聘平台
    </title> 
  <meta property="qc:admins" content="23635710066417756375" /> 
  <meta content="" name="description" /> 
  <meta content="" name="keywords" /> 
  <meta name="baidu-site-verification" content="QIQ6KC1oZ6" /> 
  <!-- <div class="web_root" style="display:none">h</div> --> 
  <script type="text/javascript">
      var ctx = "h";
      console.log(1);
  </script> 
  <link rel="Shortcut Icon" href="h/images/favicon.ico" /> 
  <link rel="stylesheet" type="text/css" href="style/css/style.css" /> 
  <link rel="stylesheet" type="text/css" href="style/css/external.min.css" /> 
  <link rel="stylesheet" type="text/css" href="style/css/popup.css" /> 
  <script src="style/js/jquery.1.10.1.min.js" type="text/javascript">
    </script> 
  <script type="text/javascript" src="style/js/jquery.lib.min.js">
    </script> 
  <script src="style/js/ajaxfileupload.js" type="text/javascript">
    </script> 
  <script type="text/javascript" src="style/js/additional-methods.js">
    </script> 
  <!--[if lte IE 8]>
      <script type="text/javascript" src="style/js/excanvas.js">
      </script>
    <![endif]--> 
  <script type="text/javascript">
      var youdao_conv_id = 271546;
    </script> 
  <script type="text/javascript" src="style/js/conv.js">
    </script> 
 </head> 
 <body> 
  <div id="body"> 
   <div id="header"> 
    <div class="wrapper"> 
     <a href="index.jsp" class="logo"> <img src="style/images/logo.png" width="229" height="43" alt="医伯乐-专注医药招聘" /> </a> 
     <ul class="reset" id="navheader"> 
      <li class="current"> <a href="index.jsp"> 首页 </a> </li> 
      <li> <a href="companylist.jsp"> 公司 </a> </li> 
     <!-- <li> <a href="h/toForum.jsp" target="_blank"> 论坛 </a> </li> !-->
      <li> <a href="jianli.jsp" rel="nofollow"> 我的简历 </a> </li> 
      <li> <a href="create.jsp" rel="nofollow"> 发布职位 </a> </li> 
     </ul> 
 
     <s:if test="#session.userIdentity==0"> <!-- 求职者 -->
     	<ul class="loginTop">
      	<li> <a href="jianli.jsp" rel="nofollow"> 个人中心 </a> </li> 
    	 </ul> 
     </s:if>     
     <s:elseif test="#session.userIdentity==1">
     	<ul class="loginTop"> 
      	<li> <a href="create.jsp" rel="nofollow"> 企业中心 </a> </li> 
    	 </ul> 
     </s:elseif>
     <s:else>
     	<ul class="loginTop"> 
      <li> <a href="login.jsp" rel="nofollow"> 登录 </a> </li> 
      <li> | </li> 
      <li> <a href="register.jsp" rel="nofollow"> 注册 </a> </li> 
     </ul> 
     	
     </s:else>
     
    </div> 
   </div> 
   <!-- end #header --> 
   <div id="container"> 
    <div id="sidebar"> 
     <div class="mainNavs"> 
      <div class="menu_box"> 
       <div class="menu_main"> 
        <h2> 医院/临床医疗 <span> </span> </h2> 
        <a href="#"> 内科 </a> 
        <a href="#"> 外科 </a> 
        <a href="#"> 五官科 </a> 
        <a href="#"> 其他科室 </a> 
        <a href="#"> 妇产科 </a> 
       </div> 
       <div class="menu_sub dn"> 
        <dl class="reset"> 
         <dt> 
          <a href="#"> 内科 </a> 
         </dt> 
         <dd> 
          <a href="#" class="curr"> 普通内科 </a> 
          <a href="#" > 消化内科 </a> 
          <a href="#" > 呼吸内科 </a> 
          <a href="#" class="curr"> 心血管内科 </a> 
          <a href="#" > 血液内科 </a> 
          <a href="#" > 肾脏内科 </a> 
          <a href="#"> 神经内科 </a> 
          <a href="#"> 风湿免疫 </a> 
          <a href="#"> 内分泌 </a> 
          <a href="#"> 老年病科 </a> 
         </dd> 
        </dl> 
        <dl class="reset"> 
         <dt> 
          <a href="#"> 外科 </a> 
         </dt> 
         <dd> 
          <a href="#" > 普通外科 </a> 
          <a href="#" class="curr"> 泌尿外科 </a> 
          <a href="#" class="curr"> 肝胆外科 </a> 
          <a href="#" > 肛肠外科 </a> 
          <a href="#" class="curr"> 神经外科 </a> 
          <a href="#" > 心胸血管外科 </a> 
          <a href="#"> 整形外科 </a> 
		  <a href="#" > 烧伤科 </a> 
          <a href="#"> 骨科 </a> 
         </dd> 
        </dl> 
        <dl class="reset"> 
         <dt> 
          <a href="#"> 五官科 </a> 
         </dt> 
         <dd> 
			<a href="#" > 眼科 </a> 
			<a href="#" class="curr"> 耳鼻喉科 </a> 
			<a href="#" class="curr"> 口腔科 </a> 
         </dd> 
        </dl> 
		
		<dl class="reset"> 
         <dt> 
          <a href="#"> 其他科室 </a> 
         </dt> 
         <dd> 
          <a href="#" > 妇产科 </a> 
          <a href="#" > 儿科 </a> 
          <a href="#" class="curr"> 急诊科 </a> 
          <a href="#" > 麻醉科 </a> 
          <a href="#" class="curr"> 全科 </a> 
          <a href="#" > 重症医学科ICU </a> 
          <a href="#"> 感染传染病科 </a> 
          <a href="#"> 结核病科 </a> 
		  <a href="#"> 肿瘤科 </a> 
		  <a href="#"> 运动医学 </a> 
		  <a href="#"> 精神心理科 </a> 
		  <a href="#"> 皮肤性病科 </a> 
		  <a href="#"> 妇幼保健 </a> 
		  <a href="#"> 职业病科 </a> 
		  <a href="#"> 生殖遗传中心 </a> 
		  <a href="#"> 中医科 </a> 
		  <a href="#"> 康复医学 </a> 
		  <a href="#"> 其他 </a> 
         </dd> 
        </dl> 
		
       </div> 
      </div> 
	  
      <div class="menu_box"> 
       <div class="menu_main"> 
        <h2> 辅助科室及护理 <span> </span> </h2> 
        <a href="#"> 检验科 </a> 
        <a href="#"> 影像放射 </a> 
        <a href="#"> 超声科 </a> 
       </div> 
       <div class="menu_sub dn"> 
        <dl class="reset"> 
         <dt> 
          <a href="#"> 辅助科室及护理 </a> 
         </dt> 
         <dd> 
			<a href="#"> 检验科 </a> 
			<a href="#"> 影像放射 </a> 
			<a href="#"> 超声科 </a> 		
			<a href="#"> 心电图室 </a> 		
			<a href="#"> 病理科 </a> 		
			<a href="#"> 护理主任/护士长 </a> 		
			<a href="#"> 护士/护理人员 </a> 		
			<a href="#"> 药剂科 </a> 		
			<a href="#"> 输血科 </a> 		
			<a href="#"> 营养科 </a> 		
			<a href="#"> 体检中心 </a> 		
			<a href="#"> 医院管理 </a> 		
			<a href="#"> 行政后勤 </a> 		
			<a href="#"> 病案管理 </a> 		
			<a href="#"> 公共卫生 </a> 		
			<a href="#"> 导医针灸推拿 </a> 		
			<a href="#"> 技师 </a> 		
			<a href="#"> 兽医/宠物医生 </a> 		
			<a href="#"> 其他 </a> 		
			
         </dd> 
        </dl> 
       </div> 
      </div> 
	  
	  
      <div class="menu_box"> 
       <div class="menu_main"> 
        <h2> 医药市场与销售 <span> </span> </h2> 
        <a href="#"> 市场推广 </a> 
        <a href="#"> 市场策划 </a> 
        <a href="#"> 活动策划 </a> 
        <a href="#"> 销售经理 </a> 
       </div> 
       <div class="menu_sub dn"> 
        <dl class="reset"> 
         <dt> 
          <a href="#"> 医药市场/营销 </a> 
         </dt> 
         <dd> 
          <a href="#"> 市场营销 </a> 
          <a href="#" class="curr"> 市场策划 </a> 
          <a href="#"> 市场顾问 </a> 
          <a href="#" class="curr"> 市场推广 </a> 
          <a href="#"> 商务渠道 </a> 
          <a href="#"> 销售助理 </a> 
		  <a href="#"> 销售经理 </a> 
		  <a href="#"> 客户经理及客户代表 </a> 
		  <a href="#"> 商务助理 </a> 
         </dd> 
        </dl> 
       </div> 
      </div> 
	  
	  
	  <div class="menu_box"> 
       <div class="menu_main"> 
        <h2> 医药研发/制药生产 <span> </span> </h2> 
        <a href="#"> 医药技术研发管理 </a> 
        <a href="#"> 医药技术研发人员 </a> 
        <a href="#"> 药品生产/质量管理 </a> 
        <a href="#"> 生产工程操作 </a> 
       </div> 
       <div class="menu_sub dn"> 
        <dl class="reset"> 
         <dt> 
          <a href="#"> 医药研发/制药生产 </a> 
         </dt> 
         <dd> 
			<a href="#"> 医药技术研发管理 </a> 
			<a href="#"> 医药技术研发人员 </a> 
			<a href="#"> 药品生产/质量管理 </a> 
			<a href="#"> 生产工程操作 </a> 
			<a href="#"> 工艺主管及工艺员 </a> 
			<a href="#"> 临床监察员 </a> 
			<a href="#"> 临床协调员 </a> 
			<a href="#"> 药品注册 </a> 
			<a href="#"> 药品市场推广 </a> 
			<a href="#"> 医药销售经理主管 </a> 
			<a href="#"> 医药销售代表 </a> 
			<a href="#"> OTC代表 </a> 
			<a href="#"> 学士代表 </a> 
			<a href="#"> 医学总监/医学经理 </a> 
			<a href="#"> 医学顾问 </a> 
			<a href="#"> 数据管理员 </a> 
			<a href="#"> 数据统计师 </a> 
			<a href="#"> 其他 </a> 
         </dd> 
        </dl> 
       </div> 
      </div> 
	  
	  
	  <div class="menu_box"> 
       <div class="menu_main"> 
        <h2> 互联网/IT <span> </span> </h2> 
        <a href="#"> 软件工程师 </a> 
        <a href="#"> EP技术/开发应用 </a> 
        <a href="#"> 系统集成工程师 </a> 
        <a href="#"> 系统分析员 </a> 
       </div> 
       <div class="menu_sub dn"> 
        <dl class="reset"> 
         <dt> 
          <a href="#"> 互联网/IT </a> 
         </dt> 
         <dd> 
			<a href="#"> 软件工程师 </a> 
			<a href="#"> EP技术/开发应用 </a> 
			<a href="#"> 系统集成工程师 </a> 
			<a href="#"> 系统分析员 </a> 
			<a href="#"> 系统工程师 </a> 
			<a href="#"> 系统架构设计师 </a> 
			<a href="#"> 数据库管理员 </a> 
			<a href="#"> 电脑辅助设计工程师 </a> 
			<a href="#"> 信息系统管理员 </a> 
			<a href="#"> 网络管理 </a> 
			<a href="#"> 硬件维护 </a> 
         </dd> 
        </dl> 
       </div> 
      </div> 
	  
      <div class="menu_box"> 
       <div class="menu_main"> 
        <h2> 生物化工 <span> </span> </h2> 
			<a href="#"> 生物制药 </a> 
			<a href="#"> 生物工程 </a> 
			<a href="#"> 生物材料 </a> 
			<a href="#"> 有机合成 </a> 
			<a href="#"> 分子生物学 </a> 
			<a href="#"> 微生物研发 </a> 
       </div> 
       <div class="menu_sub dn"> 
        <dl class="reset"> 
         <dt> 
          <a href="#"> 生物化工 </a> 
         </dt> 
         <dd> 
			<a href="#"> 生物制药 </a> 
			<a href="#"> 生物工程 </a> 
			<a href="#"> 生物材料 </a> 
			<a href="#"> 有机合成 </a> 
			<a href="#"> 分子生物学 </a> 
			<a href="#"> 微生物研发 </a>          
			<a href="#"> 细胞生物学 </a>          
			<a href="#"> 生物信息 </a>          
			<a href="#"> 信息经理/CIO </a>          
			<a href="#"> 生物科研 </a>          
			<a href="#"> 生物教育 </a>          
			<a href="#"> 食品研发 </a>          
			<a href="#"> 保健品研发 </a>          
			<a href="#"> 化妆品研发 </a>          
			<a href="#"> 化工技术应用 </a>          
			<a href="#"> 化学分析测试 </a>          
			<a href="#"> 其他 </a>          
		</dd> 
        </dl> 
       </div> 
      </div> 
     </div> 
	 
	 
	 
    <!--
	<a class="subscribe" href="subscribe.jsp" target="_blank"> 订阅职位 </a> !-->
    </div> 
	
	
    <div class="content"> 
     <div id="search_box"> 
      <form id="searchForm" name="searchForm" action="list.jsp" method="get">  <!-- 搜索后表单跳转 !-->
       <ul id="searchType"> 
        <li data-searchtype="1" class="type_selected"> 职位 </li> 
        <li data-searchtype="4"> 公司 </li> 
       </ul> 
       <div class="searchtype_arrow"> 
       </div> 
       <input type="text" id="search_input" name="kd" tabindex="1" value="" placeholder="请输入职位名称，如：临床医生" /> 
       <input type="hidden" name="spc" id="spcInput" value="" /> 
       <input type="hidden" name="pl" id="plInput" value="" /> 
       <input type="hidden" name="gj" id="gjInput" value="" /> 
       <input type="hidden" name="xl" id="xlInput" value="" /> 
       <input type="hidden" name="yx" id="yxInput" value="" /> 
       <input type="hidden" name="gx" id="gxInput" value="" /> 
       <input type="hidden" name="st" id="stInput" value="" /> 
       <input type="hidden" name="labelWords" id="labelWords" value="" /> 
       <input type="hidden" name="lc" id="lc" value="" /> 
       <input type="hidden" name="workAddress" id="workAddress" value="" /> 
       <input type="hidden" name="city" id="cityInput" value="" /> 
       <input type="submit" id="search_button" value="搜索" /> 
      </form> 
     </div> 
     <style>
            .ui-autocomplete{width:488px;background:#fafafa !important;position: relative;z-index:10;border:
            2px solid #91cebe;} .ui-autocomplete-category{font-size:16px;color:#999;width:50px;position:
            absolute;z-index:11; right: 0px;/*top: 6px; */text-align:center;border-top:
            1px dashed #e5e5e5;padding:5px 0;} .ui-menu-item{ *width:439px;vertical-align:
            middle;position: relative;margin: 0px;margin-right: 50px !important;background:#fff;border-right:
            1px dashed #ededed;} .ui-menu-item a{display:block;overflow:hidden;}
     </style> 
     <script type="text/javascript" src="style/js/search.min.js"> </script> 
     <dl class="hotSearch"> 
      <dt>
        热门搜索： 
      </dt> 
      <dd> 
       <a href="#"> 护士招聘 </a> 
      </dd> 
      <dd> 
       <a href="#"> 检验招聘 </a> 
      </dd> 
      <dd> 
       <a href="#"> 临床医生 </a> 
      </dd> 
     </dl> 
     <div id="home_banner"> 
      <ul class="banner_bg"> 
       <li class="banner_bg_1 current"> <a href="#" target="_blank"> <img src="style/images/d05a2cc6e6c94bdd80e074eb05e37ebd.png" width="612" height="160" /> </a> </li> 
       <li class="banner_bg_2"> <a href="#" target="_blank"> <img src="style/images/c9d8a0756d1442caa328adcf28a38857.png" width="612" height="160" /> </a> </li> 
       <li class="banner_bg_3"> <a href="#" target="_blank"> <img src="style/images/354d445c5fd84f1990b91eb559677eb5.jpg" width="612" height="160"/> </a> </li> 
      </ul> 
      <div class="banner_control"> 
       <em> </em> 
       <ul class="thumbs"> 
        <li class="thumbs_1 current"> <i> </i> <img src="style/images/d05a2cc6e6c94bdd80e074eb05e37ebd.png" width="113" height="42" /> </li> 
        <li class="thumbs_2"> <i> </i> <img src="style/images/c9d8a0756d1442caa328adcf28a38857.png" width="113" height="42" /> </li> 
        <li class="thumbs_3"> <i> </i> <img src="style/images/354d445c5fd84f1990b91eb559677eb5.jpg" width="113" height="42" /> </li> 
       </ul> 
      </div> 
     </div> 
     <!--/#main_banner--> 
     <ul id="da-thumbs" class="da-thumbs"> 
      <li> <a href="http://www.ny-bio.com/" target="_blank"> <img src="style/images/p1.png" width="113" height="113" alt="诺扬" /> 
        <div class="hot_info"> 
         <h2 title="诺扬"> 诺扬生物 </h2> 
         <em> </em> 
         <p title="专注于生命科学和生物技术">专注于生命科学和生物技术 </p> 
        </div> </a> </li> 
      <li> <a href="http://www.dazd.cn/" target="_blank"> <img src="style/images/p2.jpeg" width="113" height="113" alt="迪安" /> 
        <div class="hot_info"> 
         <h2 title="迪安"> 迪安诊断 </h2> 
         <em> </em> 
         <p title="将心注入 追求极致"> 立志成为中国诊断行业受人尊敬的领导者 </p> 
        </div> </a> </li> 
      <li> <a href="http://www.medjaden.com/" target="_blank"> <img src="style/images/p3.jpeg" width="113" height="113" alt="美捷登" /> 
        <div class="hot_info"> 
         <h2 title="美捷登"> 美捷登 </h2> 
         <em> </em> 
         <p title="您不放弃，我们决不放弃"> 您不放弃，我们决不放弃 </p> 
        </div> </a> </li> 
      <li> <a href="http://www.hybiome.com/" target="_blank"> <img src="style/images/p4.jpeg" width="113" height="113" alt="长光华医" /> 
        <div class="hot_info"> 
         <h2 title="长光华医"> 长光华医 </h2> 
         <em> </em> 
         <p title="一家专注于体外诊断产品领域高新技术企业"> 一家专注于体外诊断产品领域高新技术企业 </p> 
        </div> </a> </li> 
      <li> <a href="http://www.opmbiosciences.com/" target="_blank"> <img src="style/images/p5.png" width="113" height="113" alt="奥浦迈" /> 
        <div class="hot_info"> 
         <h2 title="奥浦迈"> 奥浦迈 </h2> 
         <em> </em> 
         <p title="注重高品质细胞培养基研发和生产"> 注重高品质细胞培养基研发和生产 </p> 
        </div> </a> </li> 
      <li class="last"> <a href="http://www.dxy.cn/" target="_blank"> <img src="style/images/p6.png" width="113" height="113" alt="丁香园" /> 
        <div class="hot_info"> 
         <h2 title="丁香园"> 丁香园 </h2> 
         <em> </em> 
         <p title="中国医疗领域的连接者"> 中国医疗领域的连接者 </p> 
        </div> </a> </li> 
     </ul> 
	 
	 
	 
	 
     <ul class="reset hotabbing"> 
      <li class="current"> 热门职位 </li> 
      <li> 最新职位 </li> 
     </ul> 
	 
     <div id="hotList"> 
      <ul class="hot_pos reset"> 
       <li class="clearfix"> 
        <div class="hot_pos_l"> 
         <div class="mb10"> 
          <a href="h/jobs/147822.jsp" target="_blank"> 质量主管 </a> &nbsp; 
          <span class="c9"> [北京] </span> 
         </div> 
		 
         <span> <em class="c7"> 月薪： </em> 15k-20k </span> 
         <span> <em class="c7"> 经验： </em> 3-5年 </span> 
         <span> <em class="c7"> 最低学历： </em> 本科 </span> 
         <br /> 
         <br /> 
         <span> 1天前发布 </span> 
         <!-- <a class="wb">分享到微博</a> --> 
        </div> 
        <div class="hot_pos_r"> 
         <div class="mb10 recompany"> 
          <a href="http://www.opmbiosciences.com/" target="_blank"> 上海奥浦迈生物科技有限公司 </a> 
         </div> 
         <span> <em class="c7"> 领域： </em> 生物企业 </span> 
         <span> <em class="c7"> 创始人： </em> 陈桦 </span> 
         <br /> 
         <span> <em class="c7"> 阶段： </em> 初创型(天使轮) </span> 
         <span> <em class="c7"> 规模： </em> 少于15人 </span> 
         <ul class="companyTags reset"> 
          <li> 移动互联网 </li> 
          <li> 五险一金 </li> 
          <li> 扁平管理 </li> 
         </ul> 
        </div> </li> 
       <li class="odd clearfix"> 
        <div class="hot_pos_l"> 
         <div class="mb10"> 
          <a href="h/jobs/147974.jsp" target="_blank"> 临床医生 </a> &nbsp; 
          <span class="c9"> [北京] </span> 
         </div> 
         <span> <em class="c7"> 月薪： </em> 6k-12k </span> 
         <span> <em class="c7"> 经验： </em> 3-5年 </span> 
         <span> <em class="c7"> 最低学历： </em> 大专 </span> 
         <br /> 
         <span> <em class="c7"> 职位诱惑： </em> 五险一金+商业保险+带薪年假+奖金等 </span> 
         <br /> 
         <span> 1天前发布 </span> 
         <!-- <a class="wb">分享到微博</a> --> 
        </div> 
        <div class="hot_pos_r"> 
         <div class="mb10 recompany"> 
          <a href="h/c/5232.jsp" target="_blank"> 北京协和医院 </a> 
         </div> 
         <span> <em class="c7"> 领域： </em> 公立医院 </span> 
         <br /> 
         <span> <em class="c7"> 规模： </em> 50-150人 </span> 
         <ul class="companyTags reset"> 
          <li> 五险一金 </li> 
          <li> 福利好 </li> 
          <li> 商业险 </li> 
         </ul> 
        </div> </li> 
       
	   
	   
     
       <li class="clearfix"> 
        <div class="hot_pos_l"> 
         <div class="mb10"> 
          <a href="h/jobs/148783.jsp" target="_blank"> 产品经理 </a> &nbsp; 
          <span class="c9"> [北京] </span> 
         </div> 
         <span> <em class="c7"> 月薪： </em> 8k-10k </span> 
         <span> <em class="c7"> 经验： </em> 1-3年 </span> 
         <span> <em class="c7"> 最低学历： </em> 本科 </span> 
         <br /> 
         <span> <em class="c7"> 职位诱惑： </em> 六险一金，饭补，班车，晋升机制，氛围好 </span> 
         <br /> 
         <span> 14:15发布 </span> 
         <!-- <a class="wb">分享到微博</a> --> 
        </div> 
        <div class="hot_pos_r"> 
         <div class="mb10 recompany"> 
          <a href="h/c/8143.jsp" target="_blank"> 诺扬生物 </a> 
         </div> 
         <span> <em class="c7"> 领域： </em> 制药工程 </span> 
         <span> <em class="c7"> 创始人： </em> 罗军 </span> 
         <br /> 
         <span> <em class="c7"> 阶段： </em> 成长型(B轮) </span> 
         <span> <em class="c7"> 规模： </em> 500-2000人 </span> 
         <ul class="companyTags reset"> 
          <li> 绩效奖金 </li> 
          <li> 五险一金 </li> 
          <li> 带薪年假 </li> 
         </ul> 
        </div> </li> 
       <li class="odd clearfix"> 
        <div class="hot_pos_l"> 
         <div class="mb10"> 
          <a href="h/jobs/148206.jsp" target="_blank"> 产品经理 </a> &nbsp; 
          <span class="c9"> [北京] </span> 
         </div> 
         <span> <em class="c7"> 月薪： </em> 10k-20k </span> 
         <span> <em class="c7"> 经验： </em> 5-10年 </span> 
         <span> <em class="c7"> 最低学历： </em> 本科 </span> 
         <br /> 
         <span> <em class="c7"> 职位诱惑： </em> 和一群聪明的人共事 </span> 
         <br /> 
         <span> 1天前发布 </span> 
         <!-- <a class="wb">分享到微博</a> --> 
        </div> 
        <div class="hot_pos_r"> 
         <div class="mb10 recompany"> 
          <a href="h/c/3646.jsp" target="_blank"> PEVC </a> 
         </div> 
         <span> <em class="c7"> 领域： </em> A </span> 
         <span> <em class="c7"> 创始人： </em> 兰宁羽 </span> 
         <br /> 
         <span> <em class="c7"> 阶段： </em> 成长型(A轮) </span> 
         <span> <em class="c7"> 规模： </em> 50-150人 </span> 
         <ul class="companyTags reset"> 
          <li> 五险一金 </li> 
          <li> 节日礼物 </li> 
          <li> 弹性工作 </li> 
         </ul> 
        </div> </li> 
       <li class="clearfix"> 
        <div class="hot_pos_l"> 
         <div class="mb10"> 
          <a href="h/jobs/147720.jsp" target="_blank"> 团队经理 </a> &nbsp; 
          <span class="c9"> [北京] </span> 
         </div> 
         <span> <em class="c7"> 月薪： </em> 10k-15k </span> 
         <span> <em class="c7"> 经验： </em> 不限 </span> 
         <span> <em class="c7"> 最低学历： </em> 大专 </span> 
         <br /> 
         <span> <em class="c7"> 职位诱惑： </em> 位置佳，环境优越，发展空间大，薪酬高 </span> 
         <br /> 
         <span> 2天前发布 </span> 
         <!-- <a class="wb">分享到微博</a> --> 
        </div> 
        <div class="hot_pos_r"> 
         <div class="mb10 recompany"> 
          <a href="h/c/3786.jsp" target="_blank"> B公司 </a> 
         </div> 
         <span> <em class="c7"> 领域： </em> B </span> 
         <span> <em class="c7"> 创始人： </em> 唐宁 </span> 
         <br /> 
         <span> <em class="c7"> 阶段： </em> 成熟型(D轮及以上) </span> 
         <span> <em class="c7"> 规模： </em> 2000人以上 </span> 
         <ul class="companyTags reset"> 
          <li> 管理规范 </li> 
          <li> 技能培训 </li> 
          <li> 扁平管理 </li> 
         </ul> 
        </div> </li> 
       <li class="odd clearfix"> 
        <div class="hot_pos_l"> 
         <div class="mb10"> 
          <a href="h/jobs/145249.jsp" target="_blank"> C </a> &nbsp; 
          <span class="c9"> [上海] </span> 
         </div> 
         <span> <em class="c7"> 月薪： </em> 6k-10k </span> 
         <span> <em class="c7"> 经验： </em> 1-3年 </span> 
         <span> <em class="c7"> 最低学历： </em> 大专 </span> 
         <br /> 
         <span> <em class="c7"> 职位诱惑： </em> 一年两次调薪，免费早、晚餐，项目、年终奖 </span> 
         <br /> 
         <span> 2014-06-27 </span> 
         <!-- <a class="wb">分享到微博</a> --> 
        </div> 
        <div class="hot_pos_r"> 
         <div class="mb10 recompany"> 
          <a href="h/c/4428.jsp" target="_blank"> C </a> 
         </div> 
         <span> <em class="c7"> 领域： </em> 医疗 </span> 
         <span> <em class="c7"> 创始人： </em> 王悦 </span> 
         <br /> 
         <span> <em class="c7"> 阶段： </em> 初创型(未融资) </span> 
         <span> <em class="c7"> 规模： </em> 500-2000人 </span> 
         <ul class="companyTags reset"> 
          <li> 游戏公司 </li> 
          <li> 页游 </li> 
          <li> 手游 </li> 
         </ul> 
        </div> </li> 
       <li class="clearfix"> 
        <div class="hot_pos_l"> 
         <div class="mb10"> 
          <a href="h/jobs/148680.jsp" target="_blank"> 市场推广 </a> &nbsp; 
          <span class="c9"> [上海] </span> 
         </div> 
         <span> <em class="c7"> 月薪： </em> 7k-12k </span> 
         <span> <em class="c7"> 经验： </em> 1-3年 </span> 
         <span> <em class="c7"> 最低学历： </em> 大专 </span> 
         <br /> 
         <span> <em class="c7"> 职位诱惑： </em> 年度16薪 市场营销发展方向 </span> 
         <br /> 
         <span> 1天前发布 </span> 
         <!-- <a class="wb">分享到微博</a> --> 
        </div> 
        <div class="hot_pos_r"> 
         <div class="mb10 recompany"> 
          <a href="h/c/1235.jsp" target="_blank"> D </a> 
         </div> 
         <span> <em class="c7"> 领域： </em> 制药工程 </span> 
         <span> <em class="c7"> 创始人： </em> 黄天赐 </span> 
         <br /> 
         <span> <em class="c7"> 阶段： </em> 成熟型(C轮) </span> 
         <span> <em class="c7"> 规模： </em> 50-150人 </span> 
         <ul class="companyTags reset"> 
          <li> 弹性工作 </li> 
          <li> 领导好 </li> 
          <li> 移动互联网 </li> 
         </ul> 
        </div> </li> 
       <a href="list.jsp" class="btn fr" target="_blank"> 查看更多 </a> 
      </ul> 
      <ul class="hot_pos hot_posHotPosition reset" style="display:none;"> 
       <li class="clearfix"> 
        <div class="hot_pos_l"> 
         <div class="mb10"> 
          <a href="h/jobs/149389.jsp" target="_blank"> 医药研发 </a> &nbsp; 
          <span class="c9"> [南京] </span> 
         </div> 
         <span> <em class="c7"> 月薪： </em> 12k-24k </span> 
         <span> <em class="c7"> 经验： </em> 3-5年 </span> 
         <span> <em class="c7"> 最低学历： </em> 本科 </span> 
         <br /> 
        <!-- <span> <em class="c7"> 职位诱惑： </em> IPO了的互联网创业公司，潜力无限！ </span> -->
         <br /> 
         <span> 15:11发布 </span> 
         <!-- <a class="wb">分享到微博</a> --> 
        </div> 
        <div class="hot_pos_r"> 
         <div class="mb10"> 
          <a href="h/c/8250.jsp" target="_blank"> A </a> 
         </div> 
         <span> <em class="c7"> 领域： </em> A </span> 
         <span> <em class="c7"> 创始人： </em> 于敦德 </span> 
         <br /> 
         <span> <em class="c7"> 阶段： </em> 上市公司 </span> 
         <span> <em class="c7"> 规模： </em> 500-2000人 </span> 
         <ul class="companyTags reset"> 
          <li> 绩效奖金 </li> 
          <li> 股票期权 </li> 
          <li> 五险一金 </li> 
         </ul> 
        </div> </li> 
       <li class="odd clearfix"> 
        <div class="hot_pos_l"> 
         <div class="mb10"> 
          <a href="h/jobs/149388.jsp" target="_blank"> A </a> &nbsp; 
          <span class="c9"> [南京] </span> 
         </div> 
         <span> <em class="c7"> 月薪： </em> 15k-30k </span> 
         <span> <em class="c7"> 经验： </em> 3-5年 </span> 
         <span> <em class="c7"> 最低学历： </em> 本科 </span> 
         <br />
         <br /> 
         <span> 15:09发布 </span> 
         <!-- <a class="wb">分享到微博</a> --> 
        </div> 
        <div class="hot_pos_r"> 
         <div class="mb10"> 
          <a href="h/c/8250.jsp" target="_blank"> A </a> 
         </div> 
         <span> <em class="c7"> 领域： </em> A </span> 
         <span> <em class="c7"> 创始人： </em> 于敦德 </span> 
         <br /> 
         <span> <em class="c7"> 阶段： </em> 上市公司 </span> 
         <span> <em class="c7"> 规模： </em> 500-2000人 </span> 
         <ul class="companyTags reset"> 
          <li> 绩效奖金 </li> 
          <li> 股票期权 </li> 
          <li> 五险一金 </li> 
         </ul> 
        </div> </li> 
       <li class="clearfix"> 
        <div class="hot_pos_l"> 
         <div class="mb10"> 
          <a href="h/jobs/149385.jsp" target="_blank"> A </a> &nbsp; 
          <span class="c9"> [南京] </span> 
         </div> 
         <span> <em class="c7"> 月薪： </em> 15k-30k </span> 
         <span> <em class="c7"> 经验： </em> 3-5年 </span> 
         <span> <em class="c7"> 最低学历： </em> 本科 </span> 
         <br /> 
         <span> <em class="c7"> 职位诱惑： </em> IPO了的互联网创业公司，潜力无限！ </span> 
         <br /> 
         <span> 15:08发布 </span> 
         <!-- <a class="wb">分享到微博</a> --> 
        </div> 
        <div class="hot_pos_r"> 
         <div class="mb10"> 
          <a href="h/c/8250.jsp" target="_blank"> A </a> 
         </div> 
         <span> <em class="c7"> 领域： </em> A </span> 
         <span> <em class="c7"> 创始人： </em> 于敦德 </span> 
         <br /> 
         <span> <em class="c7"> 阶段： </em> 上市公司 </span> 
         <span> <em class="c7"> 规模： </em> 500-2000人 </span> 
         <ul class="companyTags reset"> 
          <li> 绩效奖金 </li> 
          <li> 股票期权 </li> 
          <li> 五险一金 </li> 
         </ul> 
        </div> </li> 
       <li class="odd clearfix"> 
        <div class="hot_pos_l"> 
         <div class="mb10"> 
          <a href="h/jobs/149380.jsp" target="_blank"> A </a> &nbsp; 
          <span class="c9"> [南京] </span> 
         </div> 
         <span> <em class="c7"> 月薪： </em> 15k-30k </span> 
         <span> <em class="c7"> 经验： </em> 3-5年 </span> 
         <span> <em class="c7"> 最低学历： </em> 本科 </span> 
         <br /> 

         <br /> 
         <span> 15:06发布 </span> 
         <!-- <a class="wb">分享到微博</a> --> 
        </div> 
        <div class="hot_pos_r"> 
         <div class="mb10"> 
          <a href="h/c/8250.jsp" target="_blank"> A </a> 
         </div> 
         <span> <em class="c7"> 领域： </em> A </span> 
         <span> <em class="c7"> 创始人： </em> 于敦德 </span> 
         <br /> 
         <span> <em class="c7"> 阶段： </em> 上市公司 </span> 
         <span> <em class="c7"> 规模： </em> 500-2000人 </span> 
         <ul class="companyTags reset"> 
          <li> 绩效奖金 </li> 
          <li> 股票期权 </li> 
          <li> 五险一金 </li> 
         </ul> 
        </div> </li> 
       <li class="clearfix"> 
        <div class="hot_pos_l"> 
         <div class="mb10"> 
          <a href="h/jobs/73775.jsp" target="_blank"> A </a> &nbsp; 
          <span class="c9"> [成都] </span> 
         </div> 
         <span> <em class="c7"> 月薪： </em> 4k-8k </span> 
         <span> <em class="c7"> 经验： </em> 1-3年 </span> 
         <span> <em class="c7"> 最低学历： </em> 大专 </span> 
         <br /> 
         <br /> 
         <span> 14:47发布 </span> 
         <!-- <a class="wb">分享到微博</a> --> 
        </div> 
        <div class="hot_pos_r"> 
         <div class="mb10"> 
          <a href="h/c/15431.jsp" target="_blank"> A </a> 
         </div> 
         <span> <em class="c7"> 领域： </em> A </span> 
         <br /> 
         <span> <em class="c7"> 阶段： </em> 成长型(B轮) </span> 
         <span> <em class="c7"> 规模： </em> 50-150人 </span> 
         <ul class="companyTags reset"> 
          <li> 五险一金 </li> 
          <li> 绩效奖金 </li> 
          <li> 带薪年假 </li> 
         </ul> 
        </div> </li> 
       <li class="odd clearfix"> 
        <div class="hot_pos_l"> 
         <div class="mb10"> 
          <a href="h/jobs/88497.jsp" target="_blank"> A </a> &nbsp; 
          <span class="c9"> [成都] </span> 
         </div> 
         <span> <em class="c7"> 月薪： </em> 6k-12k </span> 
         <span> <em class="c7"> 经验： </em> 1-3年 </span> 
         <span> <em class="c7"> 最低学历： </em> 大专 </span> 
         <br /> 
         <br /> 
         <span> 14:46发布 </span> 
         <!-- <a class="wb">分享到微博</a> --> 
        </div> 
        <div class="hot_pos_r"> 
         <div class="mb10"> 
          <a href="h/c/15431.jsp" target="_blank"> A </a> 
         </div> 
         <span> <em class="c7"> 领域： </em> A </span> 
         <br /> 
         <span> <em class="c7"> 阶段： </em> 成长型(B轮) </span> 
         <span> <em class="c7"> 规模： </em> 50-150人 </span> 
         <ul class="companyTags reset"> 
          <li> 五险一金 </li> 
          <li> 绩效奖金 </li> 
          <li> 带薪年假 </li> 
         </ul> 
        </div> </li> 
       <li class="clearfix"> 
        <div class="hot_pos_l"> 
         <div class="mb10"> 
          <a href="h/jobs/146689.jsp" target="_blank"> A </a> &nbsp; 
          <span class="c9"> [北京] </span> 
         </div> 
         <span> <em class="c7"> 月薪： </em> 6k-10k </span> 
         <span> <em class="c7"> 经验： </em> 1-3年 </span> 
         <span> <em class="c7"> 最低学历： </em> 大专 </span> 
         <br /> 
         <br /> 
         <span> 14:42发布 </span> 
         <!-- <a class="wb">分享到微博</a> --> 
        </div> 
        <div class="hot_pos_r"> 
         <div class="mb10"> 
          <a href="h/c/3786.jsp" target="_blank"> A </a> 
         </div> 
         <span> <em class="c7"> 领域： </em> A </span> 
         <span> <em class="c7"> 创始人： </em> 唐宁 </span> 
         <br /> 
         <span> <em class="c7"> 阶段： </em> 成熟型(D轮及以上) </span> 
         <span> <em class="c7"> 规模： </em> 2000人以上 </span> 
         <ul class="companyTags reset"> 
          <li> 管理规范 </li> 
          <li> 技能培训 </li> 
          <li> 扁平管理 </li> 
         </ul> 
        </div> </li> 
       <li class="odd clearfix"> 
        <div class="hot_pos_l"> 
         <div class="mb10"> 
          <a href="h/jobs/126310.jsp" target="_blank"> A </a> &nbsp; 
          <span class="c9"> [北京] </span> 
         </div> 
         <span> <em class="c7"> 月薪： </em> 6k-10k </span> 
         <span> <em class="c7"> 经验： </em> 1-3年 </span> 
         <span> <em class="c7"> 最低学历： </em> 本科 </span> 
         <br /> 
         <span> <em class="c7"> 职位诱惑： </em> 六险一金，饭补，班车，晋升机制，氛围好 </span> 
         <br /> 
         <span> 14:16发布 </span> 
         <!-- <a class="wb">分享到微博</a> --> 
        </div> 
        <div class="hot_pos_r"> 
         <div class="mb10"> 
          <a href="h/c/8143.jsp" target="_blank"> A </a> 
         </div> 
         <span> <em class="c7"> 领域： </em> A </span> 
         <span> <em class="c7"> 创始人： </em> 罗军 </span> 
         <br /> 
         <span> <em class="c7"> 阶段： </em> 成长型(B轮) </span> 
         <span> <em class="c7"> 规模： </em> 500-2000人 </span> 
         <ul class="companyTags reset"> 
          <li> 绩效奖金 </li> 
          <li> 五险一金 </li> 
          <li> 带薪年假 </li> 
         </ul> 
        </div> </li> 
       <li class="clearfix"> 
        <div class="hot_pos_l"> 
         <div class="mb10"> 
          <a href="h/jobs/137954.jsp" target="_blank"> 海外客服主管-北京-02615 </a> &nbsp; 
          <span class="c9"> [北京] </span> 
         </div> 
         <span> <em class="c7"> 月薪： </em> 6k-8k </span> 
         <span> <em class="c7"> 经验： </em> 3-5年 </span> 
         <span> <em class="c7"> 最低学历： </em> 大专 </span> 
         <br /> 
         <span> <em class="c7"> 职位诱惑： </em> 施展个人才华的平台 </span> 
         <br /> 
         <span> 14:16发布 </span> 
         <!-- <a class="wb">分享到微博</a> --> 
        </div> 
        <div class="hot_pos_r"> 
         <div class="mb10"> 
          <a href="h/c/8143.jsp" target="_blank"> A </a> 
         </div> 
         <span> <em class="c7"> 领域： </em> A </span> 
         <span> <em class="c7"> 创始人： </em> 罗军 </span> 
         <br /> 
         <span> <em class="c7"> 阶段： </em> 成长型(B轮) </span> 
         <span> <em class="c7"> 规模： </em> 500-2000人 </span> 
         <ul class="companyTags reset"> 
          <li> 绩效奖金 </li> 
          <li> 五险一金 </li> 
          <li> 带薪年假 </li> 
         </ul> 
        </div> </li> 
       <li class="odd clearfix"> 
        <div class="hot_pos_l"> 
         <div class="mb10"> 
          <a href="h/jobs/124832.jsp" target="_blank"> A </a> &nbsp; 
          <span class="c9"> [北京] </span> 
         </div> 
         <span> <em class="c7"> 月薪： </em> 6k-8k </span> 
         <span> <em class="c7"> 经验： </em> 1-3年 </span> 
         <span> <em class="c7"> 最低学历： </em> 大专 </span> 
         <br /> 
         <br /> 
         <span> 14:16发布 </span> 
         <!-- <a class="wb">分享到微博</a> --> 
        </div> 
        <div class="hot_pos_r"> 
         <div class="mb10"> 
          <a href="h/c/8143.jsp" target="_blank"> A </a> 
         </div> 
         <span> <em class="c7"> 领域： </em> A </span> 
         <span> <em class="c7"> 创始人： </em> 罗军 </span> 
         <br /> 
         <span> <em class="c7"> 阶段： </em> 成长型(B轮) </span> 
         <span> <em class="c7"> 规模： </em> 500-2000人 </span> 
         <ul class="companyTags reset"> 
          <li> 绩效奖金 </li> 
          <li> 五险一金 </li> 
          <li> 带薪年假 </li> 
         </ul> 
        </div> </li> 
       <li class="clearfix"> 
        <div class="hot_pos_l"> 
         <div class="mb10"> 
          <a href="h/jobs/124794.jsp" target="_blank"> A</a> &nbsp; 
          <span class="c9"> [北京] </span> 
         </div> 
         <span> <em class="c7"> 月薪： </em> 10k-13k </span> 
         <span> <em class="c7"> 经验： </em> 1-3年 </span> 
         <span> <em class="c7"> 最低学历： </em> 本科 </span> 
         <br /> 
         <span> <em class="c7"> 职位诱惑： </em> 六险一金，饭补，班车，晋升机制，氛围好 </span> 
         <br /> 
         <span> 14:16发布 </span> 
         <!-- <a class="wb">分享到微博</a> --> 
        </div> 
        <div class="hot_pos_r"> 
         <div class="mb10"> 
          <a href="h/c/8143.jsp" target="_blank"> A </a> 
         </div> 
         <span> <em class="c7"> 领域： </em> A </span> 
         <span> <em class="c7"> 创始人： </em> 罗军 </span> 
         <br /> 
         <span> <em class="c7"> 阶段： </em> 成长型(B轮) </span> 
         <span> <em class="c7"> 规模： </em> 500-2000人 </span> 
         <ul class="companyTags reset"> 
          <li> 绩效奖金 </li> 
          <li> 五险一金 </li> 
          <li> 带薪年假 </li> 
         </ul> 
        </div> </li> 
       <li class="odd clearfix"> 
        <div class="hot_pos_l"> 
         <div class="mb10"> 
          <a href="h/jobs/123599.jsp" target="_blank"> A </a> &nbsp; 
          <span class="c9"> [北京] </span> 
         </div> 
         <span> <em class="c7"> 月薪： </em> 10k-13k </span> 
         <span> <em class="c7"> 经验： </em> 3-5年 </span> 
         <span> <em class="c7"> 最低学历： </em> 本科 </span> 
         <br /> 
         <br /> 
         <span> 14:16发布 </span> 
         <!-- <a class="wb">分享到微博</a> --> 
        </div> 
        <div class="hot_pos_r"> 
         <div class="mb10"> 
          <a href="h/c/8143.jsp" target="_blank"> a </a> 
         </div> 
         <span> <em class="c7"> 领域： </em> A </span> 
         <span> <em class="c7"> 创始人： </em> 罗军 </span> 
         <br /> 
         <span> <em class="c7"> 阶段： </em> 成长型(B轮) </span> 
         <span> <em class="c7"> 规模： </em> 500-2000人 </span> 
         <ul class="companyTags reset"> 
          <li> 绩效奖金 </li> 
          <li> 五险一金 </li> 
          <li> 带薪年假 </li> 
         </ul> 
        </div> </li> 
       <li class="clearfix"> 
        <div class="hot_pos_l"> 
         <div class="mb10"> 
          <a href="h/jobs/120897.jsp" target="_blank"> A </a> &nbsp; 
          <span class="c9"> [北京] </span> 
         </div> 
         <span> <em class="c7"> 月薪： </em> 8k-12k </span> 
         <span> <em class="c7"> 经验： </em> 3-5年 </span> 
         <span> <em class="c7"> 最低学历： </em> 本科 </span> 
         <br /> 
         <br /> 
         <span> 14:16发布 </span> 
         <!-- <a class="wb">分享到微博</a> --> 
        </div> 
        <div class="hot_pos_r"> 
         <div class="mb10"> 
          <a href="h/c/8143.jsp" target="_blank"> A </a> 
         </div> 
         <span> <em class="c7"> 领域： </em> A </span> 
         <span> <em class="c7"> 创始人： </em> 罗军 </span> 
         <br /> 
         <span> <em class="c7"> 阶段： </em> 成长型(B轮) </span> 
         <span> <em class="c7"> 规模： </em> 500-2000人 </span> 
         <ul class="companyTags reset"> 
          <li> 绩效奖金 </li> 
          <li> 五险一金 </li> 
          <li> 带薪年假 </li> 
         </ul> 
        </div> </li> 
       <li class="odd clearfix"> 
        <div class="hot_pos_l"> 
         <div class="mb10"> 
          <a href="h/jobs/120282.jsp" target="_blank"> A </a> &nbsp; 
          <span class="c9"> [北京] </span> 
         </div> 
         <span> <em class="c7"> 月薪： </em> 15k-22k </span> 
         <span> <em class="c7"> 经验： </em> 5-10年 </span> 
         <span> <em class="c7"> 最低学历： </em> 本科 </span> 
         <br /> 
         <span> <em class="c7"> 职位诱惑： </em> 六险一金，饭补，班车，晋升机制，氛围好 </span> 
         <br /> 
         <span> 14:16发布 </span> 
         <!-- <a class="wb">分享到微博</a> --> 
        </div> 
        <div class="hot_pos_r"> 
         <div class="mb10"> 
          <a href="h/c/8143.jsp" target="_blank"> A </a> 
         </div> 
         <span> <em class="c7"> 领域： </em> A </span> 
         <span> <em class="c7"> 创始人： </em> 罗军 </span> 
         <br /> 
         <span> <em class="c7"> 阶段： </em> 成长型(B轮) </span> 
         <span> <em class="c7"> 规模： </em> 500-2000人 </span> 
         <ul class="companyTags reset"> 
          <li> 绩效奖金 </li> 
          <li> 五险一金 </li> 
          <li> 带薪年假 </li> 
         </ul> 
        </div> </li> 
       <li class="clearfix"> 
        <div class="hot_pos_l"> 
         <div class="mb10"> 
          <a href="h/jobs/91655.jsp" target="_blank"> 市场经理 </a> &nbsp; 
          <span class="c9"> [北京] </span> 
         </div> 
         <span> <em class="c7"> 月薪： </em> 10k-15k </span> 
         <span> <em class="c7"> 经验： </em> 5-10年 </span> 
         <span> <em class="c7"> 最低学历： </em> 本科 </span> 
         <br /> 
         <span> <em class="c7"> 职位诱惑： </em> 六险一金，饭补，班车，晋升机制，氛围好 </span> 
         <br /> 
         <span> 14:16发布 </span> 
         <!-- <a class="wb">分享到微博</a> --> 
        </div> 
        <div class="hot_pos_r"> 
         <div class="mb10"> 
          <a href="h/c/8143.jsp" target="_blank"> A </a> 
         </div> 
         <span> <em class="c7"> 领域： </em> A </span> 
         <span> <em class="c7"> 创始人： </em> 罗军 </span> 
         <br /> 
         <span> <em class="c7"> 阶段： </em> 成长型(B轮) </span> 
         <span> <em class="c7"> 规模： </em> 500-2000人 </span> 
         <ul class="companyTags reset"> 
          <li> 绩效奖金 </li> 
          <li> 五险一金 </li> 
          <li> 带薪年假 </li> 
         </ul> 
        </div> </li> 
       <a href="list.jsp?city=%E5%85%A8%E5%9B%BD" class="btn fr" target="_blank"> 查看更多 </a> 
      </ul> 
     </div> 
     <div class="clear"> 
     </div> 
<!--    
	<div id="linkbox"> 
      <dl> 
       <dt>
         友情链接 
       </dt> 
       <dd> 
        <a href="http://www.zhuqu.com/" target="_blank"> 住趣家居网 </a> 
        <span> | </span> 
        <a href="http://www.woshipm.com/" target="_blank"> 人人都是产品经理 </a> 
        <span> | </span> 
        <a href="http://lieyunwang.com/" target="_blank"> 猎云网 </a> 
        <span> | </span> 
        <a href="http://www.ucloud.cn/" target="_blank"> UCloud </a> 
        <span> | </span> 
        <a href="http://www.iconfans.com/" target="_blank"> iconfans </a> 
        <span> | </span> 
        <a href="http://www.jsp5dw.com/" target="_blank"> html5梦工厂 </a> 
        <span> | </span> 
        <a href="http://www.sykong.com/" target="_blank"> 手游那点事 </a> 
        <a href="http://www.php100.com/" target="_blank"> php100 </a> 
        <span> | </span> 
        <a href="http://www.uehtml.com/" target="_blank"> uehtml </a> 
        <span> | </span> 
        <a href="http://www.w3cplus.com/" target="_blank"> W3CPlus </a> 
        <span> | </span> 
        <a href="http://www.boxui.com/" target="_blank"> 盒子UI </a> 
        <span> | </span> 
        <a href="http://www.uimaker.com/" target="_blank"> uimaker </a> 
        <span> | </span> 
        <a href="http://www.yixieshi.com/" target="_blank"> 互联网的一些事 </a> 
        <span> | </span> 
        <a href="http://www.chuanke.com/" target="_blank"> 传课网 </a> 
        <span> | </span> 
        <a href="http://www.eoe.cn/" target="_blank"> 安卓开发 </a> 
        <span> | </span> 
        <a href="http://www.eoeandroid.com/" target="_blank"> 安卓开发论坛 </a> 
        <a href="http://hao.360.cn/" target="_blank"> 360安全网址导航 </a> 
        <span> | </span> 
        <a href="http://se.360.cn/" target="_blank"> 360安全浏览器 </a> 
        <span> | </span> 
        <a href="http://www.hao123.com/" target="_blank"> hao123上网导航 </a> 
        <span> | </span> 
        <a href="http://www.ycpai.com" target="_blank"> 互联网创业 </a> 
        <span> | </span> 
        <a href="http://www.zhongchou.cn" target="_blank"> 众筹网 </a> 
        <span> | </span> 
        <a href="http://www.marklol.com/" target="_blank"> 马克互联网 </a> 
        <span> | </span> 
        <a href="http://www.chaohuhr.com/" target="_blank"> 巢湖英才网 </a> 
        <a href="http://www.zhubajie.com/" target="_blank"> 创意服务外包 </a> 
        <span> | </span> 
        <a href="http://www.thinkphp.cn/" target="_blank"> thinkphp </a> 
        <span> | </span> 
        <a href="http://www.chuangxinpai.com/" target="_blank"> 创新派 </a> 
        <span> | </span> 
        <a href="http://w3cshare.com/" target="_blank"> W3Cshare </a> 
        <span> | </span> 
        <a href="http://www.518lunwen.cn/" target="_blank"> 论文发表网 </a> 
        <span> | </span> 
        <a href="http://www.199it.com" target="_blank"> 199it </a> 
        <span> | </span> 
        <a href="http://www.shichangbu.com" target="_blank"> 市场部网 </a> 
        <span> | </span> 
        <a href="http://www.meitu.com/" target="_blank"> 美图公司 </a> 
        <span> | </span> 
        <a href="https://www.teambition.com/" target="_blank"> Teambition </a> 
        <a href="http://oupeng.com/" target="_blank"> 欧朋浏览器 </a> 
        <span> | </span> 
        <a href="http://iwebad.com/" target="_blank"> 网络广告人社区 </a> 
        <a href="h/af/flink.jsp" target="_blank" class="more"> 更多 </a> 
       </dd> 
      </dl> 
     </div> 
	 !-->
    </div> 
    <input type="hidden" value="" name="userid" id="userid" /> 
    <!-- <div id="qrSide"><a></a></div> --> 
    <!-- --> 
    <!-- <div id="loginToolBar">
        <div>
        <em></em>
        <img src="style/images/footbar_logo.png" width="138" height="45" />
        <span class="companycount"></span>
        <span class="positioncount"></span>
        <a href="#loginPop" class="bar_login inline" title="登录"><i></i></a>
        <div class="right">
        <a href="register.jsp?from=index_footerbar" onclick="_hmt.push(['_trackEvent', 'button', 'click', 'register'])" class="bar_register" id="bar_register" target="_blank"><i></i></a>
        </div>
        <input type="hidden" id="cc" value="16002" />
        <input type="hidden" id="cp" value="96531" />
        </div>
        </div>
        --> 
    <!--弹窗lightbox -----------------------------------------> 
    <div style="display:none;"> 
     <!-- 登录框 --> 
     <div id="loginPop" class="popup" style="height:240px;"> 
      <form id="loginForm"> 
       <input type="text" id="email" name="email" tabindex="1" placeholder="请输入登录邮箱地址" /> 
       <input type="password" id="password" name="password" tabindex="2" placeholder="请输入密码" /> 
       <span class="error" style="display:none;" id="beError"> </span> 
       <label class="fl" for="remember"> <input type="checkbox" id="remember" value="" checked="checked" name="autoLogin" /> 记住我 </label> 
       <a href="h/reset.jsp" class="fr"> 忘记密码？ </a> 
       <input type="submit" id="submitLogin" value="登 &nbsp; &nbsp; 录" /> 
      </form> 
      <div class="login_right"> 
       <div>
         还没有医伯乐帐号？ 
       </div> 
       <a href="register.jsp" class="registor_now"> 立即注册 </a> 
       <div class="login_others">
         使用以下帐号直接登录: 
       </div> 
       <a href="h/ologin/auth/sina.jsp" target="_blank" id="icon_wb" class="icon_wb" title="使用新浪微博帐号登录"> </a> 
       <a href="h/ologin/auth/qq.jsp" class="icon_qq" id="icon_qq" target="_blank" title="使用腾讯QQ帐号登录"> </a> 
      </div> 
     </div> 
     <!--/#loginPop--> 
    </div> 
    <!-- end -----------------------------------------> 
    <script type="text/javascript" src="style/js/Chart.min.js">
        </script> 
    <script type="text/javascript" src="style/js/home.min.js">
        </script> 
    <script type="text/javascript" src="style/js/count.js">
        </script> 
    <div class="clear"> 
    </div> 
    <input type="hidden" id="resubmitToken" value="" /> 
    <a id="backtop" title="回到顶部" rel="nofollow"> </a> 
   </div> 
   <!-- end #container --> 
  </div> 
  <!-- end #body --> 
  <div id="footer"> 
   <div class="wrapper"> 
    <a href="h/about.jsp" target="_blank" rel="nofollow"> 联系我们 </a> 
    <a href="#" target="_blank"> 公司导航 </a> 
    <a href="#" target="_blank" rel="nofollow"> 微博 </a> 
    <a href="javascript:void(0)" rel="nofollow"> 微信 <i> </i> </a> 
    <div class="copyright">
      &copy;2017-2018  
     <a target="_blank" href="http://www.miitbeian.gov.cn/state/outPortal/loginPortal.action"> 京ICP备14023790号-2 </a> 
    </div> 
   </div> 
  </div> 
  <script type="text/javascript" src="style/js/core.min.js">
    </script> 
  <script type="text/javascript" src="style/js/popup.min.js">
    </script> 
  <!-- <script src="style/js/wb.js" type="text/javascript" charset="utf-8"></script>
    -->  
 </body>
</html>
