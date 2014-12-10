<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="model.dto.User"%>
<%@page import="model.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html lang="ko">
<head>
<META HTTP-EQUIV="contentType" CONTENT="text/html;charset=UTF-8">
<% request.setCharacterEncoding("UTF-8");%>
<title>재능기부 사이트</title>
<link href="stylesheet/style.css" rel="stylesheet" type="text/css">
<!-- JavaScript -->
<script src="js/jquery-1.11.1.js"></script>
<script src="js/global.js"></script>
<script type="text/javascript">
	alert("아이디와 비밀번호를 확인해주세요");
</script>
</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0"
	bgcolor="#5B81A8">
	<table cellpadding="0" cellspacing="0" border="0">
		<tr>

			<td class="form" rowspan="10" width="50%" bgcolor="#5B81A8"></td>

			<td class="form"><img src="image/under.jpg"></td>
			<div class="te">
				<a class="submitUrl" href="index.jsp">재 능 기 부 사 이 트</a>
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
								<a class="submitUrl" class="submitUrl" href="search.jsp">
									재능 검색
							</div>
							</a>
						</td>
						<td class="form" width="179" height="88" valign="top">
							<div class="pres">
								<a class="submitUrl" class="submitUrl" href="donation.jsp">
									재능 기부
							</div>
							</a>
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
							</div>
							</a>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		

		<tr>
			<td class="form" valign="top" align="center">
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td class="form" colspan="2"><img src="image/mainicon.png"></td>
					</tr>
					<tr>
						<td class="form"><img src=""></td>
						<td class="form" width="233" valign="top"><div class="wel">
								재능기부 사이트에 오신것을 환영합니다.</div></td>
						<td class="form" width="4" valign="top"><img
							src="image/block.gif"></td>
						<td class="form" width="191" valign="top">
							<div style="padding-left: 13px; padding-top: 5px;">
							
								<form action="user" method="post"  name = "loginform">
									<table cellpadding="0" cellspacing="0">
										<tr>
											<td class="form">ID</td>
											<td class="form" style="padding-left: 7px;"><input
												type="text" style="width: 80; height: 20" name="id"></td>
										</tr>
										<tr>
											<td class="form" height="5"></td>
										</tr>
										<tr>
											<td class="form">Password</td>
											<td class="form" style="padding-left: 7px;"><input
												type="password" style="width: 80; height: 20" name="pwd"></td>
										</tr>
										<tr>
											<td class="form" colspan="2"><img src=""></td>
										</tr>
										
										<tr>
											<td class="form" colspan="5"><input type="button"
												name="log" value="login" id = "logincheck" onClick = "Login()"> <input type="button"
												name="use" value="회원가입"
												onclick="location.href='registUser.jsp'"></td>
											<td class="form">
											<input type="hidden" value="login" name="action" value = "Login"/>
										</tr>
									</table>
								</form>
							</div>
						</td>
					</tr>

					<tr>
						<td class="form" colspan="4" align="center"
							style="padding-top: 10px;">2014 &copy; Copyright
							WebProgramming, inc. All rights reserved.</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<script type = "text/javascript">
			
		function Login(){
			
			if(!document.loginform.id.value){
				alert("아이디를 입력해주세요.");
				document.loginform.id.focus();
				return false;
			}
						
			if(!document.loginform.pwd.value){
				alert("비밀번호를 입력해주세요.");
				document.loginform.pwd.focus();
				return false;
			}
					
			else{
				document.loginform.submit();
				return true;
			}
		} 
	</script>
	</body>
	</html>