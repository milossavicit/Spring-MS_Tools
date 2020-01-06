<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navigation.jsp" %>

<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Productions</h1>
          <p class="mb-4">A list of all productions.</p>

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
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>ID</th>
                      <th>User</th>
                      <th>Product</th>
                      <th>Machine</th>
                      <th>Status</th>
                      <th>Action</th>
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
                      <td style="text-align:center">
                      <c:if test="${p.prodStatus == 'Zavrseno'}"><a href="${pageContext.request.contextPath}/deleteProduction/${p.productionId}"><button type="button" class="btn btn-danger" style="width: 100px;" onclick="return confirm('Are you sure you want to delete this production?')">DELETE</button></a></c:if></td>
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