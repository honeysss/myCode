<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>文章详情</title>
</head>
<body>
<!--    顶部内容-->
<div class="top-content">
    <h1 class="top-h1">文章详情</h1>
</div>

<!--    中间内容-->
<div class="show-middle-content">
    <!--        文章信息-->
    <div class="article-list">
        <h1 class="article-show-title"><?php echo $result['title'];?></h1>
        <p class="article-show-author">作者：<?php echo $result['author'];?></p>
        <p class="article-show-content"><?php echo $result['content'];?></p>
    </div>
</div>
</body>
</html>