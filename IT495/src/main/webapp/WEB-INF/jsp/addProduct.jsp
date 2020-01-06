<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navigation.jsp" %>

<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-lg-6 mb-4">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Add Product</h6>
                </div>
                <div class="card-body">
                    <div class="p-5">
                        <c:url var="post_url" value="/addProduct" />
                        <form:form id="myform" class="user" method="POST" action="${post_url}" modelAttribute="product">
                            <% String success = (String) request.getAttribute("successMsg");%>
                            <%= (success != null) ? "<div class=\"alert alert-success\">" + success + "</div>" : ""%>
                            <c:if test="${not empty error}">
                                    <div class="alert alert-danger">${error}</div>
                            </c:if>
                            <div class="form-group">
                                <form:input type="text" id="productname" class="form-control form-control-user" placeholder="Product name" path="productname" />
                            </div>
                            <div class="form-group">
                                <form:input type="text" id="price" class="form-control form-control-user" placeholder="Price" path="price" />
                            </div>
                            <div class="form-group">
                                <form:input type="text" id="quantity" class="form-control form-control-user" placeholder="Quantity" path="quantity" />
                            </div>
                            <div class="form-group">
                                <form:input type="hidden" id="productId" class="form-control form-control-user" placeholder="productId" path="productId" />
                                <form:select id="categoryId" style="font-size:.8rem;border-radius:10rem;height:50px;" class="form-control" path="categoryId">
                                    <form:option value="">Select category</form:option>
                                    <form:options items="${requestScope.categories}" itemValue="categoryId" itemLabel="name" />
                                </form:select>
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