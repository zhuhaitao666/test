<%@ page import="java.util.List" %>
<%@ page import="com.qbd.pojo.Shoes" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <title>我要去卖鞋子</title>
    <link rel="stylesheet" href="../css/style.css" type="text/css" media="all" />

    <script src="../js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../js/jquery.jcarousel.pack.js" type="text/javascript"></script>
    <script src="../js/jquery.slide.js" type="text/javascript"></script>
    <script src="../js/jquery-func.js" type="text/javascript"></script>
    <script type="text/javascript">
        function delcfm(userId) {
            var a=document.getElementsByClassName("wantToSelf")[0];
            if(userId) {}
            else {
                a.target="_self";
                alert("请先登录");
            }
        }
    </script>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    String phone=(String) session.getAttribute("phone");
    List<Shoes> allShoes=(List<Shoes>) session.getAttribute("allShoes");
    List<Shoes> hotShoes=(List<Shoes>) session.getAttribute("hotShoes");
%>
<!-- Top -->
<div id="top">

    <div class="shell">

        <!-- Header -->
        <div id="header">

            <div id="navigation">
                <ul>
                    <li>
                        <div class="search">
                            <form action="${pageContext.request.contextPath}/ShoesOnline/LikeNameNavigation" method="post">
                                <input type="text" class="blink" value="SEARCH" title="SEARCH" />
                                <input class="search-submit" type="submit" value="搜索" />
                            </form>
                        </div>
                    </li>
                    <li class="right"><a href="${pageContext.request.contextPath}/ShoesOnline/toIndex">主页</a></li>
                    <li class="right"><a href="${pageContext.request.contextPath}/ShoesOnline/toCart" target="_blank">购物车</a></li>
                    <li class="right"><a href="#">商店</a></li>
                    <li class="right" style="color: indianred">
                        <%
                            if (session.getAttribute("phone")!=null)
                            {
                        %>
                           用户${sessionScope.phone} &nbsp; <a href="${pageContext.request.contextPath}/ShoesOnline/logout">注销</a>
                        <%
                            }else 
                                {
                        %>
                        <a href="${pageContext.request.contextPath}/jsp/login.jsp" target="_blank">登录</a>
                        <%
                            }
                        %>
                    </li>
                    <li class="right"><a href="${pageContext.request.contextPath}/jsp/register.jsp" target="_blank">注册</a></li>
                    <li class="right"><a href="${pageContext.request.contextPath}/ShoesOnline/toSelf" class="wantToSelf"
                                         onClick="delcfm(<%=session.getAttribute("userId") %>)" target="_blank">
                        <img src="../images/self.jpg" width="18px" height="18px" />
                    </a></li>
                </ul>
            </div>
        </div>
        <!-- End Header -->

        <!-- Slider -->
        <div id="slider">
            <div id="slider-holder">
                <ul>
                    <%
                        for (Shoes h:hotShoes) {
                    %>
                    <li><a href="${pageContext.request.contextPath}/ShoesOnline/detail?shoesId=<%=h.getGoodsId()%>"><img src="../images/slide1.jpg" alt="" /></a></li>
                    <%
                        }
                    %>
                    <li><a href="#"><img src="../images/slide2.jpg" alt="" /></a></li>
                    <li><a href="#"><img src="../images/slide3.jpg" alt="" /></a></li>
                    <li><a href="#"><img src="../images/slide4.jpg" alt="" /></a></li>
                    <li><a href="#"><img src="../images/slide5.jpg" alt="" /></a></li>
                    <li><a href="#"><img src="../images/slide6.jpg" alt="" /></a></li>

                </ul>
            </div>
            <div id="slider-nav">
                <a href="#" class="prev">Previous</a>
                <a href="#" class="next">Next</a>
            </div>
        </div>
        <!-- End Slider -->

    </div>
</div>
<!-- Top -->

<!-- Main -->
<div id="main">
    <div class="shell">
        <!-- Search, etc -->
        <div class="options">

            <span class="left"><a href="#">说明</a></span>

            <div class="right">
				<span class="cart">
					<a href="#" class="cart-ico">&nbsp;</a>
					<strong>$0.00</strong>
				</span>
                <span class="left more-links">
					<a href="#" >结算</a>
					<a href="mycar.html" >详细</a>
				</span>
            </div>
        </div>

        <!-- Content -->
        <div id="content">

            <!-- Tabs -->
            <div class="tabs">
                <ul>
                    <li><a href="#" class="active"><span>平板鞋</span></a></li>
                    <li><a href="#"><span>运动鞋</span></a></li>
                    <li><a href="#" class="red"><span>More Shoes</span></a></li>
                </ul>
            </div>
            <!-- Tabs -->

            <!-- Container -->
            <div id="container">

                <div class="tabbed">

                    <!-- First Tab Content -->
                    <div class="tab-content" style="display:block;">
                        <div class="items">
                            <div class="cl">&nbsp;</div>
                            <ul>
                                <%
                                    for (Shoes shoes:allShoes) {
                                %>

                                <li>
                                    <div class="image">
                                        <a href="${pageContext.request.contextPath}/ShoesOnline/detail?shoesId=<%=shoes.getGoodsId()%>"><img src="<%=shoes.getShoesImg().getPath()%>" alt="" /></a>
                                    </div>
                                    <p>
                                        名称 <span><%=shoes.getGoodsName()%></span><br />
                                        Size List : <span>38/39/40/41/42/43</span><br />
                                        Brand Name: <a href="#"><%=shoes.getShoesType().getBrandName()%> Shoes</a>
                                    </p>
                                    <p class="price">市场价: ￥<strong><%=shoes.getShopPrice()%></strong>1
                                        
                                        
                                    </p>
                                </li>
                                <%
                                    }
                                %>
                            </ul>
                            <div class="cl">&nbsp;</div>
                        </div>
                    </div>
                    <!-- End First Tab Content -->

                    <!-- Second Tab Content -->
                    <div class="tab-content">
                        <div class="items">
                            <div class="cl">&nbsp;</div>
                            <ul>
                                <li>
                                    <div class="image">
                                        <a href="shoeindex.html"><img src="../images/image2.jpg" alt="" /></a>
                                    </div>
                                    <p>
                                        名称 <span>125515</span><br />
                                        Size List : <span>38/39/40/41/42/43</span><br />
                                        Brand Name: <a href="#">Adidas Shoes</a>
                                    </p>
                                    <p class="price">市场价: <strong>88 ￥</strong>
                                         
                                    </p>
                                </li>
                                <li>
                                    <div class="image">
                                        <a href="#"><img src="../images/image2.jpg" alt="" /></a>
                                    </div>
                                    <p>
                                        名称 <span>125515</span><br />
                                        Size List : <span>38/39/40/41/42/43</span><br />
                                        Brand Name: <a href="#">Adidas Shoes</a>
                                    </p>
                                    <p class="price">市场价: <strong>88 ￥</strong>
                                         
                                    </p>
                                </li>
                                <li>
                                    <div class="image">
                                        <a href="#"><img src="../images/image2.jpg" alt="" /></a>
                                    </div>
                                    <p>
                                        名称 <span>125515</span><br />
                                        Size List : <span>38/39/40/41/42/43</span><br />
                                        Brand Name: <a href="#">Adidas Shoes</a>
                                    </p>
                                    <p class="price">市场价: <strong>88 ￥</strong>
                                         
                                    </p>
                                </li>
                                <li>
                                    <div class="image">
                                        <a href="#"><img src="../images/image2.jpg" alt="" /></a>
                                    </div>
                                    <p>
                                        名称 <span>125515</span><br />
                                        Size List : <span>38/39/40/41/42/43</span><br />
                                        Brand Name: <a href="#">Adidas Shoes</a>
                                    </p>
                                    <p class="price">市场价: <strong>88 ￥</strong>
                                         
                                    </p>
                                </li>
                                <li>
                                    <div class="image">
                                        <a href="#"><img src="../images/image1.jpg" alt="" /></a>
                                    </div>
                                    <p>
                                        名称 <span>125515</span><br />
                                        Size List : <span>38/39/40/41/42/43</span><br />
                                        Brand Name: <a href="#">Adidas Shoes</a>
                                    </p>
                                    <p class="price">市场价: <strong>88 ￥</strong>
                                         
                                    </p>
                                </li>
                                <li>
                                    <div class="image">
                                        <a href="#"><img src="../images/image1.jpg" alt="" /></a>
                                    </div>
                                    <p>
                                        名称 <span>125515</span><br />
                                        Size List : <span>38/39/40/41/42/43</span><br />
                                        Brand Name: <a href="#">Adidas Shoes</a>
                                    </p>
                                    <p class="price">市场价: <strong>88 ￥</strong>
                                         
                                    </p>
                                </li>
                                <li>
                                    <div class="image">
                                        <a href="#"><img src="../images/image1.jpg" alt="" /></a>
                                    </div>
                                    <p>
                                        名称 <span>125515</span><br />
                                        Size List : <span>38/39/40/41/42/43</span><br />
                                        Brand Name: <a href="#">Adidas Shoes</a>
                                    </p>
                                    <p class="price">市场价: <strong>88 ￥</strong>
                                         
                                    </p>
                                </li>
                                <li>
                                    <div class="image">
                                        <a href="#"><img src="../images/image1.jpg" alt="" /></a>
                                    </div>
                                    <p>
                                        名称 <span>125515</span><br />
                                        Size List : <span>38/39/40/41/42/43</span><br />
                                        Brand Name: <a href="#">Adidas Shoes</a>
                                    </p>
                                    <p class="price">市场价: <strong>88 ￥</strong>
                                         
                                    </p>
                                </li>
                            </ul>
                            <div class="cl">&nbsp;</div>
                        </div>
                    </div>
                    <!-- End Second Tab Content -->

                    <!-- Third Tab Content -->
                    <div class="tab-content">
                        <div class="items">
                            <div class="cl">&nbsp;</div>
                            <ul>
                                <li>
                                    <div class="image">
                                        <a href="#"><img src="../images/image3.jpg" alt="" /></a>
                                    </div>
                                    <p>
                                        名称 <span>125515</span><br />
                                        Size List : <span>38/39/40/41/42/43</span><br />
                                        Brand Name: <a href="#">Adidas Shoes</a>
                                    </p>
                                    <p class="price">市场价: <strong>88 ￥</strong>
                                         
                                    </p>
                                </li>
                                <li>
                                    <div class="image">
                                        <a href="#"><img src="../images/image3.jpg" alt="" /></a>
                                    </div>
                                    <p>
                                        名称 <span>125515</span><br />
                                        Size List : <span>38/39/40/41/42/43</span><br />
                                        Brand Name: <a href="#">Adidas Shoes</a>
                                    </p>
                                    <p class="price">市场价: <strong>88 ￥</strong>
                                         
                                    </p>
                                </li>
                                <li>
                                    <div class="image">
                                        <a href="#"><img src="../images/image3.jpg" alt="" /></a>
                                    </div>
                                    <p>
                                        名称 <span>125515</span><br />
                                        Size List : <span>38/39/40/41/42/43</span><br />
                                        Brand Name: <a href="#">Adidas Shoes</a>
                                    </p>
                                    <p class="price">市场价: <strong>88 ￥</strong>
                                         
                                    </p>
                                </li>
                                <li>
                                    <div class="image">
                                        <a href="#"><img src="../images/image3.jpg" alt="" /></a>
                                    </div>
                                    <p>
                                        名称 <span>125515</span><br />
                                        Size List : <span>38/39/40/41/42/43</span><br />
                                        Brand Name: <a href="#">Adidas Shoes</a>
                                    </p>
                                    <p class="price">市场价: <strong>88 ￥</strong>
                                         
                                    </p>
                                </li>
                                <li>
                                    <div class="image">
                                        <a href="#"><img src="../images/image4.jpg" alt="" /></a>
                                    </div>
                                    <p>
                                        名称 <span>125515</span><br />
                                        Size List : <span>38/39/40/41/42/43</span><br />
                                        Brand Name: <a href="#">Adidas Shoes</a>
                                    </p>
                                    <p class="price">市场价: <strong>88 ￥</strong>
                                         
                                    </p>
                                </li>
                                <li>
                                    <div class="image">
                                        <a href="#"><img src="../images/image4.jpg" alt="" /></a>
                                    </div>
                                    <p>
                                        名称 <span>125515</span><br />
                                        Size List : <span>38/39/40/41/42/43</span><br />
                                        Brand Name: <a href="#">Adidas Shoes</a>
                                    </p>
                                    <p class="price">市场价: <strong>88 ￥</strong>
                                         
                                    </p>
                                </li>
                                <li>
                                    <div class="image">
                                        <a href="#"><img src="../images/image4.jpg" alt="" /></a>
                                    </div>
                                    <p>
                                        名称 <span>125515</span><br />
                                        Size List : <span>38/39/40/41/42/43</span><br />
                                        Brand Name: <a href="#">Adidas Shoes</a>
                                    </p>
                                    <p class="price">市场价: <strong>88 ￥</strong>
                                         
                                    </p>
                                </li>
                                <li>
                                    <div class="image">
                                        <a href="#"><img src="../images/image4.jpg" alt="" /></a>
                                    </div>
                                    <p>
                                        名称 <span>125515</span><br />
                                        Size List : <span>38/39/40/41/42/43</span><br />
                                        Brand Name: <a href="#">Adidas Shoes</a>
                                    </p>
                                    <p class="price">市场价: <strong>88 ￥</strong>
                                         
                                    </p>
                                </li>

                                <li>
                                    <div class="image">
                                        <a href="#"><img src="../images/image2.jpg" alt="" /></a>
                                    </div>
                                    <p>
                                        名称 <span>125515</span><br />
                                        Size List : <span>38/39/40/41/42/43</span><br />
                                        Brand Name: <a href="#">Adidas Shoes</a>
                                    </p>
                                    <p class="price">市场价: <strong>88 ￥</strong>
                                         
                                    </p>
                                </li>
                                <li>
                                    <div class="image">
                                        <a href="#"><img src="../images/image2.jpg" alt="" /></a>
                                    </div>
                                    <p>
                                        名称 <span>125515</span><br />
                                        Size List : <span>38/39/40/41/42/43</span><br />
                                        Brand Name: <a href="#">Adidas Shoes</a>
                                    </p>
                                    <p class="price">市场价: <strong>88 ￥</strong>
                                         
                                    </p>
                                </li>
                                <li>
                                    <div class="image">
                                        <a href="#"><img src="../images/image2.jpg" alt="" /></a>
                                    </div>
                                    <p>
                                        名称 <span>125515</span><br />
                                        Size List : <span>38/39/40/41/42/43</span><br />
                                        Brand Name: <a href="#">Adidas Shoes</a>
                                    </p>
                                    <p class="price">市场价: <strong>88 ￥</strong>
                                         
                                    </p>
                                </li>
                                <li>
                                    <div class="image">
                                        <a href="#"><img src="../images/image2.jpg" alt="" /></a>
                                    </div>
                                    <p>
                                        名称 <span>125515</span><br />
                                        Size List : <span>38/39/40/41/42/43</span><br />
                                        Brand Name: <a href="#">Adidas Shoes</a>
                                    </p>
                                    <p class="price">市场价: <strong>88 ￥</strong>
                                         
                                    </p>
                                </li>
                                <li>
                                    <div class="image">
                                        <a href="#"><img src="../images/image1.jpg" alt="" /></a>
                                    </div>
                                    <p>
                                        名称 <span>125515</span><br />
                                        Size List : <span>38/39/40/41/42/43</span><br />
                                        Brand Name: <a href="#">Adidas Shoes</a>
                                    </p>
                                    <p class="price">市场价: <strong>88 ￥</strong>
                                         
                                    </p>
                                </li>
                                <li>
                                    <div class="image">
                                        <a href="#"><img src="../images/image1.jpg" alt="" /></a>
                                    </div>
                                    <p>
                                        名称 <span>125515</span><br />
                                        Size List : <span>38/39/40/41/42/43</span><br />
                                        Brand Name: <a href="#">Adidas Shoes</a>
                                    </p>
                                    <p class="price">市场价: <strong>88 ￥</strong>
                                         
                                    </p>
                                </li>
                                <li>
                                    <div class="image">
                                        <a href="#"><img src="../images/image1.jpg" alt="" /></a>
                                    </div>
                                    <p>
                                        名称 <span>125515</span><br />
                                        Size List : <span>38/39/40/41/42/43</span><br />
                                        Brand Name: <a href="#">Adidas Shoes</a>
                                    </p>
                                    <p class="price">市场价: <strong>88 ￥</strong>
                                         
                                    </p>
                                </li>
                                <li>
                                    <div class="image">
                                        <a href="#"><img src="../images/image1.jpg" alt="" /></a>
                                    </div>
                                    <p>
                                        名称 <span>125515</span><br />
                                        Size List : <span>38/39/40/41/42/43</span><br />
                                        Brand Name: <a href="#">Adidas Shoes</a>
                                    </p>
                                    <p class="price">市场价: <strong>88 ￥</strong></p>
                                    <a href="#">加入购物车</a>
                                </li>
                            </ul>
                            <div class="cl">&nbsp;</div>
                        </div>
                    </div>
                    <!-- End Third Tab Content -->

                </div>


                <center>
                    <div class="brands">
                        <h3>Brands</h3>
                        <div class="logos">
                            <a href="#"><img src="../images/logo1.gif" alt="" /></a>
                            <a href="#"><img src="../images/logo2.gif" alt="" /></a>
                            <a href="#"><img src="../images/logo3.gif" alt="" /></a>
                            <a href="#"><img src="../images/logo4.gif" alt="" /></a>
                            <a href="#"><img src="../images/logo5.gif" alt="" /></a>
                        </div>
                    </div>
                </center>


            </div>
            <!-- End Container -->

        </div>
        <!-- End Content -->
    </div>

</div>
<!-- End Main -->

</body>
</html>