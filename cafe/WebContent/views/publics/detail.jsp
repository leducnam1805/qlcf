<%@page import="models.Rate"%>
<%@page import="models.Comment"%>
<%@page import="models.Favourite"%>
<%@page import="models.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<%@include file="/templates/publics/inc/lib/headerLib.jsp" %>
	<link href="<%=request.getContextPath()%>/templates/publics/css/slick.css" type="text/css" rel="stylesheet"> 
	<link rel="stylesheet" href="<%=request.getContextPath()%>/templates/publics/css/product.css" type="text/css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/templates/publics/js/product.js.download"></script>
	<link href="<%=request.getContextPath()%>/templates/publics/css/custom.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/templates/publics/css/rating.css">
</head>
<style>
input.ip-like{
	width:25px;
	border:0;
	outline: 0;     
    outline-style: none;     
    outline-width: 0; 
}
input.nb-like{
	width:25px;
	border:0;
	outline: 0;     
    outline-style: none;     
    outline-width: 0; 
}
div.rate {
    margin-top: 10px !important;
}
li.checked {
  color: orange;
}
</style>
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
	 <div class="mod-content row">
      <div id="vnt-main" class="col-sm-12 col-xs-12">
      
      <%
 if(request.getAttribute("objProduct") != null){
	 Product objProduct = (Product)request.getAttribute("objProduct");
	 %>
		<div class="boxBB">
		  <div class="productTitle">
		  <input type="hidden"value="<%=objProduct.getId()%>" name="productID" class="productID"/>
		  	<h1><%=objProduct.getMenu().getName() %></h1>
		  </div>
		  <div class="gridP">
		    <div class="col-md-6">
		      <div class="productThumnail">
		        <div id="vnt-thumbnail-for" class="slick-init slick-initialized slick-slider">
		          <div class="slick-list draggable">
			          <div class="slick-track" style="opacity: 1; width: 375px; transform: translate3d(0px, 0px, 0px);">
				          <div class="item slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" tabindex="0" style="width: 375px;">
				            <div class="img">
				            	<%
				            		if("".equals(objProduct.getImage())){
				            			%>
				            	<img src="<%=request.getContextPath() %>/templates/publics/images/no-image.jpg" style="width:220px;height:150px;" alt="" />
				            			<%
				            		}else{
				            			%>
				            		<img src="<%=request.getContextPath()%>/uploads/images/product/<%=objProduct.getImage() %>" alt="">
				            			<%
				            		}
				            	%>
				            </div>
				          </div>
			          </div>
		          </div>
		          <div class="clear"></div>
		          <%
		          	if(session.getAttribute("userInfor") != null){
		          		User objUser = (User)session.getAttribute("userInfor");
		          		%>
		         <div class="rate">
		          <div class="favourite">
		          	  <input type="hidden" value="<%=objUser.getId()%>" name="userID" class="userID"/>
			          <a href="javascript:void(0)" class="like-product">
			          	<i class="fa fa-thumbs-up"></i>
			          	<input type="text" value="like" class="ip-like"/>
			          </a>
			          <%
			          	if(request.getAttribute("favouriteList") != null){
			          		List<Favourite> favouriteList = (List<Favourite>) request.getAttribute("favouriteList");
			          		if(favouriteList.size() > 0){
			          			for(Favourite objFavourite : favouriteList)
			          			{
			          				%>
			          <a href="javascript:void(0)">
			          	<input type="text" value="<%=objFavourite.getQuantum()%>" class="nb-like"/>
			          </a>
			          				<%
			          			}
			          		}else{
			          			%>
			          <a href="javascript:void(0)">
			          	<input type="text" value="0" class="nb-like"/>
			          </a>
			          			<%
			          		}
			          	}
			          %>
			          </div>
				 <ul class="rating">
		         <%
	        	  int rating = 5;
	        	  for(int i = 1; i <= rating; i++){
       			  %>
       			  
   		        	<li class="fa fa-star rate-star rating-item" data-rate="<%=i%>"></li>
   		          <%  
		          }
		         %>
	          	 </ul>
			          	<input type="hidden" value="<%=objUser.getId()%>" placeholder="<%=objUser.getName()%>" id="idUserComment" style="width:150px"/>
			          	<input type="text" value="" placeholder="<%=objUser.getName()%>" id="idcomment" style="width:150px"/>
			          	<button type="button" onclick="return getComment()">Bình luận</button>
		          <%
		          	if(request.getAttribute("commentList") != null){
		          		List<Comment> commentList = (List<Comment>) request.getAttribute("commentList");
		          		if(commentList.size() > 0){
		          			%>
		          <div class="row">
		          <%
		          	for(Comment objComment : commentList){
		          		%>
		          		<div class="col-sm-12">
		          			<img src="<%=request.getContextPath()%>/templates/publics/images/avata-user.jpg" alt="avatar-user" class="col-sm-4 float-left"/>
		          			<div class="col-sm-7">
		          				<h3><%=objComment.getUser().getName()%></h3>
		          				<p><%=objComment.getName()%></p>
		          				<p><%=objComment.getCreateDate() %></p>
		          			</div>
		          			<hr/>
		          		</div>
		          		<%
		          	}
		          %>
		          </div>
		          			<%
		          		}
		          	}else{
		          		%>
		          <div class="row comment-ajax">
		          	
		          </div>
		          		<%
		          	}
		          %>
		          </div>
		          		<%
		          	}else{
		          		%>
		          <div class="rate">
		          	<div class="favourite">
			          <a href="javascript:void(0)" class="like-product">
			          	<i class="fa fa-thumbs-up"></i>
			          	<input type="text" value="like" class="ip-like" />
			          </a>
			          <%
			          	if(request.getAttribute("favouriteList") != null){
			          		List<Favourite> favouriteList = (List<Favourite>) request.getAttribute("favouriteList");
			          		if(favouriteList.size() > 0){
			          			for(Favourite objFavourite : favouriteList)
			          			{
			          				%>
			          <a href="javascript:void(0)">
			          	<input type="text" value="<%=objFavourite.getQuantum()%>" class="nb-like"/>
			          </a>
			          				<%
			          			}
			          		}else{
			          			%>
			          <a href="javascript:void(0)">
			          	<input type="text" value="0" class="nb-like"/>
			          </a>
			          			<%
			          		}
			          	}
			          %>
			         	 <input type="hidden" value="" placeholder="" id="idUserComment" style="width:150px"/>
			          	<input type="text" value="" placeholder="" id="idcomment" style="width:150px"/>
			          	<button type="button" onclick="return getComment()">Bình luận</button>
		          </div>
		          <ul class="rating">
		         <%
	        	  int rating = 5;
	        	  for(int i = 1; i <= rating; i++){
       			  %>
   		        	<li class="fa fa-star rate-star rating-item" data-rate="<%=i%>"></li>
   		          <%  
		          }
		         %>
	          	 </ul>
		          <%
		          	if(request.getAttribute("commentList") != null){
		          		List<Comment> commentList = (List<Comment>) request.getAttribute("commentList");
		          		if(commentList.size() > 0){
		          			%>
		          <div class="row">
		          <%
		          	for(Comment objComment : commentList){
		          		%>
		          		<div class="col-sm-12">
		          			<img src="<%=request.getContextPath()%>/templates/publics/images/avata-user.jpg" alt="avatar-user" class="col-sm-4 float-left"/>
		          			<div class="col-sm-7">
		          				<h3><%=objComment.getUser().getName()%></h3>
		          				<p><%=objComment.getName()%></p>
		          				<p><%=objComment.getCreateDate() %></p>
		          			</div>
		          		</div>
		          		<%
		          	}
		          %>
		          </div>
		          			<%
		          		}
		          	}else{
		          		%>
		          <div class="row comment-ajax">
		          	
		          </div>
		          		<%
		          	}
		          %>
		          </div>
		          		<%
		          	}
		          
		          %>
		        </div>
		        <div id="vnt-thumbnail-nav" class="slick-init slick-initialized slick-slider">
		          <div class="slick-list draggable"><div class="slick-track" style="opacity: 1; width: 0px; transform: translate3d(0px, 0px, 0px);"><div class="item slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" tabindex="0" style="width: 0px;">
		            <div class="img"><img src="<%=request.getContextPath()%>/templates/publics/images/270_crop_GTF.png" alt=""></div>
		          </div></div></div>
		        </div>
		      </div>
		    </div>
		    <div class="col-md-6">
		      <div class="productDes desc">
		         <p><a href=""><%=objProduct.getDescription() %></a></p>
				<div>
					<a href="javascript:void(0)" id=<%=objProduct.getId() %> class="idProduct-order">
						<img alt="65-dat-mua-kmk" data-ck-zoom="yes" src="<%=request.getContextPath()%>/templates/publics/images/65-dat-mua-kmk.png" style="width: 400px; height: 99px;">
					</a>
				</div>
				<p>&nbsp;</p>
		      </div>
		      <div class="clear"></div>
		      <div class="productPrice">Giá : <strong id="ext_price"><%=objProduct.getPrice()%>&emsp;VNĐ</strong></div>
		    </div>
		  </div>
		</div>
		 <%
	 	}
	 %>
	 <%
	 	if(request.getAttribute("objProductListMenuID") != null){
	 		List<Product> objProductListMenuID = (List<Product>) request.getAttribute("objProductListMenuID");
	 		if(objProductListMenuID.size() > 0){
	 			%>
	 	<div class="box_mid">
		  <div class="mid-title">
		    <div class="titleL"><h2>Thức uống khác</h2></div>
		    <div class="titleR"></div>
		  </div>
		  <div class="mid-content">
		    <div id="slideOther" class="slideOthers slick-init slick-initialized slick-slider">
		      <div class="slick-list draggable">
		      <%
		        for(Product objProduct : objProductListMenuID){
		        	%>
		      	<div class="" style="opacity: 1; width: 534px; transform: translate3d(0px, 0px, 0px);">
		      	 <div class="item slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" tabindex="0" style="width: 267px;">
		        
			        <div class="product">
			          <div class="img">
			          <%
			          	if("".equals(objProduct.getImage())){
			          		%>
			          	<a href="<%=request.getContextPath()%>/detail?id=<%=objProduct.getId() %>" tabindex="0">
			          		<img src="<%=request.getContextPath() %>/templates/publics/images/no-image.jpg" style="width:220px;height:150px;" alt="" />
			          	</a>
			          		<%
			          	}else{
			          		%>
			          	<a href="<%=request.getContextPath()%>/detail?id=<%=objProduct.getId() %>" tabindex="0">
			          		<img src="<%=request.getContextPath()%>/uploads/images/product/<%=objProduct.getImage()%>" alt="Cookies &amp; Cream">
			          	</a>
			          		<%
			          	}
			          %>
			          	
			          	</div>
			          <div class="tend2"><h3><a href="<%=request.getContextPath()%>/detail?id=<%=objProduct.getId() %>" tabindex="0"><%=objProduct.getMenu().getName() %></a></h3></div>
			          <div class="price">Giá: <strong><%=objProduct.getPrice()%> VNĐ</strong></div>
			        </div>
			       </div>
			      </div>
		        	<%
		        }
		        %>
		  </div>
		</div>
	 			
      </div>
      <div id="vnt-sidebar" class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
       
      </div>
    </div>
    <%
	 		}
	 	}
	 %>
	
 </div>
</div>
<script>
$(document).on("click", ".idProduct-order", (function () {
	var idPro = $(this).attr("id");
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
}))
</script>
<script type="text/javascript">
$(document).on("click", ".like-product", (function () {
	var productID = $(".productID").val();
	var userID = $(".userID").val();
	var iplike = $(".ip-like").val();
	var nblike = $(".nb-like").val();
	$.ajax({
	  	  type: 'POST',
	  	  url: '<%=request.getContextPath()%>/product/favourite',
	  	  data: {
	  		productID: productID,
	  		userID : userID,
	  		iplike : iplike,
	  		nblike : nblike
	  		  },
	  	  success: function(data) {
	  		 location.reload();
	  	  },
	  	  error: function() {
	  	    
	  	  }
	  	});
}))
//comment
function getComment(){
	var productID = $(".productID").val();
	var comment = $("#idcomment").val();
	var idUserComment = $("#idUserComment").val();
	$.ajax({
	  	  type: 'POST',
	  	  url: '<%=request.getContextPath()%>/product/comment',
	  	  cache: false,
	  	  data: {
	  		productID : productID,
	  		comment: comment,
	  		idUserComment: idUserComment
	  		  },
	  	  success: function(data) {
	  		$(".comment-ajax").html(data);
	  	  },
	  	  error: function() {
	  	    alert("Có lỗi")
	  	  }
	  	});
	return false;
}
</script>
<script>
const container = document.querySelector('.rating');
const items = container.querySelectorAll('.rating-item')
container.onclick = e => {
	const elClass = e.target.classList;
	if(!elClass.contains('active')){
		items.forEach(
			item => item.classList.remove('active')		
		);
		var productID = $(".productID").val();
		var idUserComment = $("#idUserComment").val();
		var numberRating = e.target.getAttribute("data-rate");
		$.ajax({
		  	  type: 'GET',
		  	  url: '<%=request.getContextPath()%>/product/rating',
		  	  cache: false,
		  	  data: {
		  		numberRating : numberRating,
		  		productID : productID,
		  		idUserComment : idUserComment
		  		  },
		  	  success: function(data) {
		  	  },
		  	  error: function() {
		  	    alert("Có lỗi")
		  	  }
		  	});
		
		elClass.add('active');
	}
};
</script>
   <div class="footer">
   	  <%@include file="/templates/publics/inc/footer.jsp" %>
    </div>
    <%@include file="/templates/publics/inc/lib/footerLib.jsp" %>
</body>
</html>

