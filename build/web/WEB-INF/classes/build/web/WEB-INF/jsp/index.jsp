<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html lang="en">
  
<!-- Mirrored from florence-admin-template.multipurposethemes.com/bs4/main/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 03 Jun 2022 12:49:57 GMT -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="https://florence-admin-template.multipurposethemes.com/bs4/images/favicon.ico">

    <title>Florence Admin - Dashboard</title>
    
	<!-- Vendors Style-->
        <link rel="stylesheet" href="<c:url value="css/vendors_css.css"/>">
	<!-- Style-->  
        <link rel="stylesheet" href="<c:url value="css/style.css"/>">
        <link rel="stylesheet" href="<c:url value="css/skin_color.css"/>">
     
  </head>

<body class="hold-transition light-skin sidebar-mini theme-primary">
	
<div class="wrapper">

  <header class="main-header">
	<div class="d-flex align-items-center logo-box justify-content-between">
		<a href="#" class="waves-effect waves-light nav-link rounded d-none d-md-inline-block mx-10 push-btn" data-toggle="push-menu" role="button">
			<i class="ti-menu"></i>
		</a>	
		<!-- Logo -->
		<a href="index.html" class="logo">
		  <!-- logo-->
		  <div class="logo-lg">
                      <span class="light-logo"><img src="<c:url value="images/logo-dark-text.png"/>" alt="logo"></span>
                      <span class="dark-logo"><img src="<c:url value="images/logo-light-text.png"/>" alt="logo"></span>
		  </div>
		</a>	
	</div>  
    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top pl-10">
      <!-- Sidebar toggle button-->
	  <div class="app-menu">
		<ul class="header-megamenu nav">
			<li class="btn-group nav-item d-md-none">
				<a href="#" class="waves-effect waves-light nav-link rounded push-btn" data-toggle="push-menu" role="button">
					<i class="ti-menu"></i>
			    </a>
			</li>
			<li class="btn-group nav-item d-none d-xl-inline-block">
				<a href="contact_app_chat.html" class="waves-effect waves-light nav-link rounded svg-bt-icon" title="">
					<i class="ti-comments"></i>
			    </a>
			</li>
			<li class="btn-group nav-item d-none d-xl-inline-block">
				<a href="mailbox.html" class="waves-effect waves-light nav-link rounded svg-bt-icon" title="">
					<i class="ti-email"></i>
			    </a>
			</li>
			<li class="btn-group nav-item d-none d-xl-inline-block">
				<a href="extra_taskboard.html" class="waves-effect waves-light nav-link rounded svg-bt-icon" title="">
					<i class="ti-check-box"></i>
			    </a>
			</li>
			<li class="btn-group nav-item d-none d-xl-inline-block">
				<a href="extra_calendar.html" class="waves-effect waves-light nav-link rounded svg-bt-icon" title="">
					<i class="ti-calendar"></i>
			    </a>
			</li>
		</ul> 
	  </div>
		
      <div class="navbar-custom-menu r-side">
        <ul class="nav navbar-nav">	
			<li class="btn-group nav-item d-lg-inline-flex d-none">
				<a href="#" data-provide="fullscreen" class="waves-effect waves-light nav-link rounded full-screen" title="Full Screen">
					<i class="ti-fullscreen"></i>
			    </a>
			</li>	  
			<li class="btn-group d-lg-inline-flex d-none">
				<div class="app-menu">
					<div class="search-bx mx-5">
						<form>
							<div class="input-group">
							  <input type="search" class="form-control" placeholder="Search" aria-label="Search" aria-describedby="button-addon2">
							  <div class="input-group-append">
								<button class="btn" type="submit" id="button-addon3"><i class="ti-search"></i></button>
							  </div>
							</div>
						</form>
					</div>
				</div>
			</li>
		  <!-- Notifications -->
		  <li class="dropdown notifications-menu">
			<a href="#" class="waves-effect waves-light dropdown-toggle" data-toggle="dropdown" title="Notifications">
			  <i class="ti-bell"></i>
			</a>
			<ul class="dropdown-menu animated bounceIn">

			  <li class="header">
				<div class="p-20">
					<div class="flexbox">
						<div>
							<h4 class="mb-0 mt-0">Notifications</h4>
						</div>
						<div>
							<a href="#" class="text-danger">Clear All</a>
						</div>
					</div>
				</div>
			  </li>

			  <li>
				<!-- inner menu: contains the actual data -->
				<ul class="menu sm-scrol">
				  <li>
					<a href="#">
					  <i class="fa fa-users text-info"></i> Curabitur id eros quis nunc suscipit blandit.
					</a>
				  </li>
				  <li>
					<a href="#">
					  <i class="fa fa-warning text-warning"></i> Duis malesuada justo eu sapien elementum, in semper diam posuere.
					</a>
				  </li>
				  <li>
					<a href="#">
					  <i class="fa fa-users text-danger"></i> Donec at nisi sit amet tortor commodo porttitor pretium a erat.
					</a>
				  </li>
				  <li>
					<a href="#">
					  <i class="fa fa-shopping-cart text-success"></i> In gravida mauris et nisi
					</a>
				  </li>
				  <li>
					<a href="#">
					  <i class="fa fa-user text-danger"></i> Praesent eu lacus in libero dictum fermentum.
					</a>
				  </li>
				  <li>
					<a href="#">
					  <i class="fa fa-user text-primary"></i> Nunc fringilla lorem 
					</a>
				  </li>
				  <li>
					<a href="#">
					  <i class="fa fa-user text-success"></i> Nullam euismod dolor ut quam interdum, at scelerisque ipsum imperdiet.
					</a>
				  </li>
				</ul>
			  </li>
			  <li class="footer">
				  <a href="#">View all</a>
			  </li>
			</ul>
		  </li>	
		  
	      <!-- User Account-->
          <li class="dropdown user user-menu">
            <a href="#" class="waves-effect waves-light dropdown-toggle" data-toggle="dropdown" title="User">
				<i class="ti-user"></i>
            </a>
            <ul class="dropdown-menu animated flipInX">
              <li class="user-body">
				 <a class="dropdown-item" href="#"><i class="ti-user text-muted mr-2"></i> Profile</a>
				 <a class="dropdown-item" href="#"><i class="ti-wallet text-muted mr-2"></i> My Wallet</a>
				 <a class="dropdown-item" href="#"><i class="ti-settings text-muted mr-2"></i> Settings</a>
				 <div class="dropdown-divider"></div>
				 <a class="dropdown-item" href="#"><i class="ti-lock text-muted mr-2"></i> Logout</a>
              </li>
            </ul>
          </li>	
		  
          <!-- Control Sidebar Toggle Button -->
          <li>
              <a href="#" data-toggle="control-sidebar" title="Setting" class="waves-effect waves-light">
			  	<i class="ti-settings"></i>
			  </a>
          </li>
			
        </ul>
      </div>
    </nav>
  </header>
  
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar-->
    <section class="sidebar">	
	    <div class="user-profile px-10 py-15">
			<div class="d-flex align-items-center">			
				<div class="image">
				  <img src="../images/avatar/1.jpg" class="avatar avatar-lg" alt="User Image">
				</div>
				<div class="info ml-10">
					<p class="mb-0">Welcome</p>
					<h5 class="mb-0">Joan Wilkins</h5>
				</div>
			</div>
        </div>	
		
      <!-- sidebar menu-->
      <ul class="sidebar-menu" data-widget="tree">
		<li class="treeview">
          <a href="#">
            <i class="ti-dashboard"></i>
			<span>Dashboard</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="index.html"><i class="ti-more"></i>Dashboard 1</a></li>
            <li><a href="index2.html"><i class="ti-more"></i>Dashboard 2</a></li>
            <li><a href="index3.html"><i class="ti-more"></i>Dashboard 3</a></li>
          </ul>
        </li>	
		<li>
          <a href="mailbox.html">
            <i class="ti-email"></i>
			<span>Mailbox</span>
          </a>
        </li>
		<li class="treeview">
          <a href="#">
            <i class="ti-layout-grid2"></i>
			<span>Apps</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="extra_calendar.html"><i class="ti-more"></i>Calendar</a></li>
            <li><a href="contact_app.html"><i class="ti-more"></i>Contact List</a></li>
            <li><a href="contact_app_chat.html"><i class="ti-more"></i>Chat</a></li>
            <li><a href="extra_taskboard.html"><i class="ti-more"></i>Todo</a></li>
          </ul>
        </li>
		<li class="header">Login &amp; Error</li>
		<li class="treeview">
          <a href="#">
            <i class="ti-alert"></i>
			<span>Authentication</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="auth_login.html"><i class="ti-more"></i>Login</a></li>
			<li><a href="auth_register.html"><i class="ti-more"></i>Register</a></li>
			<li><a href="auth_lockscreen.html"><i class="ti-more"></i>Lockscreen</a></li>
			<li><a href="auth_user_pass.html"><i class="ti-more"></i>Recover password</a></li>	
          </ul>
        </li>
		<li class="treeview">
          <a href="#">
            <i class="ti-unlock"></i>
			<span>Miscellaneous</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
			<li><a href="error_404.html"><i class="ti-more"></i>Error 404</a></li>
			<li><a href="error_500.html"><i class="ti-more"></i>Error 500</a></li>
			<li><a href="error_maintenance.html"><i class="ti-more"></i>Maintenance</a></li>	
          </ul>
        </li>  
		<li class="header">Components </li>
		<li class="treeview">
          <a href="#">
            <i class="ti-pencil-alt"></i>
            <span>Utilities</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">			
            <li><a href="ui_grid.html"><i class="ti-more"></i>Grid System</a></li>								
            <li class="treeview">
				<a href="#">
					<i class="ti-more"></i>Card
					<span class="pull-right-container">
              			<i class="fa fa-angle-right pull-right"></i>
            		</span>
				</a>
				<ul class="treeview-menu">
					<li><a href="box_cards.html"><i class="ti-more"></i>User Card</a></li>
					<li><a href="box_advanced.html"><i class="ti-more"></i>Advanced Card</a></li>
					<li><a href="box_basic.html"><i class="ti-more"></i>Basic Card</a></li>
					<li><a href="box_color.html"><i class="ti-more"></i>Card Color</a></li>
					<li><a href="box_group.html"><i class="ti-more"></i>Card Group</a></li>
				</ul>
			</li>
            <li><a href="ui_badges.html"><i class="ti-more"></i>Badges</a></li>
            <li><a href="ui_border_utilities.html"><i class="ti-more"></i>Border</a></li>
            <li><a href="ui_buttons.html"><i class="ti-more"></i>Buttons</a></li>	
            <li><a href="ui_color_utilities.html"><i class="ti-more"></i>Color</a></li>
            <li><a href="ui_dropdown.html"><i class="ti-more"></i>Dropdown</a></li>
            <li><a href="ui_dropdown_grid.html"><i class="ti-more"></i>Dropdown Grid</a></li>
            <li><a href="ui_progress_bars.html"><i class="ti-more"></i>Progress Bars</a></li>					
            <li class="treeview">
				<a href="#">
					<i class="ti-more"></i>Icons
					<span class="pull-right-container">
              			<i class="fa fa-angle-right pull-right"></i>
            		</span>
				</a>
				<ul class="treeview-menu">
					<li><a href="icons_fontawesome.html"><i class="ti-more"></i>Font Awesome</a></li>
					<li><a href="icons_glyphicons.html"><i class="ti-more"></i>Glyphicons</a></li>
					<li><a href="icons_material.html"><i class="ti-more"></i>Material Icons</a></li>	
					<li><a href="icons_themify.html"><i class="ti-more"></i>Themify Icons</a></li>
					<li><a href="icons_simpleline.html"><i class="ti-more"></i>Simple Line Icons</a></li>
					<li><a href="icons_cryptocoins.html"><i class="ti-more"></i>Cryptocoins Icons</a></li>
					<li><a href="icons_flag.html"><i class="ti-more"></i>Flag Icons</a></li>
					<li><a href="icons_weather.html"><i class="ti-more"></i>Weather Icons</a></li>
				</ul>
			</li>
            <li><a href="ui_ribbons.html"><i class="ti-more"></i>Ribbons</a></li>
            <li><a href="ui_sliders.html"><i class="ti-more"></i>Sliders</a></li>
            <li><a href="ui_typography.html"><i class="ti-more"></i>Typography</a></li>
            <li><a href="ui_tab.html"><i class="ti-more"></i>Tabs</a></li>
            <li><a href="ui_timeline.html"><i class="ti-more"></i>Timeline</a></li>
            <li><a href="ui_timeline_horizontal.html"><i class="ti-more"></i>Horizontal Timeline</a></li>
          </ul>
        </li>
		<li class="treeview">
          <a href="#">
            <i class="ti-cup"></i>
            <span>Components</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">			
            <li><a href="component_bootstrap_switch.html"><i class="ti-more"></i>Bootstrap Switch</a></li>
            <li><a href="component_date_paginator.html"><i class="ti-more"></i>Date Paginator</a></li>
            <li><a href="component_media_advanced.html"><i class="ti-more"></i>Advanced Medias</a></li>
            <li><a href="component_rangeslider.html"><i class="ti-more"></i>Range Slider</a></li>
            <li><a href="component_rating.html"><i class="ti-more"></i>Ratings</a></li>
            <li><a href="component_animations.html"><i class="ti-more"></i>Animations</a></li>
            <li><a href="extension_fullscreen.html"><i class="ti-more"></i>Fullscreen</a></li>
            <li><a href="extension_pace.html"><i class="ti-more"></i>Pace</a></li>
            <li><a href="component_nestable.html"><i class="ti-more"></i>Nestable</a></li>
            <li><a href="component_portlet_draggable.html"><i class="ti-more"></i>Draggable Portlets</a></li>	
          </ul>
        </li>			
		<li class="treeview">
          <a href="#">
            <i class="ti-file"></i>
            <span>Forms</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="forms_advanced.html"><i class="ti-more"></i>Form Elements</a></li>
            <li><a href="forms_general.html"><i class="ti-more"></i>Form Layout</a></li>
            <li><a href="forms_wizard.html"><i class="ti-more"></i>Form Wizard</a></li>	
            <li><a href="forms_validation.html"><i class="ti-more"></i>Form Validation</a></li>
            <li><a href="forms_mask.html"><i class="ti-more"></i>Formatter</a></li>
            <li><a href="forms_xeditable.html"><i class="ti-more"></i>Xeditable Editor</a></li>
            <li><a href="forms_dropzone.html"><i class="ti-more"></i>Dropzone</a></li>
            <li><a href="forms_code_editor.html"><i class="ti-more"></i>Code Editor</a></li>
            <li><a href="forms_editors.html"><i class="ti-more"></i>Editor</a></li>
            <li><a href="forms_editor_markdown.html"><i class="ti-more"></i>Markdown</a></li>
          </ul>
        </li>
		<li class="treeview">
          <a href="#">
            <i class="ti-layout-grid3"></i>
			<span>Tables</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="tables_simple.html"><i class="ti-more"></i>Simple tables</a></li>
            <li><a href="tables_data.html"><i class="ti-more"></i>Data tables</a></li>
            <li><a href="tables_editable.html"><i class="ti-more"></i>Editable Tables</a></li>
            <li><a href="tables_color.html"><i class="ti-more"></i>Table Color</a></li>
          </ul>
        </li>
		<li class="treeview">
          <a href="#">
            <i class="ti-pie-chart"></i>
			<span>Charts</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="charts_chartjs.html"><i class="ti-more"></i>ChartJS</a></li>
            <li><a href="charts_flot.html"><i class="ti-more"></i>Flot</a></li>
            <li><a href="charts_inline.html"><i class="ti-more"></i>Inline charts</a></li>
            <li><a href="charts_morris.html"><i class="ti-more"></i>Morris</a></li>
            <li><a href="charts_peity.html"><i class="ti-more"></i>Peity</a></li>
            <li><a href="charts_chartist.html"><i class="ti-more"></i>Chartist</a></li>
            <li><a href="charts_c3_axis.html"><i class="ti-more"></i>Axis Chart</a></li>
            <li><a href="charts_c3_bar.html"><i class="ti-more"></i>Bar Chart</a></li>
            <li><a href="charts_c3_data.html"><i class="ti-more"></i>Data Chart</a></li>
            <li><a href="charts_c3_line.html"><i class="ti-more"></i>Line Chart</a></li>
            <li><a href="charts_echarts_basic.html"><i class="ti-more"></i>Basic Charts</a></li>
            <li><a href="charts_echarts_bar.html"><i class="ti-more"></i>Bar Chart</a></li>
            <li><a href="charts_echarts_pie_doughnut.html"><i class="ti-more"></i>Pie & Doughnut Chart</a></li>
          </ul>
        </li>
		<li class="treeview">
          <a href="#">
            <i class="ti-map"></i>
			<span>Maps</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="map_google.html"><i class="ti-more"></i>Google Map</a></li>
            <li><a href="map_vector.html"><i class="ti-more"></i>Vector Map</a></li>
          </ul>
        </li>	 
		<li class="header">User Pages</li>		
		<li class="treeview">
          <a href="#">
            <i class="ti-files"></i>
			<span>Usefull Page</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
			<li><a href="invoice.html"><i class="ti-more"></i>Invoice</a></li>
			<li><a href="invoicelist.html"><i class="ti-more"></i>Invoice List</a></li>	
			<li><a href="extra_app_ticket.html"><i class="ti-more"></i>Support Ticket</a></li>
			<li><a href="extra_profile.html"><i class="ti-more"></i>User Profile</a></li>
            <li><a href="contact_userlist_grid.html"><i class="ti-more"></i>Userlist Grid</a></li>
			<li><a href="contact_userlist.html"><i class="ti-more"></i>Userlist</a></li>	
			<li><a href="sample_faq.html"><i class="ti-more"></i>FAQs</a></li>
          </ul>
        </li>		  
		<li class="treeview">
          <a href="#">
            <i class="ti-briefcase"></i>
			<span>Extra Pages</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="sample_blank.html"><i class="ti-more"></i>Blank</a></li>
            <li><a href="sample_coming_soon.html"><i class="ti-more"></i>Coming Soon</a></li>
            <li><a href="sample_custom_scroll.html"><i class="ti-more"></i>Custom Scrolls</a></li>
			<li><a href="sample_gallery.html"><i class="ti-more"></i>Gallery</a></li>
			<li><a href="sample_lightbox.html"><i class="ti-more"></i>Lightbox Popup</a></li>
			<li><a href="sample_pricing.html"><i class="ti-more"></i>Pricing</a></li>
          </ul>
        </li> 
		<li class="header">Collections </li>
		<li class="treeview">
          <a href="#">
            <i class="ti-widget-alt"></i>
            <span>Widgets</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="widgets_blog.html"><i class="ti-more"></i>Blog</a></li>
            <li><a href="widgets_chart.html"><i class="ti-more"></i>Chart</a></li>
            <li><a href="widgets_list.html"><i class="ti-more"></i>List</a></li>
            <li><a href="widgets_social.html"><i class="ti-more"></i>Social</a></li>
            <li><a href="widgets_statistic.html"><i class="ti-more"></i>Statistic</a></li>
            <li><a href="widgets_weather.html"><i class="ti-more"></i>Weather</a></li>
            <li><a href="widgets.html"><i class="ti-more"></i>Widgets</a></li>
          </ul>
        </li> 
		<li class="treeview">
          <a href="#">
            <i class="ti-layout-cta-center"></i>
            <span>Modals</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
			<li><a href="component_modals.html"><i class="ti-more"></i>Modals</a></li>
            <li><a href="component_sweatalert.html"><i class="ti-more"></i>Sweet Alert</a></li>
            <li><a href="component_notification.html"><i class="ti-more"></i>Toastr</a></li>
          </ul>
        </li> 
		<li class="treeview">
          <a href="#">
            <i class="ti-shopping-cart-full"></i>
			<span>Ecommerce Pages</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="ecommerce_products.html"><i class="ti-more"></i>Products</a></li>
            <li><a href="ecommerce_cart.html"><i class="ti-more"></i>Products Cart</a></li>
            <li><a href="ecommerce_products_edit.html"><i class="ti-more"></i>Products Edit</a></li>
            <li><a href="ecommerce_details.html"><i class="ti-more"></i>Product Details</a></li>
            <li><a href="ecommerce_orders.html"><i class="ti-more"></i>Product Orders</a></li>
            <li><a href="ecommerce_checkout.html"><i class="ti-more"></i>Products Checkout</a></li>
          </ul>
        </li>
		<li>
          <a href="email_index.html">
            <i class="ti-envelope"></i>
			<span>Emails</span>
          </a>
        </li>      
      </ul>
    </section>
	<div class="sidebar-footer">
		<!-- item-->
		<a href="javascript:void(0)" class="link" data-toggle="tooltip" title="" data-original-title="Settings" aria-describedby="tooltip92529"><i class="ti-settings"></i></a>
		<!-- item-->
		<a href="mailbox_inbox.html" class="link" data-toggle="tooltip" title="" data-original-title="Email"><i class="ti-email"></i></a>
		<!-- item-->
		<a href="javascript:void(0)" class="link" data-toggle="tooltip" title="" data-original-title="Logout"><i class="ti-lock"></i></a>
	</div>
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
	  <div class="container-full">
		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-xl-3 col-md-6 col-12">
					<div class="box">
						<ul class="box-controls pull-right">
						  <li class="dropdown">
							<a data-toggle="dropdown" href="#" class="px-10 pt-5"><i class="ti-more-alt"></i></a>
							<div class="dropdown-menu dropdown-menu-right">
							  <a class="dropdown-item" href="#"><i class="ti-import"></i> Import</a>
							  <a class="dropdown-item" href="#"><i class="ti-export"></i> Export</a>
							  <a class="dropdown-item" href="#"><i class="ti-printer"></i> Print</a>
							  <div class="dropdown-divider"></div>
							  <a class="dropdown-item" href="#"><i class="ti-settings"></i> Settings</a>
							</div>
						  </li>
						</ul>
						<div class="box-body pt-0">
							<div class="d-flex align-items-center justify-content-between">
								<div class="icon bg-primary-light rounded-circle">
									<i class="text-primary mr-0 font-size-20 fa fa-heartbeat"></i>
								</div>
								<div>
									<h3 class="text-dark mb-0 font-weight-500">4,235</h3>
									<p class="text-mute mb-0">Total Patients</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6 col-12">
					<div class="box">
						<ul class="box-controls pull-right">
						  <li class="dropdown">
							<a data-toggle="dropdown" href="#" class="px-10 pt-5"><i class="ti-more-alt"></i></a>
							<div class="dropdown-menu dropdown-menu-right">
							  <a class="dropdown-item" href="#"><i class="ti-import"></i> Import</a>
							  <a class="dropdown-item" href="#"><i class="ti-export"></i> Export</a>
							  <a class="dropdown-item" href="#"><i class="ti-printer"></i> Print</a>
							  <div class="dropdown-divider"></div>
							  <a class="dropdown-item" href="#"><i class="ti-settings"></i> Settings</a>
							</div>
						  </li>
						</ul>
						<div class="box-body pt-0">
							<div class="d-flex align-items-center justify-content-between">
								<div class="icon bg-info-light rounded-circle">
									<i class="text-info mr-0 font-size-20 fa fa-user-md"></i>
								</div>
								<div>
									<h3 class="text-dark mb-0 font-weight-500">394</h3>
									<p class="text-mute mb-0">Available Staff</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6 col-12">
					<div class="box">
						<ul class="box-controls pull-right">
						  <li class="dropdown">
							<a data-toggle="dropdown" href="#" class="px-10 pt-5"><i class="ti-more-alt"></i></a>
							<div class="dropdown-menu dropdown-menu-right">
							  <a class="dropdown-item" href="#"><i class="ti-import"></i> Import</a>
							  <a class="dropdown-item" href="#"><i class="ti-export"></i> Export</a>
							  <a class="dropdown-item" href="#"><i class="ti-printer"></i> Print</a>
							  <div class="dropdown-divider"></div>
							  <a class="dropdown-item" href="#"><i class="ti-settings"></i> Settings</a>
							</div>
						  </li>
						</ul>
						<div class="box-body pt-0">
							<div class="d-flex align-items-center justify-content-between">
								<div class="icon bg-warning-light rounded-circle">
									<i class="text-warning mr-0 font-size-20 fa fa-money"></i>
								</div>
								<div>
									<h3 class="text-dark mb-0 font-weight-500">$2,526</h3>
									<p class="text-mute mb-0">Avg Treat. Costs</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6 col-12">
					<div class="box">
						<ul class="box-controls pull-right">
						  <li class="dropdown">
							<a data-toggle="dropdown" href="#" class="px-10 pt-5"><i class="ti-more-alt"></i></a>
							<div class="dropdown-menu dropdown-menu-right">
							  <a class="dropdown-item" href="#"><i class="ti-import"></i> Import</a>
							  <a class="dropdown-item" href="#"><i class="ti-export"></i> Export</a>
							  <a class="dropdown-item" href="#"><i class="ti-printer"></i> Print</a>
							  <div class="dropdown-divider"></div>
							  <a class="dropdown-item" href="#"><i class="ti-settings"></i> Settings</a>
							</div>
						  </li>
						</ul>
						<div class="box-body pt-0">
							<div class="d-flex align-items-center justify-content-between">
								<div class="icon bg-danger-light rounded-circle">
									<i class="text-danger mr-0 font-size-20 fa fa-ambulance"></i>
								</div>
								<div>
									<h3 class="text-dark mb-0 font-weight-500">35</h3>
									<p class="text-mute mb-0">Available Cars</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-7 col-12">
					<div class="box">
						<div class="box-header">
							<h4 class="box-title">Out Patients vs. In Patients Trend</h4>
							<ul class="box-controls pull-right d-md-flex d-none">
							  <li class="dropdown">
								<button class="btn btn-rounded btn-outline btn-primary dropdown-toggle px-10 " data-toggle="dropdown" href="#">Show By Months</button>
								<div class="dropdown-menu dropdown-menu-right">
								  <a class="dropdown-item" href="#"><i class="ti-import"></i> Import</a>
								  <a class="dropdown-item" href="#"><i class="ti-export"></i> Export</a>
								  <a class="dropdown-item" href="#"><i class="ti-printer"></i> Print</a>
								  <div class="dropdown-divider"></div>
								  <a class="dropdown-item" href="#"><i class="ti-settings"></i> Settings</a>
								</div>
							  </li>
							</ul>
						</div>
						<div class="box-body">
							<div class="row">
								<div class="col-lg-8 col-12">
									<div id="patients-trend"></div>
								</div>
								<div class="col-lg-4 col-12">
									<div id="progressbar1" class="mx-auto w-200 my-25 position-relative text-center"></div>
									<h4 class="text-center">Hospital Bed Availability</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-5 col-12">
					<div class="box">
						<div class="box-header">
							<h4 class="box-title">Patients by Gender</h4>
						</div>
						<div class="box-body">
							<div class="row">
								<div class="col-lg-6 col-12">
									<div id="progressbar2" class="mx-auto w-200 my-25 position-relative text-center"></div>
									<h4 class="text-center">Male</h4>
								</div>
								<div class="col-lg-6 col-12">
									<div id="progressbar3" class="mx-auto w-200 my-25 position-relative text-center"></div>
									<h4 class="text-center">Female</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-6 col-12">
					<div class="box">
						<div class="box-header">
							<h4 class="box-title">Time Admitted</h4>
						</div>
						<div class="box-body">
							<div id="admitted-trend"></div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-12">
					<div class="box">
						<div class="box-header">
							<h4 class="box-title">Patients By Division</h4>
						</div>
						<div class="box-body">
							<div class="d-flex align-items-center justify-content-between pb-10 pr-20">
								<h5 class="my-0 text-light"><i class="fa fa-home mr-50 w-20"></i>Division</h5>
								<p class="mb-0 text-light">PT.</p>
							</div>
							<div class="pat-div">								
								<div class="d-flex align-items-center justify-content-between my-15 pr-20">
									<h5 class="my-0"><i class="mr-50 w-20 fa fa-heart"></i>Cardiology</h5>
									<p class="mb-0">74</p>
								</div>								
								<div class="d-flex align-items-center justify-content-between my-15 pr-20">
									<h5 class="my-0"><i class="mr-50 w-20 fa fa-user"></i>Neurology</h5>
									<p class="mb-0">32</p>
								</div>								
								<div class="d-flex align-items-center justify-content-between my-15 pr-20">
									<h5 class="my-0"><i class="mr-50 w-20 fa fa-user-md"></i>Surgery</h5>
									<p class="mb-0">15</p>
								</div>							
								<div class="d-flex align-items-center justify-content-between my-15 pr-20">
									<h5 class="my-0"><i class="mr-50 w-20 fa fa-medkit"></i>Covid</h5>
									<p class="mb-0">35</p>
								</div>							
								<div class="d-flex align-items-center justify-content-between my-15 pr-20">
									<h5 class="my-0"><i class="mr-50 w-20 fa fa-stethoscope"></i>General</h5>
									<p class="mb-0">158</p>
								</div>							
								<div class="d-flex align-items-center justify-content-between my-15 pr-20">
									<h5 class="my-0"><i class="mr-50 w-20 fa fa-plus-square"></i>Oncology</h5>
									<p class="mb-0">85</p>
								</div>							
								<div class="d-flex align-items-center justify-content-between my-15 pr-20">
									<h5 class="my-0"><i class="mr-50 w-20 fa fa-wheelchair-alt"></i>Emergency</h5>
									<p class="mb-0">45</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-12">
					<div class="box overflow-hidden bg-primary">
						<div class="box-body p-0">
							<div class="px-30 pt-20">
								<h4 class="text-white mb-0">34,042 </h4>
								<p class="text-white-50">Patients this month</p>
							</div>
							<div id="statisticschart3"></div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- /.content -->
	  </div>
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right d-none d-sm-inline-block">
        <ul class="nav nav-primary nav-dotted nav-dot-separated justify-content-center justify-content-md-end">
		  <li class="nav-item">
			<a class="nav-link" href="javascript:void(0)">FAQ</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" href="#">Purchase Now</a>
		  </li>
		</ul>
    </div>
	  &copy; 2020 <a href="https://www.multipurposethemes.com/">Multipurpose Themes</a>. All Rights Reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar">
	  
	<div class="rpanel-title"><span class="pull-right btn btn-circle btn-danger"><i class="ion ion-close text-white" data-toggle="control-sidebar"></i></span> </div>  <!-- Create the tabs -->
    <ul class="nav nav-tabs control-sidebar-tabs">
      <li class="nav-item"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="mdi mdi-message-text"></i></a></li>
      <li class="nav-item"><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="mdi mdi-playlist-check"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane" id="control-sidebar-home-tab">
          <div class="flexbox">
			<a href="javascript:void(0)" class="text-grey">
				<i class="ti-more"></i>
			</a>	
			<p>Users</p>
			<a href="javascript:void(0)" class="text-right text-grey"><i class="ti-plus"></i></a>
		  </div>
		  <div class="lookup lookup-sm lookup-right d-none d-lg-block">
			<input type="text" name="s" placeholder="Search" class="w-p100">
		  </div>
          <div class="media-list media-list-hover mt-20">
			<div class="media py-10 px-0">
			  <a class="avatar avatar-lg status-success" href="#">
				<img src="../images/avatar/1.jpg" alt="...">
			  </a>
			  <div class="media-body">
				<p class="font-size-16">
				  <a class="hover-primary" href="#"><strong>Tyler</strong></a>
				</p>
				<p>Praesent tristique diam...</p>
				  <span>Just now</span>
			  </div>
			</div>

			<div class="media py-10 px-0">
			  <a class="avatar avatar-lg status-danger" href="#">
				<img src="../images/avatar/2.jpg" alt="...">
			  </a>
			  <div class="media-body">
				<p class="font-size-16">
				  <a class="hover-primary" href="#"><strong>Luke</strong></a>
				</p>
				<p>Cras tempor diam ...</p>
				  <span>33 min ago</span>
			  </div>
			</div>

			<div class="media py-10 px-0">
			  <a class="avatar avatar-lg status-warning" href="#">
				<img src="../images/avatar/3.jpg" alt="...">
			  </a>
			  <div class="media-body">
				<p class="font-size-16">
				  <a class="hover-primary" href="#"><strong>Evan</strong></a>
				</p>
				<p>In posuere tortor vel...</p>
				  <span>42 min ago</span>
			  </div>
			</div>

			<div class="media py-10 px-0">
			  <a class="avatar avatar-lg status-primary" href="#">
				<img src="../images/avatar/4.jpg" alt="...">
			  </a>
			  <div class="media-body">
				<p class="font-size-16">
				  <a class="hover-primary" href="#"><strong>Evan</strong></a>
				</p>
				<p>In posuere tortor vel...</p>
				  <span>42 min ago</span>
			  </div>
			</div>			
			
			<div class="media py-10 px-0">
			  <a class="avatar avatar-lg status-success" href="#">
				<img src="../images/avatar/1.jpg" alt="...">
			  </a>
			  <div class="media-body">
				<p class="font-size-16">
				  <a class="hover-primary" href="#"><strong>Tyler</strong></a>
				</p>
				<p>Praesent tristique diam...</p>
				  <span>Just now</span>
			  </div>
			</div>

			<div class="media py-10 px-0">
			  <a class="avatar avatar-lg status-danger" href="#">
				<img src="../images/avatar/2.jpg" alt="...">
			  </a>
			  <div class="media-body">
				<p class="font-size-16">
				  <a class="hover-primary" href="#"><strong>Luke</strong></a>
				</p>
				<p>Cras tempor diam ...</p>
				  <span>33 min ago</span>
			  </div>
			</div>

			<div class="media py-10 px-0">
			  <a class="avatar avatar-lg status-warning" href="#">
				<img src="../images/avatar/3.jpg" alt="...">
			  </a>
			  <div class="media-body">
				<p class="font-size-16">
				  <a class="hover-primary" href="#"><strong>Evan</strong></a>
				</p>
				<p>In posuere tortor vel...</p>
				  <span>42 min ago</span>
			  </div>
			</div>

			<div class="media py-10 px-0">
			  <a class="avatar avatar-lg status-primary" href="#">
				<img src="../images/avatar/4.jpg" alt="...">
			  </a>
			  <div class="media-body">
				<p class="font-size-16">
				  <a class="hover-primary" href="#"><strong>Evan</strong></a>
				</p>
				<p>In posuere tortor vel...</p>
				  <span>42 min ago</span>
			  </div>
			</div>
			  
		  </div>

      </div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
          <div class="flexbox">
			<a href="javascript:void(0)" class="text-grey">
				<i class="ti-more"></i>
			</a>	
			<p>Todo List</p>
			<a href="javascript:void(0)" class="text-right text-grey"><i class="ti-plus"></i></a>
		  </div>
        <ul class="todo-list mt-20">
			<li class="py-15 px-5 by-1">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_1" class="filled-in">
			  <label for="basic_checkbox_1" class="mb-0 h-15"></label>
			  <!-- todo text -->
			  <span class="text-line">Nulla vitae purus</span>
			  <!-- Emphasis label -->
			  <small class="badge bg-danger"><i class="fa fa-clock-o"></i> 2 mins</small>
			  <!-- General tools such as edit or delete-->
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
			<li class="py-15 px-5">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_2" class="filled-in">
			  <label for="basic_checkbox_2" class="mb-0 h-15"></label>
			  <span class="text-line">Phasellus interdum</span>
			  <small class="badge bg-info"><i class="fa fa-clock-o"></i> 4 hours</small>
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
			<li class="py-15 px-5 by-1">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_3" class="filled-in">
			  <label for="basic_checkbox_3" class="mb-0 h-15"></label>
			  <span class="text-line">Quisque sodales</span>
			  <small class="badge bg-warning"><i class="fa fa-clock-o"></i> 1 day</small>
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
			<li class="py-15 px-5">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_4" class="filled-in">
			  <label for="basic_checkbox_4" class="mb-0 h-15"></label>
			  <span class="text-line">Proin nec mi porta</span>
			  <small class="badge bg-success"><i class="fa fa-clock-o"></i> 3 days</small>
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
			<li class="py-15 px-5 by-1">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_5" class="filled-in">
			  <label for="basic_checkbox_5" class="mb-0 h-15"></label>
			  <span class="text-line">Maecenas scelerisque</span>
			  <small class="badge bg-primary"><i class="fa fa-clock-o"></i> 1 week</small>
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
			<li class="py-15 px-5">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_6" class="filled-in">
			  <label for="basic_checkbox_6" class="mb-0 h-15"></label>
			  <span class="text-line">Vivamus nec orci</span>
			  <small class="badge bg-info"><i class="fa fa-clock-o"></i> 1 month</small>
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
			<li class="py-15 px-5 by-1">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_7" class="filled-in">
			  <label for="basic_checkbox_7" class="mb-0 h-15"></label>
			  <!-- todo text -->
			  <span class="text-line">Nulla vitae purus</span>
			  <!-- Emphasis label -->
			  <small class="badge bg-danger"><i class="fa fa-clock-o"></i> 2 mins</small>
			  <!-- General tools such as edit or delete-->
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
			<li class="py-15 px-5">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_8" class="filled-in">
			  <label for="basic_checkbox_8" class="mb-0 h-15"></label>
			  <span class="text-line">Phasellus interdum</span>
			  <small class="badge bg-info"><i class="fa fa-clock-o"></i> 4 hours</small>
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
			<li class="py-15 px-5 by-1">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_9" class="filled-in">
			  <label for="basic_checkbox_9" class="mb-0 h-15"></label>
			  <span class="text-line">Quisque sodales</span>
			  <small class="badge bg-warning"><i class="fa fa-clock-o"></i> 1 day</small>
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
			<li class="py-15 px-5">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_10" class="filled-in">
			  <label for="basic_checkbox_10" class="mb-0 h-15"></label>
			  <span class="text-line">Proin nec mi porta</span>
			  <small class="badge bg-success"><i class="fa fa-clock-o"></i> 3 days</small>
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
		  </ul>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  
  <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
  
</div>
<!-- ./wrapper -->	 
	
	<!-- Vendor JS -->
        <script src="<c:url value="././js/vendors.min.js"/>"></script>
        <script src="<c:url value="./assets/icons/feather-icons/feather.min.js"/>"></script>	
    

        <script src="<c:url value="./WEB-INF/assets/vendor_components/apexcharts-bundle/dist/apexcharts.js"/>"></script>
        <script src="<c:url value="./WEB-INF/assets/vendor_components/progressbar.js-master/dist/progressbar.js"/>"></script>
	
	<!-- Florence Admin App -->
        <script src="<c:url value="././js/template.js"/>"></script>
        <script src="<c:url value="././js/pages/dashboard.js"/>"></script>
        <script src="<c:url value="././js/demo.js"/>"></script>
	
	
</body>

<!-- Mirrored from florence-admin-template.multipurposethemes.com/bs4/main/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 03 Jun 2022 12:50:31 GMT -->
</html>

