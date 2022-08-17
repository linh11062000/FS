<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
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
                        <h3 class="title-3">Shop Collection</h3>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/home/index.htm">Home</a></li>
                            <li>Shop</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Area End Here -->
    <!-- Shop Main Area Start Here -->
    <div class="shop-main-area">
        <div class="container container-default custom-area">
            <div class="row flex-row-reverse">
                <div class="col-12 col-custom widget-mt">
                    <!--shop toolbar start-->
                    <div class="shop_toolbar_wrapper mb-30">
                        <div class="shop_toolbar_btn">
                            <button data-role="grid_4" type="button" class="active btn-grid-4" title="Grid-4"><i class="fa fa-th"></i></button>
                            <button data-role="grid_3" type="button" class="btn-grid-3" title="Grid-3"> <i class="fa fa-th-large"></i></button>
                            <button data-role="grid_list" type="button" class="btn-list" title="List"><i class="fa fa-th-list"></i></button>
                        </div>
                        <%-- <div class="shop-select">
                            <form:form class="d-flex flex-column w-100" action="#">
                                <div class="form-group">
                                    <select class="form-control nice-select w-100" name="role">
                                        <option selected value="1">Alphabetically, A-Z</option>
                                        <option value="2">Sort by popularity</option>
                                        <option value="3">Sort by newness</option>
                                        <option value="4">Sort by price: low to high</option>
                                        <option value="5">Sort by price: high to low</option>
                                        <option value="6">Product Name: Z</option>
                                    </select>
                                </div>
                            </form:form>
                        </div> --%>
                    </div>
                    <!--shop toolbar end-->
                    <!-- Shop Wrapper Start -->
                    <jsp:useBean id="pagedListHolder" scope="request"
							type="org.springframework.beans.support.PagedListHolder" />
						<c:url value="${contextPath}/shop/main.htm" var="pagedLink">
							<c:param name="p" value="~" />
						</c:url>
                    <div class="row shop_wrapper grid_4">
                    <c:forEach var="flo" items="${pagedListHolder.pageList}">
                        <div class="col-lg-3 col-md-6 col-sm-6  col-custom product-area">
                            <div class="product-item">
                                <div class="single-product position-relative mr-0 ml-0">
                                    <div class="product-image">
                                        <a class="d-block" href="${pageContext.request.contextPath}/shop/product_detail/${flo.id}.htm">
                                            <img src="${pageContext.request.contextPath}/resources/images/flower/${flo.image}" alt="" class="product-image-1 w-100">
                                            <img src="${pageContext.request.contextPath}/resources/images/flower/${flo.image}" alt="" class="product-image-2 position-absolute w-100 zoom"> 
                                        </a>
					                    <c:if test="${flo.discount!=0 && flo.discount!=null }">
					                    	<span class="onsale">-${flo.discount}%</span>
					                    </c:if>
                                        <div class="add-action d-flex flex-column position-absolute">
                                            <a title="Compare">
                                                <i class="lnr lnr-sync" data-toggle="tooltip" data-placement="left" title="Compare"></i>
                                            </a>
                                            <a title="Add To Wishlist">
                                                <i class="lnr lnr-heart" data-toggle="tooltip" data-placement="left" title="Wishlist"></i>
                                            </a>
                                            <a href="#exampleModalCenter${flo.id}" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter${flo.id}">
                                                <i class="lnr lnr-eye" data-toggle="tooltip" data-placement="left" title="Quick View"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="product-content">
                                        <div class="product-title">
                                            <h4 class="title-2"> <a href="${pageContext.request.contextPath}/shop/product_detail/${flo.id}.htm">${flo.name}</a></h4>
                                        </div>
                                        <div class="product-rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                        </div>
                                        <div class="price-box">
                                        	<c:if test="${flo.discount==0 || flo.discount==null }">
						                    	<span class="regular-price "><fmt:formatNumber  pattern="###,### VND" value="${flo.price}" type="currency" /></span>
						                    </c:if>
						                    <c:if test="${flo.discount!=0 && flo.discount!=null }">
						                    	<span class="regular-price "><fmt:formatNumber pattern="###,### VND"  value="${flo.price - (flo.price*flo.discount)/100 }" type="currency" /> </span>
						                    	<del><span class="old-price"><fmt:formatNumber pattern="###,### VND"  value="${flo.price}" type="currency" /></span></del>
						                    </c:if>
                                            <%-- <span class="regular-price " pattern="###,### VND">${flo.price-flo.price*flo.discount}</span>
                                            <span class="old-price" pattern="###,### VND"><del>${flo.price}</del></span> --%>
                                        </div>
                                        <c:if test="${userLogin==null}">
						                    <a href="${pageContext.request.contextPath}/pages/login.htm" class="btn product-cart">Add to Cart</a>
						                </c:if>
                                        <c:if test="${userLogin!=null}">
						                    <a href="${pageContext.request.contextPath}/shop/cart/insert/${flo.id}.htm" class="btn product-cart">Add to Cart</a>
						                </c:if>
                                    </div>
                                    <div class="product-content-listview">
                                        <div class="product-title">
                                            <h4 class="title-2"> <a href="${pageContext.request.contextPath}/shop/product_detail/${flo.id}.htm">${flo.name}</a></h4>
                                        </div>
                                        <div class="product-rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                        </div>
                                        <div class="price-box">
                                            <c:if test="${flo.discount==0 || flo.discount==null }">
						                    	<span class="regular-price "><fmt:formatNumber  pattern="###,### VND" value="${flo.price}" type="currency" /></span>
						                    </c:if>
						                    <c:if test="${flo.discount!=0 && flo.discount!=null }">
						                    	<span class="regular-price "><fmt:formatNumber pattern="###,### VND"  value="${flo.price - (flo.price*flo.discount)/100 }" type="currency" /> </span>
						                    	<del><span class="old-price"><fmt:formatNumber pattern="###,### VND"  value="${flo.price}" type="currency" /></span></del>
						                    </c:if>
                                        </div>
                                        <p class="desc-content">${flo.contents}</p>
                                        <div class="button-listview">
                                            <c:if test="${userLogin==null}">
						                    	<a href="${pageContext.request.contextPath}/pages/login.htm" class="btn product-cart button-icon flosun-button dark-btn" data-toggle="tooltip" data-placement="top" title="Add to Cart"> <span>Add to Cart</span> </a>
						                	</c:if>
                                        	<c:if test="${userLogin!=null}">
						                    	<a href="${pageContext.request.contextPath}/shop/cart/insert/${flo.id}.htm" class="btn product-cart button-icon flosun-button dark-btn" data-toggle="tooltip" data-placement="top" title="Add to Cart"> <span>Add to Cart</span> </a>
						                	</c:if>
                                            <a class="list-icon" title="Compare">
                                                <i class="lnr lnr-sync" data-toggle="tooltip" data-placement="top" title="Compare"></i>
                                            </a>
                                            <a class="list-icon" title="Add To Wishlist">
                                                <i class="lnr lnr-heart" data-toggle="tooltip" data-placement="top" title="Wishlist"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
						 <!-- Modal -->
						<div class="modal flosun-modal fade" id="exampleModalCenter${flo.id}" tabindex="-1" role="dialog" aria-hidden="true">
					        <div class="modal-dialog modal-dialog-centered" role="document">
					            <div class="modal-content">
					                <button type="button" class="close close-button" data-dismiss="modal" aria-label="Close">
					                    <span class="close-icon" aria-hidden="true">x</span>
					                </button>
					                <div class="modal-body">
					                    <div class="container-fluid custom-area">
					                        <div class="row">
					                            <div class="col-md-6 col-custom">
					                                <div class="modal-product-img">
					                                    <a class="w-100" href="#">
					                                        <img class="w-100" src="${pageContext.request.contextPath}/resources/images/flower/${flo.image}" alt="Product">
					                                    </a>
					                                </div>
					                            </div>
					                            <div class="col-md-6 col-custom">
					                                <div class="modal-product">
					                                 <form:form method="GET">
					                                    <div class="product-content">
					                                        <div class="product-title">
					                                            <h4 class="title">${flo.name}</h4>
					                                        </div>
					                                        <div class="price-box">
					                                            <c:if test="${flo.discount==0 || flo.discount==null }">
											                    	<span class="regular-price "><fmt:formatNumber  pattern="###,### VND" value="${flo.price}" type="currency" /></span>
											                    </c:if>
											                    <c:if test="${flo.discount!=0 && flo.discount!=null }">
											                    	<span class="regular-price "><fmt:formatNumber pattern="###,### VND"  value="${flo.price - (flo.price*flo.discount)/100 }" type="currency" /> </span>
											                    	<del><span class="old-price"><fmt:formatNumber pattern="###,### VND"  value="${flo.price}" type="currency" /></span></del>
											                    </c:if>
					                                        </div>
					                                        <div class="product-rating">
					                                            <i class="fa fa-star"></i>
					                                            <i class="fa fa-star"></i>
					                                            <i class="fa fa-star"></i>
					                                            <i class="fa fa-star"></i>
					                                            <i class="fa fa-star-o"></i>
					                                            <span> ${flo.views} views</span>
					                                        </div>
					                                        <p class="desc-content">${flo.contents}</p>
					                                        <%-- <form class="d-flex flex-column w-100" action="#">
					                                            <div class="form-group">
					                                                <select class="form-control nice-select w-100">
					                                                    <option>S</option>
					                                                    <option>M</option>
					                                                    <option>L</option>
					                                                    <option>XL</option>
					                                                    <option>XXL</option>
					                                                </select>
					                                            </div>
					                                        </form> --%>
					                                        <div class="quantity-with-btn">
					                                            <div class="quantity">
					                                                <div class="cart-plus-minus">
					                                                    <input class="cart-plus-minus-box" value="1" name="qtt" type="text">
					                                                    <div class="dec qtybutton">-</div>
					                                                    <div class="inc qtybutton">+</div>
					                                                    <div class="dec qtybutton"><i class="fa fa-minus"></i></div>
					                                                    <div class="inc qtybutton"><i class="fa fa-plus"></i></div>
					                                                </div>
					                                            </div>
					                                            <div class="add-to_btn">
					                                                <c:if test="${userLogin==null}">
					                                                    <a class="btn product-cart button-icon flosun-button dark-btn" href="${pageContext.request.contextPath}/pages/login.htm">Add to cart</a>
													                </c:if>
							                                        <c:if test="${userLogin!=null}">
													                    <input class="btn flosun-button primary-btn rounded-0 black-btn" type="submit" formaction="${pageContext.request.contextPath}/shop/cart/insert/${flo.id}.htm" value="Add to cart">
													                </c:if>
					                                                <a class="btn flosun-button secondary-btn rounded-0">Add to wishlist</a>
					                                            </div>
					                                        </div>
					                                    </div>
					                                  </form:form>
					                                </div>
					                            </div>
					                        </div>
					                    </div>
					                </div>
					            </div>
					        </div>
				    	</div>
                      </c:forEach>
                    </div>
                    <!-- Shop Wrapper End -->
                    
                    <!-- Bottom Toolbar Start -->
                  <!--   <div class="row">
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
                                <p class="desc-content text-center text-sm-right mb-0">Showing 1 - 12 of 34 result</p>
                            </div>
                        </div>
                    </div> -->
                    <!-- Bottom Toolbar End -->
                </div>
                <div class="mr-4">
						<tg:paging pagedListHolder="${pagedListHolder}"
							pagedLink="${pagedLink}"/>
					</div>
            </div>
        </div>
    </div>
    <!-- Shop Main Area End Here -->
    
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