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