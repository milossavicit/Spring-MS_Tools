<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navigation.jsp" %>

<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-lg-6 mb-4">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Add User</h6>
                </div>
                <div class="card-body">
                    <div class="p-5">
                        <c:url var="post_url" value="/addUser" />
                        <form:form id="myform" class="user" method="POST" action="${post_url}" modelAttribute="user">
                            <% String success = (String) request.getAttribute("successMsg");%>
                            <%= (success != null) ? "<div class=\"alert alert-success\">" + success + "</div>" : ""%>
                            <c:if test="${not empty error}">
                                    <div class="alert alert-danger">${error}</div>
                            </c:if>
                            <div class="form-group">
                                <form:input type="text" id="firstname" class="form-control form-control-user" placeholder="First name" path="firstname" />
                            </div>
                            <div class="form-group">
                                <form:input type="text" id="lastname" class="form-control form-control-user" placeholder="Last name" path="lastname" />
                            </div>
                            <div class="form-group">
                                <form:input type="email" id="email" class="form-control form-control-user" placeholder="Email" path="email" />
                            </div>
                            <div class="form-group">
                                <form:input type="hidden" id="userId" class="form-control form-control-user" placeholder="userId" path="userId" />
                                <form:input type="hidden" id="role" class="form-control form-control-user" placeholder="role" value="ROLE_USER" path="role" />
                                <form:input type="hidden" id="enabled" class="form-control form-control-user" placeholder="enabled" value="1" path="enabled" />
                                <form:input type="hidden" id="profilePic" class="form-control form-control-user" placeholder="profilePic" value="images/user.png" path="profilePic" />
                                <form:input type="text" id="username" class="form-control form-control-user" placeholder="Username" path="username" />
                            </div>
                            <div class="form-group">
                                <form:input type="password" id="password" class="form-control form-control-user" placeholder="Password" path="password" />
                            </div>
                            <div class="form-group">
                                <div class="custom-control custom-checkbox small">
                                    <input type="checkbox" class="custom-control-input" id="customCheck" onclick="myFunction()">
                                    <label class="custom-control-label" for="customCheck">Show Password</label>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary btn-user btn-block">Submit</button>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>