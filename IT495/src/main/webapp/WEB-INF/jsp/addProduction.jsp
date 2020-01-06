<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navigation.jsp" %>

<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-lg-6 mb-4">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Add Production</h6>
                </div>
                <div class="card-body">
                    <div class="p-5">
                        <c:url var="post_url" value="/addProduction" />
                        <form:form id="myform" class="user" method="POST" action="${post_url}" modelAttribute="production">
                            <% String success = (String) request.getAttribute("successMsg");%>
                            <%= (success != null) ? "<div class=\"alert alert-success\">" + success + "</div>" : ""%>
                            <c:if test="${not empty error}">
                                    <div class="alert alert-danger">${error}</div>
                            </c:if>
                                    
                            <div class="form-group">
                                <form:input type="hidden" id="productionId" class="form-control form-control-user" placeholder="productionId" path="productionId" />
                                <form:select id="productId" style="font-size:.8rem;border-radius:10rem;height:50px;" class="form-control" path="productId">
                                    <form:option value="">Select a product</form:option>
                                    <form:options items="${requestScope.products}" itemValue="productId" itemLabel="productname" />
                                </form:select>
                            </div>
                            <div class="form-group">
                                <form:select id="machineId" style="font-size:.8rem;border-radius:10rem;height:50px;" class="form-control" path="machineId">
                                    <form:option value="">Select a machine</form:option>
                                    <form:options items="${requestScope.machines}" itemValue="machineId" itemLabel="name" />
                                </form:select>
                            </div>
                            <div class="form-group">
                                <form:select id="prodStatus" style="font-size:.8rem;border-radius:10rem;height:50px;" class="form-control" path="prodStatus">
                                    <form:option value="">Select a state</form:option>
                                    <form:option value="Priprema">Priprema</form:option>
                                    <form:option value="Izrada">Izrada</form:option>
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