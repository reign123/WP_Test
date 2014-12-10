
<%@page import="java.sql.Timestamp"%>
<%@page import="model.dto.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.PostDao"%>
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
			<form action="post" method="post" name="frm">
				<td class="form" valign="top" align="center">
					<table>
						<%
							ArrayList<Post> postList = (ArrayList<Post>) request
										.getAttribute("postList");
											
											String checkName = null;
											Timestamp writedate;
											Post post = (Post) request.getAttribute("post");
											int checkID = post.getId();
											checkName = post.getUser_id();
											writedate = post.getCreate_at();
						%>

						<table width="413" align="center">
							<tr>
								<td width="0">&nbsp;</td>
								<td align="center" width="76">글번호</td>
								<input type = "hidden" name = "num"> 
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
								<td width="319"><input type="text"
									style="width: 80; height: 20" name="subject" id="subject_ck"></td>
								<td width="0">&nbsp;</td>
							</tr>
							<tr height="1" bgcolor="#dddddd">
								<td colspan="4" width="407"></td>
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

							<tr>
								<td width="0">&nbsp;</td>
								<td align="center" width="76">내용</td>
								<td width="319"><input type="textarea"
									style="width: 80; height: 50" name="content" id="content_ck"></td>
								</td>
								<td width="0">&nbsp;</td>
							</tr>

							<tr>
								<td class="form"></td>
								<td class="form" style="padding-left: 7px"><input
									type="button" name="register_user" value="수정"
									onClick="editChk()"> <input type="button" value="취소"
									onclick="location.href='post?action=list&pageNumber=1&category=0'"></td>
								</td>
							</tr>

						</table>
						</td>
						</tr>
						<input type="hidden" id="action" name="action" value="edit" />
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

					if (document.getElementById("subject_ck").value == "") {
						alert("제목을 입력해주세요");
						return false;
					} else if (document.getElementById("content_ck").value == "") {
						alert("내용을 입력해주세요");
						return false;
					} else {
						alert("해당 게시글이 수정되었습니다.");
						document.frm.submit();
					}
				}
			</script>
</body>
</html>