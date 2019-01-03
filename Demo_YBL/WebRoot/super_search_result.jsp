<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
<script src="style/js/bootstrap.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="style/css/bootstrap.min.css" />
<script>
var tableName="";
var tableId="";
var obj;
var key=0;
var attributeName="";
var findString="";
function del(){
	$.post("adminDelete.action",{
		"tableName":tableName,
		"tableId":tableId
	},function(data){
	});
}
$(document).ready(function(){
	$("input").keyup(function(event){
  		if(event.keyCode ==13){
  			findString=$(this).val();
  			$(this).parent().prev().text(findString);
  			$(this).parent().prev().show();
  			$(this).parent().hide();
  			
  			$.post("adminUpdate.action",{
			"tableName":tableName,
			"tableId":tableId,
			"key":key,
			"attributeName":attributeName,
			"findString":findString
		},function(data){
		});
		
  		}
	});
});
</script>
<link rel="stylesheet" type="text/css" href="style/css/bootstrap.min.css" />
<table class="table  table-hover">
<%
		ArrayList<Object[]> resultList = (ArrayList<Object[]>) request
				.getAttribute("list");
		String tableName = (String) request.getAttribute("tableName");
		Object[] object = resultList.get(0);
		String[] strings = (String[])resultList.get(1);
		out.println("<tr>");
		for (int j = 0; j < object.length; j++) {
				out.println("<th>" + String.valueOf(object[j]) + "</th>");
		}
		out.println("<th>删除</th>");
		out.println("</tr>");
		for (int i = 2; i < resultList.size(); i++) {
			object = resultList.get(i);
			out.println("<tr>");
			for (int j = 0; j < object.length; j++) {
				//out.println("<th onclick='alert(88);tableName='"+tableName+"';tableId="+String.valueOf(object[0])+";attributeName='"+i+"';$(this).next().show();$(this).hide();' >" + String.valueOf(object[j]) + "</th>");
				out.println("<th onclick='tableName=\""+tableName+"\";tableId=\""+String.valueOf(object[0])+"\";attributeName=\""+strings[j]+"\";$(this).next().show();$(this).hide();'>"+String.valueOf(object[j])+"</th>");
				out.println("<th hidden ><input type='text' style='width:50px'; value='"+String.valueOf(object[j])+"' /></th>");
			}
			out.println("<th><a data-toggle=\"modal\" data-target=\"#myModal\" onclick=\"obj=$(this).parent().parent();tableName='"+tableName+"';tableId="+String.valueOf(object[0])+";\">删除</a></th>");
			out.println("</tr>");
		}
%>
</table>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">确认删除此条信息？</h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="del();obj.hide();">确认删除</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>