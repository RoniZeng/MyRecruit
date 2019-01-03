<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script> 
<script src="style/js/bootstrap.min.js" type="text/javascript"></script> 
<link rel="stylesheet" type="text/css" href="style/css/bootstrap.min.css" />
<title>医伯乐管理系统</title>
</head>
<body class="jumbotron">
	<div class="page-header">
		<h3>
			<center>管理员管理系统</center>
		</h3>
	</div>
	<div>
		<form class="form-horizontal" action="adminLogin" method="post">
			<div class="form-group">
				<label for="inputUsername" class="col-sm-offset-3 col-sm-2 control-label"> 用户名 </label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="inputUsername" name="admin.id" placeholder="用户名">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-offset-3 col-sm-2 control-label"> 密码 </label>
				<div class="col-sm-2">
					<input type="password" class="form-control" id="inputPassword" name="admin.password" placeholder="密码">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-10">
					<button type="submit" class="btn btn-default">Sign in</button>
				</div>
			</div> 
		</form>
	</div>
</body>
</html>