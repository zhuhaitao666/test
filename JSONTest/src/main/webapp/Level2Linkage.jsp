<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>二级联动</title>
</head>
<body>

    <select id="province" onchange="changeProvince()">
        <option value="-1">--请选择--</option>
    </select>
    <select id="city">
        <option value="-1">--请选择--</option>
    </select>

<script type="text/javascript">
    function check(){
        var xhr;
        if(XMLHttpRequest){
            xhr=new XMLHttpRequest();
        }else if(ActiveXObject){
            xhr=ActiveXObject("Microsoft.XMLHTTP");
        }
        else{
            alert("您使用了不兼容的浏览器");
        }
        xhr.open("get","/getCity");
        xhr.send();
        xhr.onreadystatechange=function (ev) {
            if(xhr.readyState==4&&xhr.status==200) {
                var provinces=eval("("+xhr.responseText+")");
                var province=document.getElementById("province");
                for(var i=0;i<provinces.length;i++){
                    var p=document.createElement("option");
                    p.value=provinces[i].id;
                    p.innerHTML=provinces[i].name;
                    province.appendChild(p);
                }
            }
        }
    }

    function changeProvince(){
        var xhr;
        if(XMLHttpRequest){
            xhr=new XMLHttpRequest();
        }else if(ActiveXObject){
            xhr=ActiveXObject("Microsoft.XMLHTTP");
        }
        else{
            alert("您使用了不兼容的浏览器");
        }
        var province=document.getElementById("province");
        xhr.open("get","/getCity?id="+province.value);
        xhr.send();
        xhr.onreadystatechange=function (ev) {
            if(xhr.readyState==4&&xhr.status==200) {
                var city=document.getElementById("city");
                city.innerHTML="<option value='-1'>--请选择--</option>";
                var cities=eval("("+xhr.responseText+")");
                for(var i=0;i<cities.length;i++){
                    var c=document.createElement("option");
                    c.value=cities[i].id;
                    c.innerHTML=cities[i].name;
                    city.appendChild(c);
                }
            }
        }
    }
    window.onlocad=check();
</script>
</body>
</html>