<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="addrbook.css" type="text/css">
</head>
<body>
	<h2>주소록 : 작성화면</h2>
	[<a href="addrbook_control.jsp?action=list">주소록 목록으로 </a>]<p>
	<form action= "addrbook_control.jsp" method="post">
	<input type="hidden" name="action" value="insert">
		<table border="1">
		<tr><th>이름</th><td><input type="text" name="ab_name"></td></tr>
		<tr><th>이메일</th><td><input type="text" name="ab_email"></td></tr>
		<tr><th>전화번호</th><td><input type="text" name="ab_tel"></td></tr>
		<tr><th>생일</th><td><input type="date" name="ab_birth"></td></tr>
		<tr><th>회사</th><td><input type="text" name="ab_comdept"></td></tr>
		<tr><th>메모</th><td><input type="text" name="ab_memo"></td></tr>
		<tr><td colspan=2 align="center"><input type="submit" value="저장">
		<input type="reset" value="취소"></td>
		</tr>
		</table>
	</form>
</body>
</html>