<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>Order Create</title>
    
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
  <h1>Order Create</h1>
<form action="<c:url value='/Entity1ServletCreate'/>" method="post">
	Customer ID :<input type="text" name="customer_id" value="${form.customer_id }"/>
	<span style="color: red; font-weight: 900">${errors.customer_id }</span>
	<br/>
	Restaurant ID :<input type="password" name="restaurant_id" value="${form.restaurant_id }"/>
	<span style="color: red; font-weight: 900">${errors.restaurant_id }</span>
	<br/>
	Date ：<input type="text" name="date" value="${form.date }"/>
	<span style="color: red; font-weight: 900">${errors.date }</span>
	<br/>
	Total Cost ：<input type="text" name="total_cost" value="${form.total_cost }"/>
	<span style="color: red; font-weight: 900">${errors.total_cost }</span>
	<br/>
	Num Items ：<input type="text" name="num_items" value="${form.num_items }"/>
	<span style="color: red; font-weight: 900">${errors.num_items }</span>
	<br/>
	<input type="submit" value="Create Order"/>
</form>
  </body>
</html>
