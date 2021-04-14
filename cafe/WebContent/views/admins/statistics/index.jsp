<%@page import="models.Item"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <%@include file="/templates/admins/inc/lib/headerLib.jsp" %>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
            <h1 class="m-0">Doanh thu</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/index">Trang chủ</a></li>
              <li class="breadcrumb-item active">Doanh thu</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
          <div class="col-lg-3 col-6">
            <!-- small box -->
              <button data-toggle="collapse" data-target="#staticstic-date" class="btn btn-primary">Doanh thu trong ngày <i class="fas fa-arrow-circle-right"></i></button>
              <!-- <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a> -->
          </div>
          <div class="col-lg-3 col-6">
			<div class="row">
				<div class="col-lg-12 col-12">
	            	<input type="text" id="datepicker"class="datepicker-start" data-format="DD-MM-YYYY" data-template="DD MM YYYY" name="dateStart" value="" placeholder="Ngày bắt đầu">
					<script>
					$(function(){
					    $('.datepicker-start').datepicker({
					    	dateFormat: 'dd/mm/yy'
					    });
					});
					</script>
            	</div>
			</div>          
          </div>
          <div class="col-lg-3 col-6">
			<div class="row">
				<div class="col-lg-12 col-12">
	            	<input type="text" id="datepickerend"class="datepicker-end" data-format="DD-MM-YYYY" data-template="DD MM YYYY" name="dateEnd" value="" placeholder="Ngày Kết thúc">
					<script>
					$(function(){
					    $('.datepicker-end').datepicker({
					    	dateFormat: 'dd/mm/yy' 
					    });
					});
					</script>
            	</div>
			</div>          
          </div>
          <button data-toggle="collapse" data-target="#staticstic-hienthi" class="btn btn-info hienthi">Hiển thị</button>
        </div>
        <div class="clear"></div>
        <div id="staticstic-date" class="collapse">
	          <div class="container-fluid">
	          	<table class="table table-bordered">
				  <thead>
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">Người mua</th>
				      <th scope="col">loại mua</th>
				      <th scope="col">Tên đồ uống</th>
				      <th scope="col">Số lượng</th>
				      <th scope="col">Giá tiền</th>
				      <th scope="col">Tổng tiền</th>
				    </tr>
				  </thead>
				  <%
				  	if(request.getAttribute("itemListDAY") != null){
				  		List<Item> itemListDAY = (List<Item>) request.getAttribute("itemListDAY");
				  		if(itemListDAY.size() > 0){
				  			%>
				  	<tbody>
				  	<%
				  	int i = 0;
				  	int total = 0;
				  	for(Item objItemDAY : itemListDAY){
				  		total += objItemDAY.getPrice();
				  		i++;
				  		%>
				  	<tr>
				      <th scope="row"><%=i %></th>
				      <td><%=objItemDAY.getOrderProduct().getUserID().getName()%></td>
				      <td><%=objItemDAY.getOrderProduct().getCatOrder().getName()%></td>
				      <td><%=objItemDAY.getProduct().getMenu().getName()%></td>
				      <td><%=objItemDAY.getQuantity()%></td>
				      <td><%=objItemDAY.getPrice() %> VNĐ</td>
				      <td><%=objItemDAY.getProduct().getPrice()%></td>
				    </tr>
				  		<%
				  	}
				  	%>
				  	<tr>
					      <th colspan="6" class="text-center">Thành tiền:</th>
					      <td class="text-center productAllTong"><%=total %></td>
					    </tr>
				  	<%
				  	%>
				  	
				  </tbody>
				  			<%
				  		}
				  	else{
			  			%>
			  			<div>
						  Hôm nay chưa có sản phẩm ..
						</div>
			  			<%
				  		}
			  		}
				  %>
				</table>
	          </div>
		  </div>
		  <div id="staticstic-hienthi" class="collapse">
	          <div class="container-fluid">
	          	<table class="table table-bordered">
				  <thead>
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">Người mua</th>
				      <th scope="col">loại mua</th>
				      <th scope="col">Tên đồ uống</th>
				      <th scope="col">Số lượng</th>
				      <th scope="col">Giá tiền</th>
				      <th scope="col">Tổng tiền</th>
				    </tr>
				  </thead>
				  	<tbody class="weekList">
				  	
				  </tbody>
				</table>
	          </div>
		  </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  
  <script type="text/javascript">
  $(document).on("click",".hienthi",function(){
	  var datepickerStart = $(".datepicker-start").val();
	  var datepickerEnd = $(".datepicker-end").val();
	  $.ajax({
	  	  type: 'POST',
	  	  url: '<%=request.getContextPath()%>/admin/statistic',
	  	  data: {
	  		datepickerStart: datepickerStart,
	  		datepickerEnd : datepickerEnd
	  		  },
	  	  success: function(data) {
	  		$(".weekList").html(data);
	  	  },
	  	  error: function() {
	  	    alert("Lỗi..!")
	  	  }
	  	});
  })
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
