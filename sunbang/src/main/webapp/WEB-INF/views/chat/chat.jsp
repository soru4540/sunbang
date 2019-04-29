<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>선방</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<style>
/* div{
border:1px solid black;
} */
.btn-blue{
background:rgba(75, 188, 244, 0.4);
font-size: 14px;
font-weight:bold;
color:#666;
}
</style>
</head>
<body>

<div style="width:400px; height:600px; margin:auto auto; border:1px solid #ccc; box-shadow:1px 1px 5px 2px #ddd; border-radius:10px; ">
	<div class="col-12" style="height:50px; background:rgba(187,222,214,0.7); padding:1%;">선톡
		<span style="float:right;"><i class="far fa-window-minimize"></i>
		<i class="far fa-window-maximize"></i>
		<i class="far fa-window-close"></i></span></div>
	<div style="height:550px; background:rgba(187,222,214,0.1);">
	<div style="height:460px;"></div>
	<div class="d-flex" style="height:90px; background:white; padding:2%;">
	<div style="width:80%;"><textarea style="width:100%; height:100%; resize:none; font-size:13px;"></textarea></div>
	<div style="width:20%;"><button class="btn btn-blue" style="width:60px;">전송</button>
	<i class="fas fa-file-upload"></i><i class="fas fa-image"></i></div>
	</div>
</div>

</body>
</html>