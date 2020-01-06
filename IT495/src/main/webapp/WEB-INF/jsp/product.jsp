<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navigation.jsp" %>

<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Products</h1>
          <p class="mb-4">A list of all products.</p>

          <!-- DataTales -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Products</h6>
            </div>
            <div class="card-body">
              <c:if test="${!empty products}">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Name</th>
                      <th>Price in €</th>
                      <th>Quantity</th>
                      <th>Category</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>ID</th>
                      <th>Name</th>
                      <th>Price in €</th>
                      <th>Quantity</th>
                      <th>Category</th>
                      <th>Action</th>
                    </tr>
                  </tfoot>
                  <tbody>
                    <c:forEach items="${requestScope.products}" var="p">
                    <tr>
                      <td>${p.productId}</td>
                      <td>${p.productname}</td>
                      <td>${p.price}</td>
                      <td>${p.quantity}</td>
                      <td>${p.categoryId.name}</td>
                      <td style="text-align:center">
                          <button type="button" class="btn btn-warning" style="width: 100px;" data-toggle="modal" data-target="#EditModal${p.productId}">EDIT</button>
                      <a href="${pageContext.request.contextPath}/deleteProduct/${p.productId}"><button type="button" class="btn btn-danger" style="width: 100px;" onclick="return confirm('Are you sure you want to delete this product?')">DELETE</button></a></td>
                    </tr>
                    
                    <!-- Edit Modal-->
                    <div class="modal fade" id="EditModal${p.productId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Edit product</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">×</span>
                            </button>
                          </div>
                            <div class="modal-body">
                                <c:url var="post_url" value="/editProduct" />
                                  <form:form id="myform" class="user" method="POST" action="${post_url}" modelAttribute="product">
                                      <div class="form-group">
                                          <form:label path="productname" style="font-size:.8rem;border-radius:10rem;">&nbsp;&nbsp;Product name</form:label>
                                          <form:input type="text" id="productname" style="font-size:.8rem;border-radius:10rem;height:50px;" class="form-control" value="${p.productname}" path="productname" />
                                      </div>
                                      <div class="form-group">
                                          <form:label path="price" style="font-size:.8rem;border-radius:10rem;">&nbsp;&nbsp;Price</form:label>
                                          <form:input type="text" id="price" style="font-size:.8rem;border-radius:10rem;height:50px;" class="form-control" value="${p.price}" path="price" />
                                      </div>
                                      <div class="form-group">
                                          <form:label path="quantity" style="font-size:.8rem;border-radius:10rem;">&nbsp;&nbsp;Quantity</form:label>
                                          <form:input type="text" id="quantity" style="font-size:.8rem;border-radius:10rem;height:50px;" class="form-control" value="${p.quantity}" path="quantity" />
                                      </div>
                                      <div class="form-group">
                                          <form:input type="hidden" id="productId" class="form-control" value="${p.productId}" path="productId" />
                                          <form:label path="categoryId" style="font-size:.8rem;border-radius:10rem;">&nbsp;&nbsp;Select a category</form:label>
                                          <form:select id="categoryId" style="font-size:.8rem;border-radius:10rem;height:50px;" class="form-control" path="categoryId">
                                            <form:option value="${p.categoryId.categoryId}">Default</form:option>
                                            <form:options items="${requestScope.categories}" itemValue="categoryId" itemLabel="name" />
                                          </form:select>
                                      </div>
                                      <div class="modal-footer">
                                          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                          <button type="submit" class="btn btn-primary btn-user">Update</button>
                                      </div>
                                  </form:form>
                            </div>     
                        </div>
                      </div>
                    </div>
                    </c:forEach>
                  </tbody>                   
                </table>
              </div>
             </c:if>
            </div>
          </div>
        </div>
<%@include file="footer.jsp" %>