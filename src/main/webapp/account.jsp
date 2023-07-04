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
    <link rel="stylesheet" href="css//account.css">
	<link rel="stylesheet" href="themify-icons/themify-icons.css">
    <title>Account</title>
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
	<!-- ------------End header------------------------ -->
	<div class="quote-wrapper">
		<div class="quote">
		</div>
		<div class="quote-content">
			<p>Một kẻ không đọc sách chẳng hơn gì kẻ không biết đọc.</p>
			<span>--Mark Twain--</span>
		</div>
	</div>
	<!-- -----------End quote ------------------------- -->
    <div class="body">
        <div class="side-bar">
            <div class="avatar">
                <img src="image/avatar.png" alt="">
                <div class="name-account">
                    Tài khoản của <strong>${user.name}</strong>
                </div>
            </div>
            <ul>
                <li class="js-click icon ti-user active"><span >Thông tin tài khoản</span></li>
				<li class="js-click icon ti-location-pin"><span >Số địa chỉ</span></li>
				<li class="js-click icon ti-bookmark-alt"><span >Quản lý đơn hàng</span></li>
				<li class="js-click icon ti-bell"><span >Thông báo của tôi</span></li>
				<li class="js-click icon ti-share-alt"><span >Quản lý đổi trả </span></li>
				<li class="js-click icon ti-wallet"><span >Thông tin thanh toán</span></li>
				<li class="js-click icon ti-pencil-alt"><span >Đánh giá sản phẩm</span></li>
				<li class="js-click icon ti-eye"><span >Sản phẩm bạn đã xem </span></li>
				<li class="js-click icon ti-heart"><span >Sản phẩm yêu thích</span></li>
				<li class="js-click icon ti-shopping-cart"><span >Sản phẩm mua sau</span></li>
            </ul>

        </div>
		<!-- -------  end sidebar------------------ -->
        <div class="body-content">
			<div class="account-info" >
				<form class="info-left" action="account" method="post">
					<p class="info-title">Thông tin cá nhân</p>
					<ul>
						<li>
							<p class="li-title">Họ & Tên</p>
							<div class="li-content">
								<input class="fullname" type="text" placeholder="Thêm họ tên" required name="fullname" value="${user.name }">
							</div>
						</li>
						<li>
							<p class="li-title">Ngày sinh</p>
							<div class="dob li-content" >
								<select name="day" id="" class="select" >
									<option value="0">Ngày</option>
									<c:forEach var=	"i" begin="1" end="9">
										<option value="${i }" <c:if test="${i == day}">selected</c:if>>
											0${i}
										</option>
									</c:forEach>
									<c:forEach var=	"i" begin="10" end="31">
										<option value="${i }" <c:if test="${i == day}">selected</c:if>>
											${i}
										</option>
									</c:forEach>
									<!-- <option value="1">01</option>
									<option value="2">02</option>
									<option value="3">03</option>
									<option value="4">04</option>
									<option value="5">05</option>
									<option value="6">06</option>
									<option value="7">07</option>
									<option value="8">08</option>
									<option value="9">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option> -->
								</select>
								<select name="month" id="" class="select" >
									<option value="0">Tháng</option>
									<c:forEach var=	"i" begin="1" end="9">
										<option value="${i }" <c:if test="${i == month}">selected</c:if>>
										0${i}
										</option>
									</c:forEach>
									<c:forEach var=	"i" begin="10" end="12">
										<option value="${i }" <c:if test="${i == month}">selected</c:if>>
											${i}
										</option>
									</c:forEach>
									<!-- <option value="1">01</option>
									<option value="2">02</option>
									<option value="3">03</option>
									<option value="4">04</option>
									<option value="5">05</option>
									<option value="6">06</option>
									<option value="7">07</option>
									<option value="8">08</option>
									<option value="9">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option> -->
								</select>
								<select name="year" id="" class="select" >
									<option value="0">Năm</option>
									<c:forEach var=	"i" begin="1960" end="2023" >
										<option value="${i }" <c:if test="${i == year}">selected</c:if>>
											${i}
										</option>
									</c:forEach>
									<!-- <option value="2023">2023</option>
									<option value="2022">2022</option>
									<option value="2021">2021</option>
									<option value="2020">2020</option>
									<option value="2019">2019</option>
									<option value="2018">2018</option>
									<option value="2017">2017</option>
									<option value="2016">2016</option>
									<option value="2015">2015</option>
									<option value="2014">2014</option>
									<option value="2013">2013</option>
									<option value="2012">2012</option>
									<option value="2011">2011</option>
									<option value="2010">2010</option>
									<option value="2009">2009</option>
									<option value="2008">2008</option>
									<option value="2007">2007</option>
									<option value="2006">2006 </option>
									<option value="2005">2005</option>
									<option value="2004">2004</option>
									<option value="2003">2003</option>
									<option value="2002">2002</option>
									<option value="2001">2001</option>
									<option value="2000">2000</option>
									<option value="1999">1999</option>
									<option value="1998">1998</option>
									<option value="1997">1997</option>
									<option value="1996">1996</option>
									<option value="1995">1995</option>
									<option value="1994">1994</option>
									<option value="1993">1993</option>
									<option value="1992">1992</option>
									<option value="1991">1991</option>
									<option value="1990">1990</option>
									<option value="1989">1989</option>
									<option value="1988">1988</option>
									<option value="1987">1987</option>
									<option value="1986">1986</option>
									<option value="1985">1985</option>
									<option value="1984">1984</option>
									<option value="1983">1983</option>
									<option value="1982">1982</option>
									<option value="1981">1981</option>
									<option value="1980">1980</option>
									<option value="1979">1979</option>
									<option value="1978">1978</option>
									<option value="1977">1977</option>
									<option value="1976">1976</option>
									<option value="1975">1975</option>
									<option value="1974">1974</option>
									<option value="1973">1973</option>
									<option value="1972">1972</option>
									<option value="1971">1971</option>
									<option value="1970">1970</option>
									<option value="1969">1969</option>
									<option value="1968">1968</option>
									<option value="1967">1967</option>
									<option value="1966">1966</option>
									<option value="1965">1965</option>
									<option value="1964">1964</option>
									<option value="1963">1963</option>
									<option value="1962">1962</option>
									<option value="1961">1961</option>
									<option value="1960">1960</option> -->
								</select>
							</div>
						</li>
						<li>
							<p class="li-title ">Giới tính</p>
							<div class="gender li-content">
								<c:forTokens items="Nam,Nu,Khac" delims="," var="i">
									<input type="radio" name="gender" id="${1 }" value="${i }"
										<c:if test="${user.gender == i}">
										checked
										</c:if>>
									<label for="${i }">${i }</label>
								</c:forTokens>
								
								<!-- <input type="radio" name="gender" id="nam" value="nam"checked><label for="nam">Nam</label>
								<input type="radio" name="gender" id="nu"  value="nu" ><label for="nu">Nữ</label>
								<input type="radio" name="gender" id="khac" value="khac" ><label for="khac">Khác</label> -->
							</div>
						</li>
						<li>
							<p class="li-title">Quốc tịch</p>
							<div class="li-content national">
								<select name="national" id="" class="select select-national">
									<option value="0">Việt Nam</option>
								</select>
							</div>
						</li>
						
					</ul>
					<input type="hidden" value="changeInfo" name="typeUpdate">
					<input type="submit" value="Lưu thay đổi" class="btn-change">

				</form>
				<!--  ====== end infomation left ========= -->
				<div class="separator" style="border: 1px #eee solid;margin-right: 12px; "></div>
				<div class="info-right">
					<div>
						<h3 class="sub-title">Số điện thoại và Email</h3>
						<ul>
							<li>
								<div>
									<span class="ti-headphone-alt right-icon"></span>
									<span>
										<span>Số điện thoại</span>
										<p style="margin: 4px 20px;">${user.phone}</p>
									</span>
								</div>
								<button class="right-btn-change">Thay đổi</button>
							</li>
							<li>
								<div>
									<span class="ti-email right-icon"></span>
									<span>
										<span>Địa chỉ email</span>
										<p style="margin: 4px 20px;">${user.email }</p>
									</span>
								</div>
								<button class="right-btn-change">Thay đổi</button>
							</li>
						</ul>
					</div>
					<div>
						<h3 class="sub-title">Bảo mật</h3>
						<ul>
							<li>
								<div>
									<span class="ti-lock right-icon"></span>
									<span>
										<span>Đổi mật khẩu</span>
									</span>
								</div>
								<button class="right-btn-change">Thay đổi</button>
							</li>
							<li>
								<div>
									<span class="ti-shield right-icon"></span>
									<span>
										<span>Thiết lập mã PIN</span>
									</span>
								</div>
								<button class="right-btn-change">Thay đổi</button>
							</li>
						</ul>
					</div>
					<div>
						<h3 class="sub-title">Liên kết mạng xã hội</h3>
						<ul>
							<li>
								<div style="display: flex; align-items: center;">
									<img src="image/facebook.png" alt="" height="28px" style="margin-right: 8px;">
									<span>
										<span>Facebook</span>
									</span>
								</div>
								<button class="right-btn-change">Liên kết</button>
							</li>
							<li>
								<div style="display: flex; align-items: center;">
									<img src="image/google.png" alt="" height="28px" style="margin-right: 8px;">
									<span>
										<span>Google</span>
									</span>
								</div>
								<button class="right-btn-change">Liên kết</button>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- ======== end infor right=============== -->
			<!-- ====  begin new panel ======== -->
			<div class="order hide">
				<p class="info-title">Đơn hàng của tôi</p>
				<c:forEach items="${orders }" var="o">
					<div class="order-card">
						<p class="order-status">Giao hàng thành công</p>
						<div class="order-title">
							<span>Sản phẩm</span>
							<span>Đơn giá</span>
							<span>Số lượng</span>
							<span>Thành tiền</span>
						</div>

						<c:forEach items="${o.orderDetails }" var="od">
							<div class="book-card">
								<div class="col1">
									<a href="#"><img class="book-buy" src="${od.book.picture }" alt="" width="78" height="78"></a>
									<a href="#" class="book-name">${od.book.name }</a>
								</div>
								<div class="col2">
									<span style="color:black">${formatter.format(od.book_price) } ₫</span>
								</div>
								<div class="col3">
									<span>${od.book_amount }</span>
								</div>
								<div class="col4">
									${formatter.format(od.total) } ₫
								</div>
							</div>
						</c:forEach>
						
						<div class="order-total">
							<div class="delivery-day" style="padding-left: 16px;">
								<span>Ngày đặt hàng: ${o.order_date }</span>
							</div>
							<div class="total-price">
								<p>Tổng tiền: ${formatter.format(o.total_price) } <u>đ</u></p>
								<button class="btn-cancel">Hủy</button>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<!-- ++++++   end order ++++++++ -->
			<div class="address hide">
				<p class="info-title">Địa chỉ giao hàng</p>
				<div class="address-total">
					<p>${user.name }</p>
					<p>Địa chỉ: ${user.address}</p>
					<p>Điện thoại: ${user.phone }</p>
				</div>
				<form action="account" class="address-form">
					<div class="address-item">
						<label for="">Tỉnh/Thành phố:</label>
						<select name="province" id="" class="addr" style="width: 424px;" >
							<option value="" disabled selected >Tỉnh/Thành phố</option>
							<option value="Hà Nội">Hà Nội</option>
							<option value="Hồ Chí Minh">Hồ Chí Minh</option>
							<option value="An Giang">An Giang</option>
							<option value="Bà Rịa-Vũng Tàu">Bà Rịa-Vũng Tàu</option>
							<option value="Bạc Liêu">Bạc Liêu</option>
							<option value="Bắc Giang">Bắc Giang</option>
							<option value="Bắc Kạn">Bắc Kạn</option>
							<option value="Bắc Ninh">Bắc Ninh</option>
							<option value="Bến Tre">Bến Tre</option>
							<option value="Bình Dương">Bình Dương</option>
							<option value="Bình Định">Bình Định</option>
							<option value="Bình Phước">Bình Phước</option>
							<option value="Bình Thuận">Bình Thuận</option>
							<option value="Cà Mau">Cà Mau</option>
							<option value="Cao Bằng">Cao Bằng</option>
							<option value="Cần Thơ">Cần Thơ</option>
							<option value="Đà Nẵng">Đà Nẵng</option>
							<option value="Đắk Lắk">Đắk Lắk</option>
							<option value="Đắk Nông">Đắk Nông</option>
							<option value="Điện Biên">Điện Biên</option>
							<option value="Đồng Nai">Đồng Nai</option>
							<option value="Đồng Tháp">Đồng Tháp</option>
							<option value="Gia Lai">Gia Lai</option>
							<option value="Hà Giang">Hà Giang</option>
							<option value="Hà Nam">Hà Nam</option>
							<option value="Hà Tĩnh">Hà Tĩnh</option>
							<option value="Hải Dương">Hải Dương</option>
							<option value="Hải Phòng">Hải Phòng</option>
							<option value="Hậu Giang">Hậu Giang</option>
							<option value="Hòa Bình">Hòa Bình</option>
							<option value="Hưng Yên">Hưng Yên</option>
							<option value="Hưng Yên">Hưng Yên</option>
							<option value="Kiên Giang">Kiên Giang</option>
							<option value="Kon Tum">Kon Tum</option>
							<option value="Lai Châu">Lai Châu</option>
							<option value="Lạng Sơn">Lạng Sơn</option>
							<option value="Lào Cai">Lào Cai</option>
							<option value="Lâm Đồng">Lâm Đồng</option>
							<option value="Long An">Long An</option>
							<option value="Nam Định">Nam Định</option>
							<option value="Nghệ An">Nghệ An</option>
							<option value="Ninh Bình">Ninh Bình</option>
							<option value="Ninh Thuận">Ninh Thuận</option>
							<option value="Phú Thọ">Phú Thọ</option>
							<option value="Phú Yên">Phú Yên</option>
							<option value="Quảng Bình">Quảng Bình</option>
							<option value="Quảng Nam">Quảng Nam</option>
							<option value="Quảng Ngãi">Quảng Ngãi</option>
							<option value="Quảng Ninh">Quảng Ninh</option>
							<option value="Quảng Trị">Quảng Trị</option>
							<option value="Sóc Trăng">Sóc Trăng</option>
							<option value="Sơn La">Sơn La</option>
							<option value="Tây Ninh">Tây Ninh</option>
							<option value="Thái Bình">Thái Bình</option>
							<option value="Thái Nguyên">Thái Nguyên</option>
							<option value="Thanh Hóa">Thanh Hóa</option>
							<option value="Thừa Thiên Huế">Thừa Thiên Huế</option>
							<option value="Tiền Giang">Tiền Giang</option>
							<option value="Trà Vinh">Trà Vinh</option>
							<option value="Tuyên Quang">Tuyên Quang</option>
							<option value="Vĩnh Long">Vĩnh Long</option>
							<option value="Vĩnh Phúc">Vĩnh Phúc</option>
							<option value="Yên Bái">Yên Bái</option>
						</select>
					</div>
					<div class="address-item">
						<label for="">Quận huyện:</label>
						<input type="text" name="district" id="" class="addr" required placeholder="Quận/huyện">
					</div>
					<div class="address-item">
						<label for="">Phường xã:</label>
						<input type="text" name="commune" id="" class="addr" required placeholder="Phường/Xã">
					</div>
					<div class="address-item">
						<label for="">Địa chỉ:</label>
						<input type="text" name="address-details" id="" class="addr" required required placeholder="Địa chỉ chi tiết">
					</div>
					<input type="hidden" value="changeAddress" name="typeUpdate">
					<div class="address-item" style="margin: 40px 0 0 240px;">
						<input type="submit" value="Cập nhật" class="submit-address">
					</div>
				</form>
			</div>
        </div>
    </div>




	<!-- -----------End body ------------------------- -->
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
		<div class="address-cor">
			<h3>Trụ sở</h3>
			<p>Trụ sở chính: Tòa nhà Viettel, Số 285, đường Cách Mạng Tháng 8, phường 12, quận 10, Thành phố Hồ Chí Minh.</p>
			<p>Tiki nhận đặt hàng trực tuyến và giao hàng tận nơi, chưa hỗ trợ mua và nhận hàng trực tiếp tại văn phòng hoặc trung tâm xử lý đơn hàng.</p>
			<p>Giấy chứng nhận Đăng ký Kinh doanh số 0309532909 do Sở Kế hoạch và Đầu tư Thành phố Hồ Chí Minh cấp lần đầu ngày 06/01/2010 và sửa đổi lần thứ 23 ngày 14/02/2022.</p>
			<p>© 2022 - Bản quyền của Công ty TNHH Ti Ki</p>
		</div>
	</div>
	<div class="servlet-message">
		<input type="hidden" value="${message }" id="ser-message">
		<input type="hidden" value="${message_address }" id="message-address">
		<input type="hidden" value="" id="ser-address">
	</div>
	<script>
		var  message = document.getElementById("ser-message")
		if(message.value.length>0){
			alert(message.value)
		}

		var btns = document.getElementsByClassName("js-click");
		for (var i = 0; i < btns.length; i++) {
			btns[i].addEventListener("click", function() {
				var current = document.getElementsByClassName("active");
				current[0].className = current[0].className.replace(" active", "");
				this.className += " active";
				
				if(this.innerText !== "Thông tin tài khoản"){
					document.querySelector(".account-info").classList.add('hide')
				}
				else{
					document.querySelector(".account-info").classList.remove('hide')
				}

				if(this.innerText !== "Quản lý đơn hàng"){
					document.querySelector(".order").classList.add('hide')
				}
				else{
					document.querySelector(".order").classList.remove('hide')
				}

				if(this.innerText !== "Số địa chỉ"){
					document.querySelector(".address").classList.add('hide')
				}
				else{
					document.querySelector(".address").classList.remove('hide')
				}
			});
			// console.log(index)
			// console.log(document.getElementById('js-account').innerText==="Thông tin tài khoản")
		}
		// mua hàng mà chưa cập nhật address
		var  message_address = document.getElementById("message-address")
		if(message_address.value.length>0){
			alert(message_address.value)

			var current2 = document.getElementsByClassName("active");
			current2[0].className = current2[0].className.replace(" active", "");
			var address = document.getElementsByClassName("ti-location-pin")
			address[0].className += " active";
			document.querySelector(".account-info").classList.add('hide')
			document.querySelector(".order").classList.add('hide')
			document.querySelector(".address").classList.remove('hide')
		}
	</script>
</body>
</html>