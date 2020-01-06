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
                          <c:if test="${p.prodStatus != 'Zavrseno'}"><button type="button" class="btn btn-warning" style="width: 100px;" data-toggle="modal" data-target="#EditModal${p.productionId}">EDIT</button></c:if>
                      <a href="${pageContext.request.contextPath}/deleteProduction/${p.productionId}"><button type="button" class="btn btn-danger" style="width: 100px;" onclick="return confirm('Are you sure you want to delete this production?')">DELETE</button></a></td>
                    </tr>
                    
                    <!-- Edit Modal-->
                    <div class="modal fade" id="EditModal${p.productionId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Edit production</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">×</span>
                            </button>
                          </div>
                            <div class="modal-body">
                                <c:url var="post_url" value="/editProduction" />
                                  <form:form id="myform" class="user" method="POST" action="${post_url}" modelAttribute="production">
                                      <div class="form-group">
                                          <form:label path="productId" style="font-size:.8rem;border-radius:10rem;">&nbsp;&nbsp;Select a product</form:label>
                                          <form:select id="productId" style="font-size:.8rem;border-radius:10rem;height:50px;" class="form-control" path="productId">
                                            <form:option value="${p.productId.productId}">Default</form:option>
                                            <form:options items="${requestScope.products}" itemValue="productId" itemLabel="productname" />
                                          </form:select>
                                      </div>
                                      <div class="form-group">
                                          <form:label path="machineId" style="font-size:.8rem;border-radius:10rem;">&nbsp;&nbsp;Select a machine</form:label>
                                          <form:select id="machineId" style="font-size:.8rem;border-radius:10rem;height:50px;" class="form-control" path="machineId">
                                            <form:option value="${p.machineId.machineId}">Default</form:option>
                                            <form:options items="${requestScope.machines}" itemValue="machineId" itemLabel="name" />
                                          </form:select>
                                      </div>
                                      <div class="form-group">
                                          <form:label path="prodStatus" style="font-size:.8rem;border-radius:10rem;">&nbsp;&nbsp;Select a state</form:label>
                                          <form:select id="prodStatus" style="font-size:.8rem;border-radius:10rem;height:50px;" class="form-control" path="prodStatus">
                                            <form:option value="${p.prodStatus}">Default</form:option>
                                            <form:option value="Priprema">Priprema</form:option>
                                            <form:option value="Izrada">Izrada</form:option>
                                            <form:option value="Zavrseno">Zavrseno</form:option>
                                          </form:select>
                                      </div>
                                      <div class="form-group">
                                          <form:input type="hidden" id="productionId" class="form-control form-control-user" value="${p.productionId}" path="productionId" />
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