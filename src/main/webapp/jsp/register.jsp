<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>注册页面</title>
    <style type="text/css">
        * { padding:0; margin:0; outline:0; }
        .thediv{
            color: #80808D;
            font-size: 16px;
            width:80%;
            height: 90%;
            background-color:#636363;
            background-image: url(../images/registerlogo.jpg);
            background-repeat: no-repeat;
            background-size: 100% 100%;
            display:block;
            position:absolute;
            top:50px;
            left:150px;
        }
        .thediv .theform{
            position:absolute;
            top: 35%;
            left: 45%;
        }
        h2{
            position:absolute;
            top:10px;
            left:150px;
        }
        .login{
            width: 150px;
            background-color:#E1EDF7;
            border-style:solid;
            border-color:red;
        }
        a:hover{
            color: red;
            text-decoration: none;
        }
        .zht_form1 ul li{
            list-style-type: none;
        }
        #code{
            background-color: #6A6A6A;
            width: 100px;
            color: red;
        }

    </style>
</head>
<body bgcolor="#A9A9A9">

<h2 align="center">注册</h2><br /><br /><br /><br />
<div class="thediv" align="center" name="thediv">
    <form class="theform" action="${pageContext.request.contextPath}/ShoesOnline/register" method="post" name="theform">
        <div>
            <label>
                <input name="name" placeholder="姓名:" type="text" tabindex="1" required autofocus>
            </label>
        </div>
        <div>
            <label>
                <input name="phone" placeholder="电话:" type="text" tabindex="2" required autofocus>
            </label>
        </div>
        <div>
            <label>
                <input name="address" placeholder="address:" type="text" tabindex="3" required autofocus>
            </label>
        </div>
        <div>
            <label>
                <input name="email" placeholder="email:" type="text" tabindex="4" required autofocus>
            </label>
        </div>
        <div>
            <label>
                <input name="qq" placeholder="QQ:" type="text" tabindex="5" required autofocus>
            </label>
        </div>
        <div>
            <label>
                <input name="birthday" placeholder="Birthday:" type="text" tabindex="6" required autofocus>
            </label>
        </div>
        <div class="zht_form1">

            <label class="radio left"><input type="radio" name="radio" checked="">男</label>

            <label class="radio"><input type="radio" name="radio">女</label>

        </div><br />
        <div>
            <label>
                <input  name="password" placeholder="password" type="password" tabindex="7" required>
            </label>
        </div>
        <div class="soWhat">
            <label>
                <input name="mima2"  placeholder="repeat password" type="password" tabindex="8" required>

            </label>

        </div><br/>


        <div id="code">
            xdF2
        </div>

        <div>
            <label>
                <input name="codeInput" placeholder="请填写验证码" type="text" tabindex="8" required>
            </label>
        </div>
        <div>
            <input type="submit" value="注册" id="register-submit" onclick="common();">
            <input type="reset"value="重置" />
        </div>
        <div class="sky-form">
            <label class="checkbox">
                <input type="checkbox" name="checkbox" checked/>
                我已阅读并同意用户协议 &nbsp;
                <a class="terms" href="#">详情</a>
            </label>
        </div>
    </form>
</div>
<script type="text/javascript">
    //当前验证码获取的随即范围
    var codeStr = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    //思想：0-61索引 只需要随机生成4个索引，然后charAt可以获取随机4个索引。
    var oDiv = document.getElementById("code");

    function getRandom(n, m) {
        n = Number(n);              //转换n,m，结果不是数字就是NaN
        m = Number(m);
        if (isNaN(n) || isNaN(m)) {          //判断n,m,是不是有效数字，如果n或m其中一个传入的不是数字
            return Math.random();           //返回  【0-1）之间的随机小数
        }
        if (n > m) {                          //如果n大于m，则交换位置
            var temp = n;
            n = m;
            m = temp;
        }
        return Math.round(Math.random() * (m - n) + n);                   //返回，取m,n之间的随机整数。
    }


    function getCode() {
        var str = "";　　　　　　　　//定义一个空字符串备用
        for (var i = 0; i < 5; i++) {        //遍历4个索引
            var ran = getRandom(0, 61);           //调用getRandom方法，随机获取一个索引0-61里的随机索引
            str += codeStr.charAt(ran);           //把codeStr字符串里，我们指定获取ran（这个4个索引）；
        }
        oDiv.innerHTML = str;//呈现在页面上
        code=str;
    }

    getCode();                           //调用方法

    oDiv.onclick = function () {
        getCode();
    }
    function common() {


        var com1=document.theform.password.value;
        var com2=document.theform.mima2.value;
        var codeInput=document.theform.codeInput.value;
        if(com1!=com2&&codeInput!=code)
        {
            alert("俩次密码输入不一致!\n验证码输入错误!");
        }
        else if(com1!=com2||codeInput!=code){
            if (com1!=com2)
            {
                alert("俩次输入不一致！");
            }

            if (codeInput!=code)
            {
                alert("验证码输入错误！");
            }
        }
        else{alert("注册成功!");}
    }
</script>

</body>
</html>
