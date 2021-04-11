<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="Frontend/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='//fonts.googleapis.com/css?family=Londrina+Solid|Coda+Caption:800|Open+Sans' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="Frontend/css/responsiveslides.css">
<script src="Frontend/js/jquery.min.js"></script>
<script src="Frontend/js/responsiveslides.min.js"></script>
<script src="js/client/accounting.js"></script>


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" >
		<div class="container-fluid">
    		<div class="navbar-header">
      			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        			<span class="icon-bar"></span>
        			<span class="icon-bar"></span>
        			<span class="icon-bar"></span>                        
      			</button>
        <a class="navbar-brand" href="/damh" style="padding-left: 70px;">ComputerShop</a></div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="/damh">Trang chủ</a>
                </li>
				<li class="nav-item">
                    <a class="nav-link page-scroll" href="/damh/store">Cửa hàng</a>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="/damh/contact">Liên hệ</a>
                </li>
            </ul>
			<div class="nav navbar-nav navbar-right" style="padding-right:40px">

				<c:if test="${pageContext.request.userPrincipal.name != null}">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="<%=request.getContextPath()%>/account">Xin chào: ${loggedInUser.hoTen}</a></li>
						<li><a href="<%=request.getContextPath()%>/cart">Giỏ hàng<span class="glyphicon glyphicon-shopping-cart"></span></a></li>
						<li><a href="<%=request.getContextPath()%>/logout"><span class="glyphicon glyphicon-log-out"></span>Đăng xuất</a></li>
					</ul>
				</c:if>
				<c:if test="${pageContext.request.userPrincipal.name == null}">
					<ul class="nav navbar-nav navbar-right" >
						<li><a href="<%=request.getContextPath()%>/login">Đăng nhập</a></li>
						<li><a href="<%=request.getContextPath()%>/cart">Giỏ hàng<span class="glyphicon glyphicon-shopping-cart"></span></a></li>
					</ul>
				</c:if>
			</div>
			</div>
        </div>
    </nav> 
	<!-- <div class="wrap">
		<div class="header">
			 <div class="search-bar">
				<form action="/damh/search">
					<input type="text" name="name"><input type="submit"
						value="Search" />
				</form>
			</div>
			<div class="clear"></div> 
			</br>
			<div class="header-top-nav ">
				<c:if test="${pageContext.request.userPrincipal.name != null}">

					<ul>
						<li>Xin chào: ${loggedInUser.hoTen}</li>
						<li><a href="<%=request.getContextPath()%>/account">Tài
								khoản</a></li>
						<li><a href="<%=request.getContextPath()%>/cart"><span>Giỏ
									hàng&nbsp;&nbsp;: </span></a><span
							class="glyphicon glyphicon-shopping-cart"></span></li>
						<li><a href="<%=request.getContextPath()%>/logout"> Đăng
								xuất</a></li>
					</ul>
				</c:if>

				<c:if test="${pageContext.request.userPrincipal.name == null}">
					<ul>
						<li><a href="<%=request.getContextPath()%>/register">Đăng
								kí</a></li>
						<li><a href="<%=request.getContextPath()%>/login">Đăng
								nhập</a></li>
						<li><a href="<%=request.getContextPath()%>/cart"> <span>Giỏ hàng&nbsp;&nbsp;&nbsp;</span></a><span
							class="glyphicon glyphicon-shopping-cart"></span></li>

					</ul>
				</c:if>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<div class="top-header">
		<div class="wrap">
			<div class="logo">
				<a href="#"></a>
					<img src="Frontend/img/logo1.png" title="logo" /></a>
			</div>
			<div class="top-nav">
				<ul>
					<li><a href="<%=request.getContextPath()%>/">Trang chủ</a></li>

					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Cửa hàng <span class="caret"></span></a>
						<ul class="dropdown-menu" style="background: rgb(46, 176, 236)" id="danhmuc2">
						</ul></li>
					<li><a href="<%=request.getContextPath()%>/contact">Liên hệ</a></li>
				</ul>

			</div>
			<div class="clear"></div>
		</div>
	</div> -->
	
	<script src="<c:url value='/js/client/header.js'/>" ></script>