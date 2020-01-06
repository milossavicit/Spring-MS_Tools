<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navigation.jsp" %>

<!-- Begin Page Content -->
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-lg-7">
                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">Categories</h1>
                <p class="mb-4">A list of all categories.</p>

                <!-- DataTales -->
                <div class="card shadow mb-4">
                  <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Categories</h6>
                  </div>
                  <div class="card-body">
                    <c:if test="${!empty categories}">
                    <div class="table-responsive">
                      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                          <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Action</th>
                          </tr>
                        </thead>
                        <tfoot>
                          <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Action</th>
                          </tr>
                        </tfoot>
                        <tbody>
                          <c:forEach items="${requestScope.categories}" var="c">
                          <tr>
                            <td>${c.categoryId}</td>
                            <td>${c.name}</td>
                            <td style="text-align:center">
                                <button type="button" class="btn btn-warning" style="width: 100px;" data-toggle="modal" data-target="#EditModal${c.categoryId}">EDIT</button>
                            <a href="${pageContext.request.contextPath}/deleteCategory/${c.categoryId}"><button type="button" class="btn btn-danger" style="width: 100px;" onclick="return confirm('Are you sure you want to delete this category?')">DELETE</button></a></td>
                          </tr>

                          <!-- Edit Modal-->
                          <div class="modal fade" id="EditModal${c.categoryId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel">Edit category</h5>
                                  <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                  </button>
                                </div>
                                  <div class="modal-body">
                                      <c:url var="post_url" value="/editCategory" />
                                        <form:form id="myform" class="user" method="POST" action="${post_url}" modelAttribute="category">
                                            <div class="form-group">
                                                <form:input type="hidden" id="categoryId" class="form-control" value="${c.categoryId}" path="categoryId" />
                                                <form:label path="name" style="font-size:.8rem;border-radius:10rem;">&nbsp;&nbsp;Name</form:label>
                                                <form:input type="text" id="name" style="font-size:.8rem;border-radius:10rem;height:50px;" class="form-control" value="${c.name}" path="name"/>
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
          </div>
        </div>
<%@include file="footer.jsp" %>