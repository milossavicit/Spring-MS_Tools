<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navigation.jsp" %>

<!-- Begin Page Content -->
<div class="container-fluid">

  <!-- Page Heading -->
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
  </div>
  
  <!-- Content Row -->
    <div class="row">
        
        <!-- Employees -->
        <div class="col-xl-3 col-md-6 mb-4">
          <div class="card border-left-info shadow h-100 py-2">
            <div class="card-body">
              <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                  <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Employees</div>
                  <div class="h5 mb-0 font-weight-bold text-gray-800">${brojU}</div>
                </div>
                <div class="col-auto">
                  <i class="fas fa-user fa-2x text-gray-300"></i>
                </div>
              </div>
            </div>
          </div>
        </div>

      <!-- Number of products -->
        <div class="col-xl-3 col-md-6 mb-4">
          <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
              <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                  <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Products</div>
                  <div class="h5 mb-0 font-weight-bold text-gray-800">${brojP}</div>
                </div>
                <div class="col-auto">
                  <i class="fab fa-product-hunt fa-2x text-gray-300"></i>
                </div>
              </div>
            </div>
          </div>
        </div>
  
        <!-- Production -->
        <div class="col-xl-3 col-md-6 mb-4">
          <div class="card border-left-warning shadow h-100 py-2">
            <div class="card-body">
              <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                  <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">In production</div>
                  <div class="h5 mb-0 font-weight-bold text-gray-800">${brojProd}</div>
                </div>
                <div class="col-auto">
                  <i class="fas fa-hourglass-half fa-2x text-gray-300"></i>
                </div>
              </div>
            </div>
          </div>
        </div>
                
        <!-- Number of customers -->
        <div class="col-xl-3 col-md-6 mb-4">
          <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
              <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                  <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Customers</div>
                  <div class="h5 mb-0 font-weight-bold text-gray-800">${broj}</div>
                </div>
                <div class="col-auto">
                  <i class="fas fa-users fa-2x text-gray-300"></i>
                </div>
              </div>
            </div>
          </div>
        </div>
  
    </div>
    <!-- DataTales -->
    <div class="card shadow mb-4">
      <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Productions</h6>
      </div>
      <div class="card-body">
        <c:if test="${!empty productions}">
        <div class="table-responsive">
          <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead>
              <tr>
                <th>ID</th>
                <th>User</th>
                <th>Product</th>
                <th>Machine</th>
                <th>Status</th>
              </tr>
            </thead>
            <tfoot>
              <tr>
                <th>ID</th>
                <th>User</th>
                <th>Product</th>
                <th>Machine</th>
                <th>Status</th>
              </tr>
            </tfoot>
            <tbody>
              <c:forEach items="${requestScope.productions}" var="p">
              <tr>
                <td>${p.productionId}</td>
                <td>${p.user.username}</td>
                <td>${p.productId.productname}</td>
                <td>${p.machineId.name}</td>
                <td>
                    <c:if test="${p.prodStatus == 'Priprema'}"><span class="badge badge-secondary">${p.prodStatus}</span></c:if>
                    <c:if test="${p.prodStatus == 'Izrada'}"><span class="badge badge-warning">${p.prodStatus}</span></c:if>
                    <c:if test="${p.prodStatus == 'Zavrseno'}"><span class="badge badge-success">${p.prodStatus}</span></c:if>
                </td>
              </tr>
              </c:forEach>
            </tbody>                   
          </table>
        </div>
       </c:if>
      </div>
    </div>
</div>

<%@include file="footer.jsp" %>