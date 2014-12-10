
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="model.dto.Post"%>
<%@ page import="model.dao.PostDao"%>

<html lang="ko">
<head>
<META HTTP-EQUIV="contentType" CONTENT="text/html;charset=UTF-8">
<title>재능기부 사이트 - 재능 검색</title>
<link href="stylesheet/style.css" rel="stylesheet" type="text/css">
</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0"
	bgcolor="#5B81A8">
	<table cellpadding="0" cellspacing="0" border="0">
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
								<a class="submitUrl"
									href="post?action=list&pageNumber=1&category=0"> 재능 검색 
							</div> </a>
						</td>
						<td class="form" width="179" height="88" valign="top">
							<div class="pres">
								<a class="submitUrl" href="donation.jsp"> 재능 기부 
							</div> </a>
						</td>
						<td class="form" width="185" height="88" valign="top">
							<div class="pres">
								<a class="submitUrl" href="myroom.html"> 마이룸 </a>
							</div>
						</td>
						<td class="form" width="191" height="88" valign="top">
							<div class="pres">
								<a class="submitUrl" href="client_center.html"> 고객센터 
							</div> </a>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		
		<table><%
		Post post = (Post) request.getAttribute("post");
		/* getid = null */
		int test = post.getId();
		%>
		<%=test %>
			<form action="delete" method="post" name="deleteform">
				<tr>
					<td>
						<table width="100%" cellpadding="0" cellspacing="0" border="0">

							<td><input type=button value="삭제" onclick="deleteCheck()" name = "delete">
								<input type=button value="취소"
								OnClick="javascript:history.back(-1)"> <input
								type="hidden" id="action" name="action" value="delete" /></td>
						</table>
					</td>
				</tr>
			</form>
		</table>

	</table>
	<script type="text/javascript">
		function deleteCheck() {
			document.deleteform.submit;
		}
	</script>
</body>
</html>