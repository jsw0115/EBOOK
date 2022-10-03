<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
 <%@ page import="java.util.*" %>
 <%@ page import="jspbook.addrBook.*" %>
<jsp:useBean id="addrbook" class="jspbook.addrBook.AddrBook"></jsp:useBean>
<jsp:useBean id="gb" class="jspbook.addrBook.AddrBean" scope="page"></jsp:useBean>
<jsp:setProperty name="addrbook" property="*"/>
<%
	String action=request.getParameter("action");	// artbook_form.jsp name�� ����
	if(action.equals("list")){
		// �ش� ����Ͻ� ���� ȣ��
		ArrayList<AddrBook> datas = gb.getDBList();
		out.print(datas);
		request.setAttribute("datas",datas);
		pageContext.forward("addrbook_list.jsp");		// �����ͼ� ������ datas 
		//��ü �������� ������ �� ����ϴ� ��ɾ�
		
	}	// >> ���������� >>
	else if(action.equals("insert")){
		// �ش� �����Ͻ� ���� ȣ��
		if(gb.insertDB(addrbook) ){
			response.sendRedirect("addrbook_control.jsp?action=list");	//����
			out.println("����");
		}else{
			out.println("����");
		}
	}else if(action.equals("edit")){
		// �ش� �����Ͻ� ���� ȣ��
		AddrBook abook=gb.getDB(addrbook.getAb_id());
		if(!request.getParameter("upasswd").equals("1234")){
			out.println("<script>alert('��й�ȣ�� Ʋ�Ƚ��ϴ�!');</script>");
		}else{
			request.setAttribute("ab",abook);
			pageContext.forward("addrbook_edit_form.jsp");	
		}
	}else if(action.equals("update")){
		// �ش� �����Ͻ� ���� ȣ��
		if(gb.updateDB(addrbook)){
			response.sendRedirect("addrbook_control.jsp?action=list");
		}
	}else if(action.equals("delete")){
		// �ش� �����Ͻ� ���� ȣ��
		if(gb.deleteDB(addrbook.getAb_id())){
			response.sendRedirect("addrbook_control.jsp?action=list");
		}
	}
%>









<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>