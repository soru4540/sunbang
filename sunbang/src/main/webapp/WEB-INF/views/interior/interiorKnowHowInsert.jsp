<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
	<link rel="shortcut icon" type="image⁄x-icon" href="/bang/resources/images/logo2.PNG">
<title>SUNBANG</title>
<style type="text/css">

.jb_khinsert_btn {
    display: inline-block;
    font-weight: 400;
    color: #fff;
    text-align: center;
    vertical-align: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-color: #ff9198;
    border: 0;
    padding: .375rem .75rem;
     font-family: a고딕15;
    font-size: 1rem;
    line-height: 1.5;
    border-radius: .25rem;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}

#jb_khinsert_icon{
color:#ff9198;
  font-size: 30px;
     vertical-align: middle;

}

.jb_khinsert_line{
color:#ff9198;
  font-size: 30px;
 vertical-align: middle;
}

#jb_khinsert_container label {
    position:relative;
    cursor:pointer;
    display:inline-block;
    vertical-align:middle;
    overflow:hidden;
    width:100px;
    height:35px;
    background:#ff9198;
    color:#fff;
    text-align:center;
    line-height:35px;
}
#jb_khinsert_container label input {
    position:absolute;
    width:0;
    height:0;
    overflow:hidden;
}

</style>
</head>
<body>
	<c:import url="interiorHeader.jsp" />	
	<script type="text/javascript">
	$(function(){
		$("#input_img").on("change",handleImgFileSelect);
	});
	
	function handleImgFileSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			
			sel_file = f;
			
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img").attr("src",e.target.result);
			}
			reader.readAsDataURL(f);
		});
				
	}
	
	</script>
 	<br>
    <br>
	<div class="container" id="jb_khinsert_container">
	<div class="row">
	<div class="col-md-2"></div>
		<div class="col-md-8">
		<label>커버 업로드
		<input type="file" id="input_img">		
		</label>
		</div>
		<div class="col-md-2"></div>
	</div>
	<br>
	<div class="row">	    
	    <div class="col-md-2"></div>
		<div class="col-md-8" align="center">
			<img id="img" style="height:500px;width:100%;border: 1px solid #ff9198;">			
		</div>
		<div class="col-md-2"></div>
	</div>
	<br>
	<div class="row">
		<div class="col-md-12" align="center">
			<select>				
			<option value="">카테고리</option>
			<option value="리모델링">리모델링</option>
			<option value="꾸미기팁">꾸미기팁</option>
			<option value="지식백과">지식백과</option>
			<option value="이거어때">이거어때</option>
			<option value="생활정보">생활정보</option>
			</select>
			&nbsp;&nbsp;&nbsp;
				<select>				
			<option value="">카테고리</option>
			<option value="리모델링">리모델링</option>
			<option value="꾸미기팁">꾸미기팁</option>
			<option value="지식백과">지식백과</option>
			<option value="이거어때">이거어때</option>
			<option value="생활정보">생활정보</option>
			</select>
			&nbsp;&nbsp;&nbsp;
				<select>				
			<option value="">카테고리</option>
			<option value="리모델링">리모델링</option>
			<option value="꾸미기팁">꾸미기팁</option>
			<option value="지식백과">지식백과</option>
			<option value="이거어때">이거어때</option>
			<option value="생활정보">생활정보</option>
			</select>			
		</div>		
	</div>
	<br>
	<div class="row">
	    <div class="col-md-2"></div>
		<div class="col-md-8">
	     <span style="font-family: a고딕14;">제목 : </span><input type="text" size="30" id="jb_khinsert_title">		
		</div>
		<div class="col-md-2"></div>
	</div>
	<br>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
		<h5><i class="far fa-grin"></i>&nbsp;&nbsp;닉네임</h5>
		</div>
		<div class="col-md-2"></div>
	</div>
	<br>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
		<textarea rows="5" cols="101" style="resize: none;border: 1px solid #ff9198;">
봄 햇살이 따뜻하게 내리쬐는 날, 소파에서 나른하게 쉬는 모습을 상상만해도 기분이 좋아집니다. 이사철이다 혼수철이다 해서 가구 할인도 많이 하는 것 같은데! 이번 기회에 소파 하나 장만해볼까 싶으시다면 이번 콘텐츠 묶음을 꼭 봐주세요. 막막한 여러분을 위해 기초부터 디테일까지 잘 안내해드릴 콘텐츠를 모아봤어요.
</textarea>
		</div>
		<div class="col-md-2"></div>
	</div>
	<br>
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
	<hr color="#ff9198">
	</div><div class="col-md-2"></div>
	</div>
	<br>
	<div class="row">
	   	<div class="col-md-2"></div>
		<div class="col-md-8">
		<i class="fas fa-times-circle" id="jb_khinsert_icon"></i>&nbsp;&nbsp;&nbsp;<button class="jb_khinsert_btn">소제목</button>&nbsp;&nbsp;&nbsp;<button class="jb_khinsert_btn">텍스트</button>&nbsp;&nbsp;&nbsp;<button class="jb_khinsert_btn">사진</button>&nbsp;&nbsp;&nbsp;
		<button class="jb_khinsert_btn">동영상</button>&nbsp;&nbsp;&nbsp;<button class="jb_khinsert_btn">버튼</button>&nbsp;&nbsp;&nbsp;<button class="jb_khinsert_btn">구분선</button>
		</div>
	 	<div class="col-md-2"></div>
	</div>
	<br>
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
	<hr color="#ff9198">
	</div><div class="col-md-2"></div>
	</div>
	<br>
	<div class="row">
	<div class="col-md-2"></div>
		<div class="col-md-8" width="100%">
		<i class="fas fa-plus-circle" id="jb_khinsert_icon"></i>&nbsp;&nbsp;&nbsp;<span class="jb_khinsert_line">-------------------------------------</span>
		</div>
		<div class="col-md-2"></div>
	</div>
	<br><br>
</div>
<c:import url="footer.jsp" />	

</body>
</html>