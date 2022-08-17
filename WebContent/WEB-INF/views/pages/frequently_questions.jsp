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
                        <h3 class="title-3">FAQ</h3>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/home/index.htm">Home</a></li>
                            <li>Faq</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Area End Here -->
    <!--faq area start-->
    <div class="faq-area">
        <!-- Faq Content Start  -->
        <div class="faq_content_area mt-text-6">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="faq_content_wrapper">
                            <h4>Below are frequently asked questions, you may find the answer for yourself</h4>
                            <p>Shop Hoa DND sẽ là cầu nối để kết nối những tình cảm thân yêu của bạn, làm vững bền mối thâm giao bằng hữu tạo dựng đẳng cấp và phong cách khác biệt trong cuộc sống và công việc hay để chia ngọt sẻ bùi, gửi gắm tâm tư ...</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Faq Content End -->
        <!--Accordion area-->
        <div class="accordion_area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div id="accordion" class="card__accordion">
                            <div class="card card_dipult">
                                <div class="card-header card_accor" id="headingOne">
                                    <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Làm  sao để mua được sản phẩm từ DND Flower Shop?<i class="fa fa-plus"></i><i class="fa fa-minus"></i>
                                    </button>
                                </div>
                                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                                    <div class="card-body">
                                        <p>  Quý khách có thể đặt hàng theo các cách sau: <br>
												 + Mua hàng trực tiếp trên website.<br>
												 + Đặt hàng qua Hotline(24/24): 19001000 <br>
												 + Đặt hàng trực tiếp tại shop DND: contact@dndshop.com
										</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card card_dipult">
                                <div class="card-header card_accor" id="headingTwo">
                                    <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
										Thời gian đặt hàng trước khi giao hoa là bao nhiêu thì tốt nhất?                                        <i class="fa fa-plus"></i>
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                                    <div class="card-body">
                                        <p>
											Trong tất cả trường hợp, chúng tôi đều khuyến khích bạn nên đặt hoa trước 24h, điều này giúp chúng tôi có thể giúp bạn được tốt hơn. Tuy nhiên, một số trường hợp đột xuất quan trọng và những mẫu hoa đơn giản chúng tôi cũng vẫn có thể chấp nhận các đơn hàng trước 1 đến 2 giờ. Chúng tôi sẽ cố gắng hết sức trong khả năng cho phép để có thể giúp bạn.                                        
											</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card card_dipult">
                                <div class="card-header card_accor" id="headingThree">
                                    <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
										DND sẽ xác nhận đơn hàng như thế nào?                                        <i class="fa fa-plus"></i>
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                                    <div class="card-body">
                                   		 <p>Khi đặt hàng thành công quý khách sẽ nhận được thông báo Nội dung chi tiết đơn đặt hành thành công qua email quý khách đã đăng kí trên website. Sau khi nhận được đơn đặt hàng chúng tôi sẽ gọi điện thoại hoặc gửi email xác nhận đơn đặt hàng với quý khách.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card card_dipult">
                                <div class="card-header card_accor" id="headingfour">
                                    <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseeight" aria-expanded="false" aria-controls="collapseeight">
											 Sản phẩm của DND có đảm bảo chất lượng và đúng mẫu không?                                        <i class="fa fa-plus"></i>
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                                <div id="collapseeight" class="collapse" aria-labelledby="headingfour" data-parent="#accordion">
                                    <div class="card-body">
	                                    <p>Tất cả các đại lý và nhà cung cấp sản phẩm,dịch vụ đã đươc chọn lọc và có cam kết với DND shop để phục vụ các sản phẩm, dịch vụ tốt nhất đến quý khách. Bạn cứ yên tâm nhé! Nếu có điều gì không hài lòng, bạn hãy phản hồi cho chúng tôi tại tổng đài hoặc email: contact@dndflower.com . Chúng tôi luôn lắng nghe và ghi nhận những ý kiến đóng góp của khách hàng.
	                                    	<br>Trong trường hợp thiếu nguyên liệu về hoa, chúng tôi sẽ chủ động liên hệ với quý khách để thông báo và tư vấn phương án thay thế tốt nhất.
	                                    </p>
                                    </div>
                                </div>
                            </div>
                            <div class="card card_dipult">
                                <div class="card-header card_accor" id="headingfive">
                                    <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseseven" aria-expanded="false" aria-controls="collapseseven">
										Các đơn hàng ở tỉnh thì phí vận chuyển ( phí ship ) được tính như thế nào ?                                        <i class="fa fa-plus"></i>
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                                <div id="collapseseven" class="collapse" aria-labelledby="headingfive" data-parent="#accordion">
                                    <div class="card-body">
                                   		 <p>Đối với các đơn hàng ở tỉnh, nếu địa điểm giao hoa nằm trong phạm vi bán kính 5km tính từ trung tâm của tỉnh thì khách hàng sẽ không cần trả thêm phí ship. Đối với các đơn hàng nằm ngoài phạm vi bán kính 5km, chúng tôi nhờ chi nhánh xác nhận lại phí ship, thời gian giao hoa cũng như chất lượng hoa trong quá trình giao nhận và sẽ trả lời lại cho quý khách trong thời gian thường 15 phút.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card card_dipult">
                                <div class="card-header card_accor" id="headingsix">
                                    <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapsefour" aria-expanded="false" aria-controls="collapsefour">
										 Tôi có nhất thiết phải đăng ký trở thành khách hàng của DND mới được mua hàng hay không?                                        <i class="fa fa-plus"></i>
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                                <div id="collapsefour" class="collapse" aria-labelledby="headingsix" data-parent="#accordion">
                                    <div class="card-body">
										<p>Tùy vào tính chất riêng tư bạn không cần phải đăng ký (có thể nhờ người khác đăng ký). Tuy nhiên, việc đăng ký giúp chúng tôi có những thông tin chăm sóc bạn tốt hơn như: gửi chương trình khuyến mãi, tặng quà...</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card card_dipult">
                                <div class="card-header card_accor" id="headingseven">
                                    <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapsefive" aria-expanded="false" aria-controls="collapsefive">
                                        Trường hợp bạn quên mật khẩu  
                                        <i class="fa fa-plus"></i>
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                                <div id="collapsefive" class="collapse" aria-labelledby="headingseven" data-parent="#accordion">
                                    <div class="card-body">
										<p>Để lấy lại mật khẩu của mình bạn bấm Quên Mật Khẩu khi đăng nhập và làm theo hướng dẫn</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card card_dipult">
                                <div class="card-header card_accor" id="headingeight">
                                    <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapsesix" aria-expanded="false" aria-controls="collapsesix">
                                        Tôi muốn giới thiệu bạn bè và người thân tham gia mua hàng tại website của DND shop thì làm thế nào?
                                        <i class="fa fa-plus"></i>
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                                <div id="collapsesix" class="collapse" aria-labelledby="headingeight" data-parent="#accordion">
                                    <div class="card-body">
										<p>Bạn có thể gửi đường link website của chúng tôi cho họ qua Email, Facebook, Yahoo hoặc các mạng xã hội khác. Chúng tôi luôn trân trọng sự yêu mến và tin tưởng của các bạn.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Accordion area end-->
    </div>
    <!--faq area End-->
    
    
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
	      var item=lis[3];
	      item.className += " active";
	   
	</script>
</body>
</html>