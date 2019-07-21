<%@ page import="com.qbd.pojo.Shoes" %>
<%@ page import="com.qbd.pojo.Comment" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="UTF-8">
    <title></title>
    <style type="text/css">
        .image{
            position: absolute;
            top: 60px;
            left: 200px;
            width: 500px;
            height: 500px;
            border: solid 1px;
            border-color: black;
        }
        .image img{
            width: 500px;
            height: 500px;
        }
        .main{
            font-family:"微软雅黑";
            font-size: 18px;
        }
        .product-detail{
            position: absolute;
            width: 500px;
            height: 510px;
            top: 60px;
            left: 850px;
            background-color:#E7E7E7;
        }
        .product-detail .info{
            font-family: "century gothic";
            font-size: 14px;
            color: red;
        }
        .product-detail .price .p1{
            font-size: 20px;
            color: red;
        }
        .product-detail .price .p2{
            font-size: 20px;
            color: red;
            text-decoration: line-through;
        }
        .product-detail form span{
            width: 60px;
            height: 40px;
            border: solid 1px;
            background-color:#DADADA;
        }
        .product-detail form span:hover{
            background-color:#C0C0C0;
        }
        .submit1{
            position: absolute;
            background-color: red;
            height: 40px;
            text-align: center;
        }
        .judgeMain{
            font-family:"微软雅黑";
            font-size: 10px;
        }
        .judgeNav{
            position: relative;
            width: 1150px;
            height: 310px;
            top: 600px;
            left: 195px;
            background-color:#E7E7E7;
        }
        .judgeNav ul li{
            list-style-type: none;
            float: left;
            margin-right: 10px ;
            width: 13%;
        }
        a {
            text-decoration: none;
            background-color: #DADADA;
            width: 60px;
        }
        a:hover{
            background-color: #9D0000;
        }
        .judgeNav ul li a:hover{
            background-color: #A94442;
        }
        .pageTurning{
            float: right;
        }
        table{
            border: solid 1px;
            border-color:lightgoldenrodyellow;
            text-align: center;
            width: 1150px;
        }
        tr{
            margin-bottom: 100px;
        }
        td{
            margin-bottom: 100px;
        }
        .th{
            font-size: 15px;
            color: #A94442;
        }
    </style>
    <script type="text/javascript">
        function delcfm(userId) {
            if(userId) {
                alert("成功添加到购物车");
                return true;
            }
            else {
                alert("请先登录");
                return false;
            }
            return false;
        }
    </script>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
        Shoes s=(Shoes) session.getAttribute("s");
        List<Comment>comments = (List<Comment>) session.getAttribute("comments");
        int addJudgeNum=0;
        int goodJudgeNum=0;
        int mediocreJudgeNum=0;
        int nagativeJudgeNum=0;
        int allJudge=0;
        for (Comment c:comments) {
            if (c.getAddContent()!=null){
                addJudgeNum++;
            }
            if(c.getStar()==5){
                goodJudgeNum++;
            }
            else if (c.getStar()==4){
                mediocreJudgeNum++;
            }
            else{
                nagativeJudgeNum++;
            }
            allJudge++;
        }

        if(session.getAttribute("commentsN")!=null){//不同评价
            comments=(List<Comment>) session.getAttribute("commentsN");
        }
    %>

<div class="main">
    <div class="image">
        <img src="<%=s.getShoesImg().getPath()%>" />
    </div>
    <div class="product-detail">
        <h3 class="description"><%=s.getGoodsName()%></h3>
        <h3 class="description"><%=s.getDesc()%> </h3>
        <p class="info">Chuck Taylor All Star 尺码偏大，请参考尺码建议</p>
        品牌:   &nbsp &nbsp&nbsp <span style="color: #EC971F;"><%=s.getShoesType().getBrandName()%></span>
        <div class="price">
            单  价 <p class="p1">￥<%=s.getShopPrice()%></p>
            <%
                if (s.getIsPromote()==1){
            %>
            促销价 <span style="color: #ffd900 ; font-size: 20px">￥<%=s.getPromotePrice()%></span>
            <script type="text/javascript">
                 var p=document.getElementsByClassName("p1")[0];
                 p.className="p2";
            </script>
            <%
                }
            %>
        </div>

        <form action="${pageContext.request.contextPath}/ShoesOnline/addShoesToCart" method="get" target="_parent" onsubmit="delcfm(<%=session.getAttribute("userId") %>)">
           <label> 选择颜色
					黑色/162050c<input  name="color" class="radio"  type="radio"  value="黑" checked/>
					白/162056c<input name="color" class="radio"  type="radio"  value="白">
           </label>
					<br /><br /><br />
            选择尺码
            <select name="size">
                <option value ="37/4.5">37/4.5</option>
                <option value ="38/5.5">38/5.5</option>
                <option value="39/6">39/6</option>
                <option value="40/7">40/7</option>
                <option value="41/7.5">41/7.5</option>
                <option value="42/8.5">42/8.5</option>
                <option value="43/9">43/9</option>
                <option value="44/10">44/10</option>
            </select>
            <br />

            <a href="JudgementIndex.html" target="_top">
                查看评价
            </a><br />
            <input type="button" value="-" onClick="javascript:if(this.form.buyNum.value>1)
                    this.form.buyNum.value--;" size="1">
            <input name="buyNum" type="text"  value="1" class="buyNum"  size="1">
            <input type="button" value="+" onClick="javascript:this.form.buyNum.value++;" size="1">
            <input class="submit1" type="submit" value="加入购物车"/>


        </form>

    </div>
    <div class="judgeMain">
        <div class="judgeNav">
            <ul>
                <li><a href="#" onClick="javascript :history.back(1);">返回上一页</a></li>
                <li><a href="${pageContext.request.contextPath}/ShoesOnline/detail?shoesId=<%=s.getGoodsId()%>" target="_top">全部评价（<%=allJudge%>）</a></li>
                <li><a href="#">晒图（0）</a></li>
                <li><a href="${pageContext.request.contextPath}/ShoesOnline/detailN?star=-1" target="_parent">追评（<%=addJudgeNum%>）</a></li>
                <li><a href="${pageContext.request.contextPath}/ShoesOnline/detailN?star=5" target="_parent">好评（<%=goodJudgeNum%>）</a></li>
                <li><a href="${pageContext.request.contextPath}/ShoesOnline/detailN?star=4" target="_parent">中评（<%=mediocreJudgeNum%>）</a></li>
                <li><a href="${pageContext.request.contextPath}/ShoesOnline/detailN?star=1" target="_parent">差评（<%=nagativeJudgeNum%>）</a></li>
            </ul>
            <br />
            <table>
                <tr class="th">
                    <td>评价人</td>
                    <td>
                        <%if (session.getAttribute("info")==null){%>
                        评价<%}else{%>
                        追评<%}%>
                    </td>
                    <td>评价星级</td>
                </tr>
                <%
                    for (Comment c: comments) {
                %>
                <tr>
                    <td> <%=c.getUser().getName()%> </td>
                    <td>
                        <%if (session.getAttribute("info")==null){%>
                        <%=c.getContent()%>
                        <%}else {%>
                        <%=c.getAddContent()%>
                        <%}%>
                    </td>
                    <td >
                        <div class="xingji">
                            <%
                                for (int i=0;i<c.getStar();i++)
                                {
                            %>
                            <img src="/images/xing.png" width="8px" height="8px"/>
                            <%
                                }
                            %>
                        </div>
                    </td>
                </tr>
                <%}%>
            </table>
            <%if(comments.size()==0){%>
            <p>该商品暂无此类评价···</p>
            <%}%>
        </div>
    </div>
</div>

</body>
</html>

