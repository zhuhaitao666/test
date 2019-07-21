<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>修改商品信息</title>
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
            var v1=document.getElementsByClassName("promoteDay")[0];
            var v2=document.getElementsByClassName("promotePrice")[0];
            v1.value="";
            v2.value="";
        }
        function canP() {
            var v =document.getElementsByClassName("canP")[0];
            var b=document.getElementsByClassName("b")[0];
            var c=document.getElementsByClassName("givePoint")[0];
            if (b.checked==true){
                v.style.display="block";
            }
            else{
                v.style.display="none";
                c.value="";
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
        function updateImg() {
            var u=document.getElementsByClassName("update_imgButton")[0];
            var b=document.getElementsByClassName("update_img")[0];
            if (u.checked==true){
                b.style.display="block";
            }
            else{
                b.style.display="none";
            }
        }
        function canUpdate(form) {
            alert("修改成功!");
            return true;
        }
    </script>
</head>
<body>
    <div class="main" align="center">
        <form action="${pageContext.request.contextPath}/ShoesOnline/updateA?goodsId=${updateShoes.goodsId}&information=updateShoes" method="post" enctype="multipart/form-data" onsubmit="return canUpdate(this)">
            <h4>修改商品信息</h4>
            <div>
                商品id:${updateShoes.goodsId}<br>
                <img class="shoesImage" src="${updateShoes.shoesImg.path}" />
            </div>
            重新商品图片:
            <input type="checkbox" value="" class="update_imgButton"  onclick="updateImg()"><br>
            <div class="update_img" style="display: none">
                <input type="file" name="pic" class="pic"/>
            </div>
            鞋子名称:<input type="text" name="goodsName" value="${updateShoes.goodsName}" required autofocus/><br>
            鞋子描述:<input type="text" name="desc" value="${updateShoes.desc}" required autofocus/><br>
            市&nbsp;场&nbsp;价:<input type="text" name="shopPrice" value="${updateShoes.shopPrice}" required autofocus><br>
            重新选择品牌选择:
            <select name="goodsTypeId" id="goodsTypeId">
                            <c:forEach var="shoesType" items="${shoesTypes}">
                                <option value="${shoesType.id}">${shoesType.brandName}</option>
                            </c:forEach>
            </select>
            <div>
            是否修改促销:
            是：<input type="radio" name="isPromote" value="1" onclick="isP()"/>
            否：<input type="radio" name="isPromote" value="0" checked onclick="notP()"><br>
                <div class="promote" style="display: none">
                    促销价格:<input type="text" name="promotePrice" class="promotePrice" value="${updateShoes.promotePrice}"><br>
                    促销天数:<input type="text" name="promoteDay" class="promoteDay"><br>
                </div>
            </div>
            是否可用于积分(1:是,0:否)<input type="checkbox" name="canPoint" value="0" onclick="canP()" class="b"><br>
            <div class="canP"  style="display: none">
            奖励积分：<input  type="text" name="givePoints" class="givePoint" value="0"/><br>
            </div>
            添加与优惠券的联系 是：<input class="d" type="checkbox" name="canUseCoupon" value="1" onclick="canCoupon()"><br>
            <div class="coupon" style="display: none">
                 优惠券1<input type="checkbox" name="goodsDiscountId" value="1" class="ACoupon">
                 优惠券2<input type="checkbox" name="goodsDiscountId" value="2" class="ACoupon">
                 优惠券3<input type="checkbox" name="goodsDiscountId" value="3" class="ACoupon">
            </div>
            <input type="submit" value="确定修改">
        </form>
    </div>
</body>
</html>