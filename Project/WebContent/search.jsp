
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

	<%
		ArrayList<Post> postList = (ArrayList<Post>) request
			.getAttribute("postList");
	%>
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
								<a class="submitUrl" href="myroom.jsp"> 마이룸 </a>
							</div>
						</td>
						<td class="form" width="191" height="88" valign="top">
							<div class="pres">
								<a class="submitUrl" href="client_center.jsp"> 고객센터 
							</div> </a>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<script language="javascript">
			function search() {
				if (documnet.searchText.value == "") {
					alert("검색어를 입력해 주세요");
					return;
				}
				document.searchText.submit();
			}
		</script>

		<tr>
			<td class="form" valign="top" align="center">
				<form method="get" action="post" name="searchText">
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td class="form" style="padding-left: 7px;"><img
								src="image/search.png"> 재능 검색 <input type="text"
								name="search_text" size="45" id="searchValue"> <input
								type="button" name="search" value="검색"
								onclick="javascript:search()"></td>
						</tr>
					</table>
				</form>
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
		</tr>
		<table>
			<%
				if (postList.size() == 0) {
			%>
			<tr align="center" height="30">
				<td align="center">등록된 글이 없습니다.</td>
			</tr>
			<%
				} else {
					for (int i = 0; i < postList.size(); i++) {
						Post tPost = postList.get(i);
			%>
			<form>
				<fieldset style="width: 80; border: 3">
					<legend>
						<a href="post?action=view&num=<%=tPost.getId()%>"> <%=tPost.getTitle()%>
					</legend>
					</a>
					<%
						String Category = null;
								if (tPost.getCategory() == 1) {
									Category = "디자인분야";
								} else if (tPost.getCategory() == 2) {
									Category = "문서 및 레포트";
								} else if (tPost.getCategory() == 3) {
									Category = "프로그래밍";
								} else if (tPost.getCategory() == 4) {
									Category = "음악/영상";
								} else {
									Category = "기타";
								}
								Timestamp date = tPost.getCreate_at();
					%>
					- 분야 :
					<%=Category%><br> 내용 :
					<%=tPost.getContent()%><br> ID :
					<%=tPost.getUser_id()%>
					작성일 :
					<%=date%>
				</fieldset>
			</form>

			<%-- 	<td align="center"><%=Category%></td>
			</tr> --%>
			<%
				}
				}
			%>
		</table>
	</table>
	<tr>
		<td class="form" align="center" style="padding-top: 10px;">2014
			&copy; Copyright WebProgramming, inc. All rights reserved.</td>
	</tr>
</body>
</html>
