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
<title>登录成功</title>
<script src="jquery/jquery-2.1.4.js"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
</head>
<body>
	<div>
		<table class="table table-hover" id="1">
		
		</table>
	</div>
	<div>	
		<input type="button" name="operator" value="首页"/>
		<input type="button" name="operator" value="上一页"/>
		<span></span>
		<input type="button" name="operator" value="下一页"/>
		<input type="button" name="operator" value="尾页"/>
		<input type="hidden" name="currentPage">
		<input type="hidden" name="totalPage">		
	</div>
	
	<a href="#" onclick=javascrtpt:window.location.href="www.baidu.com"><img src="img/防火女.jpg"></a>
</body>
<script type="text/javascript">
	$(function() {
		var currentPage = 1;
		$.getJSON("show3.lovo",{currentPage:currentPage},fillData);
		$("input[type=button]").click(function(){
			var operation = this.value;
			currentPage = parseInt($("input[name=currentPage]").val());
			var totalPage = $("input[name=totalPage]").val();
			if(operation=="首页"){
				currentPage = 1;
			}else if(operation=="上一页"){
				currentPage = currentPage - 1;
			}else if(operation=="下一页"){
				currentPage = currentPage + 1;
			}else{
				currentPage = totalPage;
			}
			$.getJSON("show3.lovo",{currentPage:currentPage},fillData);
		});
	});
	
	function fillData(data) {
		var $table = $("table");
		$table.empty();
		var head = "<tr><th>姓名</th><th>密码</th><th>删除</th><th>修改密码</th></tr>";
		$table.append(head);
		$.each(data.list,function(i,e){
			var tr = "<tr><td>"+e.username+"</td><td>"+e.password+"</td><td><input type='button' value='删除此用户' onclick=javascrtpt:window.location.href='delete.lovo?id="+e.id+"'></td><td><input type='button' value='修改密码' onclick=javascrtpt:window.location.href='jsp/update.jsp?id="+e.id+"'></td></tr>";
			$table.append(tr);
		});
		
		$("input[name=currentPage]").val(data.currentPage);
		$("input[name=totalPage]").val(data.totalPage);
		$("span").html("第"+data.currentPage+"页"+"/共"+data.totalPage+"页");
	}

	function removeBackground(){
	    $('.modal-backdrop').remove();
	    $('body').removeClass('modal-open');
	}
</script>
</html>