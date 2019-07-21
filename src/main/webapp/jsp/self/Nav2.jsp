<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>侧面导航</title>
    <style type="text/css">

        a{
            text-decoration: none;
            width: 100px;
            height:100%;
            background-color: silver;
        }
        a:hover{
            background-color: #EEBF05;
        }
        .main{
            font-family: "微软雅黑";
            width: 500px;
            background-color:#E4DFDF;
            height:800px;
        }
        #menu{
            position: absolute;
        }
        #menu li{
            list-style-type: none;
            padding-right: 20px;
            width: 100px;

            text-align: center;
        }
        #menu li ul{

            margin: 0px;
            padding: 0px;
        }
        #menu li ul li{
            padding: 0px;
            margin: 0px;
            float: none;
            list-style-type: none;
            width: 100px;
            font-size: 10px;
        }
    </style>
</head>
<body>
<div class="main">
    <ul id="menu">
        <li class="menu"><a href="#">订单中心</a>
            <ul>
                <li><a href="#">待付款</a></li>
                <li><a href="${pageContext.request.contextPath}/ShoesOnline/toPendingReceipt" target="mainFrame">待收货</a></li>
                <li><a href="${pageContext.request.contextPath}/ShoesOnline/toBeShipped" target="mainFrame">待发货</a></li>
                <li><a href="${pageContext.request.contextPath}/ShoesOnline/toHadGet" target="mainFrame">评价晒单</a></li>
            </ul>
        </li>
        <br /><br /><br />
        <li class="menu"><a href="#">我的个人中心</a>
            <ul>
                <li><a href="#">消息通知</a></li>
                <li><a href="#">优惠券</a></li>
                <li><a href="ReceiptAddress.html" target="mainFrame">收货地址</a></li>
                <li><a href="#">现金账户</a></li>
            </ul>
        </li>
        <br /><br /><br />
        <li class="menu"><a href="#">其他</a></li>
    </ul>

</div>

    <script type="text/javascript">
        var t=false,current;
        function SetupMenu(){
            if(!document.getElementsByTagName)return;

            items=document.getElementsByTagName('li');//得到页面中所有的li对象
            for (i=0;i<items.length;i++) {

                if(items[i].className!="menu")continue;

                thelink=findChild(items[i],"A");//得到菜单中的链接对象

                thelink.onmousemove=ShowMenu;//对链接进行移动到监听

                thelink.onmouseout=StartTimer;//对链接进行移除监听

                if(ul=findChild(items[i],"UL")){

                    ul.style.display="none";
                    for (j=0;j<ul.childNodes;j++) {
                        ul.childNodes[j].onmousemove=ResetTimer;
                        ul.childNodes[j].onmouseout=StartTimer;
                    }
                }

            }
        }
        //查找其中对应的第一个子标签
        function findChild(obj,tag){
            cn=obj.childNodes;
            for (k=0;k<cn.length;k++) {

                if(cn[k].nodeName==tag) return cn[k];
            }
            return false;
        }
        function ShowMenu(e){

            e=e||window.event;
            thislink=e.target||e.srcElement;
            ResetTimer();
            if(current)HideMenu(current);
            thislink=thislink.parentNode;//得到父级li
            current=thislink;
            ul=findChild(thislink,"UL");
            if(!ul)return;
            ul.style.display="block";
        }

        //隐藏菜单
        function HideMenu(thelink){
            ul=findChild(thelink,"UL");
            if(!ul)return ;
            ul.style.display="none";

        }
        function ResetTimer(){
            if(t)
                window.clearTimeout(t);
        }
        function StartTimer(){
            t=window.setTimeout("HideMenu(current)",3000);
        }
        window.onload=SetupMenu;
    </script>
</body>
</html>