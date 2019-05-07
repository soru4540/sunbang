<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>360Image</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script src="https://aframe.io/releases/0.9.0/aframe.min.js"></script>
</head>
<body>
<!-- 360도 사진 -->
     <a-scene>
        <a-sky src="${pageContext.request.contextPath }/files/realty/realty360Images/${image360 }"></a-sky>
    </a-scene>
</body>
</html>

