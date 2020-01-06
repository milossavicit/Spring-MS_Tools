<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navigation.jsp" %>

<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-lg-6 mb-4">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Create An Order</h6>
                </div>
                <div class="card-body">
                    <div class="p-5">
                        <c:url var="post_url" value="/addOrder" />
                        <form:form id="myform" class="user" method="POST" action="${post_url}" modelAttribute="order">
                            <% String success = (String) request.getAttribute("successMsg");%>
                            <%= (success != null) ? "<div class=\"alert alert-success\">" + success + "</div>" : ""%>
                            <c:if test="${not empty error}">
                                    <div class="alert alert-danger">${error}</div>
                            </c:if>
                            <div class="form-group">
                                <form:input type="hidden" id="orderId" class="form-control form-control-user" placeholder="orderId" path="orderId" />
                                <form:select id="customerId" style="font-size:.8rem;border-radius:10rem;height:50px;" class="form-control" path="customerId">
                                    <form:option value="">Select a customer</form:option>
                                    <form:options items="${requestScope.customers}" itemValue="customerId" itemLabel="firstname" />
                                </form:select>
                            </div>
                            <div class="form-group">
                                <form:select id="productId" onchange="change()" style="font-size:.8rem;border-radius:10rem;height:50px;" class="form-control" path="productId">
                                    <form:option value="">Select a product</form:option>
                                    <form:options items="${requestScope.products}" itemValue="productId" itemLabel="productname" />
                                </form:select>
                            </div>
                                <c:if test="${not empty product}">
                                    <div class="form-group">
                                    <p style="font-size:.8rem;border-radius:10rem;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Available quantity: ${requestScope.product.quantity}</p>
                                    </div>
                                </c:if>
                            <div class="form-group">
                                <form:input type="text" id="quantity" class="form-control form-control-user calc" placeholder="Quantity" path="quantity" />
                            </div>
                            <div class="form-group">
                                <input type="hidden" id="price" class="form-control form-control-user calc" value="${requestScope.product.price}" placeholder="Price" />
                            </div>
                            <c:if test="${not empty product}">
                                <div class="form-group">
                                <p style="font-size:.8rem;border-radius:10rem;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Price of one: ${requestScope.product.price} €</p>
                                </div>
                            </c:if>
                            <div class="form-group">
                                <form:input type="text" id="totalPrice" class="form-control form-control-user" value="" placeholder="Total Price" path="price" readonly="true" />
                            </div>
                            <button type="submit" class="btn btn-primary btn-user btn-block">Submit</button>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
                        
<script type="text/javascript">
    $(function() {
        $("#productId")
            .change(
                function(e) {
                    var option = $(this).val();
                    var newUrl = "addOrder?id="+option;
                    window.location=newUrl;
                });
    });
    
    $(window).on('beforeunload', function() {
        localStorage.setItem("item1",document.getElementById("productId").value);
        localStorage.setItem("item2",document.getElementById("customerId").value);
        
    });
    
    $(document).ready(function(){
        document.getElementById("productId").value = localStorage.getItem("item1");
        document.getElementById("customerId").value = localStorage.getItem("item2");
    });

    // jQuery 'keyup' to trigger the computation as the user type
    $('.calc').keyup(function () {

    var quantity = document.getElementById('quantity').value;
    var price = document.getElementById('price').value;
    
    var result = quantity * price;

    $('#totalPrice').val(result);
});
</script>

<%@include file="footer.jsp" %>