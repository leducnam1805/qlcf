<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="<%=request.getContextPath()%>/admin" class="brand-link">
      <img src="<%=request.getContextPath()%>/templates/admins/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">Quán Cafe</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="<%=request.getContextPath()%>/templates/admins/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Lê Đức Nam</a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          
          <li class="nav-item">
            <a href="<%=request.getContextPath()%>/admin/statistic" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                Thống kê
                <span class="right badge badge-danger">New</span>
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-copy"></i>
              <p>
                Thực đơn
                <i class="fas fa-angle-left right"></i>
                <span class="badge badge-info right">6</span>
              </p>
            </a>
            <ul class="nav nav-treeview">
             <li class="nav-item">
                <a href="<%=request.getContextPath()%>/admin/menu" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Loại nước</p>
                </a>
              </li>
             <li class="nav-item">
                <a href="<%=request.getContextPath()%>/admin/menu/product" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Đồ uống</p>
                </a>
              </li>
              <%-- <li class="nav-item">
                <a href="<%=request.getContextPath()%>/admin/menu/price" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Giá cả</p>
                </a>
              </li> --%>
              <%-- <li class="nav-item">
                <a href="<%=request.getContextPath()%>/admin/menu/size" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Size</p>
                </a>
              </li> --%>
               </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-chart-pie"></i>
              <p>
                Tài Khoản
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/admin/user/cat" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Loại tài khoản</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/admin/user" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Tài khoản</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/admin/permission" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Phân quyền tài khoản</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-tree"></i>
              <p>
                Đơn hàng
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/admin/order/cat" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Loại đơn hàng</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/admin/order" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Đơn hàng</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-edit"></i>
              <p>
                Đánh giá Đồ uống
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="pages/forms/general.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Đánh giá cao nhất</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/forms/advanced.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Like</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/forms/editors.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Bình luận</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/forms/validation.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>5 Sao</p>
                </a>
              </li>
            </ul>
          </li>
          <!-- <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
              <p>
                Tables
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="pages/tables/simple.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Simple Tables</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/tables/data.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>DataTables</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/tables/jsgrid.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>jsGrid</p>
                </a>
              </li>
            </ul>
          </li> -->
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
      