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
	<style type="text/css">
		.zoom:hover {
			  -ms-transform: scale(1.1); /* IE 9 */
			  -webkit-transform: scale(1.1); /* Safari 3-8 */
			  transform: scale(1.1); 
			}
	</style>
</head>

<body>
	<%@include file="/WEB-INF/views/include/header.jsp"%>
     <!-- Breadcrumb Area Start Here -->
    <div class="breadcrumbs-area position-relative">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <div class="breadcrumb-content position-relative section-content">
                        <h3 class="title-3">Product Details</h3>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/home/index.htm">Home</a></li>
                            <li>Product Details</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Area End Here -->
    <!-- Single Product Main Area Start -->
    <div class="single-product-main-area">
        <div class="container container-default custom-area">
            <div class="row">
                <div class="col-lg-5 offset-lg-0 col-md-8 offset-md-2 col-custom">
                    <div class="product-details-img">
                        <div class="single-product-img swiper-container gallery-top popup-gallery">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <a class="w-100" href="${pageContext.request.contextPath}/resources/images/flower/${flower.image}">
                                        <img class="w-100" src="${pageContext.request.contextPath}/resources/images/flower/${flower.image}" alt="Product">
                                    </a>
                                </div>
                                <div class="swiper-slide">
                                    <a class="w-100" href="${pageContext.request.contextPath}/resources/images/flower/${flower.image}">
                                        <img class="w-100" src="${pageContext.request.contextPath}/resources/images/flower/${flower.image}" alt="Product">
                                    </a>
                                </div>
                                <div class="swiper-slide">
                                    <a class="w-100" href="${pageContext.request.contextPath}/resources/images/flower/${flower.image}">
                                        <img class="w-100" src="${pageContext.request.contextPath}/resources/images/flower/${flower.image}" alt="Product">
                                    </a>
                                </div>
                                <div class="swiper-slide">
                                    <a class="w-100" href="${pageContext.request.contextPath}/resources/images/flower/${flower.image}">
                                        <img class="w-100" src="${pageContext.request.contextPath}/resources/images/flower/${flower.image}" alt="Product">
                                    </a>
                                </div>
                                <div class="swiper-slide">
                                    <a class="w-100" href="${pageContext.request.contextPath}/resources/images/flower/${flower.image}">
                                        <img class="w-100" src="${pageContext.request.contextPath}/resources/images/flower/${flower.image}" alt="Product">
                                    </a>
                                </div>
                                <div class="swiper-slide">
                                    <a class="w-100" href="${pageContext.request.contextPath}/resources/images/flower/${flower.image}">
                                        <img class="w-100" src="${pageContext.request.contextPath}/resources/images/flower/${flower.image}" alt="Product">
                                    </a>
                                </div>
                            </div>
                        </div>
                        <%-- <div class="single-product-thumb swiper-container gallery-thumbs">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <img src="${pageContext.request.contextPath}/resources/images/flower/2.jpg" alt="Product">
                                </div>
                                <div class="swiper-slide">
                                    <img src="${pageContext.request.contextPath}/resources/images/flower/2.jpg" alt="Product">
                                </div>
                                <div class="swiper-slide">
                                    <img src="${pageContext.request.contextPath}/resources/images/flower/2.jpg" alt="Product">
                                </div>
                                <div class="swiper-slide">
                                    <img src="${pageContext.request.contextPath}/resources/images/flower/2.jpg" alt="Product">
                                </div>
                                <div class="swiper-slide">
                                    <img src="${pageContext.request.contextPath}/resources/images/flower/2.jpg" alt="Product">
                                </div>
                                <div class="swiper-slide">
                                    <img src="${pageContext.request.contextPath}/resources/images/flower/2.jpg" alt="Product">
                                </div>
                            </div>
                            <!-- Add Arrows -->
                            <div class="swiper-button-next swiper-button-white"><i class="lnr lnr-arrow-right"></i></div>
                            <div class="swiper-button-prev swiper-button-white"><i class="lnr lnr-arrow-left"></i></div>
                        </div> --%>
                    </div>
                </div>
                <div class="col-lg-7 col-custom">
                    <div class="product-summery position-relative">
                      <form:form method="GET">
                        <div class="product-head mb-3">
                            <h2 class="product-title">${flower.name}</h2>
                        </div>
                        <div class="price-box mb-2">
                            <c:if test="${flower.discount==0 || flower.discount==null }">
		                    	<span class="regular-price "><fmt:formatNumber  pattern="###,### VND" value="${flower.price}" type="currency" /></span>
		                    </c:if>
		                    <c:if test="${flower.discount!=0 && flower.discount!=null }">
		                    	<span class="regular-price "><fmt:formatNumber pattern="###,### VND"  value="${flower.price - (flower.price*flower.discount)/100 }" type="currency" /> </span>
		                    	<del><span class="old-price"><fmt:formatNumber pattern="###,### VND"  value="${flower.price}" type="currency" /></span></del>
		                    </c:if>
                        </div>
                        <div class="product-rating mb-3">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <div class="sku mb-3">
                            <span>${flower.views} views</span>
                        </div>
                        <p class="desc-content mb-5">${flower.contents}</p>
                        <div class="quantity-with_btn mb-5">
                            <div class="quantity">
                                <div class="cart-plus-minus">
                                    <input class="cart-plus-minus-box" value="1" name="qtt" type="text">
                                    <div class="dec qtybutton">-</div>
                                    <div class="inc qtybutton">+</div>
                                </div>
                            </div>
                            <div class="add-to_cart">
                                <c:if test="${userLogin==null}">
	                                  <a class="btn product-cart button-icon flosun-button dark-btn" href="${pageContext.request.contextPath}/pages/login.htm">Add to cart</a>
				                </c:if>
	                            <c:if test="${userLogin!=null}">
				                    <input class="btn flosun-button primary-btn rounded-0 black-btn" type="submit" formaction="${pageContext.request.contextPath}/shop/cart/insert/${flower.id}.htm" value="Add to cart">
				                </c:if>
                                <a class="btn flosun-button secondary-btn secondary-border rounded-0">Add to wishlist</a>
                            </div>
                        </div>
                        <div class="social-share mb-4">
                            <span>Share :</span>
                            <a href="#"><i class="fa fa-facebook-square facebook-color"></i></a>
                            <a href="#"><i class="fa fa-twitter-square twitter-color"></i></a>
                            <a href="#"><i class="fa fa-linkedin-square linkedin-color"></i></a>
                            <a href="#"><i class="fa fa-pinterest-square pinterest-color"></i></a>
                        </div>
                        <div class="payment">
                            <a href="#"><img class="border" src="${pageContext.request.contextPath}/resources/assets/images/payment/payment-icon.jpg" alt="Payment"></a>
                        </div>
                      </form:form>
                    </div>
                </div>
            </div>
		</div>
	</div>
<!--Product Area Start-->
  <div class="product-area mt-text-3">
        <div class="container custom-area-2 overflow-hidden">
            <div class="row">
                <!--Section Title Start-->
                <div class="col-12 col-custom">
                    <div class="section-title text-center mb-30">
                        <span class="section-title-1">The Most Trendy</span>
                        <h3 class="section-title-3">Featured Products</h3>
                    </div>
                </div>
                <!--Section Title End-->
            </div>
            <div class="row product-row">
                <div class="col-12 col-custom">
                    <div class="product-slider swiper-container anime-element-multi">
                      
                        <div class="swiper-wrapper">
                         <c:forEach var="flo" items="${TopFlower}"> 
                            <div class="single-item swiper-slide">
                                <!--Single Product Start-->
                                <div class="single-product position-relative mb-30">
                                    <div class="product-image">
                                        <a class="d-block" href="${pageContext.request.contextPath}/shop/product_detail/${flo.f1.id}.htm">
                                            <img src="${pageContext.request.contextPath}/resources/images/flower/${flo.f1.image}" alt="" class="product-image-1 w-100">
                                            <img src="${pageContext.request.contextPath}/resources/images/flower/${flo.f1.image}" alt="" class="product-image-2 position-absolute w-100 zoom"> 
                                        </a>
                                        <c:if test="${flo.f1.discount!=0 && flo.f1.discount!=null }">
					                    	<span class="onsale">-${flo.f1.discount}%</span>
					                    </c:if>
                                        <div class="add-action d-flex flex-column position-absolute">
                                            <a title="Compare">
                                                <i class="lnr lnr-sync" data-toggle="tooltip" data-placement="left" title="Compare"></i>
                                            </a>
                                            <a title="Add To Wishlist">
                                                <i class="lnr lnr-heart" data-toggle="tooltip" data-placement="left" title="Wishlist"></i>
                                            </a>
                                           <%--  <a href="#exampleModalCenter${flo.f1.id}" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter${flo.f1.id}">
                                                <i class="lnr lnr-eye" data-toggle="tooltip" data-placement="left" title="Quick View"></i>
                                            </a> --%>
                                        </div>
                                    </div>
                                    <div class="product-content">
                                        <div class="product-title">
                                            <h4 class="title-2"> <a href="${pageContext.request.contextPath}/shop/product_detail/${flo.f1.id}.htm">${flo.f1.name}</a></h4>
                                        </div>
                                        <div class="product-rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                        </div>
                                     	<div class="price-box">
                                        	<c:if test="${flo.f1.discount==0 || flo.f1.discount==null }">
						                    	<span class="regular-price "><fmt:formatNumber  pattern="###,### VND" value="${flo.f1.price}" type="currency" /></span>
						                    </c:if>
						                    <c:if test="${flo.f1.discount!=0 && flo.f1.discount!=null }">
						                    	<span class="regular-price "><fmt:formatNumber pattern="###,### VND"  value="${flo.f1.price - (flo.f1.price*flo.f1.discount)/100 }" type="currency" /> </span>
						                    	<del><span class="old-price"><fmt:formatNumber pattern="###,### VND"  value="${flo.f1.price}" type="currency" /></span></del>
						                    </c:if>
                                        </div>
                                        <c:if test="${userLogin==null}">
						                    <a href="${pageContext.request.contextPath}/pages/login.htm" class="btn product-cart">Add to Cart</a>
						                </c:if>
                                        <c:if test="${userLogin!=null}">
						                    <a href="${pageContext.request.contextPath}/shop/cart/insert/${flo.f1.id}.htm" class="btn product-cart">Add to Cart</a>
						                </c:if>
                                    </div>
                                </div>
                                <!--Single Product End-->
                              	
                                <div class="single-product position-relative mb-30">
                                    <div class="product-image">
                                        <a class="d-block" href="${pageContext.request.contextPath}/shop/product_detail/${flo.f2.id}.htm">
                                            <img src="${pageContext.request.contextPath}/resources/images/flower/${flo.f2.image}" alt="" class="product-image-1 w-100">
                                            <img src="${pageContext.request.contextPath}/resources/images/flower/${flo.f2.image}" alt="" class="product-image-2 position-absolute w-100 zoom"> 
                                        </a>
                                        <c:if test="${flo.f2.discount!=0 && flo.f2.discount!=null }">
					                    	<span class="onsale">-${flo.f2.discount}%</span>
					                    </c:if>
                                        <div class="add-action d-flex flex-column position-absolute">
                                            <a title="Compare">
                                                <i class="lnr lnr-sync" data-toggle="tooltip" data-placement="left" title="Compare"></i>
                                            </a>
                                            <a title="Add To Wishlist">
                                                <i class="lnr lnr-heart" data-toggle="tooltip" data-placement="left" title="Wishlist"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="product-content">
                                        <div class="product-title">
                                            <h4 class="title-2"> <a href="${pageContext.request.contextPath}/shop/product_detail/${flo.f2.id}.htm">${flo.f2.name}</a></h4>
                                        </div>
                                        <div class="product-rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                        </div>
                                     	<div class="price-box">
                                        	<c:if test="${flo.f2.discount==0 || flo.f2.discount==null }">
						                    	<span class="regular-price "><fmt:formatNumber  pattern="###,### VND" value="${flo.f2.price}" type="currency" /></span>
						                    </c:if>
						                    <c:if test="${flo.f2.discount!=0 && flo.f2.discount!=null }">
						                    	<span class="regular-price "><fmt:formatNumber pattern="###,### VND"  value="${flo.f2.price - (flo.f2.price*flo.f2.discount)/100 }" type="currency" /> </span>
						                    	<del><span class="old-price"><fmt:formatNumber pattern="###,### VND"  value="${flo.f2.price}" type="currency" /></span></del>
						                    </c:if>
                                        </div>
                                        <c:if test="${userLogin==null}">
						                    <a href="${pageContext.request.contextPath}/pages/login.htm" class="btn product-cart">Add to Cart</a>
						                </c:if>
                                        <c:if test="${userLogin!=null}">
						                    <a href="${pageContext.request.contextPath}/shop/cart/insert/${flo.f2.id}.htm" class="btn product-cart">Add to Cart</a>
						                </c:if>
                                    </div>
                                </div>
                                <!--Single Product End--> 
                            </div>
      					</c:forEach>
                        </div>
                        
                        
                        
                               
                               
                        
                      
                        <!-- Slider pagination -->
                        <div class="swiper-pagination default-pagination"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Product Area End-->
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
    <!-- Scroll to Top Start -->
    <a class="scroll-to-top" href="#">
        <i class="lnr lnr-arrow-up"></i>
    </a>
    <!-- Scroll to Top End -->
    
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