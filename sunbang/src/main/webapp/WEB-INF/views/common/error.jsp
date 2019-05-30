<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/images/logo1.PNG">
<title>SUNBANG</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<style type="text/css">

</style>

</head>
<body>
<c:import url="../common/realtyHeader.jsp" />
<div class="container" style="min-height: 960px; margin-top: 60px;font-family: a고딕12; text-align:center; padding-top:7%;">
	<hr>
	<br><br><br><br>
	<h2>${message }</h2>
	<h5>이용에 불편을 드려 죄송합니다.</h5>
	<h5>관리자에게 문의바랍니다.</h5>
	<br><br><br><br>
	<hr>
</div>
<c:import url="../common/footer.jsp" />
</body>
</html>