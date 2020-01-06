<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navigation.jsp" %>

<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-lg-6 mb-4">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Add Category</h6>
                </div>
                <div class="card-body">
                    <div class="p-5">
                        <c:url var="post_url" value="/addCategory" />
                        <form:form id="myform" class="user" method="POST" action="${post_url}" modelAttribute="category">
                            <% String success = (String) request.getAttribute("successMsg");%>
                            <%= (success != null) ? "<div class=\"alert alert-success\">" + success + "</div>" : ""%>
                            <c:if test="${not empty error}">
                                    <div class="alert alert-danger">${error}</div>
                            </c:if>
                            <div class="form-group">
                                <form:input type="hidden" id="categoryId" class="form-control form-control-user" placeholder="categoryId" path="categoryId" />
                                <form:input type="text" id="name" class="form-control form-control-user" placeholder="Category name" path="name" />
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