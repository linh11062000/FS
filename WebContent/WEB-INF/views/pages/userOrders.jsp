<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
  <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>DND Flower Shop</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value='/resources/assets/images/icon.ico' />">

    <!-- CSS
	============================================ -->
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/css/vendor/bootstrap.min.css' />">
    
    <!-- Test -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/images/icon.ico' />">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/css/vendor/font.awesome.min.css' />">
    <!-- Linear Icons CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/css/vendor/linearicons.min.css' />">
    <!-- Swiper CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/css/plugins/swiper-bundle.min.css' />">
    
    <!-- Animation CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/css/plugins/animate.min.css' />">
    <!-- Jquery ui CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/css/plugins/jquery-ui.min.css' />">
    <!-- Nice Select CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/css/plugins/nice-select.min.css' />">
    <!-- Magnific Popup -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/css/plugins/magnific-popup.css' />">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/css/style.css' />">
    
	<base href="${pageContext.servletContext.contextPath }" />
</head>

<body>
	<%@include file="/WEB-INF/views/include/header.jsp"%>
   
    
    <!-- Breadcrumb Area Start Here -->
    <div class="breadcrumbs-area position-relative">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <div class="breadcrumb-content position-relative section-content">
                        <h3 class="title-3">Shopping Cart</h3>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/home/index.htm">Home</a></li>
                            <li>Shopping Detail</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Area End Here -->
    <!-- cart main wrapper start -->
    <div class="cart-main-wrapper mt-no-text">
        <div class="container custom-area">
           <div class="row">
                <div class="col-12 col-custom">
                    <div class="coupon-accordion">
                        <h3>Notice: Delete All In Cart -> Delete Order</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-custom">
                    <!-- Cart Table Area -->
                    <div class="cart-table table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th class="pro-thumbnail">Image</th>
                                    <th class="pro-title">Product</th>
                                    <th class="pro-price">Price</th>
                                    <th class="pro-quantity">Quantity</th>
                                    <th class="pro-subtotal">Total</th>
                                    <th class="pro-remove">Status</th>
                                    <th class="pro-remove">Approved/Remove</th>
                                </tr>
                            </thead>
                            <tbody>
                             <c:forEach var="order" items="${orders}">
                                <tr>
                                    <td class="pro-thumbnail"><a href="#"><img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/flower/${order.flower.image}" alt="Product" /></a></td>
                                    <td class="pro-title"><a href="#">${order.flower.name}</a></td>
                                    <td class="pro-price"><span><fmt:formatNumber pattern="###,### VND"  value="${order.amount}" type="currency" /></span></td>
                                    <td class="pro-quantity">
                                        <div class="quantity">
                                           <span>${order.quantity}</span>
                                        </div>
                                    </td>
                                    <td class="pro-subtotal"><span><fmt:formatNumber pattern="###,### VND"  value="${order.amount*order.quantity}" type="currency" /></span></td>
                                    <c:if test="${order.status==true}">
                                    	<td>Approved</td>
                                    	<td class="pro-remove"><a href=""><i class="lnr lnr-cloud-check"></i></a></td>
                                    </c:if>
                                    <c:if test="${order.status==false}">
                                    	<td>Pending</td>
	                                    <td class="pro-remove">
	                                    	<a href="${pageContext.request.contextPath}/pages/my_account/userOrders/update/${order.id}.htm"><i class="lnr lnr-sync"></i></a>
	                                    	<span style="font-size: large;"> / </span>
	                                    	<a href="${pageContext.request.contextPath}/pages/my_account/userOrders/delete/${order.id}.htm"><i class="lnr lnr-trash"></i></a>
	                                    </td>
                                    </c:if>
                                </tr>
                              </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- Cart Update Option -->
                    <div class="cart-update-option d-block d-md-flex justify-content-between">
                        <div class="apply-coupon-wrapper">
                                <a href="${pageContext.request.contextPath}/pages/my_account.htm" class="btn flosun-button primary-btn rounded-0 black-btn">Back to Dashboard</a>
                        </div> 
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-5 ml-auto col-custom">
                    <!-- Cart Calculation Area -->
                    <div class="cart-calculator-wrapper">
                        <div class="cart-calculate-items">
                            <h3>Customer Information</h3>
                            <div class="table-responsive">
                                <table class="table">
                                    <tr>
                                        <td>Name</td>
                                        <td><span class="amount">${trans.customerName}</span></td>
                                    </tr>
                                    <tr>
                                        <td>Phone</td>
                                        <td><span class="amount">${trans.customerPhone}</span></td>
                                    </tr>
                                    <tr class="total">
                                        <td>Address</td>
                                        <td><span class="amount">${trans.customerAddress}</span></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- chia ra một cái giữ chi tiết -->
                <div class="col-lg-5 ml-auto col-custom">
                    <!-- Cart Calculation Area -->
                    <div class="cart-calculator-wrapper">
                        <div class="cart-calculate-items">
                            <h3>Orders Totals</h3>
                            <div class="table-responsive">
                                <table class="table">
                                    <tr>
                                        <td>Sub Total</td>
                                        <td><span class="amount"><fmt:formatNumber pattern="###,### VND"  value="${subTotal1}" type="currency" /></span></td>
                                    </tr>
                                    <tr>
                                        <td>Shipping</td>
                                        <td><span class="amount"><fmt:formatNumber pattern="###,### VND"  value="${ship1}" type="currency" /></span></td>
                                    </tr>
                                    <tr class="total">
                                        <td>Total</td>
                                        <td class="total-amount"><span class="amount"><fmt:formatNumber pattern="###,### VND"  value="${trans.amount}" type="currency" /></span></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- cart main wrapper end -->
    <%@include file="/WEB-INF/views/include/footer.jsp"%>
    
    
     <!-- JS
============================================ -->


    <!-- Modernizer JS -->
    <script src="<c:url value='/resources/assets/js/vendor/modernizr-3.7.1.min.js' />"></script>
    <!-- jQuery JS -->
    <script src="<c:url value='/resources/assets/js/vendor/jquery-3.5.1.min.js' />"></script>
    <!-- Bootstrap JS -->
    <script src="<c:url value='/resources/assets/js/vendor/bootstrap.bundle.min.js' />"></script>

    <!-- Swiper Slider JS -->
    <script src="<c:url value='/resources/assets/js/plugins/swiper-bundle.min.js' />"></script>
    <!-- nice select JS -->
    <script src="<c:url value='/resources/assets/js/plugins/nice-select.min.js' />"></script>
    <!-- Ajaxchimpt js -->
    <script src="<c:url value='/resources/assets/js/plugins/jquery.ajaxchimp.min.js' />"></script>
    <!-- Jquery Ui js -->
    <script src="<c:url value='/resources/assets/js/plugins/jquery-ui.min.js' />"></script>
    <!-- Jquery Countdown js -->
    <script src="<c:url value='/resources/assets/js/plugins/jquery.countdown.min.js' />"></script>
    <!-- jquery magnific popup js -->
    <script src="<c:url value='/resources/assets/js/plugins/jquery.magnific-popup.min.js' />"></script>

    <!-- Main JS -->
    <script src="<c:url value='/resources/assets/js/main.js' />"></script>
	<script>
		    // Get all <li>
		  var lis = document.getElementById('navbar_main').querySelectorAll('li a');
		   /*  lis.forEach((item, index) => {
		    	
		    	item.className += " active";
		        console.log({ index, item })
		      }); */
	      var item=lis[1];
	      item.className += " active";
		   
	</script>
    
    
</body>
</html>