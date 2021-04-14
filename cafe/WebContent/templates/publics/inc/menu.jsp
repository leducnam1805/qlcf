<%@page import="utils.MenuUtil"%>
<%@page import="com.sun.webkit.ContextMenu.ShowContext"%>
<%@page import="models.Menu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <div class="navbar navbar-default" role="navigation">
    <div class="container">
      <div class="navbar-header">
         <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
           <span class="sr-only">Toggle navigation</span>
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
         </button>
         <a class="navbar-brand" href="<%=request.getContextPath()%>/index">Quán cà phê</a>
      </div>
 
      <div class="collapse navbar-collapse">
         <ul class="nav navbar-nav menu1">
            <li class="active"><a href="<%=request.getContextPath()%>/index">Trang chủ</a></li>
            <li>
                <a href="javascript:void(0)" class="dropdown-toggle">Thực đơn<b class="caret"></b></a>
                <%
                if(request.getAttribute("menuList") != null){
                	List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
                	if(menuList.size() > 0){
                		%>
                <ul class="dropdown-menu">
                	<%
                	for(Menu objMenu : menuList){
	              		if(objMenu.getParentID() == 0){
	              			%>
	              			<li><a href="<%=request.getContextPath()%>/detail?id=<%=objMenu.getId()%>"><%=objMenu.getName()%><b class="caret"></b></a>
	              			<%
	              			MenuUtil.ShowMenu(objMenu.getId(), request, out);
	              		}
                	}
                	%>
               </ul>
                		<%
                	}
                }
                %>
           </li>
        </ul>
    </div>
  </div>
</div>

	<%-- <script src="<%=request.getContextPath() %>/templates/publics/js/menu.js" type="text/javascript"></script> --%>
    <script>
    $(document).ready(function() {
    	$(".menu1 li").hover(function(){
    		$(this).find("ul:first").slideDown(800);
    	},function(){
    		$(this).find("ul:first").hide(500);
    	})
    	  /* $('.navbar a.dropdown-toggle').hover(function(e) {
    	      var $el = $(this);
    	     var $parent = $(this).offsetParent(".dropdown-menu");
    	     $(this).parent("li").toggleClass('open');
    	     if(!$parent.parent().hasClass('nav')) {
    	          $el.next().css({"top": $el[0].offsetTop, "left": $parent.outerWidth() - 4});
    	     }
    	     $('.nav li.open').not($(this).parents("li")).removeClass("open");
    	     return false;
    	    }); */
    	});
</script>