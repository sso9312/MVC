<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>jstlTest3.jsp</title>
</head>
<body>

	<h3>* JSTL 함수 *</h3>

	<c:set var="txt" value=" 	White	Space	"></c:set>
	
	<c:out value="${txt}"></c:out> <hr>
	${txt} <hr>
	
	글자갯수 : ${fn:length(txt)}   
	<hr>	
	
	공백제거 : @<c:out value="${fn:trim(txt)}"></c:out>@
	<hr>
	
	<c:set var="str" value="Hi My name is waldo"></c:set>
	문자열자르기 : ${fn:substring(str, 3 , 9)}<!-- My nam -->
	<hr>
	${fn:toLowerCase(str)}
	<hr>
	${fn:toUpperCase(str)}
	<hr>
	
<%
	//엔터를 <br>로 바꾸기
	
	//1) JSP
	String content="";
	content = content.replace("\n", "<br>");
	
	//2) EL + JSTL
	pageContext.setAttribute("cn", "\n");
%>	

	<c:set var="content" value="Hi
								My name is
								waldo"></c:set>
	${content}
	<hr>
	${fn:replace(content, cn, "<br>")}
	<hr>
	
	<!-- 3) < > & ' " 등 특수문자 변환 -->
	<c:set var="text" value="Hi
	                         My <name> is
                         'W     a   l      d    o'"></c:set><!-- Tab말고 띄어쓰기로 공백주기 -->

	${fn:escapeXml(text)}
	<hr>
	${fn:replace(fn:escapeXml(text), cn, "<br>")}
	<hr>
	${fn:replace(fn:replace(fn:escapeXml(text), cn, "<br>"), ' ' , '&nbsp;')}
	
</body>
</html>