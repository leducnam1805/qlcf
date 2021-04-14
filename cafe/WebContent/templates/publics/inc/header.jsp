<%@page import="models.User"%>
<%@page import="models.Item"%>
<%@page import="java.util.List"%>
<%@page import="models.OrderProduct"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <div class="header_top">
			<div class="logo">
				<a href="index.html"><img src="<%=request.getContextPath() %>/templates/publics/images/kingcoffe-logo.png" alt="" style="height:100px;width:90%"/></a>
			</div>
			  <div class="header_top_right">
			    <!-- <div class="search_box">
				    <form>
				    	<input type="text" value="Search for Products" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search for Products';}"><input type="submit" value="SEARCH">
				    </form>
			    </div> -->
			    <div class="shopping_cart">
		    		<div class="cart">
						<a href="<%=request.getContextPath() %>/product/order" title="View my shopping cart" rel="nofollow">
			<%
			    if(session.getAttribute("orderProduct") != null){
			    	OrderProduct orderProduct = (OrderProduct) session.getAttribute("orderProduct");
			    	List<Item> itemList =(List<Item>) orderProduct.getItem();
			    	if(itemList.size() > 0){
			    		%>
							<%
							int total = 0;
							int totalFinal = 0;
							for(Item quantity : itemList){
								total += quantity.getQuantity();
							}
							totalFinal =totalFinal + total;
							%>
							<span class="cart_title"><%=totalFinal %></span>
						<%
			    	}
			    }
			    %>
			    <span class="no_product">(Sản phẩm)</span>
						</a>
					</div>
					
			      </div>
	   
   <%
   if(session.getAttribute("userInfor")!= null){
	   User objUser = (User)session.getAttribute("userInfor");
	   %>
	   <div class="login">
	   	   <span>
	   	   	<a href="#"><%=objUser.getName() %></a>
	   	   </span>
		</div>
		<div class="login">
	   	   <span>
	   	   	<a href="<%=request.getContextPath()%>/logout">Đăng xuất</a>
	   	   </span>
		</div>
	   <%
   }else{
	   %>
	   <div class="login">
	   	   <span>
	   	   	<a href="<%=request.getContextPath()%>/login">Đăng nhập</a>
	   	   </span>
		</div>
		<div class="login">
	   	   <span>
	   	   	<a href="<%=request.getContextPath()%>/register" style="line-height:1">Đăng Ký</a>
	   	   </span>
		</div>
	   <%
   }
   %>
		   
		 <div class="clear"></div>
	 </div>
	 <div class="clear"></div>
	 </div>
	 