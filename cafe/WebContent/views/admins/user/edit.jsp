<%@page import="models.CatUser"%>
<%@page import="models.User"%>
<%@page import="models.Product"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Menu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <%@include file="/templates/admins/inc/lib/headerLib.jsp" %>
  <style>
	<!--
	thead.thead-CCFFFF{
	background: #FFF;
	}
	tr.tr-hover:hover{
	background: #FFFFCC;
	}
	-->
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
  <!-- Navbar -->
  <%@include file="/templates/admins/inc/header.jsp" %>
  <!-- /.navbar -->
  <!-- Main Sidebar Container -->
  <%@include file="/templates/admins/inc/sidebar.jsp" %>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <div class="row">
            <button class="btn btn-primary">Cập nhật</button>
            </div>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
              <li class="breadcrumb-item active">Người dùng</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <%
		if(!"".equals(request.getParameter("msg"))){
			String msg = request.getParameter("msg");
			if("OK".equals(msg)){
				%>
					<div class="alert alert-success" role="alert">
						 Xử lý thành công.!
					</div>
				<%
			}
			if("ERROR".equals(msg)){
				%>
					<div class="alert alert-success" role="alert">
						 Xử lý thất bại.!
					</div>
				<%
			}
		}
	%>
    <section class="content">
  <!-- sua -->
      <div class="modal-body">
      <%
       		if(request.getAttribute("user") != null){
       			User user = (User) request.getAttribute("user");
       			%>
       	<form role="form" id="registration" action="<%=request.getContextPath()%>/admin/user/edit" method="post">
	       	<div class="form-group row">
			    <label for="exampleprice" class="col-sm-3">Tên người dùng</label>
			    <input type="hidden" class="form-control col-sm-8" id="exampleprice" value="<%=user.getId()%>" name="idmenu">
			    <input type="text" class="form-control col-sm-8" id="exampleprice" value="<%=user.getName()%>" name="nameCreate" readonly="readonly">
			  </div>
			  <div class="form-group row">
			    <label for="expass" class="col-sm-3">Mật khẩu</label>
			    <input type="text" class="form-control col-sm-8" id="expass" value="" name="expass">
			  </div>
			  <div class="form-group row">
			    <label for="exphone" class="col-sm-3">Số điện thoại</label>
			    <input type="text" class="form-control col-sm-8" id="exphone" value="<%=user.getPhone()%>" name="exphone">
			  </div>
			  <div class="form-group row">
			    <label for="exemail" class="col-sm-3">Email</label>
			    <input type="text" class="form-control col-sm-8" id="exemail" value="<%=user.getEmail()%>" name="exemail">
			  </div>
			  <div class="form-group row">
			    <label for="exaddress" class="col-sm-3">Địa chỉ</label>
			    <input type="text" class="form-control col-sm-8" id="exaddress" value="<%=user.getAddress()%>" name="exaddress">
			  </div>
			  <div class="form-group row">
			    <label for="exampleInputCategory" class="col-sm-3 col-form-label">Loại tài khoản</label>
			    <%
				    	if(request.getAttribute("catUser") != null){
			        		List<CatUser> catUser = (List<CatUser>) request.getAttribute("catUser");
			        		if(catUser.size() > 0){
			        			%>
			    <div class="col-sm-8">
				    <select class="form-control" id="catUserID" aria-label="Default select example" name="catUserID">
					  <%
					  for(CatUser objCatUser : catUser){
						  %>
						  <option value="<%=objCatUser.getId()%>"
						  <%if(user.getCatUser().getId()==objCatUser.getId()) out.print("selected"); %>
						  ><%=objCatUser.getName()%></option>
						  <%
					  }
					  %>
					</select>
			    </div>
			        			<%
			        		}
				    	}
				    	%>
			  </div>
			  <div class="modal-footer">
		        <button type="submit" class="btn btn-primary create-menu">Cập nhật</button>
		      </div>
		</form>
       			<%
       		}
       	%>
      </div>
    </section>
    <!-- Main content -->
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <%@include file="/templates/admins/inc/footer.jsp" %>
  </footer>
  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<script type="text/javascript">
$(document).on("click",".suaMenu",function(){
	var id = $(this).attr("suaMenu")
	$.ajax({
	  	  type: 'GET',
	  	  url: '<%=request.getContextPath()%>/admin/menu/edit',
	  	  cache: false,
	  	  data: {
	  		id : id
	  		  },
	  	  success: function(data) {
	  		alert(data)
	  	  },
	  	  error: function() {
	  	    alert("Có lỗi")
	  	  }
	  	});
	return false;
})
</script>
<!-- ./wrapper -->
<%@include file="/templates/admins/inc/lib/footerLib.jsp" %>
</body>
</html>