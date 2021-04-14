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
  <!-- sua -->
      <div class="modal-body">
      <%
       		if(request.getAttribute("objMenuFindByID") != null){
       			Menu objMenuFindByID = (Menu) request.getAttribute("objMenuFindByID");
       			%>
       	<form role="form" id="registration" action="<%=request.getContextPath()%>/admin/menu/edit" method="post">
	       	<div class="form-group row">
			    <label for="exampleprice" class="col-sm-3">Tên đồ uống</label>
			    <input type="hidden" class="form-control col-sm-8" id="exampleprice" value="<%=objMenuFindByID.getId()%>" name="idmenu">
			    <input type="text" class="form-control col-sm-8" id="exampleprice" value="<%=objMenuFindByID.getName()%>" name="nameCreate">
			  </div>
			  <%
			  	if(objMenuFindByID.getParentID() != 0){
			  		%>
			  	<div class="form-group row">
			    <label for="exampleInputCategory" class="col-sm-3 col-form-label">Tên thực đơn</label>
			    <%
				    	if(request.getAttribute("menuList") != null){
			        		List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
			        		if(menuList.size() > 0){
			        			%>
			    <div class="col-sm-8">
				    <select class="form-control" id="parentIdCreate" aria-label="Default select example" name="parentIdCreate" readonly="readonly">
					  <%
					  for(Menu objMenu : menuList){
						  %>
						  <option value="<%=objMenu.getId()%>"
						  <%if(objMenuFindByID.getParentID()==objMenu.getId()) out.print("selected"); %>
						  ><%=objMenu.getName()%></option>
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
			  		<%
			  	}
			  %>
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