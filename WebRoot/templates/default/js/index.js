var njb_colck,njb_box = '';
function ajax(type,file,text,func)
{
	var XMLHttp_Object;
	try{XMLHttp_Object = new ActiveXObject("Msxml2.XMLHTTP");}
	catch(new_ieerror)
	{
		try{XMLHttp_Object = new ActiveXObject("Microsoft.XMLHTTP");}
		catch(ieerror){XMLHttp_Object = false;}
	}
	if(!XMLHttp_Object && typeof XMLHttp_Object != "undefiend")
	{
		try{XMLHttp_Object = new XMLHttpRequest();}
		catch(new_ieerror){XMLHttp_Object = false;}
	}
	type = type.toUpperCase();
	if(type == "GET") file = file + "?" + text;
	XMLHttp_Object.open(type,file,true);
	if(type == "POST") XMLHttp_Object.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	XMLHttp_Object.onreadystatechange = function ResponseReq()
	{
		if(XMLHttp_Object.readyState == 4) func(XMLHttp_Object.responseText);
	};
	if(type == "GET") text = null;
	XMLHttp_Object.send(text);
}
function picresize(obj,MaxWidth,MaxHeight)
{
	if(!window.XMLHttpRequest)
	{
		obj.onload = null;
		img = new Image();
		img.src = obj.src;
		if (img.width > MaxWidth && img.height > MaxHeight)
		{
			if(img.width / img.height > MaxWidth / MaxHeight)
			{
				obj.height = MaxWidth * img.height / img.width;
				obj.width = MaxWidth;
			}else{
				obj.width = MaxHeight * img.width / img.height;
				obj.height = MaxHeight;
			}
		}else if(img.width > MaxWidth){
			obj.height = MaxWidth * img.height / img.width;
			obj.width = MaxWidth;
		}else if(img.height > MaxHeight){
			obj.width = MaxHeight * img.width / img.height;
			obj.height = MaxHeight;
		}else{
			obj.width = img.width;
			obj.height = img.height;
		}
	}
}
function get_cookie(c_name)
{
	if(document.cookie.length > 0)
	{
		c_start = document.cookie.indexOf(c_name + "=");
		if(c_start != -1)
		{
			c_start = c_start + c_name.length + 1;
			c_end = document.cookie.indexOf(";",c_start);
			if(c_end == -1)
			{
				c_end = document.cookie.length;
			}
			return unescape(document.cookie.substring(c_start,c_end));
		}
	}
	return "";
}
function del_cookie(name)
{
	var date = new Date();
	date.setTime(date.getTime() - 10000);
	document.cookie = name + "=a; expires=" + date.toGMTString();
}
function go_back()
{
	if(document.location.href != document.referrer)
	{
		document.location.replace(document.referrer);
	}else{
		window.history.go(-1);
	}
}
//////////////////////////////////////////////////////////////
function show_box(id,w,h)
{
	njb_box = id;
	$("#" + id).show();
	$("#" + id + " .inner").css("width",w + "px");
	$("#" + id + " .inner").css("height",h + "px");
	$("#" + id).css("left",Math.floor((document.body.clientWidth - w - 10) / 2) + "px");
}
function hide_box(id)
{
	njb_box = '';
	document.getElementById(id).style.display = "none";
}
function do_search()
{
	var obj = document.getElementById("form_search");
	var cat = obj.cat.value;
	var key = obj.key.value;
	obj.action = obj.action + "/cat-" + cat + "/key-" + key + "/";
	obj.submit();
}
//新秀