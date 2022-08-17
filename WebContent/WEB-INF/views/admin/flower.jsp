<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/admin/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8">
<title>Dashboard</title>
<link rel="shortcut icon" type="image/x-icon" href="<c:url value='/resources/assets/images/icon.ico' />">
 <%@include file="/resources/admin/common/loadcss.jsp"%> 
 <%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<style type="text/css">
*[id$=errors] {
	color: red;
	font-style: italic;
}
.tdcon {
width: 300px
}
 .contentss{
 width: 100%;
   display: block; 
   text-overflow: ellipsis; 
   word-wrap: break-word; 
   overflow: hidden;  
   max-height: 8em;
   line-height: 2em;   
} 
</style>
</head>
<body>
	<%@include file="/resources/admin/common/header.jsp"%>
	<%@include file="/resources/admin/common/left-side-bar.jsp"%>
	<div class="mobile-menu-overlay"></div>
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px"> 
				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>Danh sách hoa</h4>
							</div>
						</div>
						<div class="col-md-6 col-sm-12 text-right">
							<!-- <a href="thiet-bi" class="btn btn-info"
								type="button">Làm mới</a>  -->
							<a href="#" id="insert_btn"
								class="btn btn-info " data-toggle="modal"
								data-target="#bd-example-modal-lg" type="button">THÊM HOA MỚI </a>
						</div>
					</div>
				</div>
							<jsp:useBean id="pagedListHolder" scope="request"
							type="org.springframework.beans.support.PagedListHolder" />
						<c:url value="admin/flower.htm" var="pagedLink">
							<c:param name="p" value="~" />
						</c:url>
				 <!-- Simple Datatable start -->
				 <div class="card-box mb-30">
					<hr>
					<div class="pb-20 overflow-auto ">
								<div class="mr-4">
									<form class="d-inline-flex mb-5" style="float:right">
											<input name="searchInput" id="searchInput" class="form-control me-2" type="search"
												placeholder="Nhập tên hoa" aria-label="Search">
											
											<button name="btnsearch" id="searchProduct"
												class="btn btn-outline-info" type="submit">Search</button>
										</form>
								</div>
								
								
						<table class="data-table table stripe hover" style="width: 100%" id="myTable">
								
								
							<thead  class="table-dark">
								<tr>
									<th>HÌNH ẢNH</th>
									<th>TÊN HOA</th>
									<th>GIÁ</th>
									<th>NỘI DUNG</th>
									<th>GIẢM GIÁ</th>
									<th class="">CHỨC NĂNG</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${pagedListHolder.pageList}">
									<tr>
										<td><img src="resources/images/flower/${item.image}"
											style="width: 100px; height: 100px"></td>
										<td>${item.name}</td>
										<td><fmt:formatNumber value="${item.price }" type="currency" currencySymbol="VND"/></td>
										<%-- <td>${item.price} VND</td> --%>
										
										<td class="tdcon"> <p class="contentss"> ${item.contents}</p>   </td>
										<td>${item.discount} %</td>
										<%--  <td><fmt:formatNumber value="${item.discount }" type="percent"/></td> --%>
										
					
										<td class="">
											<div class="row clearfix btn-list">
												<form action="admin/flower/edit/${item.id}.htm">
													<button class="btn btn-info mb-2" type="submit"
														data-toggle="tooltip" data-placement="top" title="Sửa">
														<span class="material-icons ">edit</span>
													</button>
												</form>
												  <form action="admin/flower/delete.htm" method="post">
													<!-- 														Dùng để hiển thị tên lên form  -->
													<input type="hidden" name="name" value="${item.name}" />
													<!-- 														Dùng để gửi về controller  -->
													<input type="hidden" name="id" value="${item.id}" />
													<button type="submit" style="display: none"
														class="submit_del_btn"></button>
												</form> 
												<button class="btn btn-danger delete_btn mb-2"
													data-toggle="tooltip" data-placement="top" title="Xoá"
													type="button">
													<span class="material-icons delete_btn">delete</span>
												</button> 
											</div>
										</td> 
									</tr> 
								</c:forEach>
								
							</tbody>
						</table>
								<div class="mr-4">
									<tg:paging pagedListHolder="${pagedListHolder}"
										pagedLink="${pagedLink}" />
								</div>
					</div>
				</div>
				<!-- Simple Datatable End -->
			</div>
		</div>
	</div>
	<!--======================================================== Dùng để insert ============================================================ -->
	<div class="modal fade bs-example-modal-lg" id="bd-example-modal-lg"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-xl modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<div class="clearfix">
						<div class="pull-left">
							<h3 class="text-info">Thêm hoa mới</h3>
						</div>
					</div>
				</div>
				<div class="modal-body">
					<!-- Default Basic Forms Start -->
					<div class="pd-20 card-box mb-30">
						<form:form action="admin/flower/insert.htm" modelAttribute="flowerNew"
							method="post" enctype="multipart/form-data">
								 <form:input path="id" class="form-control" type="hidden" />  
							 <div class="row">
								<div class="col-sm-12 col-md-6">
									<div class="form-group row">
										<label class="col-sm-12 col-md-3 col-form-label">Chọn
											ảnh</label>
										  <div class="col-sm-12 col-md-8">
											<input name="photo" class="form-control" type="file"
												placeholder="Chọn ảnh hoa" required="required" />
										</div> 
									</div>
								</div>
								<div class="col-sm-12 col-md-6">
									<div class="form-group row">
										<label class="col-sm-12 col-md-3 col-form-label">Tên
											hoa</label>
										<div class="col-sm-12 col-md-8">
											<%-- <form:errors path="name" /> --%>
											<form:input path="name" class="form-control" type="text"
												placeholder="Nhập tên hoa" required="required" />
											
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-12 col-md-3 col-form-label">Giá</label>
										<div class="col-sm-12 col-md-8 input-group mb-0">
											<%-- <form:errors path="price" /> --%>
											<form:input path="price" class="form-control" type="text"
												placeholder="Nhập giá hoa" required="required"/>
												 <div class="input-group-prepend">
										          <div class="input-group-text">VND</div>
										        </div>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-12 col-md-3 col-form-label">Nội dung</label>
										<div class="col-sm-12 col-md-8">
									<%-- 	<form:errors path="contents" /> --%>
											<form:input path="contents" class="form-control" type="text"
												placeholder="Nhập nội dung"/>
												
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-12 col-md-3 col-form-label">Giảm giá</label>
										<div class="col-sm-12 col-md-8 input-group mb-0">
											<form:input path="discount" class="form-control" type="text"
												placeholder="Nhập giảm giá" value="0"/>
												 <div class="input-group-prepend">
										          <div class="input-group-text">%</div>
										        </div>
										</div>
									</div>
									<%--   <div class="form-group row">
										<label class="col-sm-12 col-md-3 col-form-label">Màu</label>
											<div class="col-sm-12 col-md-8">								
												  <form:select class="form-control" path="colors"
													style="width: 100%; height: 60px;" >
													<form:options  items="${getListCL}" itemValue="id"
														itemLabel="name"/>
												</form:select>  
											</div>
										</div>
										<div class="form-group row">
										<label class="col-sm-12 col-md-3 col-form-label">Danh mục</label>
											<div class="col-sm-12 col-md-8">								
												  <form:select class="form-control" path="categories"
													style="width: 100%; height: 60px;" >
													<form:options items="${getListCA}" itemValue="id"
														itemLabel="category"/>
												</form:select>  
											</div>
										</div>   --%>
									</div> 
								</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Đóng</button>
								<button type="submit" class="btn btn-info">Thêm</button>
							</div>
						</form:form>
					</div>  
					<!-- Default Basic Forms Start -->
				</div>
			</div>
		</div>
	</div>
	<button hidden="true" id="update_modal_btn" data-toggle="modal"
		data-target="#bd-edit-modal-lg"></button>
	<!--======================================================== Dùng để update ============================================================ -->
 	<div class="modal fade bs-example-modal-lg" id="bd-edit-modal-lg"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body">
					<!-- Default Basic Forms Start -->
					<div class="pd-20 card-box mb-30">
						<div class="clearfix">
							<div class="pull-left">
								<h4 class="text-blue h4">Sửa thông tin</h4>
							</div>
						</div>
						  <form:form action="admin/flower/update.htm" modelAttribute="flowerEdit"
							method="post" enctype="multipart/form-data">
							<form:input path="id" class="form-control" type="hidden" /> 
							<div class="row">
								<div class="col-sm-12 col-md-6">
									<div class="form-group row">
											
										<label class="col-sm-12 col-md-3 col-form-label">Chọn
											ảnh</label>
										 <div class="col-sm-12 col-md-8">
											<img src="resources/images/flower/${flowerEdit.image}" /> <input
												name="photo" class="form-control" type="file"
												placeholder="Chọn ảnh "/>
											<!-- <input name="photo" class="form-control"
												style="display: none" /> -->
										</div> 
									</div>

								</div>
								<div class="col-sm-12 col-md-6">
									
									<div class="form-group row">
										<label class="col-sm-12 col-md-3 col-form-label">Tên
											hoa</label>
										<div class="col-sm-12 col-md-8">
											<form:input path="name" class="form-control" type="text"
												placeholder="Nhập tên hoa" required="required"/>
																						<form:errors path="name" />
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-12 col-md-3 col-form-label">Giá</label>
										<div class="col-sm-12 col-md-8 input-group mb-0">
											<form:input path="price" class="form-control" type="text"
												placeholder="Nhập giá" required="required"/>
												
											 <div class="input-group-prepend">
										          <div class="input-group-text">VND</div>
										        </div>
																						<form:errors path="price" />
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-12 col-md-3 col-form-label">Nội dung</label>
										<div class="col-sm-12 col-md-8">
											<form:input path="contents" class="form-control" type="text"
												placeholder="Nhập nội dung" />
												
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-12 col-md-3 col-form-label">Giảm giá</label>
										<div class="col-sm-12 col-md-8 input-group mb-0">
											<form:input path="discount" class="form-control" type="text"
												placeholder="giảm giá" />
												 <div class="input-group-prepend">
										          <div class="input-group-text">%</div>
										        </div>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Đóng</button>
								<button type="submit" class="btn btn-info">Cập nhật</button>
							</div>
						</form:form> 
					</div>
					<!-- Default Basic Forms Start -->
				</div>
			</div>
		</div>
	</div>
	<!-- js -->
	<%@include file="/resources/admin/common/footer.jsp"%>
	<!-- DÙNG ĐỂ SHOW FORM EDIT -->
	<c:if test="${formEdit}">
		<script type="text/javascript">
			$(document).ready(function() {
				$('#update_modal_btn').click();
				console.log("Hiển thị edit form")
			});
		</script>
	</c:if>
	<!-- DÙNG ĐỂ SHOW FORM DELETE -->
	<c:if test="${form_del}">
		<script type="text/javascript">
			$(document).ready(function() {
				$('#update_modal_btn').click();
				console.log("Hiển thị del form")
			});
		</script>
	</c:if>
	<!-- HIỂN THỊ THÔNG BÁO THÊM THÀNH CÔNG / THẤT BẠI -->
	<c:if test="${insert || update || delete}">
		<script type="text/javascript">
			$(document).ready(function() {
				show_success();

			});
		</script>
	</c:if>
	<!-- HIỂN THỊ THÔNG BÁO KHI SAI ĐỊNH DẠNG DỮ LIỆU LÚC THÊM -->
	<c:if test="${them_saidinhdang}">
		<script type="text/javascript">
			$(document).ready(function() {
				$('#insert_btn').click();
				console.log("thêm sai định dạng")

			});
		</script>
	</c:if>
	<!-- HIỂN THỊ THÔNG BÁO KHI SAI ĐỊNH DẠNG DỮ LIỆU LÚC SỬA -->
	<c:if test="${sua_saidinhdang}">
		<script type="text/javascript">
			$(document).ready(function() {
				$('#update_modal_btn').click();
				console.log("Sửa sai định dạng")
			});
		</script>
	</c:if>
	<!-- HIỂN THỊ THÔNG BÁO CÓ LỖI XẢY RA-->
	<c:if test="${insert == false || update == false || delete == false}">
		<script type="text/javascript">
			$(document).ready(function() {	
				show_error();
			});
		</script>
	</c:if>
	<script type="text/javascript">
		//LOAD TABLE 
		/*  $('#myTable').DataTable();  */
		
		
		//NẾU CLICK NÚT XOÁ
		$('#myTable').on('click','.delete_btn',function(){
			let ten = $(this).parent().find("input[name='name']").val();
			let delete_btn = $(this).parent().find('.submit_del_btn');
			Swal.fire({
				title: 'Xoá [' + ten + '] ?',
				text: "Dữ liệu không thể khôi phục sau thao tác này!",
				icon: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: 'Xoá',
				cancelButtonText: 'Huỷ'
			}).then((result) =>{
				if (result.isConfirmed) {
					delete_btn.click();
				}
			})
		});
		
		//NẾU CLICK NÚT KHOÁ
		$('#lock_btn').on('click',function(){
			if(confirm_lock()){
				console.log(1)
			}
			console.log("locked")
		});
		
		
		//THÔNG BÁO THÀNH CÔNG
		function show_success(content="Thao tác") {
			Swal.fire({
				title: 'THÀNH CÔNG',
				text: content+" thành công!",
				icon: 'success',
			})
		};
		
		//THÔNG BÁO LỖI
		function show_error(content="Thao tác") {
			Swal.fire({
				title: 'THẤT BẠI',
				text: content+" thất bại!",
				icon: 'error',
			})
		};
		
		/* function trimText(str ,wordCount){
			var strArray = str.split(' ');
	    var subArray = strArray.slice(0, wordCount);
	    var result = subArray.join(" ");
	    return result + '...';
		}

		var str = $('.contentss').text();
		var result = trimText(str, 10);
		 $('.contentss').text(result);  */
	</script>  
	 
</body>
</html>