<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link href="/resources/css/page/getBook.css" rel="stylesheet">
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>상품 상세 페이지</title>
</head>
<body class="mt-3">

<div>BOOK_NO : ${book.book_no }</div>
<div class="mt-5"><h1>${book.title }</h1></div>

<section class=py-5>
<div class="container">
<div class='row mb-5 mt-5'>
  <div class='col-4'>
  <img alt="${book.title }" src="${book.book_img }" ></div>
  <div class='col-8'>
  <ul>
  	<li>
  	 	<div id="detail-text"><i class="bi bi-arrow-right-circle"></i> 작가 </div>
  	 	<div id="detail-value">${book.author }</div>
  	</li>
  	<li>
  		<div id="detail-text">출판사</div>
  		<div id="detail-value"> ${book.publisher }</div>
  	</li>
  	<li>
  		<div id="detail-text">가격</div>
  		<div id="detail-value">${book.book_price}</div>
  	</li>
  	<li>
  		<div id="detail-text">출판일 </div>
  		<div id="detail-value">${strdate} </div>
  	</li>
  	<li>
  		<div id="detail-text">ISBN 번호</div>
  		<div id="detail-value">${book.isbn_no }</div>
  	</li>
  	<li>
  		<div id="detail-text">국내/해외 구분 </div>
  		<div id="detail-value" > ${book.book_category}</div>
  	</li>
  	<li>
  		<div id ="detail-text">수량</div>
  		<div id="detail-value"><input class="form-control text-center me-3" id="inputQuantity" type="number" value="1"></div>
  	</li>
  </ul>
  </div>
</div>
<h3><i class="bi bi-info-circle"></i> 책 소개</h3>
<p class="mt-5">${book.book_content }</p>
</div>
</section>

<div class="mt-5">
	<h3 class="mb-3"><i class="bi bi-book"></i> 리뷰</h3>
	<textarea rows="3" cols="150" name="review_content" placeholder="배송 문의나 욕설 인신공격성 글은 상품 페이지에서 노출 제외처리됩니다."></textarea>
	<button class="text-center btn btn-outline-dark flex-shrink-0" name="btn_review">등록</button>
</div>

	<div id="reviewList">
	<c:if test="${empty review}"  >
		<div class="text-center mt-5"> 작성된 리뷰가 없습니다. </div>
	</c:if>
		<c:forEach var="review" items="${review}" varStatus="status">
		<ul>
			<li>
				<div class="flex mt-4">
					<div class="d-flex">
						<i class="bi bi-person-circle fs-2"></i>
						<!-- 별점  -->
						<div class="ms-2 d-flex">
						<c:forEach begin="1" end="${review.review_star}">
							<div class="bi-star-fill fs-5">  </div>
						</c:forEach>
						</div>
						<div class="ms-5"> ${review.review_content} </div>
					</div>
					<div class="d-flex">
						<div>${review.user_no} </div>
						<div> ${review.review_date} </div>
						<div> 추천 (${review.review_recommend}) </div>
					</div>
					<div class="mt-2"><button class="text-center btn btn-outline-dark flex-shrink-0 btn-xs" ><i class="bi bi-hand-thumbs-up"></i> 추천하기</button> </div>
					
				</div> 
			<li>
		</ul>
		</c:forEach>
	</div>
<div class="mt-5" id="btn-buy">
	<button class="text-center btn btn-outline-dark flex-shrink-0  btn-lg me-3">
		<i class="bi-cart-fill me-1"></i>장바구니
	</button>
	<button class="text-center btn btn-outline-dark flex-shrink-0  btn-lg">
		<i class="bi bi-basket2"></i> 바로구매
	</button>
</div>

</body>
</html>