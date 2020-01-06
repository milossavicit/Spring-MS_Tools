<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navigation.jsp" %>
<!-- Begin Page Content -->
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-lg-6  mb-4">
            <!-- Profile -->
            <div class="card shadow mb-4">
              <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Profile</h6>
              </div>
              <div class="card-body">
                <div class="text-center">
                    <img class="img-profile rounded-circle" style="width:200px;height:200px;" src="${requestScope.profilePic}">
                    <div class="row justify-content-center">
                    <div class="col-lg-6 mb-4">
                    <c:url var="post_url" value="/profile" />
                    <form:form id="myform" class="user" method="POST" action="${post_url}" modelAttribute="user" enctype="multipart/form-data">
                        <div class="form-group">
                          <form:input type="hidden" id="userId" class="form-control" value="${requestScope.user.userId}" path="userId" />
                          <form:input type="hidden" id="username" class="form-control" value="${requestScope.user.username}" path="username" readonly="true" />
                        </div>
                        <div class="form-group">
                          <form:input type="hidden" id="firstname" class="form-control" value="${requestScope.user.firstname}" path="firstname" />
                        </div>
                        <div class="form-group">
                          <form:input type="hidden" id="lastname" class="form-control" value="${requestScope.user.lastname}" path="lastname" />
                        </div>
                        <div class="form-group">
                          <form:input type="hidden" id="email" class="form-control" value="${requestScope.user.email}" path="email" />
                        </div>
                        <div class="form-group">
                          <form:input type="hidden" id="password" class="form-control" value="${requestScope.user.password}" path="password" />
                          <form:input type="hidden" id="role" class="form-control" value="${requestScope.user.role}" path="role" />
                          <form:input type="hidden" id="enabled" class="form-control" value="${requestScope.user.enabled}" path="enabled" />
                        </div>
                        <div  style="text-align: left;" class="form-group custom-file mb-3">
                          <input type="file" class="custom-file-input" id="customFile" name="file">
                          <label class="custom-file-label" for="customFile">Update profile picture</label>
                        </div>
                    </div>
                    </div>
                    </div>
                        <hr>
                        <c:if test="${!empty user}">
                          <h3 style="text-align:center">${requestScope.user.firstname} ${requestScope.user.lastname}</h3>
                          <p><h6 style="text-align:center;">${requestScope.user.email}</h6></p>
                          <p style="text-align:center;"><input type="submit" class="btn btn-outline-secondary btn-user" value="Update"></p>
                        </c:if>
                  </form:form>
                          
              </div>
            </div>
        </div>
    </div>
</div>
                  
<script>
$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
</script>            

<%@include file="footer.jsp" %>
