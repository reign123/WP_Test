<%@page import="model.dto.User"%>
<%@page import="model.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page errorPage="error.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="ko">
<head>
<META HTTP-EQUIV="contentType" CONTENT="text/html;charset=UTF-8">
<title>재능기부 사이트 - 재능 기부</title>
<link href="stylesheet/style.css" rel="stylesheet" type="text/css">
<!-- JavaScript -->
<script src="js/jquery-1.11.1.js"></script>
<script src="js/global.js"></script>
<link href="stylesheet/style.css" rel="stylesheet" type="text/css">

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
						<td class="form" width="173" height="88" valign="top">
							<div class="pres">
								<a class="submitUrl" class="submitUrl"
									href="post?action=list&pageNumber=1&category=0"> 재능 검색 
							</div> </a>
						</td>
						<td class="form" width="179" height="88" valign="top">
							<div class="pres">
								<a class="submitUrl" class="submitUrl" href="donation.jsp">
									재능 기부 
							</div> </a>
						</td>
						<td class="form" width="185" height="88" valign="top">
							<div class="pres">
								<a class="submitUrl" class="submitUrl" href="myroom.jsp">
									마이룸 </a>
							</div>
						</td>
						<td class="form" width="191" height="88" valign="top">
							<div class="pres">
								<a class="submitUrl" class="submitUrl" href="client_center.jsp">
									고객센터 
							</div> </a>
						</td>
					</tr>
				</table>
			</td>
		</tr>

		<form action="post" method="post" name="boa">
			<table width="600" cellpadding="0" cellspacing="0" border="0"
				align="center">
				<tr bgColor="#5B81A8" height="25">
					<td class="form" width="20%" align="center">글쓴이</td>
					<td class="form" width="80%"><input type="text"
						style="width: 80; height: 20; background-color: #5B81A8; border: 0px"
						name="id" id="<%=checkID%>" value=<%=checkID%> readonly></td>
				</tr>

				<tr bgColor="#5B81A8" height="25">
					<td class="form" align="center">글제목</td>
					<td><input type="text" id="subject" name="subject"
						maxlength="20" size="40"></td>
				</tr>

				<tr bgColor="#5B81A8" height="25">
					<td class="form" align="center">분류</td>
					<td><select name="category">
							<option value="1">디자인분야</option>
							<option value="2">문서 및 레포트</option>
							<option value="3">프로그래밍</option>
							<option value="4">음악/영상</option>
							<option value="0">기타</option>
					</select></td>
				</tr>

				<tr bgColor="#5B81A8" height="25">
					<td class="form" align="center">글 내용</td>
					<td><textarea cols="60" rows="10" id="content" name="content"></textarea></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td class="form"></td>
					<td class="form" style="padding-left: 7px"><input
						type="button" name="write" value="글쓰기" onClick="send()"> <input
						type="reset" value="다시쓰기"> <input type="button" value="목록"
						onclick="location.href = 'post?action=list&pageNumber=1&category=0'">
					</td>
				</tr>
				<input type="hidden" id="action" name="action" value="write" />
			</table>
		</form>
	</table>

	<script type="text/JavaScript">
		function send() {
			if (document.getElementById("subject").value == "") {
				alert("제목을 입력하세요");
				return;
			}
			if (document.getElementById("content").value == "") {
				alert("내용을 입력해주세요");
				return;
			} else {
				alert("글이 작성되었습니다.");
				document.boa.submit();
			}
		}
	</script>

</body>
</html>




