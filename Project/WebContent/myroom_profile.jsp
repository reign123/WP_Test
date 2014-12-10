<%@page import="model.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>
<meta charset="utf-8">
<title>재능기부 사이트 - 마이룸</title>
<link href="stylesheet/style.css" rel="stylesheet" type="text/css">
<script language="javascript">
	function previewImage(targetObj, View_area) {
		var preview = document.getElementById(View_area); //div id
		var ua = window.navigator.userAgent;
		if (ua.indexOf("MSIE") > -1) {
			targetObj.select();
			try {
				var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
				var ie_preview_error = document
						.getElementById("ie_preview_error_" + View_area);

				if (ie_preview_error) {
					preview.removeChild(ie_preview_error); //error가 있으면 delete
				}

				var img = document.getElementById(View_area); //이미지가 뿌려질 곳

				//이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
				img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
						+ src + "', sizingMethod='scale')";
			} catch (e) {
				if (!document.getElementById("ie_preview_error_" + View_area)) {
					var info = document.createElement("<p>");
					info.id = "ie_preview_error_" + View_area;
					info.innerHTML = e.name;
					preview.insertBefore(info, null);
				}
			}
		} else {
			var files = targetObj.files;
			for (var i = 0; i < files.length; i++) {
				var file = files[i];
				var imageType = /image.*/;
				if (!file.type.match(imageType))
					continue;
				var prevImg = document.getElementById("prev_" + View_area);
				if (prevImg) {
					preview.removeChild(prevImg);
				}
				var img = document.createElement("img");
				img.id = "prev_" + View_area;
				img.classList.add("obj");
				img.file = file;
				img.style.width = '100px';
				img.style.height = '100px';
				preview.appendChild(img);
				if (window.FileReader) { // FireFox, Chrome, Opera 확인.
					var reader = new FileReader();
					reader.onloadend = (function(aImg) {
						return function(e) {
							aImg.src = e.target.result;
						};
					})(img);
					reader.readAsDataURL(file);
				} else {
					if (!document.getElementById("sfr_preview_error_"
							+ View_area)) {
						var info = document.createElement("p");
						info.id = "sfr_preview_error_" + View_area;
						info.innerHTML = "not supported FileReader";
						preview.insertBefore(info, null);
					}
				}
			}
		}
	}
</script>
</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0"
	bgcolor="#5B81A8">
	<%
		String checkID = "temp";
		User user = (User) session.getAttribute("user");
		checkID = user.getId();
	%>
	<table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td class="form" rowspan="10" width="50%" bgcolor="#5B81A8"></td>
			<td class="form"><img src="image/under.jpg"></td>
			<div class="te">
				<%
					if (user.getId() != null) {
				%>
				<a class="submitUrl" href="loginpage.jsp">재 능 기 부 사 이 트</a>
				<%
					} else {
				%>
				<a class="submitUrl" href="index.jsp">재 능 기 부 사 이 트</a>
				<%
					}
				%>
			</div>
			<td class="form" rowspan="10" width="50%" bgcolor="#5B81A8"></td>
		</tr>
		<tr>
			<td class="form" valign="top" align="center">
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td class="form"><img src="image/search.png"></td>
						<td class="form"><img src="image/donation.png"></td>
						<td class="form"><img src="image/myroom.png"></td>
						<td class="form"><img src="image/client_center.png"></td>
					</tr>
					<tr>
						<td class="form" width="173" height="88" background=""
							valign="top">
							<div class="pres">
								<a class="submitUrl" class="submitUrl"
									href="post?action=list&pageNumber=1&category=0"> 재능 검색 
							</div> </a>
						</td>
						<td class="form" width="179" height="88" background=""
							valign="top">
							<div class="pres">
								<a class="submitUrl" href="donation.jsp"> 재능 기부 
							</div> </a>
						</td>
						<td class="form" width="185" height="88" background=""
							valign="top">
							<div class="pres">
								<a class="submitUrl" href="myroom.jsp"> 마이룸 
							</div> </a>
						</td>
						<td class="form" width="191" height="88" background=""
							valign="top">
							<div class="pres">
								<a class="submitUrl" href="client_center.jsp"> 고객센터 
							</div> </a>
						</td>
					</tr>
					<table>
						<th></th>
						<th>프로필 등록</th>
						<th></th>
						<tr>
							<td class="profile_box"></td>
							<td class="profile_img"><div id='View_area'
									style='position: relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline;'>
								</div></td>
							<td class="profile_box"></td>
						</tr>
						<tr>
							<td></td>
							<td colspan="3">
								<form action="#" accept-charset="utf-8" name="person_info"
									method="get">
									<textarea name="comment" cols="41" rows="10"
										placeholder="자신의 정보를 입력해주세요."></textarea>
									<br> <br>
								</form>
							</td>
						</tr>
						<tr>
						    <td></td>
						    <td></td>
						    <td></td>
							<td align="right" valign="top"><input type="submit" value="확인"><input type="reset" value="취소"></td>
						</tr>
						<tr>
							<td align="right"><프로필사진></td>
							<td colspan="3"><input type="file" name="profile_pt"
								id="profile_pt" onchange="previewImage(this,'View_area')">
								<input type="submit" value="확인"><input type="reset"
								value="취소">
								</form></td>
						</tr>
					</div>
						</table>
				</table>
			</td>
		</tr>

</body>
</html>