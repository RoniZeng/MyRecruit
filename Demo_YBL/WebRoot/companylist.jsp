<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			全国-公司列表-医伯乐-最专业的医药招聘平台
		</title> 
  <meta property="qc:admins" content="23635710066417756375" /> 
  <meta content="全国condition-condition-公司列表-医伯乐-最专业的医药招聘平台" name="description" /> 
  <meta content="全国condition-公司列表-医伯乐-最专业的医药招聘平台" name="keywords" /> 
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
      <li> <a href="index.jsp"> 首页 </a> </li> 
      <li class="current"> <a href="companylist.jsp"> 公司 </a> </li> 
      <li> <a href="jianli.jsp" rel="nofollow"> 我的简历 </a> </li> 
      <li> <a href="create.jsp" rel="nofollow"> 发布职位 </a> </li> 
     </ul> 
     				<s:if test="#session.userIdentity==0">
					<ul class="loginTop">
						<li><a href="jianli.jsp" rel="nofollow"> 个人中心 </a></li>
					</ul>
				</s:if>
				<s:elseif test="#session.userIdentity==1">
					<ul class="loginTop">
						<li><a href="create.jsp" rel="nofollow"> 个人中心 </a></li>
					</ul>
				</s:elseif>
				<s:else>
					<ul class="loginTop">
						<li><a href="login.jsp" rel="nofollow"> 登录 </a></li>
						<li>|</li>
						<li><a href="register.jsp" rel="nofollow"> 注册 </a></li>
					</ul>
				</s:else> 
    </div> 
   </div> 
   <!-- end #header --> 
   <div id="container"> 
    <div class="clearfix"> 
     <div class="content_l"> 
      <form id="companyListForm" name="companyListForm" method="get" action="h/c/companylist.jsp"> 
       <input type="hidden" id="city" name="city" value="全国" /> 
       <input type="hidden" id="fs" name="fs" value="" /> 
       <input type="hidden" id="ifs" name="ifs" value="" /> 
       <input type="hidden" id="ol" name="ol" value="" /> 
       <dl class="hc_tag"> 
        <dt> 
         <!-- <h2 class="fl">热门公司</h2> --> 
         <ul class="workplace reset fr" id="workplaceSelect"> 
          <li> <a href="javascript:void(0)" class="current"> 全国 </a> | </li> 
          <li> <a href="javascript:void(0)"> 北京 </a> | </li> 
          <li> <a href="javascript:void(0)"> 上海 </a> | </li> 
          <li> <a href="javascript:void(0)"> 广州 </a> | </li> 
          <li> <a href="javascript:void(0)"> 深圳 </a> | </li> 
          <li> <a href="javascript:void(0)"> 成都 </a> | </li> 
          <li> <a href="javascript:void(0)"> 杭州 </a> | </li> 
          <li> <a href="javascript:void(0)"> 武汉 </a> | </li> 
          <li> <a href="javascript:void(0)"> 南京 </a> | </li> 
          <li class="more"> <a href="javascript:void(0)"> 其他 </a> 
           <div class="triangle citymore_arrow"> 
           </div> </li> 
          <li id="box_expectCity" class="searchlist_expectCity dn"> <span class="bot"> </span> <span class="top"> </span> 
           <dl> 
            <dt>
              ABCDEF 
            </dt> 
            <dd> 
             <span> 北京 </span> 
             <span> 长春 </span> 
             <span> 成都 </span> 
             <span> 重庆 </span> 
             <span> 长沙 </span> 
             <span> 常州 </span> 
             <span> 东莞 </span> 
             <span> 大连 </span> 
             <span> 佛山 </span> 
             <span> 福州 </span> 
            </dd> 
           </dl> 
           <dl> 
            <dt>
              GHIJ 
            </dt> 
            <dd> 
             <span> 贵阳 </span> 
             <span> 广州 </span> 
             <span> 哈尔滨 </span> 
             <span> 合肥 </span> 
             <span> 海口 </span> 
             <span> 杭州 </span> 
             <span> 惠州 </span> 
             <span> 金华 </span> 
             <span> 济南 </span> 
             <span> 嘉兴 </span> 
            </dd> 
           </dl> 
           <dl> 
            <dt>
              KLMN 
            </dt> 
            <dd> 
             <span> 昆明 </span> 
             <span> 廊坊 </span> 
             <span> 宁波 </span> 
             <span> 南昌 </span> 
             <span> 南京 </span> 
             <span> 南宁 </span> 
             <span> 南通 </span> 
            </dd> 
           </dl> 
           <dl> 
            <dt>
              OPQR 
            </dt> 
            <dd> 
             <span> 青岛 </span> 
             <span> 泉州 </span> 
            </dd> 
           </dl> 
           <dl> 
            <dt>
              STUV 
            </dt> 
            <dd> 
             <span> 上海 </span> 
             <span> 石家庄 </span> 
             <span> 绍兴 </span> 
             <span> 沈阳 </span> 
             <span> 深圳 </span> 
             <span> 苏州 </span> 
             <span> 天津 </span> 
             <span> 太原 </span> 
             <span> 台州 </span> 
            </dd> 
           </dl> 
           <dl> 
            <dt>
              WXYZ 
            </dt> 
            <dd> 
             <span> 武汉 </span> 
             <span> 无锡 </span> 
             <span> 温州 </span> 
             <span> 西安 </span> 
             <span> 厦门 </span> 
             <span> 烟台 </span> 
             <span> 珠海 </span> 
             <span> 中山 </span> 
             <span> 郑州 </span> 
            </dd> 
           </dl> </li> 
         </ul> 
        </dt> 
        <dd> 
         <dl> 
          <dt>
            医院等级： 
          </dt> 
          <dd> 
           <a href="javascript:void(0)"> 三甲 </a> 
           <a href="javascript:void(0)"> 三乙 </a> 
           <a href="javascript:void(0)"> 三级 </a> 
           <a href="javascript:void(0)"> 二甲 </a> 
		   <a href="javascript:void(0)"> 二乙 </a> 
		   <a href="javascript:void(0)"> 二级 </a> 
		   <a href="javascript:void(0)"> 一甲 </a> 
		   <a href="javascript:void(0)"> 一乙 </a> 
		   <a href="javascript:void(0)"> 一级 </a> 
		   <a href="javascript:void(0)"> 其他 </a> 
		   
          </dd> 
         </dl> 
         <dl> 
          <dt>
            企业类型： 
          </dt> 
          <dd> 
           <a href="javascript:void(0)"> 公立医院 </a> 
           <a href="javascript:void(0)"> 民营医院 </a> 
           <a href="javascript:void(0)"> 生物企业 </a> 
           <a href="javascript:void(0)"> 医药企业  </a> 
           <a href="javascript:void(0)"> 网络出版 </a> 
           <a href="javascript:void(0)"> 科研院校 </a> 
           <a href="javascript:void(0)"> 诊所药房 </a> 
           <a href="javascript:void(0)"> 其他单位 </a> 
          </dd> 
         </dl> 
        </dd> 
       </dl> 
       <ul class="hc_list reset"> 
        <li style="clear:both;"> <a href="h/c/25829.jsp" target="_blank"> <h3 title="CCIC"> CCIC </h3> 
          <div class="comLogo"> 
           <img src="style/images/logo_default.png" width="190" height="190" alt="CCIC" /> 
           <ul> 
            <li> A </li> 
            <li> 深圳，D轮及以上 </li> 
           </ul> 
          </div> </a> 
         <ul class="reset ctags"> 
          <li> D轮及以上 </li> 
          <li> A </li> 
          <li> 年终分红 </li> 
          <li> 绩效奖金 </li> 
          <li> 五险一金 </li> 
          <li> 交通补助 </li> 
         </ul> </li> 
        <li> <a href="h/c/25836.jsp" target="_blank"> <h3 title="MOMO"> b </h3> 
          <div class="comLogo"> 
           <img src="style/images/logo_default.png" width="190" height="190" alt="MOMO" /> 
           <ul> 
            <li> A </li> 
            <li> 西安，C轮 </li> 
           </ul> 
          </div> </a> 
         <ul class="reset ctags"> 
          <li> C轮 </li> 
          <li> A </li> 
          <li> 五险 </li> 
          <li> 年度旅游 </li> 
          <li> 扁平管理 </li> 
         </ul> </li> 
        <li> <a href="h/c/25842.jsp" target="_blank"> <h3 title="博雅"> 博雅 </h3> 
          <div class="comLogo"> 
           <img src="style/images/logo_default.png" width="190" height="190" alt="博雅" /> 
           <ul> 
            <li> A </li> 
            <li> 北京，B轮 </li> 
           </ul> 
          </div> </a>
         <ul class="reset ctags"> 
          <li> B轮 </li> 
          <li> 股票期权 </li> 
          <li> 绩效奖金 </li> 
          <li> 五险一金 </li> 
         </ul> </li> 
        <li style="clear:both;"> <a href="h/c/25851.jsp" target="_blank"> <h3 title="a"> a </h3> 
          <div class="comLogo"> 
           <img src="style/images/logo_default.png" width="190" height="190" alt="a" /> 
           <ul> 
            <li> 医疗 </li> 
            <li> 郑州，D轮及以上 </li> 
           </ul> 
          </div> </a> 
         <ul class="reset ctags"> 
          <li> D轮及以上 </li> 
          <li> 移动互联网 </li> 
          <li> 绩效奖金 </li> 
          <li> 专项奖金 </li> 
          <li> 五险一金 </li> 
          <li> 带薪年假 </li> 
         </ul> </li> 
        <li> <a href="h/c/25856.jsp" target="_blank"> <h3 title="世纪优优"> 世纪优优 </h3> 
          <div class="comLogo"> 
           <img src="style/images/logo_default.png" width="190" height="190" alt="世纪优优" /> 
           <ul> 
            <li> 视频多媒体,媒体 </li> 
            <li> 北京，D轮及以上 </li> 
           </ul> 
          </div> </a> 
         <ul class="reset ctags"> 
          <li> D轮及以上 </li> 
          <li> 视频多媒体 </li> 
          <li> 媒体 </li> 
          <li> 绩效奖金 </li> 
          <li> 股票期权 </li> 
          <li> 五险一金 </li> 
         </ul> </li> 
        <li> <a href="h/c/25862.jsp" target="_blank"> <h3 title="易迅"> 易迅 </h3> 
          <div class="comLogo"> 
           <img src="style/images/logo_default.png" width="190" height="190" alt="易迅" /> 
           <ul> 
            <li> 电子商务 </li> 
            <li> 上海，D轮及以上 </li> 
           </ul> 
          </div> </a> <a href="h/jobs/149194.jsp" target="_blank"> 临床医生 </a> 
         <ul class="reset ctags"> 
          <li> 绩效奖金 </li> 
          <li> 年底双薪 </li> 
          <li> 五险一金 </li> 
          <li> 岗位晋升 </li> 
         </ul> </li> 
        <li style="clear:both;"> <a href="h/c/25729.jsp" target="_blank"> <h3 title="大东方"> 大东方 </h3> 
          <div class="comLogo"> 
           <img src="style/images/logo_default.png" width="190" height="190" alt="大东方" /> 
           <ul> 
            <li> 金融互联网 </li> 
            <li> 成都，D轮及以上 </li> 
           </ul> 
          </div> </a> <a href="h/jobs/148097.jsp" target="_blank"> 销售经理 </a> 
         <ul class="reset ctags"> 
          <li> 绩效奖金 </li> 
          <li> 年底双薪 </li> 
          <li> 专项奖金 </li> 
          <li> 五险一金 </li> 
         </ul> </li> 
        <li> <a href="h/c/25738.jsp" target="_blank"> <h3 title="金棕榈"> 金棕榈 </h3> 
          <div class="comLogo"> 
           <img src="style/images/logo_default.png" width="190" height="190" alt="金棕榈" /> 
           <ul> 
            <li> 制药 </li> 
            <li> 上海，B轮 </li> 
           </ul> 
          </div> </a> 
         <ul class="reset ctags"> 
          <li> 绩效奖金 </li> 
          <li> 年底双薪 </li> 
          <li> 通讯津贴 </li> 
         </ul> </li> 
        <li> <a href="h/c/25763.jsp" target="_blank"> <h3 title="永航科技"> 永航科技 </h3> 
          <div class="comLogo"> 
           <img src="style/images/logo_default.png" width="190" height="190" alt="永航科技" /> 
           <ul> 
            <li> 生物企业 </li> 
            <li> 北京，D轮及以上 </li> 
           </ul> 
          </div> </a>
         <ul class="reset ctags"> 
          <li> 绩效奖金 </li> 
          <li> 五险一金 </li> 
          <li> 带薪年假 </li> 
          <li> 定期体检 </li> 
         </ul> </li> 
        <li style="clear:both;"> <a href="h/c/25778.jsp" target="_blank"> <h3 title="北京思特奇"> B </h3> 
          <div class="comLogo"> 
           <img src="style/images/logo_default.png" width="190" height="190" alt="北京思特奇" /> 
           <ul> 
            <li> C </li> 
            <li> 南昌，D轮及以上 </li> 
           </ul> 
          </div> </a> 
         <ul class="reset ctags"> 
          <li> 云计算\大数据 </li> 
          <li> 绩效奖金 </li> 
          <li> 专项奖金 </li> 
          <li> 五险一金 </li> 
         </ul> </li> 
        <li> <a href="h/c/25784.jsp" target="_blank"> <h3 title="瑞德医疗"> 瑞德医疗 </h3> 
          <div class="comLogo"> 
           <img src="style/images/logo_default.png" width="190" height="190" alt="瑞德医疗" /> 
           <ul> 
            <li> 健康医疗 </li> 
            <li> 北京，C轮 </li> 
           </ul> 
          </div> </a> <a href="h/jobs/148433.jsp" target="_blank"> 网络编辑 </a> <a href="h/jobs/148426.jsp" target="_blank"> 市场营销 </a> 
         <ul class="reset ctags"> 
          <li> C轮 </li> 
          <li> 健康医疗 </li> 
         </ul> </li> 
        <li> <a href="h/c/25804.jsp" target="_blank"> <h3 title="乐影网"> C </h3> 
          <div class="comLogo"> 
           <img src="style/images/logo_default.png" width="190" height="190" alt="乐影网" /> 
           <ul> 
            <li> O2O </li> 
            <li> 北京，B轮 </li> 
           </ul> 
          </div> </a> 
         <ul class="reset ctags"> 
          <li> B轮 </li> 
          <li> O2O </li> 
          <li> 五险一金 </li> 
          <li> 带薪年假 </li> 
          <li> 节日礼物 </li> 
          <li> 定期体检 </li> 
         </ul> </li> 
        <li style="clear:both;"> <a href="h/c/25226.jsp" target="_blank"> <h3 title="卓宝计算机"> 卓宝 </h3> 
          <div class="comLogo"> 
           <img src="style/images/logo_default.png" width="190" height="190" alt="卓宝计算机" /> 
           <ul> 
            <li> L </li> 
            <li> 上海，B轮 </li> 
           </ul> 
          </div> </a> 
         <ul class="reset ctags"> 
          <li> B轮 </li> 
          <li> 移动互联网 </li> 
          <li> 视频多媒体 </li> 
          <li> 五险一金 </li> 
          <li> 弹性工作 </li> 
          <li> 年度旅游 </li> 
         </ul> </li> 
        <li> <a href="h/c/25236.jsp" target="_blank"> <h3 title="中科蓝鲸"> 中科蓝鲸 </h3> 
          <div class="comLogo"> 
           <img src="style/images/logo_default.png" width="190" height="190" alt="中科蓝鲸" /> 
           <ul> 
            <li> B </li> 
            <li> 北京，D轮及以上 </li> 
           </ul> 
          </div> </a> 
         <ul class="reset ctags"> 
          <li> D轮及以上 </li> 
          <li> 云计算\大数据 </li> 
          <li> 绩效奖金 </li> 
          <li> 股票期权 </li> 
          <li> 五险一金 </li> 
          <li> 通讯津贴 </li> 
         </ul> </li> 
        <li> <a href="h/c/25268.jsp" target="_blank"> <h3 title="杭州瓷肌"> 杭州瓷肌 </h3> 
          <div class="comLogo"> 
           <img src="style/images/logo_default.png" width="190" height="190" alt="杭州瓷肌" /> 
           <ul> 
            <li> D </li> 
            <li> 杭州，B轮 </li> 
           </ul> 
          </div> </a> 
         <ul class="reset ctags"> 
          <li> B轮 </li> 
          <li> 电子商务 </li> 
          <li> 五险一金 </li> 
          <li> 带薪年假 </li> 
          <li> 节日礼物 </li> 
          <li> 定期体检 </li> 
         </ul> </li> 
       </ul> 
       <div class="Pagination"> 
       </div> 
      </form> 
     </div> 
	 
     <div class="content_r"> 
      <div class="subscribe_side"> 
      
        <!--
		 <a href="subscribe.jsp" target="_blank"> 
		<div class="subpos"> 
         <span> 订阅 </span> 职位 
        </div> 
		!-->
      <!--
		<div class="c7">
          根据你的筛选条件，定期将符合你要求的职位信息发给你 
        </div> 
        <div class="count">
          已有 
         <em> 3 </em> 
         <em> 4 </em> 
         <em> 2 </em> 
         <em> 1 </em> 
         <em> 0 </em> 人订阅 
        </div> <i> 我也要订阅职位 </i> </a> !-->
      </div> 
	  
      <div class="greybg qrcode mt20"> 
       <img src="style/images/companylist_qr.png" width="242" height="242" alt="微信公众号二维码" /> 
       <span class="c7"> 扫描二维码，微信轻松搜工作 </span> 
      </div> 
      <!-- <a href="h/speed/speed3.jsp" target="_blank" class="adSpeed"></a> --> 
     
     </div> 
    </div> 
    <input type="hidden" value="" name="userid" id="userid" /> 
    <script type="text/javascript" src="style/js/company_list.min.js">
				</script> 
    <script>
					$(function() {
						/*分页 */
						$('.Pagination').pager({
							currPage: 1,
							pageNOName: "pn",
							form: "companyListForm",
							pageCount: 20,
							pageSize: 5
						});
					})
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
    <a href="#" target="_blank" rel="nofollow"> 联系我们 </a> 
    <a href="#" target="_blank"> 公司导航 </a> 
    <a href="#" target="_blank" rel="nofollow"> 微博 </a> 
    <a href="style/images/companylist_qr.png" rel="nofollow" > 微信 <i> </i> </a> 
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
  <!-- -->  
 </body>
</html>
