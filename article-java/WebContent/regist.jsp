<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/common.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/common.js"></script>
    <style>
    	span{
    		color: red;
    		font-size:11px;
    	}
    </style>
<title>regist</title>
</head>
<body>
	<div class="page-body">
           
            <div class="page-content">
                <form action="search.action?pageNum=1&title=" id="form1" method="post">
                    <fieldset>
                        <legend>注册</legend>
                        <table class="formtable" style="width:56%">
                            <tr>
                                <td><label class="modify-h2 control-label">用户名：</label></td>
                                <td>
	                                <div class="modify1 form-group">
							                <input id="username" type="text" name="username"
		                                    placeholder="请输入您的姓名" value="${requestScope.username }"
		                                    onblur="checkName()" class="modify-title form-control"  style="display:inline-block;">
		                                    &nbsp;&nbsp;&nbsp;<span id="userMsg"></span>
							        </div>
                                </td>
                            </tr>
                            <tr>	
                                <td><label class="modify-h2 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码:</label></td>
                                <td>
                                	<div class="modify1 form-group" >
							                <input id="pwd" type="password" name="password"
		                                     placeholder="请输入您的密码"
		                                     onblur="checkPwd()" class="modify-title form-control"  style="display:inline-block;">
		                                    &nbsp;&nbsp;&nbsp;<span id="pwdMsg"></span>
							        </div>
                                </td>
                            </tr>
                            <tr>	
                                <td><label class="modify-h2 control-label">确认密码:</label></td>
                                <td>
                                	<div class="modify1 form-group" >
							                <input id="pwd2" type="password" name="pwd2"
		                                     placeholder="请再次输入密码"
		                                     onblur="checkPwd2()" class="modify-title form-control"  style="display:inline-block;">
		                                    &nbsp;&nbsp;&nbsp;<span id="pwdMsg2"></span>
							        </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="command">
                                    <input type="button" value="注册" class="clickbutton btn btn-default" onclick="check()"/>
                                    <input type="button" value="返回" class="clickbutton btn btn-default" onclick="window.location.href='login.jsp';" />
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </form>
            </div>
        </div>
        
        
    	<script src="js/common.js"></script>
        
        <script>
	        function checkName() {
				var name = document.getElementById('username').value.trim();
				var userMsg = document.getElementById('userMsg');
				if (name === '' || name === null) {
					userMsg.innerHTML = '用户名不能为空';
				} else {
					$.post('ifExistUsername.action', {
						'username': name
					}, function(data) {
						if (data === 'true') {
							userMsg.innerHTML = '用户名已被注册';
						} else {
							userMsg.innerHTML = '';
						}
					})
				}
			}
	
			function checkPwd() {
				var pwd = document.getElementById('pwd').value.trim();
				var pwdMsg = document.getElementById('pwdMsg');
				if (pwd === '' || pwd === null) {
					pwdMsg.innerHTML = '密码不能为空';
				} else {
					pwdMsg.innerHTML = '';
				}
			}
			
			function checkPwd2() {
				var pwd = document.getElementById('pwd').value.trim();
				var pwd2 = document.getElementById('pwd2').value.trim();
				var pwdMsg2 = document.getElementById('pwdMsg2');
				if (pwd2 !== pwd) {
					pwdMsg2.innerHTML = '两次密码不一致';
				} else {
					pwdMsg2.innerHTML = '';
				}
			}
			
			function check() {
				var name = document.getElementById('username').value.trim();
				var pwd = document.getElementById('pwd').value.trim();
				var pwd2 = document.getElementById('pwd2').value.trim();
				var pwdMsg = document.getElementById('pwdMsg');
				var pwdMsg2 = document.getElementById('pwdMsg2');
				var userMsg = document.getElementById('userMsg');
				var form1 = document.getElementById('form1');
				if (name === '' || name === null) {
					userMsg.innerHTML = '用户名不能为空';
				} else if (pwd === '' || pwd === null) {
					pwdMsg.innerHTML = '密码不能为空';
				} else if (pwd2 !== pwd) {
					pwdMsg2.innerHTML = '两次密码不一致';
				} else {
					$.post('ifExistUsername.action', {
						username: name
					}, function(data) {
						if(data === 'true') {
							userMsg.innerHTML = '用户名已被注册';
						} else {
							changeToPostMethod('regist.action', {
								'username': name,
								'password': pwd
							})
						}
					})
				}
			}
        </script>
        
</body>
</html>