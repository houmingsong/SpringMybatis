<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
<title>展示</title>
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
		<input type="text" name="yemian" style="width:2%">
		<input type="button" name="operator" value="跳转">
		<input type="button" name="operator" value="生产Excel表格">
		<a href="select.lovo?sex=男&&scondition=非会员">展示</a>
		<input type="hidden" name="currentPage">
		<input type="hidden" name="totalPage">
	</div>
	
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					详细信息
				</h4>
			</div>
			<div class="modal-body">
				<table class="table table-hover">
					<tr>
						<th>id</th>
						<th>信息</th>
					</tr>
					<c:forEach var="u" items="${user}">
					<tr class='active'>
						<td>${u.id}</td>
						<td>${u.message}</td>
					</tr>
					</c:forEach>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</body>
<script type="text/javascript">
	$(function() {
		var currentPage = 1;
		$.getJSON("show.lovo",{currentPage:currentPage},fillData);
		$("input[type=button]").click(function(){
			var operation = this.value;
			currentPage = parseInt($("input[name=currentPage]").val());
			yemian = parseInt($("input[name=yemian]").val());
			var totalPage = $("input[name=totalPage]").val();
			if(operation == "生产Excel表格"){
				 window.location.href='poi.lovo';
			 }
			if(operation=="首页"){
				currentPage = 1;
			}else if(operation=="上一页"){
				currentPage = currentPage - 1;
			}else if(operation=="下一页"){
				currentPage = currentPage + 1;
			}else if(operation=="跳转"){
				currentPage = yemian;
			}else{
				currentPage = totalPage;
			}
			$.getJSON("show.lovo",{currentPage:currentPage},fillData);
		});
	});
	
	function fillData(data) {
		var $table = $("table[id=1]");
		$table.empty();
		var head = "<tr><th>姓名</th><th>性别</th><th>生日</th><th>班级名称ID</th><th>地址</th><th>是否会员</th><th>电话</th><th>父亲姓名</th><th>父亲电话</th><th>母亲姓名</th><th>母亲电话</th><th>说明</th></tr>";
		$table.append(head);
		$.each(data.list,function(i,e){
			var tr = "<tr class='active'><td><input type='button' name='operator' value="+e.studentName+" onclick=javascrtpt:window.location.href='user.lovo?id="+e.id+"'></td><td>"+e.sex+"</td><td>"+e.birthday+"</td><td>"+e.classNameId+"</td><td>"+e.address+"</td><td>"+e.scondition+"</td><td>"+e.tel+"</td><td>"+e.fatherName+"</td><td>"+e.fatherTel+"</td><td>"+e.motherName+"</td><td>"+e.motherTel+"</td><td>"+e.scomment+"</td></tr>";
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