<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>Employee Create</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <h1>Restaurant Create</h1>
<form action="<c:url value='/Entity1ServletCreate'/>" method="post">
	
	Zip Code：<input type="password" name="zip_code" value="${form.zip_code }"/>
	<span style="color: red; font-weight: 900">${errors.zip_code }</span>
	<br/>
	State	：<input type="text" name="state" value="${form.state }"/>
	<span style="color: red; font-weight: 900">${errors.state }</span>
	<br/>
	Num of Employee	：<input type="text" name="num_of_employee" value="${form.num_of_employee }"/>
	<span style="color: red; font-weight: 900">${errors.num_of_employee }</span>
	<br/>
	<input type="submit" value="Create Employee"/>
</form>
  </body>
</html>
