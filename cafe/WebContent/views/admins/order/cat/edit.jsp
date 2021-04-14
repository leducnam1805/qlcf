<%@page import="models.CatOrder"%>
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
              <li class="breadcrumb-item active">Loại đơn hàng</li>
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
       		if(request.getAttribute("catOrder") != null){
       			CatOrder catOrder = (CatOrder) request.getAttribute("catOrder");
       			%>
       	<form role="form" id="registration" action="<%=request.getContextPath()%>/admin/order/cat/edit" method="post">
	       	<div class="form-group row">
			    <label for="exampleprice" class="col-sm-3">Loại đơn hàng</label>
			    <input type="hidden" class="form-control col-sm-8" id="exampleprice" value="<%=catOrder.getId()%>" name="idCatorder">
			    <input type="text" class="form-control col-sm-8" id="exampleprice" value="<%=catOrder.getName()%>" name="nameCreate">
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