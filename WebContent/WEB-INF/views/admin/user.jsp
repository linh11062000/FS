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
								<h4>Danh sách tài khoản</h4>
							</div>
						</div>
						<div class="col-md-6 col-sm-12 text-right">
							<a href="#" id="insert_btn" class="btn btn-info"
								data-toggle="modal" data-target="#bd-example-modal-lg"
								type="button">THÊM TÀI KHOẢN </a>
						</div>
					</div>
				</div>
				
								 <jsp:useBean id="pagedListHolder" scope="request"
								type="org.springframework.beans.support.PagedListHolder" />
							<c:url value="admin/user.htm" var="pagedLink">
								<c:param name="p" value="~" />
							</c:url> 
				<!-- Simple Datatable start -->
				<div class="card-box mb-30">
					<div class="mr-4">
							<form class="d-inline-flex mb-5" style="float:right">
								<input name="searchInput" id="searchInput" class="form-control me-2" type="search"
									placeholder="Nhập họ tên" aria-label="Search">
								
								<button name="btnsearch" id="searchProduct"
									class="btn btn-outline-info" type="submit">Search</button>
								</form>
					</div>
					<hr>
					<div class="mb-3" style=" color: blue">Thông Báo: ${message}</div>
					<div class="pb-20">
						<table class="data-table table stripe hover nowrap" id="myTable">
							<thead class="bg-dark color-white">
								<tr>
									<th class="table-plus datatable-nosort">HỌ TÊN</th>
									<th>EMAIL</th>
									<th>SỐ ĐIỆN THOẠI</th>
									<th>ĐỊA CHỈ</th>
									<th>MẬT KHẨU</th>
									<th class="datatable-nosort">Hành động</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${pagedListHolder.pageList}" varStatus="row">
									<tr>
										<td class="table-plus">${item.name}</td>
										<td>${item.email}</td>
										<td>${item.phone}</td>
										<td>${item.address}</td>
										<td>******</td>
										<%-- <td>${item.password}</td> --%>
										
										<td>
											<div class="row clearfix">
												<div class="col ">
													<form action="admin/user/edit/${item.id}.htm">
														<button class="btn btn-info mb-2" type="submit"
															data-toggle="tooltip" data-placement="top" title="Sửa">
															<i class="material-icons">edit</i>
														</button>
														<!--  -->
													</form>
												</div>
												<div class="col">
													<form action="admin/user/delete.htm" method="post" hidden="true">
														<!-- Dùng để hiển thị tên lên form -->
														<input type="hidden" name="name" value="${item.name}" />
														<!-- Dùng để gửi về controller -->
														<input type="hidden" name="id" value="${item.id}" />
														<button type="submit" class="submit_del_btn"></button>
													</form>
													<button class="btn btn-danger delete_btn"
														data-toggle="tooltip" data-placement="top" title="Xoá"
														type="button">
														<i class="material-icons">delete</i>
													</button>
												</div>
												
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
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body">
					<!-- Default Basic Forms Start -->
					<div class="pd-20 card-box mb-30">
						<div class="clearfix">
							<div class="pull-left">
								<h4 class="text-blue h4">Thêm tài khoản mới</h4>
							</div>
						</div>
						<form:form action="admin/user/insert.htm" modelAttribute="userNew"
							method="post">
							<div class="form-group row">
								<label class="col-sm-12 col-md-2 col-form-label">Họ tên
									</label>
								<div class="col-sm-12 col-md-10">
									<form:input path="name" class="form-control" type="text"
										placeholder="Nhập họ tên" required="required"/>
									<form:errors path="name" />
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-12 col-md-2 col-form-label">Email
									</label>
								<div class="col-sm-12 col-md-10">
									<form:input path="email" class="form-control" type="text"
										placeholder="Nhập email" required="required"/>
									<form:errors path="email" />
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-12 col-md-2 col-form-label">Số điện thoại
									</label>
								<div class="col-sm-12 col-md-10">
									<form:input path="phone" class="form-control" type="text"
										placeholder="Nhập số điện thoại" required="required"/>
									<form:errors path="phone" />
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-12 col-md-2 col-form-label">Địa chỉ</label>
								<div class="col-sm-12 col-md-10">
									<form:input path="address" class="form-control" type="text"
										placeholder="Nhập địa chỉ" required="required"/>
									<form:errors path="address" />
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-12 col-md-2 col-form-label">Mật khẩu</label>
								<div class="col-sm-12 col-md-10">
									<form:input path="password" class="form-control" type="text"
										placeholder="Nhập mật khẩu" required="required"/>
									<form:errors path="password" />
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
								<h4 class="text-blue h4">Sửa thông tin user</h4>
							</div>
						</div>
						<form:form action="admin/user/update.htm" modelAttribute="userEdit"
							method="post">
							<form:input path="id" class="form-control" type="hidden" /> 
							<div class="form-group row">
								<label class="col-sm-12 col-md-2 col-form-label">Họ tên
									</label>
								<div class="col-sm-12 col-md-10">
									<form:input path="name" class="form-control" type="text"
										placeholder="Nhập họ tên" required="required"/>
									<form:errors path="name" />
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-12 col-md-2 col-form-label">Email
									</label>
								<div class="col-sm-12 col-md-10">
									<form:input path="email" class="form-control" type="text"
										placeholder="Nhập địa chỉ email" required="required"/>
									<form:errors path="email" />
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-12 col-md-2 col-form-label">Số điện thoại
									</label>
								<div class="col-sm-12 col-md-10">
									<form:input path="phone" class="form-control" type="text"
										placeholder="Nhập số điện thoại" required="required"/>
									<form:errors path="phone" />
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-12 col-md-2 col-form-label">Địa chỉ
									</label>
								<div class="col-sm-12 col-md-10">
									<form:input path="address" class="form-control" type="text"
										placeholder="Nhập địa chỉ" required="required"/>
									<form:errors path="address" />
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-12 col-md-2 col-form-label">Mật khẩu
									</label>
								<div class="col-sm-12 col-md-10">
									<input class="form-control" type="text" name="newpass" placeholder="Nhập mật khẩu mới">
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Đóng</button>
								<button type="submit" class="btn btn-info">Sửa</button>
							</div>
						</form:form>
					</div>
					<!-- Default Basic Forms Start -->
				</div>
			</div>
		</div>
	</div> 
	<!-- <script>
		let input = document.getElementById('maThietbi_modal');
		let btnTest = document.querySelector('.btn-test');

		btnTest.addEventListener('click', function() {

			console.log(input.classList);
		})
	</script> -->
	<c:if test="${action.equals('edit') }">
	</c:if>
	<!-- js -->
	<%@include file="/resources/admin/common/footer.jsp"%>
	<!-- DÙNG ĐỂ SHOW FORM EDIT -->
	<c:if test="${form_edit}">
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
		/* $('#myTable').DataTable(); */
		
		
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
			}).then((result) => {
				//Nếu nút đồng ý được nhấn
				if (result.isConfirmed) {
					delete_btn.click();
				}
			})
		})
		
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
	</script>
</body>
</html>