<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- 在所有的链接前面加上动态获取的绝对全路径 -->
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>选项</title>
<script src="jquery/jquery-2.1.4.js"></script>
</head>
<body>
	<form action="exhibition.lovo" method="post">
		<select multiple="multiple" id="select1" style="width: 100px; height: 160px;">
		
		</select> 
		<select multiple="multiple" id="select2" style="width: 100px; height: 160px; margin-left: 87px" name="kk">
		
		</select><br> 
		<input type="button" value="全部左移"> 
		<input type="button" value="选中左移"> 
		<input type="button" value="选中右移">
		<input type="button" value="全部右移">
		<input type="submit" value="登录">
	</form>
</body>
<script type="text/javascript">
	$.getJSON("QueryAllUsers.lovo",function(data){		
		var select = $("select[id=select1]");
		select.empty();
		$.each(data,function(i,n){
		var str ="<option value="+n.id+">"+n.studentName+"</option>";
		select.append(str);
		});
	});

	$(function() {
		$(":button[value=全部右移]").click(moveAllToRight);
		$(":button[value=选中右移]").click(moveToRight);
		$(":button[value=选中左移]").click(moveToLeft);
		$(":button[value=全部左移]").click(moveAllToLeft);
		/*$("#select1 option").dblclick(moveToRight);
		$("#select2 option").dblclick(moveToLeft);*/
		$("#select1").dblclick(moveToRight);
		$("#select2").dblclick(moveToLeft);
	});

	function moveAllToRight() {
		$("#select1 option").appendTo($("#select2"));
	}

	function moveToRight() {
		$("#select1 option:selected").appendTo($("#select2"));
	}

	function moveToLeft() {
		$("#select2 option:selected").appendTo($("#select1"));
	}

	function moveAllToLeft() {
		$("#select2 option").appendTo($("#select1"));
	}
</script>
</html>