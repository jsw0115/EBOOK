<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	function delCheck(){
	result = confirm("������ �����Ͻðڽ��ϱ�?");
	if(result == true){
		document.form1.action.value="delete";
		document.form1.submit();
	}else{
	return;
	}
</script>
</head>
<jsp:useBean id = "ab" scope="request" class="jspbook.addrBook.AddrBook"/>
<body>
<form name ="form1" method ="post" action="addrbook_control.jsp">
<input type = "hidden" name="action" value="update">
<input type="hidden" name="ab_id" value="<%=ab.getAb_id()%>">
<table border=1>
	<tr>
	<th>�̸�</th>
	<td><input type="text" name="ab_name" value=<%=ab.getAb_name()%>></td>
	</tr>
	<tr>
	<th>email</th>
	<td><input type="text" name="ab_email" value=<%=ab.getAb_email()%>></td>
	</tr>
	<tr>
	<th>��ȭ��ȣ</th>
	<td><input type="text" name="ab_tel" value=<%=ab.getAb_tel()%>></td>
	</tr>
	<tr>
	<th>�� ��</th>
	<td><input type="date" name="ab_birth" value=<%=ab.getAb_birth()%>></td>
	</tr>
	<tr>
	<th>ȸ ��</th>
	<td><input type="text" name="ab_comdept" value=<%=ab.getAb_comdept()%>></td>
	</tr>
	<tr>
	<th>�� ��</th>
	<td><input type="text" name="ab_memo" value=<%=ab.getAb_memo()%>></td>
	</tr>
	<tr>
		<td colspan=2 align = "center" > <input type ="submit" value="����">
		<input type="reset" value="���">
		<input type="button" value="����" onClick="delCheck()">
		</td>
	</tr>
</table>
</form>
</body>
</html>