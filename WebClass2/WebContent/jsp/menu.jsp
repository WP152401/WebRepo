<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextpath" value ="${pageContext.request.contextPath }"></c:set>
<ul class="navbar-nav mr-auto">
	<li class="nav-item" onmouseover="menu_over(this);" onmouseout="menu_out(this);">
		<a class="nav-link" href="${contextpath }/session">메뉴1</a>
	</li>
	<li class="nav-item" onmouseover="menu_over(this);" onmouseout="menu_out(this);">
		<a class="nav-link" href="${contextpath }/list">메뉴2</a>
	</li>
	<li class="nav-item" onmouseover="menu_over(this);" onmouseout="menu_out(this);">
		<a class="nav-link" href="dom.html">메뉴3</a>
	</li>
</ul>