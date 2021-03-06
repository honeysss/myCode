<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 	<meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <title>文章发布</title>
</head>
<body>
<!--    顶部内容-->
<div class="top-content">
    <h1 class="top-h1">发布文章</h1>
</div>

<div class="modify-article-content">
    <form method="post" action="publish.action" class="form-horizontal" role="form" id="form">
        <div class="modify1 form-group">
            <label class="modify-h2 col-sm-2 control-label"  placeholder="请输入文章名称..." >文章名称：</label>
            <div class="col-sm-5">
                <input type="text" class="modify-title form-control" name="title" id="title">
            </div>
        </div>
        <div class="modify2 form-group">
            <label class="modify-h2 col-sm-2 control-label" placeholder="请输入文章作者..." >文章作者：</label><div class="col-sm-5">
                <input type="text" class="modify-title form-control" name="author" id="author">
            </div>
        </div>
        <div class="modify3 form-group">
            <label class="modify-h2 col-sm-2 control-label"  placeholder="请输入文章内容">文章内容：</label>
            <div class="col-sm-7">
                <textarea class="form-control" name="content" rows="15" id="content"></textarea>
            </div>
        </div>
        <button type="button" id="publishBtn" class="btn btn-default change-over1">提交</button>
        <button type="button" class="btn btn-default change-over2">
        	<a href="search.action?pageNum=1&title=" style="color: black; text-decoration: none;">返回</a>
        </button>
    </form>
    <div class="foot"></div>
    
       <script>
		$(document).ready(function() {
			
			$('#title').blur(function() {
				var title = $('#title').val().trim();
				$.post('ifExistTheArticle.action', {
					title: title
				}, function(data) {
					if(data === 'true') {
						alert('该文章已存在');
					}
				})
			})
			
			$('#publishBtn').click(function() {
				var title = $('#title').val().trim();
				var author = $('#author').val().trim();
				var content = $('#content').val().trim();
				if (title != null && title != '' && author != null && author != '' && content != null && content != '') {
					//如果都不为空 验证文章名称是否已经存在 如果不存在 提交表单
					$.post('ifExistTheArticle.action', {
						title: title
					}, function(data) {
						if(data === 'true') {
							alert('该文章已存在');
						} else {
							$('#form').submit();
						}
					})
				} else {
					alert('不能为空');
				}
			})
		})
	</script>
    
</div>
</body>
</html>