<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navigation.jsp" %>

<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Orders</h1>
          <p class="mb-4">A list of all orders.</p>

          <!-- DataTales -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Orders</h6>
            </div>
            <div class="card-body">
              <c:if test="${!empty orders}">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Customer</th>
                      <th>Product</th>
                      <th>Order Date</th>
                      <th>Quantity</th>
                      <th>Price in €</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>ID</th>
                      <th>Customer</th>
                      <th>Product</th>
                      <th>Order Date</th>
                      <th>Quantity</th>
                      <th>Price in €</th>
                      <th>Action</th>
                    </tr>
                  </tfoot>
                  <tbody>
                    <c:forEach items="${requestScope.orders}" var="o">
                    <tr>
                      <td>${o.orderId}</td>
                      <td>${o.customerId.firstname}</td>
                      <td>${o.productId.productname}</td>
                      <td>${o.orderdate}</td>
                      <td>${o.quantity}</td>
                      <td>${o.price}</td>
                      <td style="text-align:center">
                       <a href="${pageContext.request.contextPath}/deleteOrder/${o.orderId}"><button type="button" class="btn btn-danger" style="width: 100px;" onclick="return confirm('Are you sure you want to delete this order?')">DELETE</button></a></td>
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