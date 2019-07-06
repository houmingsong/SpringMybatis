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
<title>登录</title>
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
                        登录
                    </div>
                    <form action="login.lovo" method="post">
                    <div class="card-body py-5">
                        <div class="form-group">
                            <label class="form-control-label">用户名</label>
                            <input type="text" class="form-control" name="username">
                        </div>

                        <div class="form-group">
                            <label class="form-control-label">密码</label>
                            <input type="password" class="form-control" name="password">
                        </div>

					<span id="span"></span>
                   
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-6">
                                <input type="submit" class="btn btn-primary px-5" value="登录">
                            </div>

                            <div class="col-6">
                                <a href="jsp/register.jsp" class="btn btn-link">注册</a>
                            </div>
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
	   		$("#span").html("密码错误，请重新登录");
	   		$("#span").css("color","red");
	  }else if(error=='no.jsp'){
		  	$("#span").html("用户名不存在，请重新登录");
	   		$("#span").css("color","red");
	  }
  });
 
</script>
</body>
</html>