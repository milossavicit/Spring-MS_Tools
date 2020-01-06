<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navigation.jsp" %>

<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Customers</h1>
          <p class="mb-4">A list of all customers.</p>

          <!-- DataTales -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Customers</h6>
            </div>
            <div class="card-body">
              <c:if test="${!empty customers}">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>First Name</th>
                      <th>Last Name</th>
                      <th>Email</th>
                      <th>Company name</th>
                      <th>Address</th>
                      <th>City</th>
                      <th>JMBG/PIB</th>
                      <th>Phone number</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>ID</th>
                      <th>First Name</th>
                      <th>Last Name</th>
                      <th>Email</th>
                      <th>Company name</th>
                      <th>Address</th>
                      <th>City</th>
                      <th>JMBG/PIB</th>
                      <th>Phone number</th>
                      <th>Action</th>
                    </tr>
                  </tfoot>
                  <tbody>
                    <c:forEach items="${requestScope.customers}" var="c">
                    <tr>
                      <td>${c.customerId}</td>
                      <td>${c.firstname}</td>
                      <td>${c.lastname}</td>
                      <td>${c.email}</td>
                      <td>${c.companyname}</td>
                      <td>${c.address}</td>
                      <td>${c.city}</td>
                      <td>${c.jmbgPib}</td>
                      <td>${c.number}</td>
                      <td style="text-align:center">
                          <button type="button" class="btn btn-warning" style="width: 100px;" data-toggle="modal" data-target="#EditModal${c.customerId}">EDIT</button>
                      <a href="${pageContext.request.contextPath}/deleteCustomer/${c.customerId}"><button type="button" class="btn btn-danger" style="width: 100px;" onclick="return confirm('Are you sure you want to delete this customer?')">DELETE</button></a></td>
                    </tr>
                    
                    <!-- Edit Modal-->
                    <div class="modal fade" id="EditModal${c.customerId}" tabindex="-1" role="dialog" aria-labelledby="customerModalLabel" aria-hidden="true">
                      <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="customerModalLabel">Edit customer</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">×</span>
                            </button>
                          </div>
                            <div class="modal-body">
                                <c:url var="post_url" value="/editCustomer" />
                                <form:form id="myform" class="user form-inline" method="POST" action="${post_url}" modelAttribute="customer">
                                    <div class="form-group">
                                    <form:input type="hidden" id="customerId" class="form-control" value="${c.customerId}" path="customerId" />
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="form-group">
                                                <form:label path="firstname" style="font-size:.8rem;border-radius:10rem;">&nbsp;&nbsp;First name</form:label>
                                                <form:input type="text" id="firstname" style="font-size:.8rem;border-radius:10rem;height:50px;" class="form-control" value="${c.firstname}" path="firstname" />
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="form-group">
                                                <form:label path="lastname" style="font-size:.8rem;border-radius:10rem;">&nbsp;&nbsp;Last name</form:label>
                                                <form:input type="text" id="lastname" style="font-size:.8rem;border-radius:10rem;height:50px;" class="form-control" value="${c.lastname}" path="lastname" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="form-group">
                                                <form:label path="email" style="font-size:.8rem;border-radius:10rem;">&nbsp;&nbsp;Email</form:label>
                                                <form:input type="email" id="email" style="font-size:.8rem;border-radius:10rem;height:50px;" class="form-control" value="${c.email}" path="email" />
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="form-group">
                                                <form:label path="companyname" style="font-size:.8rem;border-radius:10rem;">&nbsp;&nbsp;Company name</form:label>
                                                <form:input type="text" id="companyname" style="font-size:.8rem;border-radius:10rem;height:50px;" class="form-control" value="${c.companyname}" path="companyname" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="form-group">
                                                <form:label path="address" style="font-size:.8rem;border-radius:10rem;">&nbsp;&nbsp;Address</form:label>
                                                <form:input type="text" id="address" style="font-size:.8rem;border-radius:10rem;height:50px;" class="form-control" value="${c.address}" path="address" />
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="form-group">
                                                <form:label path="city" style="font-size:.8rem;border-radius:10rem;">&nbsp;&nbsp;City</form:label>
                                                <form:input type="text" id="city" style="font-size:.8rem;border-radius:10rem;height:50px;" class="form-control" value="${c.city}" path="city" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="form-group">
                                                <form:label path="jmbgPib" style="font-size:.8rem;border-radius:10rem;">&nbsp;&nbsp;JMBG/PIB</form:label>
                                                <form:input type="text" id="jmbgPib" style="font-size:.8rem;border-radius:10rem;height:50px;" class="form-control" value="${c.jmbgPib}" path="jmbgPib" />
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="form-group">
                                                <form:label path="number" style="font-size:.8rem;border-radius:10rem;">&nbsp;&nbsp;Phone number</form:label>
                                                <form:input type="text" id="number" style="font-size:.8rem;border-radius:10rem;height:50px;" class="form-control" value="${c.number}" path="number" />
                                            </div>
                                        </div>
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