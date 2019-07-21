<%@ page import="com.qbd.pojo.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="com.qbd.pojo.Ordergoods" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript" charset="utf-8" src="/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="/Ueditor/lang/zh-cn/zh-cn.js"></script>

    <style type="text/css">

        .nav{
            float: left;
            width: 100%;
            height: 90%;
            top: 60px;
            background-color:#E7E7E7;
        }
        .nav ul li{
            list-style-type: none;
            float: left;
            margin-left: 145px ;
            width: 6%;

        }

        a{
            text-decoration: none;
            width: 60px;
            background-color: orangered;

        }
        a:hover{
            background-color: red;
        }
        .text-center{
            float: left;
            top: 100px;
        }
        table{
            background-color:#E7E7E7;
            border: dashed  1px;
            font-family: "微软雅黑";
            font-size: 15px;
            text-align: center;
            width: 100%;
        }
        table tr{
            height: 50px;

        }
        table tr td{
            width: 200px;
        }
        #find{
            background-color: darkgoldenrod;
        }
        #find:hover{
            background-color: red;
        }
        .price{
            color: red;
        }
        .pageTurning{
            float: right;
        }
        b{
            color: #A94442;
        }
        .mainEditor{
            float: right;
        }
        div{
            width:100%;
        }
    </style>
    <script type="text/javascript">
        var n = 1;
        function addBotton(i){
            var judge=document.getElementsByClassName("judge")[i];
            if(n==1)
            {
                judge.innerHTML+="<input type='text' name='judgement' required autofocus/>";
                judge.innerHTML+="<select name='star'>\n" +
                    "            <option value='1'>一星评价</option>\n" +
                    "            <option value='2'>二星评价</option>\n" +
                    "            <option value='3'>三星评价</option>\n" +
                    "            <option value='4'>四星评价</option>\n" +
                    "            <option value='5'>五星评价</option>\n" +
                    "        </select>";
                judge.innerHTML+="<input type='submit'  value='提交'/>"
                judge.innerHTML+="<input type='reset'  value='重置'/>"
            }
            n++;
        }
        function myCheck(form)
        {
            alert("评论成功");
            return true;
        }
        function addBotton1(i){
            var judge1=document.getElementsByClassName("judge1")[i];
            if(n==1)
            {
                judge1.innerHTML+="<input type='text' name='judgement' required autofocus/>";
                judge1.innerHTML+="<input type='submit'  value='提交'/>"
                judge1.innerHTML+="<input type='reset'  value='重置'/>"
            }
            n++;
        }
        function myCheck1(form)
        {
            alert("追评成功");
            return true;
        }

    </script>
</head>
<body>
<%
    List<Order> orders=(List<Order>) request.getAttribute("orders");
%>
<span style="color: darkgreen;font-size:25px">评价晒单</span><a href="#" onClick="javascript :history.back(1);">返回上一页</a>
<div class="main">
    <div class="text-center">
        <table>
            <tr>
                <td>商品</td>
                <td>订单详情</td>
                <td>收货人</td>
                <td>数量</td>
                <td>评价</td>
                <td>星级</td>

            </tr>
        </table>
        <%
            int i=0;
            int n=0;
            for (Order o:orders){
                for (Ordergoods ordergoods:o.getOrdergoods()) {
                   System.out.println("订单项:"+ordergoods);
        %>
        <table>

            <tr>
                <td><img src="<%=ordergoods.getShoes().getShoesImg().getPath()%>" width="50px" height="50px"/></td>
                <td><%=ordergoods.getShoes().getGoodsName()%> </td>
                <td><%=o.getUser().getName()%></td>
                <td><%=ordergoods.getNumber()%></td>
                <td>
                    <%if (ordergoods.getComment()==null||ordergoods.getComment().equals("null")){%>
                    <%--<form class="judge" action="<%=request.getContextPath() %>/ShoesOnline/toJudge"--%>
                          <%--method="get" onsubmit="return myCheck(this)">--%>
                        <%--<input type="hidden" name="goodsId" value="<%=ordergoods.getGoodsId()%>" />--%>
                        <%--<input type="hidden" name="orderId" value="<%=ordergoods.getOrderId()%>" />--%>
                        <%--<input name="judgement" type="button" value="评论" onclick="addBotton(<%=n%>)"/><br>--%>
                    <%--</form>--%>
                    <a href="${pageContext.request.contextPath}/jsp/self/judge.jsp?goodsId=<%=ordergoods.getGoodsId()%>&orderId=<%=ordergoods.getOrderId()%>" target="mainFrame">评论</a>
                    <%n++;}else{%>
                    <span><b>首评:</b><%=ordergoods.getComment().getContent()%>
                     <%if (ordergoods.getComment().getAddContent()==null){%>
                        <%--<form class="judge1" action="<%=request.getContextPath() %>/ShoesOnline/toAddJudge"--%>
                              <%--method="get" onsubmit="return myCheck1(this)">--%>
                            <%--<input type="hidden" name="commentId" value="<%=ordergoods.getComment().getCommentId()%>">--%>
                            <%--<input name="judgement1" type="button" value="追评" onclick="addBotton1(<%=i%>)"/><br>--%>
                         <%--</form>--%>
                        <a href="${pageContext.request.contextPath}/jsp/self/addjudge.jsp?commentId=<%=ordergoods.getComment().getCommentId()%>" target="mainFrame">追加评论</a>
                        <%i++;}else{%>
                           <br/><b>追评:</b><%=ordergoods.getComment().getAddContent()%>
                        <%}%>
                 </span>
                </td>
                <td>
                    <% int star=ordergoods.getComment().getStar();
                        while(star>0){%>
                    <img src="/images/xing.png" width="8px" height="8px"/>
                    <%star--; }%>
                </td>
                <%}%>
                </td>
            </tr>
            <% }%>
            <tr>
                <td>付款方式: 在线支付</td>
                <td class="price">实付金额 ￥<%=o.getValue()%></td>
            </tr>

        </table>
        <%}%>

    </div>


</div>
</body>
</html>