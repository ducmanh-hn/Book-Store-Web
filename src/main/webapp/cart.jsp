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
    <link rel="stylesheet" href="css/cart.css">
    <title>Cart</title>
</head>
<body onload="sumTotalPrice()">
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
	<!-- ----------------End header-------------------- -->
<%
	DecimalFormat formatter = new DecimalFormat("###,###,###");
	request.setAttribute("formatter", formatter); 
%>
    <div class="body">
        <h4 class="title">GIỎ HÀNG</h4>
        <form class="content" action="checkOut" method="post">
        	<input type="hidden" name="from" value="cart.jsp">
            <div class="left">
                <div class="total">
                    <div class="total-check">
                        <input type="checkbox" name="" id="total-checkbox">
                        <label for="total-checkbox">Tất cả sản phẩm</label>
                    </div>
                    <span>Đơn giá</span>
                    <span>Số lượng</span>
                    <span>Thành tiền</span>
                    <span title="Xóa mục đã chọn" id="delete-all"><img src="image/trash.svg" alt=""></span>
                </div>
                <div class="card-detail">
                <c:forEach items="${bookInCart }" var="i">
                    <div class="detail">
                        <div class="col1">
                            <input type="checkbox" name="" class="check-buy">
                            <a href="#"><img class="book-buy" src="${i.picture }" alt=""></a>
                            <div>
                                <a href="#" class="book-name">${i.name }</a>
                                <p><img src="image/fast.png" alt="" style="height: 60px;"></p>
                                <span  style="color:#009900">GIAO TIẾT KIỆM</span>
                            </div>
                        </div>
                        <div class="col2">
                            <span style="color:black" id="price${i.book_id}">${formatter.format(i.price) } ₫</span>
                            <del style="color: #808089">${formatter.format(i.discount_price)} ₫</del>
                        </div>
                        <div class="col3">
                            <input type="button" value="-" class="btn-minus" onclick="minus(${i.book_id})">
                            <input id="text-amount${i.book_id}" type="number" style="padding-left: 16px;" value="${i.amount}" name="amount-${i.book_id }" min="1" max="10">
                            <input type="button" value="+" class="btn-plus" onclick="plus(${i.book_id})">
                        </div>
                        <div class="col4" >
                            <span id="tt${i.book_id }" class="item-price">${formatter.format(i.price * i.amount) } ₫</span>
                        </div>
                        <a class="col5" href="addToCart?book_id=${i.book_id}&remove=true">
                            <span  class="delete"><img src="image/trash.svg" alt=""></span>
                        </a>
                    </div>
                </c:forEach>
                    
                </div>
            </div>
            <div class="right">
                <div class="delivery">
                    <div class="header-delivery">
                        <h3 class="sub-title">Giao tới</h3>
                        <a href="#" class="change-address">Thay đổi</a>
                    </div>
                    <div class="name">
                        <h4  style="margin-top: 0">${user.name } | ${user.phone }</h4>
                        <p><b>Địa chỉ: </b>${user.address==null ? "Địa chỉ chưa được cập nhật" : user.address}</p>
                    </div>
                </div>
                <div class="price">
                    <ul>
                        <li>
                            <div>Tạm tính</div>
                            <div class="price-value" id="sumTotalPrice"></div>
                        </li>
                        <li>
                            <div>Giảm giá</div>
                            <div class="discount-value">0đ</div>
                        </li>
                    </ul>
                </div>
                <div class="separator"></div>
                <div class="total-price">
                    <div class="total-price-val">
                        <div>Tổng tiền</div>
                        <div class="price-value" id="sumTotalPrice2"></div>
                    </div>
                </div>
                <div class="buy" >
                    <input type="submit" class="btn-buy"  value="Mua hàng (${amount })" <c:if test="${amount ==0}">disabled</c:if> >
                </div>
            </div>
        </form>
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
    <script>
		function plus(id){
			var amount = document.getElementById("text-amount"+id)
			var price = document.getElementById("price"+id)
			var totalPrice = document.getElementById("tt"+id)
			if(parseInt(amount.value)<10)
				amount.value = parseInt(amount.value)+1
			totalPrice.innerHTML = (parseInt(price.innerHTML)*1000*amount.value).toLocaleString('en-US')+" ₫"
			sumTotalPrice()

		}
		function minus(id){
			var amount = document.getElementById("text-amount"+id)
			if(parseInt(amount.value)>=2)
				amount.value = parseInt(amount.value)-1
			var price = document.getElementById("price"+id)
			var totalPrice = document.getElementById("tt"+id)
			totalPrice.innerHTML = (parseInt(price.innerHTML)*1000*amount.value).toLocaleString('en-US')+" ₫"
			sumTotalPrice()

		}
		function sumTotalPrice(){
			var item_price = document.getElementsByClassName("item-price")
			var sum =0
			for(var i=0;i<item_price.length ; i++){
				if(parseFloat(item_price[i].innerHTML)<10)
					sum = sum + parseFloat(item_price[i].innerHTML.replace(",",""))
				else 
					sum = sum + parseFloat(item_price[i].innerHTML)
			}
			var sumTotal = document.getElementById("sumTotalPrice")
			sumTotal.innerHTML = (sum*1000).toLocaleString('en-US')+" đ"

			var sumTotal2 = document.getElementById("sumTotalPrice2")
			sumTotal2.innerHTML = (sum*1000).toLocaleString('en-US')+" đ"

			var amount = document.getElementById("text-amount"+id)
			var price = document.getElementById("price"+id)
			var totalPrice = document.getElementById("tt"+id)
			totalPrice.innerHTML = (parseInt(price.innerHTML)*1000*amount.value).toLocaleString('en-US')+" ₫" 
		}

		
	</script>
</body>
</html>