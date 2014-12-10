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
<script type="text/javascript">
function popupOpen(){
	var popUrl = "test.html";	//팝업창에 출력될 페이지 URL
	var popOption = "width=370, height=200, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
function popupOpen2(){
	var popUrl = "test2.html";	//팝업창에 출력될 페이지 URL
	var popOption = "width=370, height=200, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
</script>
</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0"
	bgcolor="#5B81A8">
	<table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td rowspan="10" width="50%" bgcolor="#5B81A8"></td>
			<td><img src="image/under.jpg"></td>
			<div class="te">
				<a class="submitUrl" href="index.jsp">재 능 기 부 사 이 트</a>

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
						<td width="191" height="88" background="" valign="top">
							<div class="pres">
								<a class="submitUrl" href="client_center.jsp"> 고객센터 
							</div>
							</a>
						</td>
					</tr>
				</table>
			</td>
		</tr>

		<tr>
			<td valign="top" align="center">
				<table>
					<tr>
						<td><img src=""></td>
						<td></td>
						<td style="padding-left: 250px;">
						<td><img src=""></td>
					</tr>
					<tr>
						<td width="600"><a class="submitUrl" href=""> <font
								size="8" color="#000000">Q N A</td>
						</font>
						</a>
						<td style="padding-left: 250px;">
						<td width="600"><a class="submitUrl" href="client_ask.jsp">
								<font color="#000000" size="10"> 1:1 문의 </td>
						</font>
						</a>
					</tr>
				</table>
		</tr>

		<tr>
			<td valign="middle" align="left">
				<table>
					<tr>
						<td><font size="5"> 자주 묻는 질문</td>
						</font>
						<td></td>
						<td></td>
					</tr>
				</table>
			</td>
		</tr>

		<table class="QNA" cellspacing="0" align="center">

			<colgroup>
				<col width="100">
				<col width="400">
				<col width="150">

			</colgroup>

			<thead>
				<tr>
					<th scope="col">문의 번호</th>
					<th scope="col">문의 내역</th>
					<th scope="col"></th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td style="text-align: center">2</td>
					<td class="title" style="padding-left: 30px;"><a class="submitUrl" href="javascript:popupOpen2();" >회원
							정보 수정이 안됩니다.</a></td>
				</tr>

				<tr>
					<td style="text-align: center">1</td>
					<td class="title" style="padding-left: 30px;"><a class="submitUrl" href="javascript:popupOpen();" >재능
							기부는 어떻게 하나요?</a></td>
				</tr>
			</tbody>
		</table>
</body>
</html>
