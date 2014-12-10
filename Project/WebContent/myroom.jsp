<%@page import="model.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page errorPage="error.jsp"%>

<html lang="ko">
<head>
<meta charset="utf-8">
<title>재능기부 사이트 - 마이룸</title>
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
						<th> <%=checkID %></th>
						<th><a class="submitUrl" href="myroom_profile.jsp">프로필 등록</a></th>
						<tr>
							<td></td>
							<td class="profile_box"></td>
							<td class="profile_img"><div id='View_area'
									style='position: relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline;'>
								</div></td>
							<td class="profile_box"></td>
						</tr>
						<tr>
							<td></td>
							<td class="profile_img" colspan="3" bgcolor="white"></td>
							</td>
						</tr>

						</div>
					</table>
				</table>
			</td>
		</tr>
</body>
</html>