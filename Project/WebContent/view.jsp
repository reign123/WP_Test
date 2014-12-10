<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="model.dto.Post"%>
<%@ page import="model.dao.PostDao"%>
<%@ page import="model.dto.User"%>
<%@ page import="model.dao.UserDao"%>
<%@ page errorPage="error.jsp"%>
<html lang="ko">
<head>
<META HTTP-EQUIV="contentType" CONTENT="text/html;charset=UTF-8">
<title>재능기부 사이트 - 재능 검색</title>
<link href="stylesheet/style.css" rel="stylesheet" type="text/css">
<script src="js/jquery-1.11.1.js"></script>

</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0"
	bgcolor="#5B81A8">

	<%
		request.setCharacterEncoding("utf-8");

		Timestamp writedate;
		int checkID;
		String checkTitle = null;
		String content = null;
		int category;
		String equalsID = null;

		Post post = (Post) request.getAttribute("post");
		User user = (User) request.getSession().getAttribute("user");

		String currentID = user.getId();
		checkID = post.getId();
		checkTitle = post.getTitle();
		equalsID = post.getUser_id();
		writedate = post.getCreate_at();
		content = post.getContent();
		category = post.getCategory();
	%>
	<script type="text/javascript">
		$(function() {
			$('#editFile').click(function() {
				$(location).attr('href', "post?action=editFile&num=<%=checkID%>");
					});
		});
	</script>
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

		<tr>
			<td class="form" valign="top" align="center">
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td class="form" style="padding-left: 7px;"><img
							src="image/search.png"> 재능 검색 <input type="text"
							name="search_text" size="45" id="sText"> <input
							type="button" name="search" value="검색" id="sSearch"></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="form" valign="top" align="center">
				<table cellpadding="0" cellspacing="0" border="0" align="center">
					<tr>
						<td class="form" style="padding-left: 7px;">
							<div class="pres">
								분야별 검색 : <a href="post?action=list&pageNumber=1&category=1"
									class="searchForm">디자인분야 </a> <a
									href="post?action=list&pageNumber=1&category=2"
									class="searchForm"> 문서 및 레포트 </a> <a
									href="post?action=list&pageNumber=1&category=3"
									class="searchForm">프로그래밍</a> <a
									href="post?action=list&pageNumber=1&category=4"
									class="searchForm"">음악/영상</a> <a
									href="post?action=list&pageNumber=1&category=0"
									class="searchForm">전체보기</a>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>

			<table width="413" align="center">
				<tr>
					<td width="0">&nbsp;</td>
					<td align="center" width="76">글번호</td>
					<td width="319"><%=checkID%></td>
					<td width="0">&nbsp;</td>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4" width="407"></td>
				</tr>
				<tr>
					<td width="0">&nbsp;</td>
					<td align="center" width="76">이름</td>
					<td width="319"><%=post.getUser_id()%></td>
					<td width="0">&nbsp;</td>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4" width="407"></td>
				</tr>
				<tr>
					<td width="0">&nbsp;</td>
					<td align="center" width="76">작성일</td>
					<td width="319"><%=writedate%></td>
					<td width="0">&nbsp;</td>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4" width="407"></td>
				</tr>
				<tr>
					<td width="0">&nbsp;</td>
					<td align="center" width="76">제목</td>
					<td width="319"><%=checkTitle%></td>
					<td width="0">&nbsp;</td>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4" width="407"></td>
				</tr>
				<tr>
					<td width="0">&nbsp;</td>
					<td align="center" width="76">내용</td>
					<td width="319"><%=content%></td>
					<td width="0">&nbsp;</td>
				</tr>
				<tr>
					<td width="0">
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4" width="407"></td>
				</tr>
				<tr height="1" bgcolor="#82B5DF">
					<td colspan="4" width="407"></td>
				</tr>
				<tr align="center">


					<td width="0">&nbsp;</td>
					<td colspan="2" width="399"><input type=button value="글쓰기"
						OnClick="location.href='donation.jsp'"> <input type=button
						value="리뷰"> <input type=button value="목록"
						OnClick="location.href='post?action=list&pageNumber=1&category=0'">
						<%
							if (currentID.equals(equalsID)) {
						%> <input type="button" value="수정" id="editFile" class="editFile">
						<script>
							function deletePost() {
								var f = document.createElement("form");
								f.setAttribute("method", "post");
								f.setAttribute("action", "post");
								document.body.appendChild(f);

								var i = document.createElement("input");
								i.setAttribute("type", "hidden");
								i.setAttribute("name", "num");
								i.setAttribute("value",
						<%=checkID%>
							);
								f.appendChild(i);
								var j = document.createElement("input");
								j.setAttribute("type", "hidden");
								j.setAttribute("name", "action");
								j.setAttribute("value", "delete");
								f.appendChild(j);

								f.submit();
							}
						</script> <input type="button" value="삭제" onclick='deletePost();'>
						<%
							} else {
						%> <input type=button value="요청하기"> <%
 	}
 %>
					<td width="0">&nbsp;</td>

				</tr>
			</table>
</body>
</html>