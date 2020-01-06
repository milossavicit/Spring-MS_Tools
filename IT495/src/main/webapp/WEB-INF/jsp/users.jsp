<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navigation.jsp" %>

<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Users</h1>
          <p class="mb-4">A list of all users.</p>

          <!-- DataTales -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Users</h6>
            </div>
            <div class="card-body">
              <c:if test="${!empty users}">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Username</th>
                      <th>First Name</th>
                      <th>Last Name</th>
                      <th>Email</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>ID</th>
                      <th>Username</th>
                      <th>First Name</th>
                      <th>Last Name</th>
                      <th>Email</th>
                      <th>Action</th>
                    </tr>
                  </tfoot>
                  <tbody>
                    <c:forEach items="${requestScope.users}" var="u">
                    <tr>
                      <td>${u.userId}</td>
                      <td>${u.username}</td>
                      <td>${u.firstname}</td>
                      <td>${u.lastname}</td>
                      <td>${u.email}</td>
                      <td style="text-align:center">
                          <button type="button" class="btn btn-warning" style="width: 115px;" data-toggle="modal" data-target="#EditModal${u.userId}"><i class="fas fa-user-edit"></i> EDIT</button>
                      <a href="${pageContext.request.contextPath}/deleteUser/${u.userId}"><button type="button" class="btn btn-danger" style="width: 115px;" onclick="return confirm('Are you sure you want to delete this user?')"><i class="fas fa-user-minus"></i> DELETE</button></a></td>
                    </tr>
                    
                    <!-- Edit Modal-->
                    <div class="modal fade" id="EditModal${u.userId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Edit user</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">×</span>
                            </button>
                          </div>
                            <div class="modal-body">
                                <c:url var="post_url" value="/editUser" />
                                  <form:form id="myform" class="user" method="POST" action="${post_url}" modelAttribute="user">
                                      <div class="form-group">
                                          <form:input type="hidden" id="userId" class="form-control" value="${u.userId}" path="userId" />
                                          <form:label path="username" style="font-size:.8rem;border-radius:10rem;">&nbsp;&nbsp;Username</form:label>
                                          <form:input type="text" id="username" style="font-size:.8rem;border-radius:10rem;height:50px;" class="form-control" value="${u.username}" path="username" readonly="true" />
                                      </div>
                                      <div class="form-group">
                                          <form:label path="firstname" style="font-size:.8rem;border-radius:10rem;">&nbsp;&nbsp;First name</form:label>
                                          <form:input type="text" id="firstname" style="font-size:.8rem;border-radius:10rem;height:50px;" class="form-control" value="${u.firstname}" path="firstname" />
                                      </div>
                                      <div class="form-group">
                                          <form:label path="lastname" style="font-size:.8rem;border-radius:10rem;">&nbsp;&nbsp;Last name</form:label>
                                          <form:input type="text" id="lastname" style="font-size:.8rem;border-radius:10rem;height:50px;" class="form-control" value="${u.lastname}" path="lastname" />
                                      </div>
                                      <div class="form-group">
                                          <form:label path="email" style="font-size:.8rem;border-radius:10rem;">&nbsp;&nbsp;Email</form:label>
                                          <form:input type="email" id="email" style="font-size:.8rem;border-radius:10rem;height:50px;" class="form-control" value="${u.email}" path="email" />
                                      </div>
                                      <div class="form-group">
                                          <form:input type="hidden" id="password" class="form-control" value="${u.password}" path="password" />
                                          <form:input type="hidden" id="role" class="form-control" value="${u.role}" path="role" />
                                          <form:input type="hidden" id="profilePic" class="form-control" value="${u.profilePic}" path="profilePic" />
                                          <form:input type="hidden" id="enabled" class="form-control" value="${u.enabled}" path="enabled" />
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