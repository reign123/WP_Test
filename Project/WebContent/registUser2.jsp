<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>
<META HTTP-EQUIV="contentType" CONTENT="text/html;charset=UTF-8">
<title>재능기부사이트 - 회원가입</title>
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
						<td class="form" width="173" height="88" background=""
							valign="top">
							<div class="pres">
								<a class="submitUrl" href="search.jsp"> 재능 검색 
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
				</table>
			</td>
		</tr>

		<form action="user" method="post" name="frm">
			<tr>
				<td class="form" valign="top" align="center">
					<table>
						<tr>
							<td class="form">ID</td>
							<td class="form" style="padding-left: 7px;"><input
								type="text" style="width: 80; height: 20" name="id"
								id="check_id"> <input type="button" name="check_ID"
								value="중복확인" id="requestCheckId"></td>
						</tr>

						<tr>
							<td class="form" height="5"></td>
						</tr>

						<tr>
							<td class="form">Password</td>
							<td class="form" style="padding-left: 7px;"><input
								type="password" style="width: 80; height: 20" name="pwd"
								id="check_pw"></td>
						</tr>

						<tr>
							<td class="form" height="5"></td>
						</tr>

						<tr>
							<td class="form">Password 확인</td>
							<td class="form" style="padding-left: 7px;"><input
								type="password" style="width: 80; height: 20" name="pwd2"
								id="check_pwck"></td>
						</tr>

						<tr>
							<td class="form" height="5"></td>
						</tr>

						<tr>
							<td class="form">성명</td>
							<td class="form" style="padding-left: 7px;"><input
								type="text" style="width: 80; height: 20" name="user_name"
								id="check_name"></td>

							</td>
						</tr>

						<tr>
							<td class="form">e-mail</td>
							<td class="form" style="padding-left: 7px;"><input
								type="text" style="width: 80; height: 20" name="email" size="40"
								id="check_email"></td>
						</tr>

						<tr>
							<td class="form" height="5"></td>
						</tr>

						<tr>
							<td class="form"></td>
							<td class="form" style="padding-left: 7px"><input
								type="button" name="register_user" value="회원가입"
								onClick="memChk()"> <input type="button" value="취소"
								onclick="location.href='index.jsp'"></td>
							</td>
						</tr>

					</table>
				</td>
			</tr>
			<input type="hidden" id="action" name="action" value="registUser">
		</form>
		<tr>
			<td class="form" colspan="4" align="center"
				style="padding-top: 10px;">2014 &copy; Copyright
				WebProgramming, inc. All rights reserved.</td>
		</tr>
	</table>
	</form>


	<!-- ajax call -->
	<script type="text/javascript">
		flag = false;
		cnt = 0;
		$(function() {
			$('#requestCheckId').click(function() {
				var submitUrl = gUrl;
				var params = {
					servlet : 'user',
					action : 'requestCheckId',
					param : $('#check_id').val()
				};
				$.post(submitUrl + params['servlet'], {
					action : params['action'],
					userId : params['param']
				}, function(result) {
					//callback
					if (result['result'] == 'true') {
						flag = 'true';
						cnt = 1;
						alert('사용 가능한 아이디입니다.');
					} else {
						flag = 'false';
						alert('중복된 아이디입니다.');
					}
				}, 'json');
			});
		});
	</script>

	<!-- form valid check -->
	<script type="text/javascript">
		$(function() {

		});

		function winOpen() {
			window.open("idChk.jsp", "w",
					"width=300, height=100, resizable=yes");

		}
		function nickChk() {
			window.open("nickChk.jsp", "n", "width=300, height=100")
		}
		function memChk() {

			if (document.getElementById("check_id").value == "") {
				alert("아이디를 입력해주세요");
				return false;
			} else if (document.getElementById("check_pw").value == "") {
				alert("패스워드를 입력해주세요");
				return false;
			} else if (document.getElementById("check_pwck").value == "") {
				alert("패스워드 확인을 입력해주세요");
				return false;
			} else if (document.getElementById("check_name").value == "") {
				alert("이름을 입력해주세요");
				return false;
			} else if (document.getElementById("check_email").value == "") {
				alert("이메일을 입력해주세요");
				return false;
			}

			var pw = document.getElementById("check_pw").value;
			var pwck = document.getElementById("check_pwck").value;
			if (pw != pwck) {
				alert("패스워드와 패스워드 확인이 다릅니다.");
				return false;
			}
			if (flag == 'false' || cnt == 0) {
				alert("아이디를 확인해주세요");
				return false;
			}
			if (flag == 'true' && cnt == 1) {
				alert("회원가입되었습니다");
				document.frm.submit();
			}
		}
	</script>
</body>
</html>
