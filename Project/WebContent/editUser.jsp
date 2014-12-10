
<%@page import="java.sql.Timestamp"%>
<%@page import="model.dto.User"%>
<%@page import="model.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>
<META HTTP-EQUIV="contentType" CONTENT="text/html;charset=UTF-8">
<title>재능기부사이트 - 회원정보수정</title>
<!-- JavaScript -->
<script src="js/jquery-1.11.1.js"></script>
<script src="js/global.js"></script>
<link href="stylesheet/style.css" rel="stylesheet" type="text/css">

<!-- Bootstrap -->
<!-- 
<script src="framework/bootstrap/js/bootstrap.js"></script>
<link href="framework/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	 type="text/css"> -->
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
								<a class="submitUrl" class="submitUrl" href="search.jsp"> 재능
									검색 
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

		<tr>
			<form action="user" method="post" name="frm">
				<td class="form" valign="top" align="center">
					<table>
						<%
							request.setCharacterEncoding("utf-8");

							String checkID = "temp";
							String checkName = null;
							Timestamp joindate;
							User user = (User) session.getAttribute("user");
							checkID = user.getId();
							checkName = user.getUser_name();
							joindate = user.getJoin_date();
							
						%>

						<tr>
							<td class="form">ID</td>
							<td class="form" style="padding-left: 7px;"><input
								type="text"
								style="width: 80; height: 20; background-color: #5B81A8; border: 0px"
								name="id" value=<%=checkID %> readonly></td>
						</tr>

						<tr>
							<td class="form" height="5"></td>
						</tr>

						<tr>
							<td class="form">변경할 Password</td>
							<td class="form" style="padding-left: 7px;"><input
								type="password" style="width: 80; height: 20" name="pwd"
								id="editcheck_pw"></td>
						</tr>

						<tr>
							<td class="form" height="5"></td>
						</tr>

						<tr>
							<td class="form">변경할 Password 확인</td>
							<td class="form" style="padding-left: 7px;"><input
								type="password" style="width: 80; height: 20" name="pwd2"
								id="editcheck_pw2"></td>
						</tr>

						<tr>
							<td class="form" height="5"></td>
						</tr>

						<tr>
							<td class="form">성명</td>
							<td class="form" style="padding-left: 7px;"><input
								type="text" style="width: 80; height: 20; background-color:#5B81A8; border: 0px" name="user_name"
								value=<%=checkName %> readonly></td>

							</td>
						</tr>

						<tr>
							<td class="form">E-mail</td>
							<td class="form" style="padding-left: 7px;"><input
								type="text" style="width: 80; height: 20" name="email" size="40"
								id="check_email"></td>
						</tr>

						<tr>
							<td class="form" height="5"></td>
						</tr>

						<tr>
							<td class="form">가입일</td>
							<td class="form" style="padding-left: 7px;"><%=joindate %></td>
						</tr>

						<tr>
							<td class="form" height="5"></td>
						</tr>

						<tr>
							<td class="form"></td>
							<td class="form" style="padding-left: 7px"><input
								type="button" name="register_user" value="회원정보 변경"
								onClick="editChk()"> <input type="button" value="취소"
								onclick="location.href='loginpage.jsp'"></td>
							</td>
						</tr>

					</table>
				</td>
		</tr>
		<input type="hidden" id="action" name="action" value="editUser" />
		</form>
		<table align="center">
			<tr>
				<td class="form" colspan="4" align="center"
					style="padding-top: 10px;">2014 &copy; Copyright
					WebProgramming, inc. All rights reserved.</td>
			</tr>
		</table>
	</table>
	</form>


	<script type="text/javascript">
		function editChk() {

			if (document.getElementById("editcheck_pw").value == "") {
				alert("변경할 패스워드를 입력해주세요");
				return false;
			} else if (document.getElementById("editcheck_pw2").value == "") {
				alert("변경할 패스워드 확인을 입력해주세요");
				return false;
			} else if (document.getElementById("check_email").value == "") {
				alert("이메일을 입력해주세요");
				return false;
			}

			var pw = document.getElementById("editcheck_pw").value;
			var pwck = document.getElementById("editcheck_pw2").value;

			if (pw != pwck) {
				alert("패스워드와 패스워드 확인이 다릅니다.");
				return false;

			} else {
				alert("회원정보가 수정되었습니다.");
				document.frm.submit();
			}
		}
	</script>
</body>
</html>