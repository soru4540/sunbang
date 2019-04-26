<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>360Image</title>
<script src="https://aframe.io/releases/0.9.0/aframe.min.js"></script>
</head>
<body>
<!-- 360도 사진 -->
    <a-scene>
        <a-sky src="${pageContext.request.contextPath }/files/realty/realty360Images/우리집.jpg"></a-sky>
    </a-scene>
</body>
</html>

