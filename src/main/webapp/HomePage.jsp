<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Home</title>
	<link rel="stylesheet" href="css//HomePage.css">
</head>
<body>
	<div class="header">
		<img src="image/images.png" alt="" class="logo">
		<form class="search" action="search" method="get">
			<img src="image/search.png" alt="" class="icon icon-search">
			<input type="search" name="info-search" id="search-input" placeholder="Bạn tìm gì hôm nay">
			<input type="submit" value="Tìm  kiếm"  id="btn-search">
		</form>
		<div class="home">
			<img src="image/home.png" alt="" class="icon">
			<span>Trang chủ</span>
		</div>
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
		<div class="left">
			<div  class="title">Danh mục</div>
			<div class="categories">
				<c:forEach items="${listC}" var="c">
					<a href="home?cid=${c.category_id}">
						<div class="category">${c.name}</div>
					</a>
				
				</c:forEach>

			</div>
		</div>
		<div  class="right">
			<c:forEach items="${listBook}" var="b">
				<div class="card">
					<div class="thumbnail" >
						<a href="product?book_id=${b.book_id}">
							<img class="picture"src="${b.picture}" alt="Sách hay">
						</a>
					</div>
					<div class="info">
						<a href="product?book_id=${b.book_id}">
							<p class="name">${b.name}</p>
						</a>
						<p class="sold">Da ban:  ${b.sold_amount }</p>
						<span class="price">${formatter.format(b.price)} đ</span>
						<a href="addToCart?book_id=${b.book_id }">
							<c:if test="${sessionScope.user !=null}">
								<img class="add-cart" src="image/cart.png" alt="" onclick="alert('Đã thêm sản phẩm vào giỏ hàng')">
							</c:if>
							<c:if test="${sessionScope.user ==null}">
								<img class="add-cart" src="image/cart.png" alt="" onclick="alert('Bạn chưa đăng nhập tài khoản')">
							</c:if>
						</a>
					</div>
				</div>
			</c:forEach>
			
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
</body>
</html>

