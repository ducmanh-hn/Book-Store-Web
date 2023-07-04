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
    <link rel="stylesheet" href="css/checkout.css">
    <title>Check-out</title>
</head>
<body>
    <div class="header">
		<img src="image/images.png" alt="" class="logo">
		<div class="separator"></div>
        <h1 class="title">Thanh toán</h1>
        <img src="image/contact.png" alt="" class="contact">
	</div>
	<!-- ----------------End header-------------------- -->
	<%
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		request.setAttribute("formatter", formatter); 
	%>	
    <div class="body">
        <h4 class="title">HÓA ĐƠN</h4>
        <form class="content" action="checkOut" method="get">
            <div class="left">
            	<div class="total">
                    <div class="total-check">
                        <input type="checkbox" name="" id="total-checkbox" checked>
                        <label for="total-checkbox">Tất cả sản phẩm</label>
                    </div>
                    <span>Đơn giá</span>
                    <span>Số lượng</span>
                    <span>Thành tiền</span>
                </div>
                <div class="card-detail">
                    <!-- item -->
               	<c:forEach items="${bookInCart }" var="i">
                    <div class="detail">
                        <div class="col1">
                            <input type="checkbox" name="" class="check-buy" checked>
                            <a href="#"><img class="book-buy" src="${i.picture }" alt=""></a>
                            <div>
                                <a href="#" class="book-name">${i.name }</a>
                                <p><img src="image/fast.png" alt="" style="height: 60px;"></p>
                                <span  style="color:#009900">GIAO TIẾT KIỆM</span>
                            </div>
                        </div>
                        <div class="col2">
                            <span style="color:black" id="price${i.book_id}">${formatter.format(i.price) } ₫</span>
                        </div>
                        <div class="col3">
                            <%-- <input id="text-amount${i.book_id}" type="number" style="padding-left: 16px;" value="${i.amount}" > --%>
                            <span>x ${i.amount}</span>
                        </div>
                        <div class="col4" >
                            <span id="tt${i.book_id }" class="item-price">${formatter.format(i.price * i.amount) } ₫</span>
                        </div>
                        
                    </div>
                </c:forEach>
                    <!-- end item -->
                    

                </div>
                <h3>Giao hàng vào : <span id="delivery-date" style="color:#1aa7ff"></span></h3>
                <div class="delivery-type">
                    <h4 sub-title>Chọn hình thức thanh toán</h4>
                    <!--   =================    -->
                    <div class="delivery-item">
                        <input type="radio" name="type" id="cash" checked value="Thanh toán tiền mặt khi nhận hàng">
                        <label for="cash" class="label">
                                <img src="image/cash.svg" alt=""> <span> Thanh toán tiền mặt khi nhận hàng</span>
                        </label>
                    </div>
                    <!--   =================    -->
                    <div class="delivery-item">
                        <input type="radio" name="type" id="viettel" value="Thanh toán bằng Viettel Money">
                        <label for="viettel" class="label">
                                <img src="image/Viettel_money.png" alt="" height="32px"> <span> Thanh toán bằng Viettel Money</span>
                        </label>
                    </div>
                    <!--   =================    -->
                    <div class="delivery-item">
                        <input type="radio" name="type" id="momo" value="Thanh toán bằng ví MoMo">
                        <label for="momo" class="label">
                                <img src="image/momo.svg" alt=""> <span> Thanh toán bằng ví MoMo</span>
                        </label>
                    </div>
                    <!--   =================    -->
                    <div class="delivery-item">
                        <input type="radio" name="type" id="zalo" value="Thanh toán bằng ví ZaloPay">
                        <label for="zalo" class="label">
                                <img src="image/zalopay.svg" alt=""> <span> Thanh toán bằng ví ZaloPay</span>
                        </label>
                    </div>
                    <!--   =================    -->


                </div>
            </div>
            <div class="right">
                <div class="delivery">
                    <div class="header-delivery">
                        <h3 class="sub-title">Giao tới</h3>
                        <a href="#" class="change-address">Thay đổi</a>
                    </div>
                    <div class="name">
                        <h4>${user.name } | ${user.phone }</h4><br>
                        <p><b>Địa chỉ: </b>${user.address }</p>
                    </div>
                </div>
                <div class="price">
                    <ul>
                    	<li>
                            <div>Tạm tính</div>
                            <div class="temp-value">${formatter.format(temp_total) } đ</div>
                        </li>
                        <li>
                            <div>Vận chuyển</div>
                            <div class="price-value">20,000 đ</div>
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
                        <div class="price-value">${formatter.format(temp_total +20000)} đ</div>
                    </div>
                </div>
                <div class="buy">
                    <!-- <button class="btn-buy"><a href="checkOut?from=checkout.jsp">Đặt hàng</a></button> -->
                    <input type="hidden" name="from" value="checkout.jsp">
                    <input type="submit" value="Đặt hàng" class="btn-buy">
                </div>
            </div>
        </form>

    </div>
    <!-- ------------------------------------ -->
    <div class="footer">
        <div class="footer-content">
            <p style="margin-bottom: 16px;">Bằng việc tiến hành Đặt Mua, bạn đồng ý với các Điều kiện Giao dịch chung:</p>
            <p>
                <a href="">Quy chế hoạt động</a>
                <span class="separate"></span>

                <a href="">Chính sách giải quyết khiếu nại</a>
                <span class="separate"></span>

                <a href="">Chính sách bảo hành</a>
                <span class="separate"></span>

                <a href=""> Chính sách bảo mật thanh toán</a>
                <span class="separate"></span>

                <a href="">Chính sách bảo mật thông tin cá nhân</a>
            </p>
            <p class="copy-right">© 2019 - Bản quyền của Công Ty Cổ Phần Apple Tree Books - apbooks.vn</p>

        </div>
    </div>


    <!-- ------------------------------------ -->
    <script>
        var days = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
        n =  new Date();    
        day = days[ n.getDay() +1];
        y = n.getFullYear();
        m = n.getMonth() + 1;
        d = n.getDate()+1;
        
        document.getElementById("delivery-date").innerHTML = " "+d + "/" + m + "/" + y+", "+day;
    </script>
</body>
</html>