<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
    <title>Custom designed fancy check boxes and radio buttons with CSS and JavaScript</title>
    <meta name="Description" content="Quiz"/>
    <%--<link rel="stylesheet" type="text/css" href="style.css"/>--%>
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        var proportion = 100;
        function resizeFont() {
            document.body.style.fontSize = parseInt(document.body.offsetWidth / proportion) + 'px'
        }
        onload = onresize = resizeFont;
        if (document.addEventListener) document.addEventListener("DOMContentLoaded", resizeFont, null);
    </script>

</head>
<body>
<div id="sizer">

    <div class="form">

        <img src="${pageContext.request.contextPath}/resources/img/new_logo.png" width="800" height="400" id="logo"/>

        <div id = "msg">Спасибо! Ваш голос учтен.</div>

    </div>
</div>

</body>
</html>