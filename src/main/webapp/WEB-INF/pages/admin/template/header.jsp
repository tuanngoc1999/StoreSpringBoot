<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang Quản Trị </title>
  		<link rel='stylesheet' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
  		<link rel='stylesheet' href='http://cdnjs.cloudflare.com/ajax/libs/animate.css/3.2.3/animate.min.css'>
  		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  		<link rel="stylesheet" href="<c:url value='/css/admin.css' />">
</head>
<body>
	<nav class="navbar navbar-inverse">
  		<div class="container-fluid">
    		<div class="navbar-header">
      			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        			<span class="icon-bar"></span>
        			<span class="icon-bar"></span>
        			<span class="icon-bar"></span>                        
      			</button>
      			<a class="navbar-brand" href="/damh/admin">ComputerShop</a>
    		</div>
    		<div class="collapse navbar-collapse" id="myNavbar">
      			<ul class="nav navbar-nav">
        			<li class="active"><a href="/damh">Store</a></li>
        			<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Tác vụ<span class="caret"></span></a>
        			<ul class="dropdown-menu">
          				<li><a href="<c:url value='/admin/don-hang' />">
              				<span class="glyphicon glyphicon-shopping-cart">&nbsp;</span>Quản lý Đơn hàng</a></li>
          				<li><a href='<c:url value="/admin/san-pham"/>' >
              				<span class="glyphicon glyphicon-folder-open">&nbsp;</span>Quản lý Sản phẩm</a></li>
          				<li><a href='<c:url value="/admin/danh-muc"/>'>
              				<span class="glyphicon glyphicon-tasks">&nbsp;</span>Quản lý Danh Mục</a></li>
		  				<li><a href='<c:url value="/admin/nhan-hieu"/>' >
              				<span class="glyphicon glyphicon-flag">&nbsp;</span>Quản lý Nhãn hiệu</a>
          				</li>
		  				<li>
            				<a href="<c:url value='/admin/tai-khoan' />">
              					<span class="glyphicon glyphicon-th-list">&nbsp;</span>Quản lý Tài khoản</a>
          				</li>
          				<li>
            				<a href="<c:url value='/admin/lien-he' />">
              					<span class="glyphicon glyphicon-envelope">&nbsp;</span>Quản lý Liên Hệ</a>
          				</li>
          				<li>
            				<a href="<c:url value='/admin/profile' />">
              					<span class="glyphicon glyphicon-user">&nbsp;</span>Thông tin cá nhân</a>
          				</li>
        			</ul>
      			</li>
      		</ul>
      		<ul class="nav navbar-nav navbar-right">
          		<li>
            		<a href="<c:url value='/admin/profile' />">
              			<span class="glyphicon glyphicon-user">&nbsp;</span>Xin chào: ${loggedInUser.hoTen }</a>
          		</li>
          		<li>
            		<a href="<c:url value='/logout' />"><span class="glyphicon glyphicon-log-out"></span> Đăng xuất</a>
          		</li>
        	</ul>
    	</div>
  	</div>
</nav>
