<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>添加商品</title>
    <style type="text/css">
        input.submit{
            width: 80px;
            height: 80px;
            background-color: red;
        }
    </style>
    <script type="text/javascript">
        function isP() {
            var v =document.getElementsByClassName("promote")[0];
            v.style.display="block";
        }
        function notP() {
            var v =document.getElementsByClassName("promote")[0];
            v.style.display="none";
        }
        function canP() {
            var v =document.getElementsByClassName("canP")[0];
            var b=document.getElementsByClassName("b")[0];
            if (b.checked==true){
                v.style.display="block";
            }
            else{
                v.style.display="none";
            }
        }
        function canCoupon() {
            var coupon =document.getElementsByClassName("coupon")[0];
            var d=document.getElementsByClassName("d")[0];
            var coupons=document.getElementsByClassName("ACoupon");
            if (d.checked==true){
                coupon.style.display="block";
            }
            else{
                coupon.style.display="none";
                for (var i=0;i<coupons.length;i++){
                    coupons[i].checked=false;
                }
            }
        }
        function canAdd(theform) {
             if (theform.pic.value==null||theform.pic.value==""){
                 alert("请选择上传商品图片");
                 return false;
             }
            else
             {
                 alert("上传成功");
                 return true;
             }
        }
    </script>
</head>
<body>
    <div class="main" align="center">
        <form action="${pageContext.request.contextPath}/ShoesOnline/addShoes" method="post" enctype="multipart/form-data" onsubmit="return canAdd(this)">
            <h4>选择商品图片</h4>
            <input type="file" name="pic" class="pic"/>
            鞋子名称:<input type="text" name="goodsName" required autofocus/><br>
            鞋子描述:<input type="text" name="desc" required autofocus/><br>
            库存数量:<input type="text" name="number" required autofocus><br>
            上线天数:<input type="text" name="day" required autofocus><br>&nbsp;
            市&nbsp;场&nbsp;价:<input type="text" name="shopPrice" required autofocus><br>
            品牌选择:<select name="goodsTypeId" id="goodsTypeId">
                            <c:forEach var="shoesType" items="${shoesTypes}">
                                <option value="${shoesType.id}">${shoesType.brandName}</option>
                            </c:forEach>
                     </select>
            <div>
            是否促销: <br>
            是：<input type="radio" name="isPromote" value="1" onclick="isP()"/>
            否：<input type="radio" name="isPromote" value="0" checked onclick="notP()"><br>
                <div class="promote" style="display: none">
                    促销价格:<input type="text" name="promotePrice"><br>
                    促销天数:<input type="text" name="promoteDay"><br>
                </div>
            </div>
            是否可以用于积分<input type="checkbox" name="canPoint" value="1" onclick="canP()" class="b"><br>
            <div class="canP"  style="display: none">
            奖励积分：<input  type="text" name="givePoints"/><br>
            </div>
            是否可用于优惠券 是：<input class="d" type="checkbox" name="canUseCoupon" value="1" onclick="canCoupon()"><br>
            <div class="coupon" style="display: none">
                 优惠券1<input type="checkbox" name="goodsDiscountId" value="1" class="ACoupon">
                 优惠券2<input type="checkbox" name="goodsDiscountId" value="2" class="ACoupon">
                 优惠券3<input type="checkbox" name="goodsDiscountId" value="3" class="ACoupon">
            </div>
            <input type="submit" value="确定上传">
        </form>
    </div>
</body>
</html>