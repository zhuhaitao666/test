<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Amaze UI Admin index Examples</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/css/admin.css">
    <script src="/js/jquery.min.js"></script>
    <script src="/js/app.js"></script>
    <style type="text/css">
        .admin-content
        {
            position: relative;

        }
    </style>
</head>
<body>

<header class="am-topbar admin-header">
    <div class="am-topbar-brand"><img src="/i/logo.png"></div>

    <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
        <ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">

            <li class="am-dropdown tognzhi" data-am-dropdown>
                <button class="am-btn am-btn-primary am-dropdown-toggle am-btn-xs am-radius am-icon-bell-o" data-am-dropdown-toggle> 消息管理<span class="am-badge am-badge-danger am-round">6</span></button>
                <ul class="am-dropdown-content">

                    <li class="am-dropdown-header">所有消息都在这里</li>



                    <li><a href="#">未激活会员 <span class="am-badge am-badge-danger am-round">556</span></a></li>
                    <li><a href="#">未激活代理 <span class="am-badge am-badge-danger am-round">69</span></a></li>
                    <li><a href="#">未处理汇款</a></li>
                    <li><a href="#">未发放提现</a></li>
                    <li><a href="#">未发货订单</a></li>
                    <li><a href="#">低库存产品</a></li>
                    <li><a href="#">信息反馈</a></li>
                </ul>
            </li>

            <li class="kuanjie">

                <a href="#">会员管理</a>
                <a href="#">奖金管理</a>
                <a href="#">订单管理</a>
                <a href="#">产品管理</a>
                <a href="#">个人中心</a>
                <a href="#">系统设置</a>
            </li>

            <li class="soso">

                <p>

                    <select data-am-selected="{btnWidth: 70, btnSize: 'sm', btnStyle: 'default'}">
                        <option value="b">全部</option>
                        <option value="o">产品</option>
                        <option value="o">会员</option>
                    </select>

                </p>

                <p class="ycfg"><input type="text" class="am-form-field am-input-sm" placeholder="圆角表单域" /></p>
                <p><button class="am-btn am-btn-xs am-btn-default am-xiao"><i class="am-icon-search"></i></button></p>
            </li>




            <li class="am-hide-sm-only" style="float: right;"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
        </ul>
    </div>
</header>

<div class="am-cf admin-main">
    <div class="nav-navicon admin-main admin-sidebar">
        <div class="sideMenu am-icon-dashboard" style="color:#aeb2b7; margin: 10px 0 0 0;">
            <c:choose>
                <c:when test="${ !empty sessionScope.userName}">
                    欢迎管理员: &nbsp;${sessionScope.userName}
                    <a href="${pageContext.request.contextPath}/ShoesOnline/logout1">注销</a>
                </c:when>
                <c:otherwise>
                    <jsp:forward page="login1.jsp"/>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="sideMenu">
            <h3 class="am-icon-flag"><em></em> <a href="#">商品管理</a></h3>
            <ul>
                <li><a href="/ShoesOnline/toMain">商品列表</a></li>
                <li  class="func" dataType='html' dataLink='msn.htm' iconImg='images/msn.gif'><a href="/ShoesOnline/toMain?information=addShoes">添加新商品</a></li>
                <li>商品分类</li>
                <li>用户评论</li>
                <li><a href="/ShoesOnline/toMain?information=recycleStation">商品回收站</a></li>
                <li><a href="/ShoesOnline/toMain?information=reserveStation">库存管理</a></li>
            </ul>
            <h3 class="am-icon-cart-plus"><em></em> <a href="#"> 订单管理</a></h3>
            <ul>
                <li><a href="/ShoesOnline/toMain?information=orderStation">订单列表</a></li>
                <li>合并订单</li>
                <li>完成订单</li>
                <li>添加订单</li>
                <li><a href="/ShoesOnline/toMain?information=pendingStation">发货单列表</a></li>
                <li>换货单列表</li>
            </ul>
            <h3 class="am-icon-users"><em></em> <a href="#">会员管理</a></h3>
            <ul>
                <li><a href="/ShoesOnline/toMain?information=allUsers">会员列表</a></li>
                <li><a href="${pageContext.request.contextPath}/jsp/register.jsp" target="_blank">添加用户</a></li>
                <li>团队系谱图</li>
                <li>会员推荐图</li>
                <li>推荐列表</li>
            </ul>
            <h3 class="am-icon-volume-up"><em></em> <a href="#">信息通知</a></h3>
            <ul>
                <li>站内消息 /留言 </li>
                <li>短信</li>
                <li>邮件</li>
                <li>微信</li>
                <li>客服</li>
            </ul>
            <h3 class="am-icon-gears"><em></em> <a href="#">系统设置</a></h3>
            <ul>
                <li>数据备份</li>
                <li>邮件/短信管理</li>
                <li>上传/下载</li>
                <li>权限</li>
                <li>网站设置</li>
                <li>第三方支付</li>
                <li>提现 /转账 出入账汇率</li>
                <li>平台设置</li>
                <li>声音文件</li>
            </ul>
        </div>
        <!-- sideMenu End -->
        <script type="text/javascript">
            jQuery(".sideMenu").slide({
                titCell:"h3", //鼠标触发对象
                targetCell:"ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
                effect:"slideDown", //targetCell下拉效果
                delayTime:300 , //效果时间
                triggerTime:150, //鼠标延迟触发时间（默认150）
                defaultPlay:true,//默认是否执行效果（默认true）
                returnDefault:true //鼠标从.sideMen移走后返回默认状态（默认false）
            });
        </script>
    </div>
</div>
<div class="admin">
    <c:choose>
        <c:when test="${information=='addShoes'}">
            <jsp:include page="addShoes.jsp"></jsp:include>
        </c:when>
        <c:when test="${information=='recycleStation'}">
            <jsp:include page="recycleStation.jsp"></jsp:include>
        </c:when>
        <c:when test="${information=='updateShoes'}">
            <jsp:include page="updateShoes.jsp"></jsp:include>
        </c:when>
        <c:when test="${information=='reserveStation'}">
            <jsp:include page="stock.jsp"/>
        </c:when>
        <c:when test="${information=='allUsers'}">
            <jsp:include page="allUsers.jsp"/>
        </c:when>
        <c:when test="${information=='pendingStation'}">
            <jsp:include page="pendingShipment.jsp"/>
        </c:when>
        <c:when test="${information=='orderStation'}">
            <jsp:include page="orderList.jsp"/>
        </c:when>
        <c:otherwise>
            <jsp:include page="main.jsp"></jsp:include>
        </c:otherwise>
    </c:choose>

</div>
<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="/js/polyfill/rem.min.js"></script>
<script src="/js/polyfill/respond.min.js"></script>
<script src="/js/amazeui.legacy.js"></script>
<![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<script src="/js/amazeui.min.js"></script>
<!--<![endif]-->
</body>
</html>