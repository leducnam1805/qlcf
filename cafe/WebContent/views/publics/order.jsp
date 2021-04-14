<%@page import="models.CatOrder"%>
<%@page import="models.Item"%>
<%@page import="models.OrderProduct"%>
<%@page import="models.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<%@include file="/templates/publics/inc/lib/headerLib.jsp" %>
</head>
<body>
<div class="wrap">
	<div class="header">
		<%@include file="/templates/publics/inc/header.jsp" %>
 	</div>
	<div class="h_menu">
		<%@include file="/templates/publics/inc/menu.jsp" %>
	</div>

	<div class="header_bottom">
		<%@include file="/templates/publics/inc/slider.jsp" %>
  	</div>
 <div class="main" style="margin-top:10px">
 	<div class="content">
    	<section class="section-banner">
		    <div class="container-fluid">
		      <ul class="breadcrumb">
		        <li><a href="#">Trang chủ</a></li>
		        <li class="active">Giỏ hàng</li>
		      </ul>
		    </div>
		    
		  </section><!-- /section-banner -->
	</div>
  <section class="section-compact">
    <div class="container-fluid">
    <%
		if(!"".equals(request.getParameter("msg"))){
			String msg = request.getParameter("msg");
			if("SUCCESS".equals(msg)){
				%>
					<div class="alert alert-success" role="alert">
						 Đặt hàng thành công.!
					</div>
				<%
			}
		}
	%>
    <%
	if(session.getAttribute("orderProduct") != null){
		OrderProduct orderProduct = (OrderProduct) session.getAttribute("orderProduct");
		List<Item> itemList = (List<Item>) orderProduct.getItem();
			if(itemList.size() > 0){
					%>
			<div class="cart-block">
		        <header class="heading-3 page-heading">
		          <div class="row">
		          	<table class="table table-bordered">
					  <thead>
					    <tr>
					      <th scope="col"class="text-center">Tên sản phẩm</th>
					      <th scope="col"class="text-center">Giá tiền</th>
					      <th scope="col"class="text-center">Số lượng</th>
					      <th scope="col"class="text-center">Thành tiền</th>
					    </tr>
					  </thead>
					  <tbody>
					  <%
					  long allTong = 0L;
					  int i = 0;
						for(Item item : itemList){
							i++;
							Long tong = 0L;
							int quantity = item.getQuantity();
							long price = item.getProduct().getPrice();
							tong = quantity * price;
							allTong += tong;
							int idOrder = item.getId();
							%>
							<tr class="orderList">
						      <td><%=item.getProduct().getMenu().getName() %></td>
						      <td><%=item.getPrice()%></td>
						      <td><%=item.getQuantity()%></td>
						      <td><%=tong %>&emsp;VNĐ</td>
						    </tr>
						    <%
						}
						%>
						<tr>
					      <th colspan="3" class="text-center">Tổng tiền:</th>
					      <td class="text-center productAllTong"><%=allTong %></td>
					    </tr>
						<%
					  %>
					    
					  </tbody>
					</table>
		          </div>
		        </header>
		      </div>
		      	<%
				}
			}
	%>
        
        <div class="form-main-container">
          <div class="row">
            <%-- <%
            	if(session.getAttribute("userInfor") != null){
            		User userInfor = (User) session.getAttribute("userInfor");
            		%> --%>
     		<%
     		if(session.getAttribute("userInfor") != null){
     			User user = (User)session.getAttribute("userInfor");
     			%>
     		<div class="col-sm-12 col-lg-12">
              <div class="form-section-box">
                <header class="heading-5">
                  <h1>Thông tin đơn hàng</h1>
                </header>

                <form class="checkout-form" method="post" action="<%=request.getContextPath()%>/order">
                
                <%
                	if(request.getAttribute("catOrderList") != null){
                		List<CatOrder> catOrderList = (List<CatOrder>) request.getAttribute("catOrderList");
                		if(catOrderList.size() > 0){
                			%>
                <div class="form-group row">
                    <label class="col-md-2 label-md">Loại đơn hàng</label>
                    <div class="col-md-10">
                      <select class="form-control catOrderName" id="catOrderID" name="catOrder">
                      <%
                      for(CatOrder objCatOrder : catOrderList){
                    	  %>
                    	  <option value="<%=objCatOrder.getId()%>"><%=objCatOrder.getName()%></option>
                    	  <%
                      }
                      %>
					    </select>
                    </div>
                  </div>
                			<%
                		}
                	}
                %>
                  
                
                  <div class="form-group row">
                    <label class="col-md-2 label-md">Số điện thoại</label>
                    <div class="col-md-10">
                      <input type="text" class="form-control phone" placeholder="phone" name="phone" value="<%=user.getPhone()%>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-md-2 label-md">Họ tên</label>
                    <div class="col-md-10">
                      <input type="hidden" value="<%=user.getId()%>"class="form-control idUser" placeholder="id" name="idUser">
                      <input type="text" value="<%=user.getName()%>"class="form-control fullname" placeholder="fullname" name="fullname">
                    </div>
                    
                  </div>
                  <div class="form-group row">
                    <label class="col-md-2 label-md">Email</label>
                    <div class="col-md-10">
                      <input type="email" class="form-control email" placeholder="Email" name="email" value="<%=user.getEmail()%>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-md-2 label-md">Địa chỉ nhận hàng(Ghi rõ số nhà, tên đường)</label>
                    <div class="col-md-10">
                      <textarea class="form-control address" placeholder="Adress" name="adress"></textarea>
                    </div>
                  </div>
                  <div class="form-group row">
                  	<div class="col-md-6">
                  		<!-- <button type="button" class="btn btn-info form-control" data-toggle="modal" data-target=".bd-example-modal-lg">Thanh toán COD</button> -->
                      <input type="text" class="btn btn-info form-control send-mail" value="Thanh toán COD">
                    </div>
                    <div class="col-md-6">
                     <input type="text" class="btn btn-success form-control" value="Thanh toán Online">
                    </div>
                  </div>
                  
                </form>
              </div><!-- /form-section-box -->
            </div>
     			<%
     		}
     		%>
            		<%-- <%
            	}
            %> --%>
          </div>
        </div><!-- /form-main-container -->
<!-- <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Xác nhận đơn hàng</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	<div class="row">
       		
       	</div>
      </div>
    </div>
  </div>
</div> -->

      </div><!-- /cart-block -->
    </div>

  </section>

 </div>
</div>
<script>
$(document).on("click", ".send-mail", (function () {
	var catOrderID = $("#catOrderID").val();
	var phone = $(".phone").val();
	var idUser = $(".idUser").val();
	var fullname = $(".fullname").val();
	var email = $(".email").val();
	var address = $(".address").val();
	var productAllTong = $(".productAllTong").text();
	
	//lấy dữ liêu
	swal.fire({
        title: 'Xác nhận đơn hàng',
        text: "Bạn đồng ý đặt hàng!",
        icon: 'warning',
        padding: '3em',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Đồng ý!',
        cancelButtonText: 'Hủy bỏ',
        reverseButtons: true,
        customClass: null
    }).then((result) => {
    	  if (result.value) {
    		  $.ajax({
    			  	async: false,
    	            type: "POST",
    	            url: "<%=request.getContextPath()%>/product/order",
    	            data: {
    	            	catOrderID : catOrderID,
    	            	phone : phone,
    	            	idUser : idUser,
    	            	fullname: fullname,
    	            	email : email,
    	            	address : address,
    	            	productAllTong : productAllTong
    	            	},
    	            success: function (data) {
    	            	if(data==false){
	    	            		Swal.fire(
   	    	                    'Thông Báo!',
   	    	                    'Không thành công.',
   	    	                    'danger'
   	    	                ).then(function () {
   	    	                    location.reload();
   	    	                })
    	            	}else{
   	            			Swal.fire(
	            			      'Thành công!',
	            			      'Chúc mừng bạn đã đặt hàng thành công.',
	            			      'success'
	            			    ).then(function () {
   	    	                    	location.reload();
   	    	                })
    	            	}
    	            },
    	            error: function (xhr, ajaxOptions, thrownError) {
    	                Swal.fire(
    	                    'Thông Báo!',
    	                    'Thao tác không thể thực hiện.',
    	                    'danger'
    	                ).then(function () {
    	                    location.reload();
    	                })
    	            }
    	        });
    		  } else if (result.dismiss === Swal.DismissReason.cancel) {
    		    swal.fire(
    		      'Thất bại',
    		      'Bạn Chưa thực hiện thao tác này',
    		      'error'
    		    )
    		  }
    		})
}))
</script>
   <div class="footer">
   	  <%@include file="/templates/publics/inc/footer.jsp" %>
    </div>
    <%@include file="/templates/publics/inc/lib/footerLib.jsp" %>
</body>
</html>