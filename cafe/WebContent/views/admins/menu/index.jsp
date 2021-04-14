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
            	<div class="col-sm-2">
            		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
					  Tạo
					</button>
            	</div>
            </div>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
              <li class="breadcrumb-item active">Thực đơn</li>
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
    <%
    	if(request.getAttribute("menuList") != null){
        		List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
        		if(menuList.size() > 0){
    %>
    <table class="table table-bordered" id="datatable">
	  <thead class="thead-CCFFFF">
	    <tr class="list-header">
	      <th scope="col">#</th>
	      <th scope="col">Thực đơn</th>
	      <th scope="col">Chức năng</th>
	    </tr>
	  </thead>
	  <tbody>
	  <%
	  	for(Menu objMenu : menuList){
	  %>
	  <a href="123">
 		<tr class="tr-hover">
	      <th scope="row"><input type="checkbox" name="vehicle1" value="Bike"></th>
	      <td><%=objMenu.getName()%></td>
	     <td>
	    	<button type="button" class="btn btn-warning suaMenu" data-toggle="modal" data-target="#exampleModalSua">
				<a href="<%=request.getContextPath()%>/admin/menu/edit?id=<%=objMenu.getId()%>">Cập nhật</a>
			</button>
	     	<button xoaMenu="<%=objMenu.getId()%>" type="button" class="btn btn-danger">Xóa</button>
	     </td>
	    </tr>
	   </a>
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
       	<form role="form" id="registration" action="<%=request.getContextPath()%>/admin/menu" method="post">
	       	<div class="form-group row">
			    <label for="exampleprice" class="col-sm-3">Tên đồ uống</label>
			    <input type="text" class="form-control col-sm-8" id="exampleprice" name="nameCreate">
			  </div>
			  <div class="form-group row">	
			    <label for="exampleInputCategory" class="col-sm-3 col-form-label">Tên thực đơn</label>
			    <%
				    	if(request.getAttribute("menuList") != null){
			        		List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
			        		if(menuList.size() > 0){
			        			%>
			    <div class="col-sm-8">
				    <select class="form-control" id="parentIdCreate" aria-label="Default select example" name="parentIdCreate">
					  <option value="0" selected>--- Chọn ---</option>
					  <%
					  for(Menu objMenu : menuList){
						  %>
						  <option value="<%=objMenu.getId()%>"><%=objMenu.getName()%></option>
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
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Thoát</button>
		        <button type="submit" class="btn btn-primary create-menu">Tạo</button>
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
</body>
</html>