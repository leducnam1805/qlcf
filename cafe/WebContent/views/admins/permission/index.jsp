<%@page import="models.Permission"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <%@include file="/templates/admins/inc/lib/headerLib.jsp" %>
   <link rel="stylesheet" href="<%=request.getContextPath()%>/templates/admins/dist/css/togglebutton.css">
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
            <h1 class="m-0">Phân quyền</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
              <li class="breadcrumb-item active">Phân quyền</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
      <table class="table table-bordered">
		  <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">Loại tài khoản</th>
		      <th scope="col">Quyền thêm</th>
		      <th scope="col">Quyền Sửa</th>
		       <th scope="col">Quyền xóa</th>
		    </tr>
		  </thead>
		  <%
		  	if(request.getAttribute("permissionList") != null){
		  		List<Permission> permissionList = (List<Permission>) request.getAttribute("permissionList");
		  		if(permissionList.size() > 0){
		  			%>
		  	<tbody>
		  	<%
		  	int  i = 0;
		  		for(Permission objPermission : permissionList){
		  			i++;
		  			%>
		  	<tr>
		      <th scope="row"><%=i %></th>
		      <td>
		      	<%=objPermission.getCatUser().getName() %>
		      </td>
		      <td>
		      	<label class="switch">
				  <input type="checkbox" class="toggle-state-add" perID=<%=objPermission.getId()%> <%if(objPermission.getAddPer() == true) out.print("checked"); %>>
				  <span class="slider round"></span>
				</label>
		      </td>
		      <td>
		      	<label class="switch">
				  <input type="checkbox" class="toggle-state-edit" perID=<%=objPermission.getId()%> <%if(objPermission.getEditPer() == true) out.print("checked"); %>>
				  <span class="slider round"></span>
				</label>
		      </td>
		      <td>
		      	<label class="switch">
				  <input type="checkbox" class="toggle-state-del" perID=<%=objPermission.getId()%> <%if(objPermission.getDelPer() == true) out.print("checked"); %>>
				  <span class="slider round"></span>
				</label>
		      </td>
		    </tr>
		  			<%
		  		}
		  	%>
		  </tbody>
		  			<%
		  		}
		  		else{
		  		%>
		  		<div class="alert alert-danger" role="alert">
				  Không có dữ liệu
				</div>
		  		<%
		  		}
		  	}
		  %>
		</table>
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  
  <script>
$(document).ready(function() {
	/* quyền thêm */
	$('.toggle-state-add').change(function() {
	     var giatri = $(this).prop('checked')
	     var perID = $(this).attr("perID")
	     
	     const swalWithBootstrapButtons = Swal.mixin({
			  customClass: {
			    confirmButton: 'btn btn-success',
			    cancelButton: 'btn btn-danger'
			  },
			  buttonsStyling: false
			})
	      swalWithBootstrapButtons.fire({
	    	  title: 'Bạn có chắc chắn?',
	    	  text: "Thao tác này sẽ ảnh hưởng trực tiếp đến tài khoản của bạn!",
	    	  icon: 'warning',
	    	  showCancelButton: true,
	    	  confirmButtonText: 'Tiếp tục',
	    	  cancelButtonText: 'Hủy bỏ',
	    	  reverseButtons: true
		 }).then((result) => {
			   if (result.isConfirmed) { 
				   $.ajax({
		            type: "post",
		            url: "<%=request.getContextPath()%>/admin/permission",
		            data: {
		            	perID : perID,
		            	giatri:giatri
		            	},
		            context:this,
		            success: function (response) {
		              if(response == false)
		              {
		            	  swalWithBootstrapButtons.fire(
	    	                    'Thông Báo!',
	    	                    'Bạn không thể thêm quyền cho loại tài khoản này.',
	    	                    'danger'
	    	                ).then(function () {
	    	                    location.reload();
	    	                })
		              }else{
		            	  swalWithBootstrapButtons.fire(
	            			      'Thành công!',
	            			      'Thao tác thành công.',
	            			      'success'
	            			    ).then(function () {
  	    	                    location.reload();
  	    	                })
		              }
		            },
		            error: function (xhr, ajaxOptions, thrownError) {
		            	swalWithBootstrapButtons.fire(
	    	                    'Thông Báo!',
	    	                    'Thao tác không thể thực hiện.',
	    	                    'danger'
	    	                ).then(function () {
	    	                    location.reload();
	    	                })
	    	            }
			   });
			   }else if (result.dismiss === Swal.DismissReason.cancel) {
	    		    swalWithBootstrapButtons.fire(
  	    		      'Thất bại',
  	    		      'Bạn đã hủy thao tác',
  	    		      'error'
  	    		    ).then(function () {
	                    location.reload();
	                })
  	    		  }
	    })
	})
	/* quyền sửa */
	$('.toggle-state-edit').change(function() {
	     var giatri = $(this).prop('checked')
	     var perID = $(this).attr("perID")
	     const swalWithBootstrapButtons = Swal.mixin({
			  customClass: {
			    confirmButton: 'btn btn-success',
			    cancelButton: 'btn btn-danger'
			  },
			  buttonsStyling: false
			})
	      swalWithBootstrapButtons.fire({
	    	  title: 'Bạn có chắc chắn?',
	    	  text: "Thao tác này sẽ ảnh hưởng trực tiếp đến tài khoản của bạn!",
	    	  icon: 'warning',
	    	  showCancelButton: true,
	    	  confirmButtonText: 'Tiếp tục',
	    	  cancelButtonText: 'Hủy bỏ',
	    	  reverseButtons: true
		 }).then((result) => {
			   if (result.isConfirmed) { 
				   $.ajax({
		            type: "post",
		            url: "<%=request.getContextPath()%>/admin/permission/edit",
		            data: {
		            	perID : perID,
		            	giatri : giatri
		            	},
		            context:this,
		            success: function (response) {
		              if(response == false)
		              {
		            	  swalWithBootstrapButtons.fire(
	    	                    'Thông Báo!',
	    	                    'Bạn không thể thêm quyền cho loại tài khoản này.',
	    	                    'danger'
	    	                ).then(function () {
	    	                    location.reload();
	    	                })
		              }else{
		            	  swalWithBootstrapButtons.fire(
	            			      'Thành công!',
	            			      'Thao tác thành công.',
	            			      'success'
	            			    ).then(function () {
  	    	                    location.reload();
  	    	                })
		              }
		            },
		            error: function (xhr, ajaxOptions, thrownError) {
		            	swalWithBootstrapButtons.fire(
	    	                    'Thông Báo!',
	    	                    'Thao tác không thể thực hiện.',
	    	                    'danger'
	    	                ).then(function () {
	    	                    location.reload();
	    	                })
	    	            }
			   });
			   }else if (result.dismiss === Swal.DismissReason.cancel) {
	    		    swalWithBootstrapButtons.fire(
  	    		      'Thất bại',
  	    		      'Bạn đã hủy thao tác',
  	    		      'error'
  	    		    ).then(function () {
	                    location.reload();
	                })
  	    		  }
	    })
	})
	/* quyền xóa */
	$('.toggle-state-del').change(function() {
	     var giatri = $(this).prop('checked')
	     var perID = $(this).attr("perID")
	     const swalWithBootstrapButtons = Swal.mixin({
			  customClass: {
			    confirmButton: 'btn btn-success',
			    cancelButton: 'btn btn-danger'
			  },
			  buttonsStyling: false
			})
	      swalWithBootstrapButtons.fire({
	    	  title: 'Bạn có chắc chắn?',
	    	  text: "Thao tác này sẽ ảnh hưởng trực tiếp đến tài khoản của bạn!",
	    	  icon: 'warning',
	    	  showCancelButton: true,
	    	  confirmButtonText: 'Tiếp tục',
	    	  cancelButtonText: 'Hủy bỏ',
	    	  reverseButtons: true
		 }).then((result) => {
			   if (result.isConfirmed) { 
				   $.ajax({
		            type: "post",
		            url: "<%=request.getContextPath()%>/admin/permission/del",
		            data: {
		            	perID : perID,
		            	giatri : giatri
		            	},
		            context:this,
		            success: function (response) {
		              if(response == false)
		              {
		            	  swalWithBootstrapButtons.fire(
	    	                    'Thông Báo!',
	    	                    'Bạn không thể thêm quyền cho loại tài khoản này.',
	    	                    'danger'
	    	                ).then(function () {
	    	                    location.reload();
	    	                })
		              }else{
		            	  swalWithBootstrapButtons.fire(
	            			      'Thành công!',
	            			      'Thao tác thành công.',
	            			      'success'
	            			    ).then(function () {
  	    	                    location.reload();
  	    	                })
		              }
		            },
		            error: function (xhr, ajaxOptions, thrownError) {
		            	swalWithBootstrapButtons.fire(
	    	                    'Thông Báo!',
	    	                    'Thao tác không thể thực hiện.',
	    	                    'danger'
	    	                ).then(function () {
	    	                    location.reload();
	    	                })
	    	            }
			   });
			   }else if (result.dismiss === Swal.DismissReason.cancel) {
	    		    swalWithBootstrapButtons.fire(
  	    		      'Thất bại',
  	    		      'Bạn đã hủy thao tác',
  	    		      'error'
  	    		    ).then(function () {
	                    location.reload();
	                })
  	    		  }
	    })
	})
});
	
</script>
  
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

</body>
</html>
