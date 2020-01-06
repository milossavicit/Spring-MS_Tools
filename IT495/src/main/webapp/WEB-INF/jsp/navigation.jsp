<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.io.*,java.util.*, javax.servlet.*, java.text.SimpleDateFormat"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="pagina" value="${requestScope['javax.servlet.forward.request_uri']}" />
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>IT495</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/myApp.min.css" rel="stylesheet">
  
  <!-- Custom styles for this page -->
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  
  <script src="vendor/jquery/jquery.min.js"></script>

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index">
        <div class="sidebar-brand-icon">
          <i class="fas fa-cog"></i>
        </div>
        <div class="sidebar-brand-text mx-3">MS Tools</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item ${pagina.endsWith('/index') ? 'active' : ''}">
        <a class="nav-link" href="${ctx}/index">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>
      
      <sec:authorize access="hasRole('ROLE_ADMIN')">
      <!-- Divider -->
      <hr class="sidebar-divider">
      
      <!-- Heading -->
      <div class="sidebar-heading">
          Employees
      </div>
      
      <!-- Nav Item - Users -->
      <li class="nav-item ${pagina.endsWith('/users') || pagina.endsWith('/addUser') ? 'active' : ''}">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUsers" aria-expanded="true" aria-controls="collapseUsers">
          <i class="fas fa-fw fa-user"></i>
          <span>Users</span>
        </a>
        <div id="collapseUsers" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Users:</h6>
            <a class="collapse-item ${pagina.endsWith('/addUser') ? 'active' : ''}" href="${ctx}/addUser">Add User</a>
            <a class="collapse-item ${pagina.endsWith('/users') ? 'active' : ''}" href="${ctx}/users">Users</a>            
          </div>
        </div>
      </li>
      </sec:authorize>
      
      <sec:authorize access="hasRole('ROLE_ADMIN')">
      <!-- Divider -->
      <hr class="sidebar-divider">
      
      <!-- Heading -->
      <div class="sidebar-heading">
          External
      </div>
      
      <!-- Nav Item - Customers -->
      <li class="nav-item ${pagina.endsWith('/customers') || pagina.endsWith('/addCustomer') ? 'active' : ''}">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseCustomers" aria-expanded="true" aria-controls="collapseCustomers">
          <i class="fas fa-fw fa-users"></i>
          <span>Customers</span>
        </a>
        <div id="collapseCustomers" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Customers:</h6>
            <a class="collapse-item ${pagina.endsWith('/addCustomer') ? 'active' : ''}" href="${ctx}/addCustomer">Add Customer</a>
            <a class="collapse-item ${pagina.endsWith('/customers') ? 'active' : ''}" href="${ctx}/customers">Customers</a>            
          </div>
        </div>
      </li>
      </sec:authorize>
      
      <!-- Nav Item - Orders -->
      <sec:authorize access="hasRole('ROLE_ADMIN')">
      <li class="nav-item ${pagina.endsWith('/orders') || pagina.endsWith('/addOrder') ? 'active' : ''}">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseOrder" aria-expanded="true" aria-controls="collapseOrder">
          <i class="fas fa-fw fa-truck-loading"></i>
          <span>Orders</span>
        </a>
        <div id="collapseOrder" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Orders:</h6>
            <a class="collapse-item ${pagina.endsWith('/addOrder') ? 'active' : ''}" href="${ctx}/addOrder">Create An Order</a>
            <a class="collapse-item ${pagina.endsWith('/orders') ? 'active' : ''}" href="${ctx}/orders">Orders</a>            
          </div>
        </div>
      </li>
      </sec:authorize>
      
      <!-- Divider -->
      <hr class="sidebar-divider">
      
      <!-- Heading -->
      <div class="sidebar-heading">
          Internal
      </div>
      
      <!-- Nav Item - Category -->
      <sec:authorize access="hasRole('ROLE_ADMIN')">
      <li class="nav-item ${pagina.endsWith('/category') || pagina.endsWith('/addCategory') ? 'active' : ''}">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseCategory" aria-expanded="true" aria-controls="collapseCategory">
          <i class="fas fa-fw fa-boxes"></i>
          <span>Categories</span>
        </a>
        <div id="collapseCategory" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Categories:</h6>
            <a class="collapse-item ${pagina.endsWith('/addCategory') ? 'active' : ''}" href="${ctx}/addCategory">Add Category</a>
            <a class="collapse-item ${pagina.endsWith('/category') ? 'active' : ''}" href="${ctx}/category">Categories</a>            
          </div>
        </div>
      </li>
      </sec:authorize>
      
      <!-- Nav Item - Product -->
      <sec:authorize access="hasRole('ROLE_ADMIN')">
      <li class="nav-item ${pagina.endsWith('/product') || pagina.endsWith('/addProduct') ? 'active' : ''}">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseProduct" aria-expanded="true" aria-controls="collapseProduct">
          <i class="fab fa-fw fa-product-hunt"></i>
          <span>Products</span>
        </a>
        <div id="collapseProduct" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Products:</h6>
            <a class="collapse-item ${pagina.endsWith('/addProduct') ? 'active' : ''}" href="${ctx}/addProduct">Add Product</a>
            <a class="collapse-item ${pagina.endsWith('/product') ? 'active' : ''}" href="${ctx}/product">Products</a>            
          </div>
        </div>
      </li>
      </sec:authorize>
      
      <!-- Nav Item - Machine -->
      <sec:authorize access="hasRole('ROLE_ADMIN')">
      <li class="nav-item ${pagina.endsWith('/machine') || pagina.endsWith('/addMachine') ? 'active' : ''}">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseMachine" aria-expanded="true" aria-controls="collapseMachine">
          <i class="fas fa-fw fa-cogs"></i>
          <span>Machines</span>
        </a>
        <div id="collapseMachine" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Machines:</h6>
            <a class="collapse-item ${pagina.endsWith('/addMachine') ? 'active' : ''}" href="${ctx}/addMachine">Add Machine</a>
            <a class="collapse-item ${pagina.endsWith('/machine') ? 'active' : ''}" href="${ctx}/machine">Machines</a>            
          </div>
        </div>
      </li>
      </sec:authorize>
      
      <!-- Nav Item - Production -->
      <sec:authorize access="hasRole('ROLE_ADMIN')">
      <li class="nav-item ${pagina.endsWith('/production') ? 'active' : ''}">
        <a class="nav-link" href="${ctx}/production">
          <i class="fas fa-fw fa-hourglass-half"></i>
          <span>Production</span></a>
      </li>
      </sec:authorize>
      
      <!-- Nav Item - Production - User -->
      <sec:authorize access="hasRole('ROLE_USER')">
      <li class="nav-item ${pagina.endsWith('/myProduction') || pagina.endsWith('/addProduction') ? 'active' : ''}">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseProduction" aria-expanded="true" aria-controls="collapseProduction">
          <i class="fas fa-fw fa-hourglass-half"></i>
          <span>Production</span>
        </a>
        <div id="collapseProduction" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Production:</h6>
            <a class="collapse-item ${pagina.endsWith('/addProduction') ? 'active' : ''}" href="${ctx}/addProduction">Add Production</a>
            <a class="collapse-item ${pagina.endsWith('/myProduction') ? 'active' : ''}" href="${ctx}/myProduction">My Productions</a>            
          </div>
        </div>
      </li>
      </sec:authorize>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Date -->
          <c:set var="now" value="<%=new java.util.Date()%>" />
          <ul class="navbar-nav mr-auto">
              <span class="mr-2 d-none d-lg-inline text-gray-600 ">
                  &nbsp;
                  <%Date date = new Date();
                  String str = new SimpleDateFormat("dd MMM yyyy").format(date);
                  out.print(str.toString());%>
              </span>
          </ul>
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                  <span class="mr-2 d-none d-lg-inline text-gray-600 small">${pageContext.request.userPrincipal.name}</span>
                </c:if>
                <img class="img-profile rounded-circle" src="${requestScope.profilePic}">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="${ctx}/profile"">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->
