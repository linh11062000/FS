<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
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
    <link rel="stylesheet" href="<c:url value='/resources/assets/css/style.css' />">
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

    <!--===== Pre-Loading area Start =====-->
    <div id="preloader">
        <div class="preloader">
            <div class="spinner-block">
                <h1 class="spinner spinner-3 mb-0">.</h1>
            </div>
        </div>
    </div>
    <!--==== Pre-Loading Area End ====-->
    <%@include file="/WEB-INF/views/include/header.jsp"%>
    
    <!-- Slider/Intro Section Start -->
    <div class="intro11-slider-wrap section-2">
        <div class="intro11-slider swiper-container">
            <div class="swiper-wrapper">
                <div class="intro11-section swiper-slide slide-5 slide-bg-1 bg-position">
                    <!-- Intro Content Start -->
                    <div class="intro11-content-2 text-center">
                        <h1 class="different-title">Quality</h1>
                        <h2 class="title text-white">The Gift of Flowers</h2>
                        <a href="${pageContext.request.contextPath}/shop/main.htm" class="btn flosun-button  secondary-btn theme-color rounded-0">Shop Collection</a>
                    </div>
                    <!-- Intro Content End -->
                </div>
                <div class="intro11-section swiper-slide slide-6 slide-bg-1 bg-position">
                    <!-- Intro Content Start -->
                    <div class="intro11-content-2 text-center">
                        <h1 class="different-title">Welcome</h1>
                        <h2 class="title">DND Flower Shop</h2>
                        <a href="${pageContext.request.contextPath}/shop/man.htm" class="btn flosun-button  secondary-btn theme-color rounded-0">Shop Collection</a>
                    </div>
                    <!-- Intro Content End -->
                </div>
            </div>
            <!-- Slider Navigation -->
            <div class="home1-slider-prev swiper-button-prev main-slider-nav"><i class="lnr lnr-arrow-left"></i></div>
            <div class="home1-slider-next swiper-button-next main-slider-nav"><i class="lnr lnr-arrow-right"></i></div>
            <!-- Slider pagination -->
            <div class="swiper-pagination"></div>
        </div>
    </div>
    <!-- Slider/Intro Section End -->
    <!-- Shop Collection Start Here -->
    <div class="shop-collection-area gray-bg pt-no-text pb-no-text">
        <div class="container custom-area">
            <div class="row mb-30">
                <div class="col-md-6 col-custom">
                    <div class="collection-content">
                        <div class="section-title text-left">
                            <span class="section-title-1">Flowers for the</span>
                            <h3 class="section-title-3 pb-0">Birthday & Gifts</h3>
                        </div>
                        <div class="desc-content">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
                        </div>
                        <a href="${pageContext.request.contextPath}/shop/main.htm" class="btn flosun-button secondary-btn rounded-0">Shop Collection</a>
                    </div>
                </div>
                <div class="col-md-6 col-custom">
                    <!--Single Banner Area Start-->
                    <div class="single-banner hover-style">
                        <div class="banner-img">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/resources/assets/images/about/1.jpg" alt="">
                                <div class="overlay-1"></div>
                            </a>
                        </div>
                    </div>
                    <!--Single Banner Area End-->
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-custom order-2 order-md-1">
                    <!--Single Banner Area Start-->
                    <div class="single-banner hover-style">
                        <div class="banner-img">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/resources/assets/images/about/2.jpg" alt="">
                                <div class="overlay-1"></div>
                            </a>
                        </div>
                    </div>
                    <!--Single Banner Area End-->
                </div>
                <div class="col-md-6 col-custom order-1 order-md-2">
                    <div class="collection-content">
                        <div class="section-title text-left">
                            <span class="section-title-1">Flowers for the</span>
                            <h3 class="section-title-3 pb-0">Wedding day</h3>
                        </div>
                        <div class="desc-content">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
                        </div>
                        <a href="${pageContext.request.contextPath}/shop/main.htm" class="btn flosun-button secondary-btn rounded-0">Shop Collection</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Shop Collection End Here -->
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
    <!-- Banner Area Start Here -->
    <div class="banner-area mt-text-3">
        <div class="container custom-area">
            <div class="row">
                <div class="col-md-6 col-custom">
                    <!--Single Banner Area Start-->
                    <div class="single-banner hover-style mb-30">
                        <div class="banner-img">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/resources/assets/images/banner/1-1.jpg" alt="">
                                <div class="overlay-1"></div>
                            </a>
                        </div>
                    </div>
                    <!--Single Banner Area End-->
                </div>
                <div class="col-md-6 col-custom">
                    <!--Single Banner Area Start-->
                    <div class="single-banner hover-style mb-30">
                        <div class="banner-img">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/resources/assets/images/banner/1-3.jpg" alt="">
                                <div class="overlay-1"></div>
                            </a>
                        </div>
                    </div>
                    <!--Single Banner Area End-->
                </div>
            </div>
        </div>
    </div>
    <!-- Banner Area End Here -->
    <!-- Testimonial Area Start Here -->
    <div class="testimonial-area-2 mt-text-2">
        <div class="container custom-area">
            <div class="row">
                <div class="col-lg-6 col-custom">
                    <!--Section Title Start-->
                    <div class="section-title text-center mb-30">
                        <span class="section-title-1">We love our clients</span>
                        <h3 class="section-title-3">What They’re Saying</h3>
                    </div>
                    <!--Section Title End-->
                    <div class="testimonial-carousel swiper-container intro11-carousel-wrap arrow-style-2">
                        <div class="swiper-wrapper">
                            <div class="single-item swiper-slide">
                                <!--Single Testimonial Start-->
                                <div class="single-testimonial text-center">
                                    <div class="testimonial-img">
                                        <img src="${pageContext.request.contextPath}/resources/assets/images/testimonial/Duy1.jpg" alt="">
                                    </div>
                                    <div class="testimonial-content">
                                        <p>Những chàng trai này đã hoàn toàn xuất sắc. Chủ đề hoàn hảo và tốt nhất là bạn có nhiều tùy chọn để chọn! Nhóm hỗ trợ tốt nhất từ ​​trước đến nay! Phản hồi rất nhanh! Cám ơn rất nhiều! Tôi khuyên bạn nên chọn nơi này và những con người ở đây!</p>
                                        <div class="testimonial-author">
                                            <h6>Nguyễn Thế Duy <span>Customer</span></h6>
                                        </div>
                                    </div>
                                </div>
                                <!--Single Testimonial End-->
                            </div>
                            <div class="single-item swiper-slide">
                                <!--Single Testimonial Start-->
                                <div class="single-testimonial text-center">
                                    <div class="testimonial-img">
                                        <img src="${pageContext.request.contextPath}/resources/assets/images/testimonial/Minh.jpg" alt="">
                                    </div>
                                    <div class="testimonial-content">
                                        <p>Mình đã mua hoa ở đây hơn 4 năm rồi. Từ trang trí đến độ tươi của hoa chưa bao giờ shop làm mình thất vọng. Cám ơn các bạn đã luôn đem đến dịch vụ tốt cho khách hàng! Mình sẽ tiếp tục ủng hộ các bạn!</p>
                                        <div class="testimonial-author">
                                            <h6>Phạm Văn Minh <span>Customer</span></h6>
                                        </div>
                                    </div>
                                </div>
                                <!--Single Testimonial End-->
                            </div>
                        </div>
                        <!-- Slider Navigation -->
                        <div class="home1-slider-prev swiper-button-prev main-slider-nav"><i class="lnr lnr-arrow-left"></i></div>
                        <div class="home1-slider-next swiper-button-next main-slider-nav"><i class="lnr lnr-arrow-right"></i></div>
                        <!-- Slider pagination -->
                        <div class="swiper-pagination default-pagination"></div>
                    </div>
                </div>
                <div class="col-lg-6 col-custom">
                    <!--Section Title Start-->
                    <div class="section-title text-center mb-30">
                        <span class="section-title-1">From The Blogs</span>
                        <h3 class="section-title-3">Our Latest Post</h3>
                    </div>
                    <!--Section Title End-->
                    <div class="latest-post-carousel swiper-container intro11-carousel-wrap">
                        <div class="swiper-wrapper">
                            <div class="single-item swiper-slide">
                                <!--Single Blog List Start-->
                                <div class="blog-list-vertical">
                                    <div class="post-date">1/12/2021</div>
                                    <h3 class="post-title"><a href="${pageContext.request.contextPath}/blog/main.htm">Post with Gallery</a></h3>
                                    <p class="post-author">
                                        <img src="${pageContext.request.contextPath}/resources/assets/images/icon/author2.png" alt=""> <span>Posted by </span>
                                        <a href="${pageContext.request.contextPath}/pages/about_us.htm">admin </a>
                                    </p>
                                </div>
                                <!--Single Blog list End-->
                            </div>
                            <div class="single-item swiper-slide">
                                <!--Single Blog List Start-->
                                <div class="blog-list-vertical">
                                    <div class="post-date">11/11/2021</div>
                                    <h3 class="post-title"><a href="${pageContext.request.contextPath}/blog/main.htm">Post with Video</a></h3>
                                    <p class="post-author">
                                        <img src="${pageContext.request.contextPath}/resources/assets/images/icon/icon.png" alt=""> <span>Posted by </span>
                                        <a href="${pageContext.request.contextPath}/pages/about_us.htm">admin </a>
                                    </p>
                                </div>
                                <!--Single Blog list End-->
                            </div>
                            <div class="single-item swiper-slide">
                                <!--Single Blog List Start-->
                                <div class="blog-list-vertical">
                                    <div class="post-date">07/10/2021</div>
                                    <h3 class="post-title"><a href="${pageContext.request.contextPath}/blog/main.htm">Post with Audio</a></h3>
                                    <p class="post-author">
                                        <img src="${pageContext.request.contextPath}/resources/assets/images/icon/author2.png" alt=""> <span>Posted by </span>
                                        <a href="${pageContext.request.contextPath}/pages/about_us.htm">admin </a>
                                    </p>
                                </div>
                                <!--Single Blog list End-->
                            </div>
                            <div class="single-item swiper-slide">
                                <!--Single Blog List Start-->
                                <div class="blog-list-vertical">
                                    <div class="post-date">01/09/2021</div>
                                    <h3 class="post-title"><a href="${pageContext.request.contextPath}/blog/main.htm">Standard Blog Post</a></h3>
                                    <p class="post-author">
                                        <img src="${pageContext.request.contextPath}/resources/assets/images/icon/icon.png" alt=""> <span>Posted by </span>
                                        <a href="${pageContext.request.contextPath}/pages/about_us.htm">admin </a>
                                    </p>
                                </div>
                                <!--Single Blog list End-->
                            </div>
                        </div>
                        <!-- Slider pagination -->
                        <div class="swiper-pagination default-pagination"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Testimonial Area End Here -->
    <!-- Blog Area Start Here -->
    <div class="blog-post-area mt-text-3">
        <div class="container custom-area">
            <div class="row">
                <!--Section Title Start-->
                <div class="col-12">
                    <div class="section-title text-center mb-30">
                        <span class="section-title-1">From The Blogs</span>
                        <h3 class="section-title-3">Our Latest Posts</h3>
                    </div>
                </div>
                <!--Section Title End-->
            </div>
            <div class="row">
                <div class="col-12 col-md-4 col-lg-4 col-custom mb-30">
                    <div class="blog-lst">
                        <div class="single-blog">
                            <div class="blog-image">
                                <a class="d-block" href="${pageContext.request.contextPath}/blog/detail.htm">
                                    <img src="${pageContext.request.contextPath}/resources/assets/images/blog/blog1.jpg" alt="Blog Image" class="w-100">
                                </a>
                            </div>
                            <div class="blog-content">
                                <div class="blog-text">
                                    <h4><a href="${pageContext.request.contextPath}/blog/detail.htm">Standard blog post one</a></h4>
                                    <div class="blog-post-info">
                                        <span><a href="#">By admin</a></span>
                                        <span>December 1, 2021</span>
                                    </div>
                                    <p>Hoa là món quà vô giá mà thiên nhiên đã dành tặng cho con người. Mỗi loài hoa mang một vẻ đẹp và sắc thái riêng, chính vì vậy mà người thưởng hoa có thể gởi gắm tâm tư tình cảm của mình vào chậu hoa một cách tinh tế, ý nhị.</p>
                                    <a href="${pageContext.request.contextPath}/blog/detail.htm" class="readmore">Read More <i class="fa fa-long-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 col-lg-4 col-custom mb-30">
                    <div class="blog-lst">
                        <div class="single-blog">
                            <div class="blog-image">
                                <a class="d-block" href="${pageContext.request.contextPath}/blog/detail.htm">
                                    <img src="${pageContext.request.contextPath}/resources/assets/images/blog/blog3.jpg" alt="Blog Image" class="w-100">
                                </a>
                            </div>
                            <div class="blog-content">
                                <div class="blog-text">
                                    <h4><a href="${pageContext.request.contextPath}/blog/detail.htm">Standard blog post two</a></h4>
                                    <div class="blog-post-info">
                                        <span><a href="#">By admin</a></span>
                                        <span>November 11, 2021</span>
                                    </div>
                                    <p>Hoa là món quà vô giá mà thiên nhiên đã dành tặng cho con người. Mỗi loài hoa mang một vẻ đẹp và sắc thái riêng, chính vì vậy mà người thưởng hoa có thể gởi gắm tâm tư tình cảm của mình vào chậu hoa một cách tinh tế, ý nhị.</p>
                                    <a href="${pageContext.request.contextPath}/blog/detail.htm" class="readmore">Read More <i class="fa fa-long-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 col-lg-4 col-custom mb-30">
                    <div class="blog-lst">
                        <div class="single-blog">
                            <div class="blog-image">
                                <a class="d-block" href="${pageContext.request.contextPath}/blog/detail.htm">
                                    <img src="${pageContext.request.contextPath}/resources/assets/images/blog/blog2.jpg" alt="Blog Image" class="w-100">
                                </a>
                            </div>
                            <div class="blog-content">
                                <div class="blog-text">
                                    <h4><a href="${pageContext.request.contextPath}/blog/detail.htm">Standard blog post three</a></h4>
                                    <div class="blog-post-info">
                                        <span><a href="#">By admin</a></span>
                                        <span>October 7, 2021</span>
                                    </div>
                                   <p>Hoa là món quà vô giá mà thiên nhiên đã dành tặng cho con người. Mỗi loài hoa mang một vẻ đẹp và sắc thái riêng, chính vì vậy mà người thưởng hoa có thể gởi gắm tâm tư tình cảm của mình vào chậu hoa một cách tinh tế, ý nhị.</p>
                                    <a href="${pageContext.request.contextPath}/blog/detail.htm" class="readmore">Read More <i class="fa fa-long-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Blog Area End Here -->
    <!-- Brand Logo Area Start Here -->
    <div class="brand-logo-area gray-bg pt-no-text pb-no-text mt-text-5">
        <div class="container custom-area">
            <div class="row">
                <div class="col-12 col-custom">
                    <div class="brand-logo-carousel swiper-container intro11-carousel-wrap arrow-style-3">
                        <div class="swiper-wrapper">
                            <div class="single-brand swiper-slide">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/resources/assets/images/brand/1.png" alt="Brand Logo">
                                </a>
                            </div>
                            <div class="single-brand swiper-slide">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/resources/assets/images/brand/2.png" alt="Brand Logo">
                                </a>
                            </div>
                            <div class="single-brand swiper-slide">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/resources/assets/images/brand/3.png" alt="Brand Logo">
                                </a>
                            </div>
                            <div class="single-brand swiper-slide">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/resources/assets/images/brand/4.png" alt="Brand Logo">
                                </a>
                            </div>
                            <div class="single-brand swiper-slide">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/resources/assets/images/brand/5.png" alt="Brand Logo">
                                </a>
                            </div>
                        </div>
                        <!-- Slider Navigation -->
                        <div class="home1-slider-prev swiper-button-prev main-slider-nav"><i class="lnr lnr-arrow-left"></i></div>
                        <div class="home1-slider-next swiper-button-next main-slider-nav"><i class="lnr lnr-arrow-right"></i></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Brand Logo Area End Here -->
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
		      var item=lis[0];
		      item.className += " active";
		   
		    // view homepage
		   
		    var header=document.getElementById('header_main');
		    header.className+=" header-transparent";
		    
		    var footer=document.getElementById('footer_main');
		    footer.classList.remove("mt-no-text");
	</script>


</body>

</html>