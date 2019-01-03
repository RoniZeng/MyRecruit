<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
﻿<!DOCTYPE html>
<html xmlns:wb="http://open.weibo.com/wb">
 <head> 
  <script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js"></script> 
  <meta http-equiv="Cache-Control" content="no-siteapp" /> 
  <link rel="alternate" media="handheld" /> 
  <!-- end 云适配 --> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
  <title>职位搜索-医伯乐-最专业的医药招聘平台</title> 
  <meta property="qc:admins" content="23635710066417756375" /> 
  <meta content="前端开发招聘  全国地区招聘 紫色医疗招聘前端开发,月薪:10k-20k,要求:本科及以上学历,3-5年工作经验。职位诱惑：借移动医疗大势享受坐直升飞机的职场发展 公司规模:15-50人移动互联网 ,健康医疗类公司招聘信息汇总  最新最热门互联网行业招聘信息，尽在拉勾网" name="description" /> 
  <meta content="前端开发招聘,全国地区前端开发招聘,紫色医疗招聘前端开发,移动互联网 类公司招聘信息汇总,健康医疗类公司招聘信息汇总,拉勾招聘,拉勾网,互联网招聘" name="keywords" /> 
  <meta name="baidu-site-verification" content="QIQ6KC1oZ6" /> 
  <!-- <div class="web_root"  style="display:none">h</div> --> 
  <script type="text/javascript">
var ctx = "h";
console.log(1);
</script> 
  <link rel="Shortcut Icon" href="http://www.lagou.com/h/images/favicon.ico" /> 
  <link rel="stylesheet" type="text/css" href="style/css/style.css" /> 
  <link rel="stylesheet" type="text/css" href="style/css/external.min.css" /> 
  <link rel="stylesheet" type="text/css" href="style/css/popup.css" /> 
  <script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script> 
  <script type="text/javascript" src="style/js/jquery.lib.min.js"></script> 
  <script src="style/js/ajaxfileupload.js" type="text/javascript"></script> 
  <script type="text/javascript" src="style/js/additional-methods.js"></script> 
  <!--[if lte IE 8]>
    <script type="text/javascript" src="style/js/excanvas.js"></script>
<![endif]--> 
  <script type="text/javascript">
var youdao_conv_id = 271546; 
</script> 
  <script type="text/javascript" src="style/js/conv.js"></script> 
  <script>
  var PAGE=1;
  var TYPE=0;
  var WORD="";
  function LASTPAGE(){
  	PAGE--;
  	SEARCH();
  }
  function NEXTPAGE(){
  	PAGE++;
  	SEARCH();
  }	
  function INIT(){
  	PAGE=1;
  	WORD=$("#search_input").val();
	SEARCH();

  }
  function SEARCH(){
  	if(WORD==null||WORD==""){
  		alert("请输入关键字!");
  		return;
  	}
  	if(TYPE==0){
  
  		$.post("selectReciritmentAll.action",{
  		"reciritment.position.name":WORD,
  		"pageNow":PAGE,
  		"pagesize":5
  		},function(data){
  			$("#show").html(data);
  		});
  	}else{
  		$.post("selectReciritmentAll.action",{
  		"reciritment.company.name":WORD,
  		"pageNow":PAGE,
  		"pagesize":5
  		},function(data){
  			$("#show").html(data);
  		});
  	}
  	
  }
  function T(){
  	if(TYPE==0) TYPE=1;
  	else TYPE=0;
  }
  
  </script>
 </head> 
 <body> 
  <div id="body"> 
   <div id="header"> 
    <div class="wrapper"> 
     <a href="index.jsp" class="logo"> <img src="style/images/logo.png" width="229" height="43" alt="拉勾招聘-专注互联网招聘" /> </a> 
     <ul class="reset" id="navheader"> 
      <li><a href="index.jsp">首页</a></li> 
      <li><a rel="nofollow" href="jianli.jsp">我的简历</a></li> 
      <li class="current"><a rel="nofollow" href="list.jsp">找工作</a></li> 
     </ul> 
     <dl class="collapsible_menu"> 
      <dt> 
       <span>个人中心</span> 
       <i></i> 
      </dt> 
      <dd> 
       <a href="list.jsp">找工作</a> 
      </dd> 
      <dd> 
       <a rel="nofollow" href="jianli.jsp">我的简历</a> 
      </dd> 
      <dd> 
       <a href="collections.jsp">我收藏的职位</a> 
      </dd> 
      
      <!-- 
      <dd> 
       <a href="delivery.jsp">我投递的职位 <span id="noticeNo" class="red dn">(0)</span></a> 
      </dd>  -->
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
    <div class="sidebar"> 
     <div id="options" class="greybg"> 
      <dl> 
       <dt>
        月薪范围 
        <em></em>
       </dt> 
       <dd> 
        <div>
         2k以下
        </div> 
        <div>
         2k-5k
        </div> 
        <div>
         5k-10k
        </div> 
        <div>
         10k-15k
        </div> 
        <div>
         15k-25k
        </div> 
        <div>
         25k-50k
        </div> 
        <div>
         50k以上
        </div> 
       </dd> 
      </dl> 
      <dl> 
       <dt>
        工作经验 
        <em></em>
       </dt> 
       <dd> 
        <div>
         不限
        </div> 
        <div>
         应届毕业生
        </div> 
        <div>
         1年以下
        </div> 
        <div>
         1-3年
        </div> 
        <div>
         3-5年
        </div> 
        <div>
         5-10年
        </div> 
        <div>
         10年以上
        </div> 
       </dd> 
      </dl> 
      <dl> 
       <dt>
        最低学历 
        <em></em>
       </dt> 
       <dd> 
        <div>
         不限
        </div> 
        <div>
         大专
        </div> 
        <div>
         本科
        </div> 
        <div>
         硕士
        </div> 
        <div>
         博士
        </div> 
       </dd> 
      </dl> 
      <dl> 
       <dt>
        工作性质 
        <em></em>
       </dt> 
       <dd> 
        <div>
         全职
        </div> 
        <div>
         兼职
        </div> 
        <div>
         实习
        </div> 
       </dd> 
      </dl> 
      <dl> 
       <dt>
        发布时间 
        <em></em>
       </dt> 
       <dd> 
        <div>
         今天
        </div> 
        <div>
         3天内
        </div> 
        <div>
         一周内
        </div> 
        <div>
         一月内
        </div> 
       </dd> 
      </dl> 
     </div> 
     <!-- QQ群 --> 
     <div class="qq_group">
       加入
      <span></span>QQ群 
      <div class="f18">
       跟同行聊聊
      </div> 
      <p>1111111</p> 
     </div> 
     <!-- 对外合作广告位  --> 
     <a href="http://www.w3cplus.com/" target="_blank" class="partnersAd"> <img src="style/images/3.jpg" width="230" height="80" alt="w3cplus" /> </a> 
     
     <a href="http://linux.cn/" target="_blank" class="partnersAd"> <img src="style/images/linuxcn.png" width="230" height="80" alt="Linux中文社区" /> </a> 
    
     <a href="http://www.imooc.com" target="_blank" class="partnersAd"> <img src="style/images/2.jpg" width="230" height="80" alt="幕课网" /> </a> 
     <!-- 	            <a href="http://www.osforce.cn/" target="_blank" class="partnersAd">
	            	<img src="style/images/osf-lg.jpg" width="230" height="80" alt="开源力量"  />
	            </a>
	         --> 
    </div> 
    <div class="content"> 
     <div id="search_box"> 
      <div id="searchForm" name="searchForm" action="list.jsp" method="get"> 
       <ul id="searchType"> 
        <li data-searchtype="1" class="type_selected" id="S1" >职位</li> 
        <li data-searchtype="4" id="S2" onclick="T();">公司</li> 
       </ul> 
       <div class="searchtype_arrow"></div> 
       <script>
     
       </script>
       <input type="text" id="search_input" name="kd" tabindex="1" placeholder="请输入职位名称，如：临床医生" /> 
       <input type="hidden" name="spc" id="spcInput" value="1" /> 
       <input type="hidden" name="pl" id="plInput" value="" /> 
       <input type="hidden" name="gj" id="gjInput" value="" /> 
       <input type="hidden" name="xl" id="xlInput" value="" /> 
       <input type="hidden" name="yx" id="yxInput" value="" /> 
       <input type="hidden" name="gx" id="gxInput" value="" /> 
       <input type="hidden" name="st" id="stInput" value="" /> 
       <input type="hidden" name="labelWords" id="labelWords" value="label" /> 
       <input type="hidden" name="lc" id="lc" value="" /> 
       <input type="hidden" name="workAddress" id="workAddress" value="" /> 
       <input type="hidden" name="city" id="cityInput" value="全国" /> 
       <input type="submit" id="search_button" onclick="INIT();" value="搜索" /> 
      
      </div> 
     </div> 
     <style>
.ui-autocomplete{width:488px;background:#fafafa !important;position: relative;z-index:10;border: 2px solid #91cebe;}
.ui-autocomplete-category{font-size:16px;color:#999;width:50px;position: absolute;z-index:11; right: 0px;/*top: 6px; */text-align:center;border-top: 1px dashed #e5e5e5;padding:5px 0;}
.ui-menu-item{ *width:439px;vertical-align: middle;position: relative;margin: 0px;margin-right: 50px !important;background:#fff;border-right: 1px dashed #ededed;}
.ui-menu-item a{display:block;overflow:hidden;}
</style> 
     <script type="text/javascript" src="style/js/search.min.js"></script> 
     <div class="breakline"></div> 
     <dl class="workplace" id="workplaceSelect"> 
      <dt class="fl">
       工作地点：
      </dt> 
      <dd> 
       <a href="javascript:;" class="current">全国</a> | 
      </dd> 
      <dd> 
       <a href="javascript:;">北京</a> | 
      </dd> 
      <dd> 
       <a href="javascript:;">上海</a> | 
      </dd> 
      <dd> 
       <a href="javascript:;">广州</a> | 
      </dd> 
      <dd> 
       <a href="javascript:;">深圳</a> | 
      </dd> 
      <dd> 
       <a href="javascript:;">成都</a> | 
      </dd> 
      <dd> 
       <a href="javascript:;">杭州</a> | 
      </dd> 
      <dd> 
       <a href="javascript:;">武汉</a> | 
      </dd> 
      <dd> 
       <a href="javascript:;">南京</a> | 
      </dd> 
      <dd class="more"> 
       <a href="javascript:;">其他</a> 
       <div class="triangle citymore_arrow"></div> 
      </dd> 
      <dd id="box_expectCity" class="searchlist_expectCity dn"> 
       <span class="bot"></span> 
       <span class="top"></span> 
       <dl> 
        <dt>
         ABCDEF
        </dt> 
        <dd> 
         <span>北京</span> 
         <span>长春</span> 
         <span>成都</span> 
         <span>重庆</span> 
         <span>长沙</span> 
         <span>常州</span> 
         <span>东莞</span> 
         <span>大连</span> 
         <span>佛山</span> 
         <span>福州</span> 
        </dd> 
       </dl> 
       <dl> 
        <dt>
         GHIJ
        </dt> 
        <dd> 
         <span>贵阳</span> 
         <span>广州</span> 
         <span>哈尔滨</span> 
         <span>合肥</span> 
         <span>海口</span> 
         <span>杭州</span> 
         <span>惠州</span> 
         <span>金华</span> 
         <span>济南</span> 
         <span>嘉兴</span> 
        </dd> 
       </dl> 
       <dl> 
        <dt>
         KLMN
        </dt> 
        <dd> 
         <span>昆明</span> 
         <span>廊坊</span> 
         <span>宁波</span> 
         <span>南昌</span> 
         <span>南京</span> 
         <span>南宁</span> 
         <span>南通</span> 
        </dd> 
       </dl> 
       <dl> 
        <dt>
         OPQR
        </dt> 
        <dd> 
         <span>青岛</span> 
         <span>泉州</span> 
        </dd> 
       </dl> 
       <dl> 
        <dt>
         STUV
        </dt> 
        <dd> 
         <span>上海</span> 
         <span>石家庄</span> 
         <span>绍兴</span> 
         <span>沈阳</span> 
         <span>深圳</span> 
         <span>苏州</span> 
         <span>天津</span> 
         <span>太原</span> 
         <span>台州</span> 
        </dd> 
       </dl> 
       <dl> 
        <dt>
         WXYZ
        </dt> 
        <dd> 
         <span>武汉</span> 
         <span>无锡</span> 
         <span>温州</span> 
         <span>西安</span> 
         <span>厦门</span> 
         <span>烟台</span> 
         <span>珠海</span> 
         <span>中山</span> 
         <span>郑州</span> 
        </dd> 
       </dl> 
      </dd> 
     </dl> 
  
 <dl class="workplace" id="workplaceSelect"> 

     	 <dd style="float:right;margin-right:5px;">
     	  	<a onclick="LASTPAGE()" class="current">上一页</a> 
      	 	<a onclick="NEXTPAGE()" class="current">下一页</a> 
    	  </dd> 
    	  </dl>  
   
    <!-- ee -->
      <ul class="hot_pos reset" id="show">  
      </ul>

</div>
    
    <div class="clear"></div> 
    <input type="hidden" id="resubmitToken" value="" /> 
    <a id="backtop" title="回到顶部" rel="nofollow"></a> 
   </div>
   <!-- end #container --> 
  </div>
  <!-- end #body --> 
  <div id="footer"> 
   <div class="wrapper"> 
    <a href="about.jsp" target="_blank" rel="nofollow">联系我们</a> 
    <a href="#" target="_blank">公司导航</a> 
    <a href="#" target="_blank" rel="nofollow">微博</a> 
    <a href="javascript:void(0)" rel="nofollow">微信<i></i></a> 
    <div class="copyright">
     &copy;2017-2018
     <a target="_blank" href="http://www.miitbeian.gov.cn/state/outPortal/loginPortal.action">京ICP备14023790号-2</a>
    </div> 
   </div> 
  </div> 
  <script type="text/javascript" src="style/js/core.min.js"></script> 
  <script type="text/javascript" src="style/js/popup.min.js"></script> 
  <!--  -->  
 </body>
</html>
