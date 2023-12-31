<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/taglib.jsp"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FilmViet - Danh Sách Video</title>

<%@ include file="/views/admin/common/head.jsp"%>
</head>

<body>
	<!--  Body Wrapper -->
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">

		<!-- Sidebar Start -->
		<%@ include file="/views/admin/common/assied.jsp"%>
		<!--  Sidebar End -->

		<!--  Main wrapper -->
		<div class="body-wrapper">

			<!--  Header Start -->
			<%@ include file="/views/admin/common/header.jsp"%>
			<!--  Header End -->

			<div class="container-fluid">
				<div class="card">
					<div class="card-body">
						<a class="btn btn-primary float-end" href="videoadd" role="button">
							<i class="ti ti-file-plus"></i> Phim mới
						</a>
						<h5 class="card-title fw-semibold mb-4 mt-2">Danh Sách Video
							Đang Công Chiếu</h5>
						<div class="card">
							<div class="card-body">
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">Poster</th>
												<th scope="col">Tên phim</th>
												<th scope="col">Thể loại</th>
												<th scope="col">Giá tiền</th>
												<th scope="col">Hành động</th>
											</tr>
										</thead>
										<tbody>


											<c:forEach items="${videos}" var="video" varStatus="loop">
												<tr>
													<td scope="row">${loop.index + 1}</td>
													<td><img src="<c:url value='${video.poster}'/>"
														class="img-fluid" width="250px"></td>
													<td>${video.title}</td>
													<td width="100px">${video.theloai}</td>
													<td><c:set var="amount" value="${video.price}" /> <c:set
															var="locale" value="vi_VN" /> <fmt:setLocale
															value="${locale}" /> <fmt:formatNumber
															value="${amount}" type="currency"
															currencyCode="VND" /></td>
													<td>
														<div class="btn-group" role="group">
															<button class="btn btn-primary ms-2 rounded-2"
																onclick="editVideoGetHref('${video.href}')">Sửa</button>
															<button class="btn btn-danger ms-2 rounded-2"
																onclick="deleteVideo('${video.href}')">Xoá</button>
															<button type="button" data-bs-toggle="modal"
																data-bs-target="#modalLiveDemo${loop.index}"
																class="btn btn-success ms-2 rounded-2">Xem</button>
														</div>
													</td>
												</tr>

												<!-- Modal -->
												<div class="modal fade" id="modalLiveDemo${loop.index}"
													tabindex="-1" aria-labelledby="exampleModalLabel"
													aria-hidden="true">
													<div class="modal-dialog modal-xl modal-dialog-centered">
														<div class="modal-content">
															<iframe id="player" width="100%" height="600"
																src="https://www.youtube.com/embed/${video.href}"
																frameborder="0" allowfullscreen></iframe>
														</div>
													</div>
												</div>

												<form id="videoForm" action="videodelete" method="post">
													<input type="hidden" name="confirmation" id="confirmDelete"
														value="false" /> <input type="hidden" id="videoHref"
														name="href">
												</form>

												<form id="editForm" action="videoedit" method="get">
													<input type="hidden" id="videoEditHref" name="href">
												</form>

											</c:forEach>

										</tbody>
									</table>
								</div>
							</div>
						</div>

						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<c:if test="${currenPage == 1}">
									<li class="page-item text-secondary disabled"><a
										class="page-link" href="#" aria-disabled="true"> <i
											class="ti ti-chevron-left"></i>
									</a></li>
								</c:if>

								<c:if test="${currenPage > 1}">
									<li class="page-item text-secondary"><a class="page-link"
										href="videoviews?page=${currenPage - 1}" aria-disabled="true">
											<i class="ti ti-chevron-left"></i>
									</a></li>
								</c:if>

								<c:forEach varStatus="i" begin="1" end="${maxPage}">
									<li
										class="page-item text-secondary ${currenPage == i.index ? 'active' : ''}">
										<a class="page-link"
										href="<c:url value='videoviews?page=${i.index}'/>">${i.index}</a>
									</li>
								</c:forEach>

								<c:if test="${currenPage == maxPage}">
									<li class="page-item text-secondary disabled"><a
										class="page-link" href="#" aria-disabled="true"> <i
											class="ti ti-chevron-right"></i>
									</a></li>
								</c:if>

								<c:if test="${currenPage < maxPage}">
									<li class="page-item text-secondary"><a class="page-link"
										href="videoviews?page=${currenPage + 1}" aria-disabled="true">
											<i class="ti ti-chevron-right"></i>
									</a></li>
								</c:if>
							</ul>
						</nav>

					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/views/admin/common/footer.jsp"%>

	<%
	Boolean addVideoSuccess = (Boolean) session.getAttribute("addVideoSuccess");

	if (addVideoSuccess != null) {
		if (addVideoSuccess) {
	%>
	<script>
		showSwalAlert('success', 'Thêm video thành công !');
	</script>
	<%
	} else {
	%>
	<script>
		showCenterAlert('error', 'Thất Bại !', 'Video đã tồn tại trong cơ sở dữ liệu !');
	</script>
	<%
	}
	session.removeAttribute("addVideoSuccess");
	}
	%>

	<script type="text/javascript">
		// lấy href	sử dụng cho edit video
		function editVideoGetHref(href) {
			document.getElementById("videoEditHref").value = href;
			document.getElementById("editForm").submit();
		}
	</script>

</body>

</html>