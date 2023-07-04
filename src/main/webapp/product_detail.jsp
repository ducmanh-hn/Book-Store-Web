<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/product_detail.css">
    <title>Book Detail</title>
</head>
<body>
<%
	DecimalFormat formatter = new DecimalFormat("###,###,###");
	request.setAttribute("formatter", formatter); 
%>
    <div class="header">
		<img src="image/images.png" alt="" class="logo">
		<form class="search" action="search" method="get">
			<img src="image/search.png" alt="" class="icon icon-search">
			<input type="search" name="info-search" id="search-input" placeholder="Bạn tìm gì hôm nay">
			<input type="submit" value="Tìm  kiếm"  id="btn-search">
		</form>
		<a href="home">
			<div class="home">
				<img src="image/home.png" alt="" class="icon">
				<span>Trang chủ</span>
			</div>
		</a>
		<div class="account">
			<img src="image/account3.png" alt="" class="icon" >
			<c:if test="${sessionScope.user ==null}">
				<span>Tài khoản
					<ul class="subnav">
						<li><a href="account.jsp">Thông tin tài khoản </a></li>
						<li><a href="login.jsp" >Đăng nhập</a></li>
					</ul>
				</span> 
			</c:if>
			<c:if test="${sessionScope.user !=null}">
				<span>${user.name}
					<ul class="subnav">
						<li><a href="account.jsp">Thông tin tài khoản </a></li>
						<li><a href="login.jsp" >Đăng xuất</a></li>
					</ul>
				</span> 
			</c:if>
		</div>
		<div class="cart">
			<a href="cart.jsp">
				<img src="image/cart.png" alt="" class="icon">
				<c:if test="${sessionScope.user !=null}">
					<span class="amount-in-cart">${amount }</span>
				</c:if>
				<c:if test="${sessionScope.user ==null}">
					<span class="amount-in-cart">0</span>
				</c:if>
			</a>
		</div>
	</div>
	<!-- ------------------------------------ -->
	<div class="quote-wrapper">
		<div class="quote">
		</div>
		<div class="quote-content">
			<p>Một kẻ không đọc sách chẳng hơn gì kẻ không biết đọc.</p>
			<span>--Mark Twain--</span>
		</div>
	</div>
	<!-- ------------------------------------ -->
    <div class="body">
        <div class="main">
            <div class="thumbnail">
                <div class="big">
                    <img class="main-picture" src="${book.picture}" alt="Good book">
                </div>
                <div class="smalls">
                	<c:forEach items="${listG }" var="g">
	                    <img alt="Good book" class="sub-picture js-sub-picture" src="${g.thumbnail }" >
                	</c:forEach>
                </div>
            </div>
            <div class="separator"></div>
            <!--  separator   -->
            <div class="detail">
                <div class="header-detail">
                    <p>Tác giả: <span>${book.author} </span></p>
                    <p class="author">${book.name }</p>
                    <p class="des">(250 đánh giá) | Đã bán ${book.sold_amount }</p>
                </div>
                <form class="body-detail" action="addToCart" method="post">
                    <div class="price">
                        <span>${formatter.format(book.price) } <u>đ</u></span>
                        <del class="discount-price">${formatter.format(book.discount_price) }<u> đ</u></del>
                    </div>
					<div>
						<p> 
							<img src="image/loa_product_page.png" alt="" style="width:18px;height:18px">
							Bạn sẽ được freeship 15.000₫ cho đơn từ 149.000₫.
						</p>
					</div>
					<div class="amount">
						<p style="margin-bottom: 8px;">Số lượng</p>
						<input type="button" value="-" class="btn-minus" onclick="minus()">
						<input id="text-amount" type="number" style="padding-left: 16px;" value="1" min="0" name="pd_amount">
						<input type="button" value="+" class="btn-plus" onclick="plus()">
					</div>
					<input type="hidden" name="book_id" value="${book.book_id }">
					<input type="hidden" name="from" value="product_detail">
	
						<c:if test="${sessionScope.user !=null}">
							<input type="submit" class="btn-buy"  onclick="alert('Đã thêm sản phẩm vào giỏ hàng')" value="Chọn mua">
						</c:if>
						<c:if test="${sessionScope.user ==null}">
							<input type="submit" class="btn-buy"  onclick="Bạn chưa đăng nhập tài khoản')" value="Chọn mua">
							<!-- <button class="btn-buy"  onclick="alert('Bạn chưa đăng nhập tài khoản')">Chọn mua</button> -->
						</c:if>
					</a>
                </form>
            </div>
			<div class="bonus">
				<img src="image/quang_cao.webp" alt="">
				<img src="image/quang_cao2.jpg" alt="">
			</div>
        </div>
        <!-- =========================== -->
        <div class="slider">
			<h2>Sản Phẩm Tương Tự</h2>
			<div class="cards">
				<c:forEach items="${listSimilar }" var="lS">
					<div class="card" title="${lS.name }">
						<img class="card-image" src="${lS.picture }" alt="">
						<div class="info">
							<p class="card-price">${formatter.format(lS.price) } ₫</p>
							<h3 class="card-title">${lS.name }</h3>
							<p style="font-size: 14px;">Đã bán: ${lS.sold_amount }</p>
						</div>
					</div>
					
				</c:forEach>
				<!-- <div class="card" title="Anabasis - Hồi Ký Viễn Chinh Xứ Ba Tư - Xenophon">
					<img class="card-image" src="https://salt.tikicdn.com/cache/280x280/ts/product/a0/d3/e3/95235d1910f090491a8d742cacdd21cc.jpeg.webp" alt="">
					<div class="info">
						<p class="card-price">279.000 ₫</p>
						<h3 class="card-title">Anabasis - Hồi Ký Viễn Chinh Xứ Ba Tư - Xenophon</h3>
						<p style="font-size: 14px;">Đã bán: 100</p>
					</div>
				</div>
				<div class="card"></div>
				<div class="card"></div>
				<div class="card"></div>
				<div class="card"></div> -->
			</div>
        </div>
        <!-- =========================== -->
        <div class="description">
			<h2 class="title">Mô tả sản phẩm</h2>
			<p class="des" style="white-space: pre-line">${book.description }</p>
        </div>
        <!-- =========================== -->
        <div class="feedback">
			<h2 class="title">Đánh Giá - Nhận Xét Từ Khách Hàng</h2>
        </div>
    </div>
    <!-- ------------------------------------ -->
    <div class="footer">
		<div class="service">
			<h3>Hỗ trợ khách hàng</h3>
			<p>Hotline: 1900-6035</p>
			<p>(1000 đ/phút, 8-21h kể cả T7, CN)</p>
			<p>Các câu hỏi thường gặp</p>
			<p>Gửi yêu cầu hỗ trợ</p>
			<p>Hướng dẫn đặt hàng</p>
			<p>Phương thức vận chuyển</p>
			<p>Chính sách đổi trả</p>
			<p>Hướng dẫn trả góp</p>
			<p>Chính sách hàng nhập khẩu</p>
			<p>Hỗ trợ khách hàng: hotro@tiki.vn</p>
			<p>Báo lỗi bảo mật: security@tiki.vn</p>
		</div>
		<div class="about-us">
			<h3>Về chúng tôi</h3>
			<p>Giới thiệu Tiki</p>
			<p>Tiki blog</p>
			<p>Tuyển  dụng</p>
			<p>Chính sách bảo mật thanh toán</p>
			<p>Chinh sách bảo mật thông tin cá nhân</p>
			<p>Chính sách giải quyết khiểu nại</p>
			<p>Điều khoản sử dụng</p>
			<p>Giới thiệu Tiki xu</p>
			<p>Bán hàng doanh nghiệp</p>
			<p>Điều kiện vận chuyển</p>
			<p>Tiếp thị liên kết cùng Tiki</p>
		</div>
		<div class="address">
			<h3>Trụ sở</h3>
			<p>Trụ sở chính: Tòa nhà Viettel, Số 285, đường Cách Mạng Tháng 8, phường 12, quận 10, Thành phố Hồ Chí Minh.</p>
			<p>Tiki nhận đặt hàng trực tuyến và giao hàng tận nơi, chưa hỗ trợ mua và nhận hàng trực tiếp tại văn phòng hoặc trung tâm xử lý đơn hàng.</p>
			<p>Giấy chứng nhận Đăng ký Kinh doanh số 0309532909 do Sở Kế hoạch và Đầu tư Thành phố Hồ Chí Minh cấp lần đầu ngày 06/01/2010 và sửa đổi lần thứ 23 ngày 14/02/2022.</p>
			<p>© 2022 - Bản quyền của Công ty TNHH Ti Ki</p>
		</div>
	</div>
	<input type="hidden" value="${addSuccess }" id="addSuccess">
	<script>

	
		var amount = document.getElementById("text-amount")
		function plus(){
			amount.value = parseInt(amount.value)+1
		}
		function minus(){
			if(parseInt(amount.value)>=2)
			amount.value = parseInt(amount.value)-1
		}
		// ====== Handle thumbnail===============================
		var sub_pictures = document.getElementsByClassName("js-sub-picture")
		var main_picture = document.getElementsByClassName("main-picture")
		for(var i=0;i<sub_pictures.length;i++){
			sub_pictures[i].addEventListener("click",function(){
				console.log(this)
				main_picture[0].src = this.src
			})
		}
	</script>
</body>
</html>