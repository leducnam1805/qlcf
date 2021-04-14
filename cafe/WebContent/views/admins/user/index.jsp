<%@page import="models.User"%>
<%@page import="models.CatUser"%>
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
            	<div class="col-sm-2">
            		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
					  Tạo
					</button>
            	</div>
            	<div class="col-sm-2">
            		<button type="button" class="btn btn-danger">Xóa</button>
            	</div>
            </div>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
              <li class="breadcrumb-item active">Tài khoản</li>
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
						 Xử lý thành công!
					</div>
				<%
			}else if("ERROR".equals(msg)){
				%>
				<div class="alert alert-success" role="alert">
					 Tên tài khoản đã có
				</div>
			<%
			}
		}
	%>
    <section class="content">
    <%
    	if(request.getAttribute("userList") != null){
        		List<User> userList = (List<User>) request.getAttribute("userList");
        		if(userList.size() > 0){
    %>
    <table class="table table-bordered" id="datatable">
	  <thead class="thead-CCFFFF">
	    <tr class="list-header">
	      <th scope="col">#</th>
	      <th scope="col">Tên tài khoản</th>
	      <th scope="col">Số điện thoại</th>
	      <th scope="col">Email</th>
	      <th scope="col">Địa chỉ</th>
	      <th scope="col">Loại tài khoản</th>
	      <th scope="col">Chức năng</th>
	    </tr>
	  </thead>
	  <tbody>
	  <%
	  	for(User objUser : userList){
	  %>
 		<tr class="tr-hover">
	      <th scope="row"><input type="checkbox" name="vehicle1" value="Bike"></th>
	      <td><%=objUser.getName()%></td>
	      <td><%=objUser.getPhone()%></td>
	      <td><%=objUser.getEmail()%></td>
	      <td><%=objUser.getAddress()%></td>
	      <td><%=objUser.getCatUser().getName()%></td>
	      <td>
	      	<button type="button" class="btn btn-warning suaMenu" data-toggle="modal" data-target="#exampleModalSua">
				<a href="<%=request.getContextPath()%>/admin/user/edit?id=<%=objUser.getId()%>">Cập nhật</a>
			</button>
	     	<button xoaMenu="<%=objUser.getId()%>" type="button" class="btn btn-danger">Xóa</button>
	     	</td>
	    </tr>
	  		<%
	  	}
	  %>
	  </tbody>
	</table>
    			<%
    		}else{
    			%>
	<div class="alert alert-danger" role="alert">
	  Không có dữ liệu
	</div>
    			<%
    		}
    	}
    %>
    </section>
    <!-- Main content -->
    <!-- /.content -->
  </div>
  <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Tạo mới</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	<form role="form" id="registration">
		  <div class="form-group">
		    <label for="fullname">Tên tài khoản</label>
		    <input type="text" class="form-control" id="fullname" aria-describedby="fullname" name="fullname">
		  </div>
		  <div class="form-group">
		    <label for="phone">Số điện thoại</label>
		    <input type="text" class="form-control" id="phone" aria-describedby="phone" name="phone">
		  </div>
		  <div class="form-group">
		    <label for="email">Email</label>
		    <input type="text" class="form-control" id="email" aria-describedby="email" name="email">
		  </div>
		  <div class="form-group">
		    <label for="adress">Địa chỉ</label>
		    <input type="text" class="form-control" id="adress" aria-describedby="adress" name="adress">
		  </div>
		  <%
		  if(request.getAttribute("catUserList") != null){
			  List<CatUser> catUserList = (List<CatUser>) request.getAttribute("catUserList");
			  if(catUserList.size() > 0){
				  %>
		<div class="form-group">
		    <label for="catuser">Loại tài khoản</label>
		    <select class="form-control" id="catuser" name="catuser">
		      <%
		      	for(CatUser objCatUser : catUserList){
		      		%>
		      		 <option value="<%=objCatUser.getId()%>"><%=objCatUser.getName() %></option>
		      		<%
		      	}
		      %>
		    </select>
		  </div>
				  <%
			  }
		  }
		  %>
		  <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Thoát</button>
	        <button type="button" class="btn btn-primary create-menu">Tạo</button>
	      </div>
		</form>
      </div>
    </div>
  </div>
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
<!-- ./wrapper -->
<%@include file="/templates/admins/inc/lib/footerLib.jsp" %>
<script src="<%=request.getContextPath()%>/templates/admins/dist/js/hd/menu.js"></script>
<script type="text/javascript">
$( document ).ready(function() {
	//create method Post
	$(document).on("click",".create-menu",function() {
		var fullname = $('#fullname').val();
		var phone = $('#phone').val();
		var email = $('#email').val();
		var adress = $('#adress').val();
		var catuser = $('#catuser').val();
		 $.ajax({
			  async: false,
			  method: "POST",
			  url: "<%=request.getContextPath()%>/admin/user",
			  data: { 
				  fullname : fullname,
				  phone : phone,
				  email : email,
				  adress : adress,
				  catuser : catuser
				  },
			success: function (data) {
				if(data==false){
            		Swal.fire(
	                    'Thông Báo!',
	                    'Thao tác thất bại.',
	                    'danger'
	                ).then(function () {
	                    location.reload();
	                })
	        	}else{
	       			Swal.fire(
	    			      'Thành công!',
	    			      'Xử lý thành công.',
	    			      'success'
	    			    ).then(function () {
		                    location.reload();
		                })
	        	}
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert("Thất bại");
			}
		});
    });
});
</script>
</body>
</html>