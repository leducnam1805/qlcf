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
    	<div class="content_top">
    		<div class="heading">
    			<h2>Thức uống mới</h2>
    		</div>
    		<div class="clear"></div>
    	</div>
    	<%
	      if(request.getAttribute("productNews")!= null){
	    	  List<Product> productNewsList = (List<Product>) request.getAttribute("productNews");
	    	  if(productNewsList.size() > 0){
	    		  %>
	    	<div class="section group" id="row">
	    	<%
	    	for(Product objProductNews : productNewsList){
	    		%>
	    		<div class="grid_1_of_4 images_1_of_4">
	    		
	    		<%
	    			if("".equals(objProductNews.getImage())){
	    				%>
	    			<a href="#">
	    				<img src="<%=request.getContextPath() %>/templates/publics/images/no-image.jpg" style="width:220px;height:150px;" alt="" />
	    			</a>
	    			<%
	    			}else{
	    				%>
    				<a href="#">
    					<img src="<%=request.getContextPath() %>/uploads/images/product/<%=objProductNews.getImage() %>" style="width:220px;height:150px;" alt="" />
    				</a>
	    				<%
	    			}
	    		%>
					 <div class="discount">
					 	<span class="percentage">22%</span>
					</div>
					 <h2><%=objProductNews.getMenu().getName()%></h2>
					 <p>
					 	<span class="strike"><%=objProductNews.getPrice()%> VNĐ</span>
					 	<span class="price"><%=objProductNews.getPrice()%>VNĐ</span>
					 </p>
				      <div class="button">
				      	<span><img src="<%=request.getContextPath() %>/templates/publics/images/cart.jpg" alt="" />
				      		<a idPro="<%=objProductNews.getId()%>" class="cart-button idPro-order">Mua ngay</a>
				      	</span>
				      </div>
				     <div class="button">
				     	<span>
				     		<a href="<%=request.getContextPath() %>/detail?id=<%=objProductNews.getMenu().getId()%>" class="details">Chi tiết</a>
				     	</span>
				     </div>
				</div>
	    		<%
	    	}
	    	%>
			</div>
	    		  <%
	    	  }
	    	  }
	      %>
			<div class="content_bottom">
    		<div class="heading">
    		<h3>Tất cả thức uống</h3>
    		</div>
    		
    		<div class="clear"></div>
    	</div>
    	<%
	      		if(request.getAttribute("productList") != null){
	      			List<Product> productList = (List<Product>) request.getAttribute("productList");
	      			if(productList.size() > 0){
	      				%>
			<div class="section group">
			<%
	      			for(Product objProduct : productList){
	      				%>
	      		<div class="grid_1_of_4 images_1_of_4">
	      		
	      		<%
	      		if("".equals(objProduct.getImage())){
	      			%>
	      		<a href="#">
	    				<img src="<%=request.getContextPath() %>/templates/publics/images/no-image.jpg" style="width:220px;height:150px;" alt="" />
	    		</a>
	      			<%
	      		}else{
	      			%>
	      		<a href="#"><img src="<%=request.getContextPath() %>/uploads/images/product/<%=objProduct.getImage() %>" style="width:220px;height:150px;" alt="" /></a>
	      			<%
	      		}
	      		%>
					 <div class="discount">
					 <span class="percentage">22%</span>
					</div>
					 <h2><%=objProduct.getMenu().getName()%> </h2>
					 <p><span class="strike"><%=objProduct.getPrice()%> VNĐ</span><span class="price"><%=objProduct.getPrice()%>VNĐ</span></p>
				      <div class="button"><span><img src="<%=request.getContextPath() %>/templates/publics/images/cart.jpg" alt="" /><a idPro="<%=objProduct.getId()%>" class="cart-button idPro-order">Mua ngay</a></span></div>
				     <div class="button"><span><a href="<%=request.getContextPath() %>/detail?id=<%=objProduct.getMenu().getId() %>" class="details">Chi tiết</a></span></div>
				</div>
				<%
	      			}
	      		%>
			</div>
				<%
	      			}
	      		}
	      	%>
    </div>
 </div>
</div>
<script>
$(document).on("click", ".idPro-order", (function () {
	var idPro = $(this).attr("idPro");
	//lấy dữ liêu
	swal.fire({
        title: 'Thêm sản phẩm vào giỏ hàng',
        text: "Dữ liệu sẽ được cập nhật!",
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
    	            type: "GET",
    	            url: "<%=request.getContextPath()%>/addtocart",
    	            data: {id: idPro},
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
	            			      'Thêm vào giỏ hàng thành công.',
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
}));

$(".menuNews").change(function(){
	var menuNews = $(this).find("option:selected").val();
	$.ajax({
  	  type: 'GET',
  	  url: '<%=request.getContextPath()%>/menu/search/news',
  	  data: {menuNews: menuNews},
  	  dataType: "json",
  	  async: true,
      cache: false,
  	  success: function(data) {
  		 var listSize = Object.keys(data).length;
  		 if(listSize > 0){
  			 for(i = 0;i < listSize;i++){
  				 alert(data[i].id)
  			 }
  		 }
  	  },
  	  error: function() {
  	    
  	  }
  	});
})
</script>
   <div class="footer">
   	  <%@include file="/templates/publics/inc/footer.jsp" %>
    </div>
    <%@include file="/templates/publics/inc/lib/footerLib.jsp" %>
</body>
</html>

