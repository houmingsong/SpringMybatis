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
<title>注册</title>
<script src="jquery/jquery-2.1.4.js"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="chart.js/chart.min.js"></script>
<script src="popper.js/popper.min.js"></script>
<script src="js/carbon.js"></script>
<script src="js/demo.js"></script>
<link rel="stylesheet" href="simple-line-icons/css/simple-line-icons.css">
<link rel="stylesheet" href="font-awesome/css/fontawesome-all.min.css">
<link rel="stylesheet" href="css/styles.css">
</head>
<body>
	<div class="page-wrapper flex-row align-items-center">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="card p-4">
                    <div class="card-header text-center text-uppercase h4 font-weight-light">
                        注册
                    </div>
                    <form action="testing.lovo" method="post">
                    <div class="card-body py-5">
                        <div class="form-group">
                            <label class="form-control-label">用户名</label>
                            <input type="text" class="form-control" name="username">
                        </div>

                        <div class="form-group">
                            <label class="form-control-label">密码</label>
                            <input type="password" class="form-control" name="password">
                        </div>

                   
                    </div>

                    <div class="card-footer">
                        <div class="row">
                            <div class="col-6">
                                <input type="submit" class="btn btn-primary px-5" value="注册">
                            </div>                        
                                <span id="span"></span>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
	//取出传回来的参数error并与yes比较
	$(function(){
	  	var error ='<%=request.getParameter("error")%>';
	  	if(error=='yes.jsp'){
	   		$("#span").html("用户名已存在，请重新输入");
	   		$("#span").css("color","red");
	  }
  });
 
</script>
</body>
</html>