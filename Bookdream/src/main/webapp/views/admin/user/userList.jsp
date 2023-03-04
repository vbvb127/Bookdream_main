<%@page import="com.spring.bookdream.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Favicon -->
<link rel="apple-touch-icon" sizes="180x180"
	href="/resources/images/favicon/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32"
	href="/resources/images/favicon/favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/favicon/favicon-16x16.png" />
<link rel="manifest" href="/resources/images/favicon/site.webmanifest" />
<link rel="stylesheet" href="/resources/css/styles.css" />
<link rel="stylesheet" href="/resources/css/admin_screen.css" />
<link rel="stylesheet" href="/resources/css/admin_user.css" />
<title>사용자 관리</title>
</head>
<body class="admin_body">
		<jsp:include page="/views/inc/admin_aside.jsp"/>
		
	<main class="container-fluid main_container"> <header
		class="shadow-sm">
		<nav class="navbar navbar-expand-xl navbar-light bg-white">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">관리자</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo2"
					aria-controls="navbarTogglerDemo2" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse show" id="navbarTogglerDemo2">
					<ul class="navbar-nav me-auto mb-2 mb-xl-0">
						<li class="nav-item"><a class="nav-link" aria-current="page"
							href="#">Home</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/views/main/main.jsp">Logout</a></li>
						<li class="nav-item"><a class="nav-link disabled" href="#"
							tabindex="-1" aria-disabled="true">Disabled</a></li>
					</ul>
					<form class="d-flex">
						<select class="form-select-user-search" id="user_select" name="user_select">
							<option selected value="all">전체</option>
							<option value="user_no">사용자 번호</option>
							<option value="user_id">아이디</option>
							<option value="user_password">비밀번호</option>
							<option value="user_email">이메일</option>
							<option value="user_name">이름</option>
							<option value="flatform_type">플랫폼 타입</option>
						</select>
						<input class="form-control me-2" type="search" id="searchUserKeyword" placeholder="Search" aria-label="Search" onkeypress="show_name(event)" />
 						<input type="text" style="display:none;">
 						<button class="btn btn-outline-success" type="button" onclick="searchUser()"><i class="bi bi-search"></i></button>
					</form>
				</div>
			</div>
		</nav>
	</header> <!-- Section Start -->
	<div class="section_div">
		<section class="admin-user-mngmn">
			<div class="card">
				<div class="card-body admin-user-mngmn-body">
					<h5 class="card-title admin-user-mngmn-title">사용자 관리</h5>
					<div class="admin-user-mngmn-cotent">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">NO</th>
									<th scope="col">아이디</th>
									<th scope="col">비밀번호</th>
									<th scope="col">이름</th>
									<th scope="col">전화번호</th>
									<th scope="col">이메일</th>
									<th scope="col">포인트</th>
									<th scope="col">레벨</th>
									<th scope="col">블랙리스트</th>
									<th scope="col">타입</th>
									<th scope="col">관리</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${userList}" var="userList">
									<tr class="userList-row">
										<th scope="row">${ userList.user_no }
										</td>
										<td>${ userList.user_id }</td>
										<td>${ userList.user_password }</td>
										<td>${ userList.user_name }</td>
										<td>${ userList.user_tel }</td>
										<td>${ userList.user_email }</td>
										<td>${ userList.user_point }</td>
										<td>${ userList.user_level }</td>
										<td>${ userList.blacklist_yn }</td>
										<td>${ userList.flatform_type }</td>
										<td>
											<!-- Button trigger modal -->
											<button type="button" class="btn" data-bs-toggle="modal"
												data-bs-target="#getUserModal">더보기</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- GetUserModal -->
						<div class="modal fade" id="getUserModal" tabindex="-1">
							<div class="modal-dialog modal-dialog-centered modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">회원 정보</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<div class="admin-user-modal-body">
											<div class="admin-user-modal-profile-box">
												<div class="admin-user-modal-profile">
													<i class="fa-solid fa-user fa-2x admin-user-modal-icon"></i>
												</div>
												<span id="getUSerByNoTitle"></span>
											</div>
											<div>
												<table class="table admin-user-modal-table">
													<thead>
														<tr>
															<th scope="col">NO</th>
															<th scope="col">이름</th>
															<th scope="col">전화번호</th>
															<th scope="col">이메일</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td id="getUSerByNoNo"></td>
															<td id="getUSerByNoName"></td>
															<td id="getUSerByNoTel"></td>
															<td id="getUSerByNoEmail"></td>
														</tr>
														<tr>
															<th scope="col">포인트</th>
															<th scope="col">레벨</th>
															<th scope="col">블랙리스트</th>
															<th scope="col">타입</th>
														</tr>
														<tr>
															<td id="getUSerByNoPoint"></td>
															<td id="getUSerByNoLevel"></td>
															<td id="getUSerByNoBlack"></td>
															<td id="getUSerByNoType"></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<nav class="nav nav-tabs" id="nav-tab" role="tablist">
											<a class="nav-link active" id="nav-home-tab"
												data-bs-toggle="tab" href="#nav-home" role="tab"
												aria-controls="nav-home" aria-selected="true">회원이 쓴 글</a> <a
												class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
												href="#nav-profile" role="tab" aria-controls="nav-profile"
												aria-selected="false">블랙리스트</a>
										</nav>
										<div class="tab-content admin-user-modal-nav"
											id="nav-tabContent">
											<div
												class="tab-pane fade show active adimn-user-modal-nav-content"
												id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
												@유저 댓글 리뷰 확인</div>
											<div class="tab-pane fade adimn-user-modal-nav-content"
												id="nav-profile" role="tabpanel"
												aria-labelledby="nav-profile-tab">
												<div class="blacklist-content">
													<span>해당 유저를 블랙리스트로 등록 또는 해제 하시겠습니까?</span> 
													<span>'블랙리스트'는 리뷰, 댓글 등 본사가 제공하는 서비스를 이용할 수 없습니다.</span>
													<div>
														<button type="button" id="blackListChange" class="btn btn-danger">블랙리스트 수정</button>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>

						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<li class="page-item"><a class="page-link"
									onclick="return prev()" tabindex="-1"><i class="fas fa-angle-left" aria-hidden="true"></i></a></li>
								<c:forEach begin="1" end="${ pageNum }" var="num">
									<input type="hidden" id="SearchUserKeyword" value="${SearchUserKeyword }">
											<li class="page-item"><a class="page-link"
										href="userListPage.do?num=${num }&SearchUserKeyword=${SearchUserKeyword}">${ num }</a></li>
								</c:forEach>
								<li class="page-item"><a class="page-link"
									onclick="return next()">
									<i class="fas fa-angle-right" aria-hidden="true"></i>
									</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</section>
	</div>
	<!-- Section End --> </main>

	<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js"
		crossorigin="anonymous"></script>

	<script type="text/javascript" src="/resources/js/admin_userList.js"></script>

</body>
</html>