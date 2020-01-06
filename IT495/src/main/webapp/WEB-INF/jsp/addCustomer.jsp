<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navigation.jsp" %>

<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-lg-6 mb-4">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Add Customer</h6>
                </div>
                <div class="card-body">
                    <div class="p-5">
                        <c:url var="post_url" value="/addCustomer" />
                        <form:form id="myform" class="user" method="POST" action="${post_url}" modelAttribute="customer">
                            <% String success = (String) request.getAttribute("successMsg");%>
                            <%= (success != null) ? "<div class=\"alert alert-success\">" + success + "</div>" : ""%>
                            <c:if test="${not empty error}">
                                    <div class="alert alert-danger">${error}</div>
                            </c:if>
                            <div class="form-group">
                                <form:input type="hidden" id="customerId" class="form-control form-control-user" placeholder="customerId" path="customerId" />
                            </div>
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
                                <form:input type="text" id="companyname" class="form-control form-control-user" placeholder="Company name" path="companyname" />
                            </div>
                            <div class="form-group">
                                <form:input type="text" id="address" class="form-control form-control-user" placeholder="Address" path="address" />
                            </div>
                            <div class="form-group">
                                <form:input type="text" id="city" class="form-control form-control-user" placeholder="City" path="city" />
                            </div>
                            <div class="form-group">
                                <form:input type="text" id="jmbgPib" class="form-control form-control-user" placeholder="JMBG/PIB" path="jmbgPib" />
                            </div>
                            <div class="form-group">
                                <form:input type="text" id="number" class="form-control form-control-user" placeholder="Phone number" path="number" />
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