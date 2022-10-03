<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
 <%@ page import="jspbook.addrBook.AddrBook" %>
 
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="addrbook.css" type="text/css">
<script type="text/javascript">
	function check(ab_id){
		pwd=prompt("비밀번호를 입력하세요");
		document.location.href="addrbook_control.jsp?action=edit&ab_id="+ab_id+"&upasswd="+pwd;
	}
</script>
</head>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request"></jsp:useBean>
<body>
	<div align="center">
	<h2>주소록</h2>
	<hr>
	<form>
		<a href="addrbook_form.jsp">주소록 등록</a>
		<table border="1">
			<tr>
			<th>번호</th><th>이름</th><th>전화번호</th><th>생일</th>
			<th>회사</th><th>메모</th>
			</tr>
			
			<% for(AddrBook ab: (ArrayList<AddrBook>) datas){ %>
			<tr>	
				<td><a href="javascript:check(<%=ab.getAb_id() %>)">
				<%=ab.getAb_id() %></a></td>
				<td><%=ab.getAb_name() %></td>
				<td><%=ab.getAb_tel() %></td>
				<td><%=ab.getAb_birth() %></td>
				<td><%=ab.getAb_comdept() %></td>
				<td><%=ab.getAb_memo() %></td>
			</tr>
			<%} %>
		</table>
	</form>
	</div>
</body>
</html>