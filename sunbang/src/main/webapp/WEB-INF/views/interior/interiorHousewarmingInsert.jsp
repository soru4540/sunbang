<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link rel="shortcut icon" type="image⁄x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo2.PNG">
<title>SUNBANG</title>
<style type="text/css">
.insert_btn {
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
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

.insert_submit {
	background-color: #ffa0a8;
	color: white;
	border: #ffa0a8;
	width: 100%;
	height: 50px;
	font-size: 17px;
	font-family: a고딕15;
}

#insert_icon {
	color: #ff9198;
	font-size: 30px;
	vertical-align: middle;
}

.insert_line {
	color: #ff9198;
	font-size: 24px;
	vertical-align: middle;
}

#insert_container label {
	position: relative;
	cursor: pointer;
	display: inline-block;
	vertical-align: middle;
	overflow: hidden;
	width: 100px;
	height: 35px;
	background: #ff9198;
	color: #fff;
	text-align: center;
	line-height: 35px;
}

#insert_container label input {
	position: absolute;
	width: 0;
	height: 0;
	overflow: hidden;
	height: 0;
}
</style>
</head>
<body>
	<c:import url="../common/interiorHeader.jsp" />
	<script type="text/javascript">
		//게시물추가버튼 숨김
		$(function() {
			$("#input_img0").on("change", handleImgFileSelect0);

			$("#row2").css("display", "none");
			$("#row3").css("display", "none");
			$("#row4").css("display", "none");
			$("#row5").css("display", "none");
			$("#line1").css("display", "none");
			$("#line2").css("display", "none");
			$("#line3").css("display", "none");
			$("#line4").css("display", "none");

		});

		//파일업로드하면 아래화면에 출력 메소드(커버)
		function handleImgFileSelect0(e) {
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);

			filesArr.forEach(function(f) {
				if (!f.type.match("image.*")) {
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				sel_file = f;
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#img0").attr("src", e.target.result);
				}
				reader.readAsDataURL(f);
			});
		}

		//파일업로드하면 아래화면에 출력 메소드(게시물1)
		function handleImgFileSelect1(e) {
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);

			filesArr.forEach(function(f) {
				if (!f.type.match("image.*")) {
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				sel_file = f;
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#img1").attr("src", e.target.result);
				}
				reader.readAsDataURL(f);
			});
		}
		//파일업로드하면 아래화면에 출력 메소드(게시물2)
		function handleImgFileSelect2(e) {
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);

			filesArr.forEach(function(f) {
				if (!f.type.match("image.*")) {
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				sel_file = f;
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#img2").attr("src", e.target.result);
				}
				reader.readAsDataURL(f);
			});
		}
		//파일업로드하면 아래화면에 출력 메소드(게시물3)
		function handleImgFileSelect3(e) {
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);

			filesArr.forEach(function(f) {
				if (!f.type.match("image.*")) {
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				sel_file = f;
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#img3").attr("src", e.target.result);
				}
				reader.readAsDataURL(f);
			});
		}
		//파일업로드하면 아래화면에 출력 메소드(게시물4)
		function handleImgFileSelect4(e) {
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);

			filesArr.forEach(function(f) {
				if (!f.type.match("image.*")) {
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				sel_file = f;
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#img4").attr("src", e.target.result);
				}
				reader.readAsDataURL(f);
			});
		}
		//파일업로드하면 아래화면에 출력 메소드(게시물5)
		function handleImgFileSelect5(e) {
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);

			filesArr.forEach(function(f) {
				if (!f.type.match("image.*")) {
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				sel_file = f;
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#img5").attr("src", e.target.result);
				}
				reader.readAsDataURL(f);
			});
		}
		//클릭시 게시물 추가항목들 생성
		function addType(e) {
			$("#row" + e)
					.html(
							"<i class='fas fa-times-circle' id='insert_icon' onclick='delType("
									+ e
									+ ");'></i>&nbsp;&nbsp;&nbsp;<input type='button' class='insert_btn' value='소제목' onclick='addData1("
									+ e
									+ ")'>&nbsp;&nbsp;&nbsp;<input type='button' class='insert_btn' value='텍스트' onclick='addData2("
									+ e
									+ ")'>&nbsp;&nbsp;&nbsp;"
									+ "<input type='button' class='insert_btn' value='사진' onclick='addData3("
									+ e
									+ ")'>&nbsp;&nbsp;&nbsp;<input type='button'  class='insert_btn' value='동영상' onclick='addData4("
									+ e
									+ ")'>&nbsp;&nbsp;&nbsp;"
									+ "<input type='button'  class='insert_btn' value='버튼' onclick='addData5("
									+ e
									+ ")'>&nbsp;&nbsp;&nbsp;<input type='button' class='insert_btn' value='구분선' onclick='addData6("
									+ e + ")'>");
			$("#row" + (e + 1)).css("display", "");
			$("#line" + e).css("display", "");

		}
		//클릭시 게시물 추가버튼으로 돌아감
		function delType(e) {
			$("#row" + e)
					.html(
							"<i class='fas fa-plus-circle' id='insert_icon' onclick='addType("
									+ e
									+ ");''></i>&nbsp;&nbsp;&nbsp;<span class='insert_line'>------------------------------------------</span>");
			$("#rowdata" + e).html("");
		}
		//클릭시 소제목 입력창 생성
		function addData1(e) {
			$("#rowdata" + e)
					.html(
							"<br><input type='hidden' name='post_keyword' value='strapline'>소제목 : <br><input type='text'  class='' id='' style='width: -webkit-fill-available;' name='post_contents"+e+"' size='100'>");
		}
		//클릭시 텍스트 입력창 생성
		function addData2(e) {
			$("#rowdata" + e)
					.html(
							"<br><input type='hidden' name='post_keyword' value='text'>내용 : <br><textarea id='' name='post_contents"+e+"' rows='5' cols='101' style='resize: none; width: -webkit-fill-available;'></textarea>");
		}
		//클릭시 사진 입력창 생성
		function addData3(e) {
			$("#rowdata" + e)
					.html(
							"<br><input type='hidden' name='post_keyword' value='photo'><label style='font-family:a고딕14;'>파일 선택<input type='file' id='input_img"+e+"' name='post_data"+e+"'></label><br><div class='row' style='background-color: #fbfbfb; height: 600px; width: 100%; text-align: center; margin: 0 auto; padding-top: 30px; padding-bottom: 30px; max-width: inherit;'>"
									+ "<img id='img"
									+ e
									+ "' style='min-height:540px; max-height:100%; margin: 0 auto; max-width: inherit; '></div>");
			if (e == 1) {
				$(function() {
					$("#input_img" + e).on("change", handleImgFileSelect1);
				});
			} else if (e == 2) {
				$(function() {
					$("#input_img" + e).on("change", handleImgFileSelect2);
				});
			} else if (e == 3) {
				$(function() {
					$("#input_img" + e).on("change", handleImgFileSelect3);
				});
			} else if (e == 4) {
				$(function() {
					$("#input_img" + e).on("change", handleImgFileSelect4);
				});
			} else if (e == 5) {
				$(function() {
					$("#input_img" + e).on("change", handleImgFileSelect5);
				});
			}
		}
		//클릭시 동영상 입력창 생성	
		function addData4(e) {
			$("#rowdata" + e)
					.html(
							"<br><input type='hidden' name='post_keyword' value='video'>동영상 URL 링크를 입력해주세요 : <br><input type='text' id='' name='post_data"+e+"' size='100' style='font-family: a고딕14; width: -webkit-fill-available;'><br><br>내용 : <textarea id='' name='post_contents"+e+"' rows='5' cols='101' style='resize: none;border: 1px solid #ff9198; width: -webkit-fill-available;'></textarea>");
		}
		//클릭시 버튼 입력창 생성
		function addData5(e) {
			$("#rowdata" + e)
					.html(
							"<br><input type='hidden' name='post_keyword' value='button'>버튼 URL 링크를 입력해주세요 : <br><input type='text' id='' name='post_data"+e+"' size='100' style='font-family: a고딕14; width: -webkit-fill-available;'><br><br>내용 : <input type='text' id='' style='width: -webkit-fill-available;' name='post_contents"+e+"' size='100'>");
		}
		//클릭시 구분선 입력창 생성
		function addData6(e) {
			$("#rowdata" + e)
					.html(
							"<br><input type='hidden' name='post_keyword' value='divisionline'><select class='' id='divisionline"+e+"' name='post_data"+e+"' style='width:300px; text-align:center;'><option value='solid' selected>실선</option><option value='dashed'>파선</option><option value='dotted'>점선</option>"
									+ "<option value='double'>두줄</option></select><br><br><hr id='hrline"
									+ e
									+ "' style='border:2px solid #ffb6b9;width:80%;'>");
			if (e == 1) {
				$(function() {
					$("#divisionline" + e).on(
							"change",
							function changeline() {
								$("#hrline" + e).css("border-style",
										$("#divisionline" + e).val());
							});
				});
			} else if (e == 2) {
				$(function() {
					$("#divisionline" + e).on(
							"change",
							function changeline() {
								$("#hrline" + e).css("border-style",
										$("#divisionline" + e).val());
							});
				});
			} else if (e == 3) {
				$(function() {
					$("#divisionline" + e).on(
							"change",
							function changeline() {
								$("#hrline" + e).css("border-style",
										$("#divisionline" + e).val());
							});
				});
			} else if (e == 4) {
				$(function() {
					$("#divisionline" + e).on(
							"change",
							function changeline() {
								$("#hrline" + e).css("border-style",
										$("#divisionline" + e).val());
							});
				});
			} else if (e == 5) {
				$(function() {
					$("#divisionline" + e).on(
							"change",
							function changeline() {
								$("#hrline" + e).css("border-style",
										$("#divisionline" + e).val());
							});
				});
			}
		}
	</script>
	<br>
	<br>
	<div class="container" id="insert_container">
		<form name="khinsert" id="khinsert" action="ibinsert.do" method="post"
			enctype="multipart/form-data">
			<br>
			<h4 align="center" style="font-family: a고딕15;">집들이 등록</h4>
			<br> <input type="hidden" name="board_type" value="photograph">
			<div class="row">
				<input type="hidden" id="" name="post_keyword" value="cover">
				<label style="font-family: a고딕14;">파일선택 <input type="file"
					id="input_img0" name="post_data0">
				</label>
			</div>
			<br>
			<div class="row">
				<div class="col" align="center"
					style="background-color: #fbfbfb; height: 600px; width: 100%; text-align: center; padding-top: 30px; padding-bottom: 30px;">
					<img id="img0"
						style="max-height: 100%; min-height: 540px; max-width: inherit;">
				</div>
			</div>
			<br> <br> <input type="url"
				placeholder="출처 URL이 있다면 적어주세요 (http://~)" pattern="https?://.+"
				class="url" name="card[source]" id="card_source"
				style="width: 100%; height: 40px; font-family: a고딕14;"> <br>
			<br>
			<div class="row">
				<div class="col">
					<select class="category" id="category1" name="category1"
						style="width: 100%; height: 35px; font-family: a고딕14;" required>
						<option value="">공간 선택(필수)</option>
						<option value="0">원룸</option>
						<option value="1">거실</option>
						<option value="2">키친</option>
						<option value="3">욕실</option>
						<option value="4">드레스룸</option>
						<option value="5">서재&amp;작업실</option>
						<option value="6">베란다</option>
						<option value="7">현관</option>
						<option value="8">사무공간</option>
					</select>
				</div>
				&nbsp;&nbsp;
				<div class="col">
					<select class="category" id="category2" name="category2"
						style="width: 100%; height: 35px; font-family: a고딕14;">
						<option value="">평수 선택</option>
						<option value="0">10평 미만</option>
						<option value="1">10평 이상</option>
						<option value="2">20평 미만</option>
						<option value="3">30평 미만</option>
						<option value="4">40평 미만</option>
					</select>
				</div>
				<div class="col">
					<select class="category" id="category3" name="category3"
						style="width: 100%; height: 35px; font-family: a고딕14;">
						<option value="">컬러 선택</option>
						<option value="0" style="color: red;">RED</option>
						<option value="1" style="color: yellow;">YELLOW</option>
						<option value="2" style="color: green;">GREEN</option>
						<option value="3" style="color: blue;">BLUE</option>
						<option value="4" style="color: pink;">PINK</option>
						<option value="5">WHITE</option>
					</select>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col">				
					<span style="font-family: a고딕14; ">제목 : </span><input type="text"
						size="53" name="board_title" id="jb_khinsert_title" style="width:95%;">
				</div>
			</div>
			<br>
			<div class="text">
				<!-- 내용 -->
				<textarea class="form-control" id="contents" rows="5" wrap="hard"
					name="contents" style="font-family: a고딕14;"></textarea>
			</div>
			<br>
			<div class="row">
				<div class="col" id="row1">
					<i class="fas fa-plus-circle" id="insert_icon"
						onclick="addType(1);"></i>&nbsp;&nbsp;&nbsp;<span
						class="insert_line">------------------------------------------</span>
				</div>
			</div>
			<div class="row">
				<div class="col" id="rowdata1"></div>
			</div>
			<div class="row" id="line1">
				<div class="col">
					<br>
					<hr color="#ff9198">
					<br>
				</div>
			</div>
			<div class="row">
				<div class="col" id="row2" style="width: 100%;">
					<i class="fas fa-plus-circle" id="insert_icon"
						onclick="addType(2);"></i>&nbsp;&nbsp;&nbsp;<span
						class="insert_line">------------------------------------------</span>
				</div>
			</div>
			<div class="row">
				<div class="col" id="rowdata2"></div>
			</div>
			<div class="row" id="line2">
				<div class="col">
					<br>
					<hr color="#ff9198">
					<br>
				</div>
			</div>
			<div class="row">
				<div class="col" id="row3">
					<i class="fas fa-plus-circle" id="insert_icon"
						onclick="addType(3);"></i>&nbsp;&nbsp;&nbsp;<span
						class="insert_line">------------------------------------------</span>
				</div>
			</div>
			<div class="row">
				<div class="col" id="rowdata3"></div>
			</div>
			<div class="row" id="line3">
				<div class="col">
					<br>
					<hr color="#ff9198">
					<br>
				</div>
			</div>

			<div class="row">
				<div class="col" id="row4">
					<i class="fas fa-plus-circle" id="insert_icon"
						onclick="addType(4);"></i>&nbsp;&nbsp;&nbsp;<span
						class="insert_line">------------------------------------------</span>
				</div>
			</div>
			<div class="row">
				<div class="col" id="rowdata4"></div>
			</div>
			<div class="row" id="line4">
				<div class="col">
					<br>
					<hr color="#ff9198">
					<br>
				</div>
			</div>
			<div class="row">
				<div class="col" id="row5" style="width: 100%;">
					<i class="fas fa-plus-circle" id="insert_icon"
						onclick="addType(5);"></i>&nbsp;&nbsp;&nbsp;<span
						class="insert_line">------------------------------------------</span>
				</div>
			</div>
			<div class="row">
				<div class="col" id="rowdata5"></div>
			</div>
			<br> <br>
			<div class="row">
				<div class="col" style="text-align: right;">
					<input class="insert_submit" type="submit" value="등&nbsp;록">
				</div>
			</div>
		</form>
		<br> <br>
	</div>
	<c:import url="../common/footer.jsp" />

</body>
</html>