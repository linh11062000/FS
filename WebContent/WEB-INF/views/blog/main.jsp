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
                        <h3 class="title-3">Blog Main</h3>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/home/index.htm">Home</a></li>
                            <li>Blog</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Area End Here -->
    <!-- Blog Main Area Start Here -->
    <div class="blog-main-area">
        <div class="container container-default custom-area">
            <div class="row">
                <div class="col-lg-12 col-12 col-custom widget-mt">
                    <!-- Shop Wrapper Start -->
                    <div class="row">
                        <div class="col-12 col-md-6 col-lg-4 col-custom mb-30">
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
                        <div class="col-12 col-md-6 col-lg-4 col-custom mb-30">
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
                        <div class="col-12 col-md-6 col-lg-4 col-custom mb-30">
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
                       
                    <!-- Shop Wrapper End -->
                    <!-- Bottom Toolbar Start -->
                    <div class="row">
                        <div class="col-sm-12 col-custom">
                            <div class="toolbar-bottom">
                                <div class="pagination">
                                    <ul>
                                        <li class="current">1</li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#">3</a></li>
                                        <li class="next"><a href="#">next</a></li>
                                        <li><a href="#">&gt;&gt;</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Bottom Toolbar End -->
                </div>
            </div>
        </div>
    </div>
    <!-- Blog Main Area End Here -->
 
    
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
	      var item=lis[2];
	      item.className += " active";
	   
	</script>
</body>
</html>