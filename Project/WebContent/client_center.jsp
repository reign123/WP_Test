<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="model.dto.User"%>
<%@page import="model.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page errorPage="error.jsp"%>

<html lang="ko">
<head>
<meta charset="utf-8">
<title>재능기부 사이트 - 고객센터</title>
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
			<td rowspan="10" width="50%" bgcolor="#5B81A8"></td>
			<td><img src="image/under.jpg"></td>
			<div class="te">
			<% if(user.getId() != null){ %>
				<a class="submitUrl" href="loginpage.jsp">재 능 기 부 사 이 트</a>
			<% }else{ %>
                <a class="submitUrl" href="index.jsp">재 능 기 부 사 이 트</a>
                <% } %>
			</div>
			<td rowspan="10" width="50%" bgcolor="#5B81A8"></td>
		</tr>

		<tr>
			<td valign="top" align="center">
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td><img src="image/search.png"></td>
						<td><img src="image/donation.png"></td>
						<td><img src="image/myroom.png"></td>
						<td><img src="image/client_center.png"></td>
						<td><%=checkID %></td>
					</tr>
					<tr>
						<td width="173" height="88" background="" valign="top">
							<div class="pres">
								<a class="submitUrl" class="submitUrl"
									href="post?action=list&pageNumber=1&category=0"> 재능 검색 
							</div>
							</a>
						</td>
						<td width="179" height="88" background="" valign="top">
							<div class="pres">
								<a class="submitUrl" href="donation.jsp"> 재능 기부 
							</div>
							</a>
						</td>
						<td width="185" height="88" background="" valign="top">
							<div class="pres">
								<a class="submitUrl" href="myroom.jsp"> 마이룸 
							</div>
							</a>
						</td>
						<td class="submitUrl" width="191" height="88" background=""
							valign="top">
							<div class="pres">
								<a class="submitUrl" href="client_center.jsp"> 고객센터 
							</div>
							</a>
						</td>
					</tr>
				</table>
			</td>
		</tr>

		<table class="center">
			<td><a class="submitUrl" href="client_QNA.jsp"> <font
					size="8" color="black">Q N A</td>
			</font>
			</a>
			<td><a class="submitUrl" href="client_ask.jsp"> <font
					color="#000000" size="8"> 1:1 문의</td>
			</font>
			</a>
		</table>
</body>
</html>
