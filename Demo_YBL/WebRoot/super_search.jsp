<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>医伯乐信息管理系统</title> 
<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
<script src="style/js/bootstrap.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="style/css/bootstrap.min.css" />
<style type="text/css">
.dropdown-submenu {
	position: relative;
}

.dropdown-submenu>.dropdown-menu {
	top: 0;
	left: 100%;
	margin-top: -6px;
	margin-left: -1px;
	-webkit-border-radius: 0 6px 6px 6px;
	-moz-border-radius: 0 6px 6px;
	border-radius: 0 6px 6px 6px;
}

.dropdown-submenu:hover>.dropdown-menu {
	display: block;
}

.dropdown-submenu>a:after {
	display: block;
	content: " ";
	float: right;
	width: 0;
	height: 0;
	border-color: transparent;
	border-style: solid;
	border-width: 5px 0 5px 5px;
	border-left-color: #ccc;
	margin-top: 5px;
	margin-right: -10px;
}

.dropdown-submenu:hover>a:after {
	border-left-color: #fff;
}

.dropdown-submenu.pull-left {
	float: none;
}

.dropdown-submenu.pull-left>.dropdown-menu {
	left: -100%;
	margin-left: 10px;
	-webkit-border-radius: 6px 0 6px 6px;
	-moz-border-radius: 6px 0 6px 6px;
	border-radius: 6px 0 6px 6px;
}
</style>
<script>
	var actionname="admin_find";
	var tableName = "";
	var attributeName = "";
	var findString = "";
	var key=0;
	function search(){
		findString=$("#key").val();
		submitAction(actionname,tableName,key,attributeName,findString);
	}
	function submitAction(actionname,tableName,key,attributeName,findString){
		$.post(actionname+".action",{
			"tableName":tableName,
			"attributeName":attributeName,
			"key":key,
			"findString":findString
		},function(data){
			$("#show").html(data);
		});
		
	}
	$(document).ready(function(){
		$(".selectlistItem").click(function(){
			$("#selectlist").hide();
		});
	});
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<h2>医伯乐信息管理系统</h2>
			<hr>
			<div class="dropdown col-sm-1">
				<a id="dLabel" role="button" data-toggle="dropdown"
					class="btn btn-primary" data-target="#" href="javascript:;" onclick="$(this).next().show();"> 选择
					<span class="caret"></span> </a>
				<ul class="dropdown-menu multi-level" role="menu"
					aria-labelledby="dropdownMenu" id="selectlist">
					<li class="dropdown-submenu"><a tabindex="-1"
						href="javascript:;">求职者</a>
						<ul class="dropdown-menu">
							<li><a class="selectlistItem" tabindex="-1" href="javascript:;"
								onclick="$('#word').text('求职者/查看所有求职者');submitAction('admin_find','Employee',0,null,null);">查看所有求职者</a>
							</li>
							<li><a class="selectlistItem"  tabindex="-1" href="javascript:;"
								onclick="tableName='Employee';attributeName='name';key=0;$('#word').text('求职者/根据求职者名字查询');">根据求职者名字查询</a>
							</li>
							<li><a class="selectlistItem"  tabindex="-1" href="javascript:;"
								onclick="tableName='Employee';attributeName='email';key=0;$('#word').text('求职者/根据求职者邮箱查询');">根据求职者邮箱查询</a>
							</li>
							<li><a class="selectlistItem"  tabindex="-1" href="javascript:;"
								onclick="tableName='Employee';attributeName='tel';key=0;$('#word').text('求职者/根据求职者手机号查询');">根据求职者手机号查询</a>
							</li>
							<li><a class="selectlistItem"  tabindex="-1" href="javascript:;"
								onclick="tableName='Employee';attributeName='city';key=0;$('#word').text('求职者/根据求职者所在城市查询');">根据求职者所在城市查询</a>
							</li>
							<li><a class="selectlistItem"  tabindex="-1" href="javascript:;"
								onclick="tableName='Employee';attributeName='degree';key=1;$('#word').text('求职者/根据求职者学历查询');">根据求职者学历查询</a>
							</li>
							<li><a class="selectlistItem"  tabindex="-1" href="javascript:;"
								onclick="tableName='Employee';attributeName='expSalary';key=1;$('#word').text('求职者/根据求职者薪资查询');">根据求职者薪资查询</a>
							</li>
							
						</ul></li>
					<li class="dropdown-submenu"><a tabindex="-1"
						href="javascript:;">公司</a>
						<ul class="dropdown-menu">
							<li><a class="selectlistItem" tabindex="-1" href="javascript:;"
								onclick="$('#word').text('公司/查看所有公司');submitAction('admin_find','Company',0,null,null);">查看所有公司</a>
							</li>
							<li><a class="selectlistItem" tabindex="-1" href="javascript:;"
								onclick="tableName='Company';attributeName='name';key=0;$('#word').text('公司/根据公司名字查询');">根据公司名字查询</a>
							</li>
							<li><a class="selectlistItem" tabindex="-1" href="javascript:;"
								onclick="tableName='Company';attributeName='email';key=0;$('#word').text('公司/根据公司邮箱查询');">根据公司邮箱查询</a>
							</li>
							<li><a class="selectlistItem" tabindex="-1" href="javascript:;"
								onclick="tableName='Company';attributeName='location';key=0;$('#word').text('公司/根据公司所在地址查询');">根据公司所在地址查询</a>
							</li>
							<li><a class="selectlistItem" tabindex="-1" href="javascript:;"
								onclick="tableName='Company';attributeName='field';key=0;$('#word').text('公司/根据公司行业领域查询');">根据公司行业领域查询</a>
							</li>
							<li><a class="selectlistItem" tabindex="-1" href="javascript:;"
								onclick="tableName='Company';attributeName='size';key=1;$('#word').text('公司/根据公司规模查询');">根据公司规模查询</a>
							</li>
						</ul></li>
					<li class="dropdown-submenu"><a tabindex="-1"
						href="javascript:;">简历</a>
						<ul class="dropdown-menu">
							<li><a class="selectlistItem" tabindex="-1" href="javascript:;"
								onclick="$('#word').text('简历/查看所有简历');submitAction('admin_find','Resume',0,null,null);">查看所有简历</a>
							</li>
							<li><a  class="selectlistItem"tabindex="-1" href="javascript:;"
								onclick="tableName='Resume';attributeName='id';key=1;$('#word').text('简历/根据简历Id查询');">根据简历Id查询</a>
							</li>
							<li><a  class="selectlistItem"tabindex="-1" href="javascript:;"
								onclick="tableName='Resume';attributeName='epId';key=3;$('#word').text('简历/根据求职者Id查询');">根据求职者Id查询</a>
							</li>
							<li><a  class="selectlistItem"tabindex="-1" href="javascript:;"
								onclick="tableName='Resume';attributeName='eduId';key=3;$('#word').text('简历/根据教育经历编号查询');">根据教育经历编号查询</a>
							</li>
							<li><a  class="selectlistItem"tabindex="-1" href="javascript:;"
								onclick="$('#word').text('简历/查询已规培');submitAction('admin_find','Resume',1,'isRegulate',1);">查询已规培</a>
							</li>
						</ul></li>
					<li class="dropdown-submenu"><a tabindex="-1"
						href="javascript:;">招聘</a>
						<ul class="dropdown-menu">
							<li><a class="selectlistItem" tabindex="-1" href="javascript:;"
								onclick="$('#word').text('招聘/查看所有招聘');submitAction('admin_find','Reciritment',0,null,null);">查看所有招聘</a>
							</li>
							<li><a class="selectlistItem" tabindex="-1" href="javascript:;"
								onclick="tableName='Reciritment';attributeName='id';key=1;$('#word').text('招聘/根据Id查询');">根据职位Id查询</a>
							</li>
							<li><a  class="selectlistItem"tabindex="-1" href="javascript:;"
								onclick="tableName='Reciritment';attributeName='name';key=2;$('#word').text('招聘/根据职位名称查询');">根据职位名称查询</a>
							</li>
							<li><a  class="selectlistItem"tabindex="-1" href="javascript:;"
								onclick="tableName='Reciritment';attributeName='comId';key=3;$('#word').text('招聘/根据公司编号查询');">根据公司编号查询</a>
							</li>
							<li><a class="selectlistItem" tabindex="-1" href="javascript:;"
								onclick="tableName='Reciritment';attributeName='size';key=1;$('#word').text('招聘/根据招聘人数查询');">根据招聘人数查询</a>
							</li>
							<li><a class="selectlistItem" tabindex="-1" href="javascript:;"
								onclick="tableName='Reciritment';attributeName='city';key=0;$('#word').text('招聘/根据所在城市查询');">根据所在城市查询</a>
							</li>
							<li><a class="selectlistItem" tabindex="-1" href="javascript:;"
								onclick="$('#word').text('招聘/查询有效招聘');submitAction('admin_find','Reciritment',1,'isOK','1');">查询有效招聘</a>
							</li>
							<li><a class="selectlistItem" tabindex="-1" href="javascript:;"
								onclick="$('#word').text('招聘/查询无效招聘');submitAction('admin_find','Reciritment',1,'isOK','0');">查询无效招聘</a>
							</li>
						</ul></li>
					<li class="dropdown-submenu"><a tabindex="-1"
						href="javascript:;">学校</a>
						<ul class="dropdown-menu">
							<li><a class="selectlistItem" tabindex="-1" href="javascript:;"
								onclick="$('#word').text('学校/查看所有学校');submitAction('admin_find','School',0,null,null);">查看所有学校</a>
							</li>
							<li><a class="selectlistItem" tabindex="-1" href="javascript:;"
								onclick="tableName='School';attributeName='id';key=1;$('#word').text('学校/根据学校Id查询');">根据学校Id查询</a>
							</li>
							<li><a class="selectlistItem" tabindex="-1" href="javascript:;"
								onclick="tableName='School';attributeName='name';key=0;$('#word').text('学校/根据学校名字查询');">根据学校名字查询</a>
							</li>
							<li><a class="selectlistItem" tabindex="-1" href="javascript:;"
								onclick="tableName='School';attributeName='province';key=0;$('#word').text('学校/根据学校所在省份查询');">根据学校所在省份查询</a>
							</li>
							<li><a class="selectlistItem" tabindex="-1" href="javascript:;"
								onclick="tableName='School';attributeName='city';key=0;$('#word').text('学校/根据学校所在城市查询');">根据学校所在城市查询</a>
							</li>
						</ul></li>
					<li class="dropdown-submenu"><a tabindex="-1"
						href="javascript:;">职位</a>
						<ul class="dropdown-menu">
							<li><a class="selectlistItem" tabindex="-1" href="javascript:;"
								onclick="$('#word').text('职位/查看所有职位');submitAction('admin_find','Position',0,null,null);">查看所有职位</a>
							</li>
							<li><a class="selectlistItem" tabindex="-1" href="javascript:;"
								onclick="tableName='Position';attributeName='id';key=1;$('#word').text('招聘/根据职位Id查询');">根据职位Id查询</a>
							</li>
							<li><a class="selectlistItem" tabindex="-1" href="javascript:;"
								onclick="tableName='Position';attributeName='name';key=0;$('#word').text('招聘/根据职位名称查询');">根据职位名称查询</a>
							</li>
							
						</ul></li>
				</ul>
			</div>
			<div class="col-sm-3">
				<h4 id="word"></h4>
			</div>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="key" name="manNo"
					placeholder="查询关键字">
			</div>
			<div class="col-sm-2">
				<button id="search" class="btn btn-default" onclick="search();">查询</button>
			</div>
			<div>
				<button type="submit" class="btn btn-primary" onclick="lastpage();">上一页</button>
				<button type="submit" class="btn btn-primary" onclick="nextpage();">下一页</button>
			</div>
			<script>
			</script>
		</div>
		<div class="row">
			<div id="show">
			</div>
		</div>
	
	</div>
</body>
</html>