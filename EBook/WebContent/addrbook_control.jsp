<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
 <%@ page import="java.util.*" %>
 <%@ page import="jspbook.addrBook.*" %>
<jsp:useBean id="addrbook" class="jspbook.addrBook.AddrBook"></jsp:useBean>
<jsp:useBean id="gb" class="jspbook.addrBook.AddrBean" scope="page"></jsp:useBean>
<jsp:setProperty name="addrbook" property="*"/>
<%
	String action=request.getParameter("action");	// artbook_form.jsp name값 세팅
	if(action.equals("list")){
		// 해당 비즈니스 로직 호출
		ArrayList<AddrBook> datas = gb.getDBList();
		out.print(datas);
		request.setAttribute("datas",datas);
		pageContext.forward("addrbook_list.jsp");		// 가져와서 저장한 datas 
		//전체 페이지를 보여줄 때 사용하는 명령어
		
	}	// >> 독립적으로 >>
	else if(action.equals("insert")){
		// 해당 비지니스 로직 호출
		if(gb.insertDB(addrbook) ){
			response.sendRedirect("addrbook_control.jsp?action=list");	//수정
			out.println("성공");
		}else{
			out.println("실패");
		}
	}else if(action.equals("edit")){
		// 해당 비지니스 로직 호출
		AddrBook abook=gb.getDB(addrbook.getAb_id());
		if(!request.getParameter("upasswd").equals("1234")){
			out.println("<script>alert('비밀번호가 틀렸습니다!');</script>");
		}else{
			request.setAttribute("ab",abook);
			pageContext.forward("addrbook_edit_form.jsp");	
		}
	}else if(action.equals("update")){
		// 해당 비지니스 로직 호출
		if(gb.updateDB(addrbook)){
			response.sendRedirect("addrbook_control.jsp?action=list");
		}
	}else if(action.equals("delete")){
		// 해당 비지니스 로직 호출
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