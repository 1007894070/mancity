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
function jump(url)
{
 document.location.href = url;
}
//////////////////////////////////////////////////////////////
function show_box(id,w,h)
{
	njb_box = id;
	document.getElementById(id).style.display = "block";
	document.getElementById(id).style.width = w + "px";
	document.getElementById(id).style.height = h + "px";
	document.getElementById(id).style.left = Math.floor((document.body.clientWidth - w - 10) / 2) + "px";
}
function hide_box(id)
{
	njb_box = '';
	document.getElementById(id).style.display = "none";
}
function result()
{
	alert("执行完毕");
}
function del(val)
{
	var arr = val.split("|");
 if(confirm("您确定要删除这条记录吗？"))
 {
 ajax("post","?/deal/","cmd=del_record&table=" + arr[0] + "&id=" + arr[1],
 function(data)
 {
 if(data == 1) document.location.replace(document.location.href);
 });
 }
}
function del_file(val)
{
 if(confirm("您确定要删除该文件吗？"))
 {
 ajax("post","?/deal/","cmd=del_file&path=" + val,
 function(data)
 {
 if(data == 1) document.location.replace(document.location.href);
 });
 }
}
function show_edit(val)
{
	document.getElementById(val+"_1").style.display = "none";
	document.getElementById(val+"_2").style.display = "block";
	document.getElementById(val+"_2").childNodes.item(0).focus();
}
function hide_edit(val)
{
	document.getElementById(val+"_1").style.display = "block";
	document.getElementById(val+"_2").style.display = "none";
}
function set_varia(name,val)
{
	ajax("post","?/deal/","cmd=set_varia&name="+name+"&val="+val,
	function(data)
	{
		if(data == 1) result();
	});
}
function set_order(type,table,id,val)
{
	if(val == true){val = 1;}else if(val == false){val = 0;}
	ajax("post","?/deal/","cmd=set_order&type="+type+"&table="+table+"&id="+id+"&val="+val,
	function(data)
	{
		if(data == 1)
		{
			switch(type)
			{
				case "index":
					document.getElementById("index_" +id+"_1").innerHTML = document.getElementById("index_"+id).value + "<img src='templates/default/images/pencil.gif' />";
					hide_edit("index_"+id);	
				break;
			}
			result();
		}else if(data == 0){
			switch(type)
			{
				case "show": show_box('no_deal',300,100); break;
			}
		}
	});
}
function before_upload(box,tag,dir,show_tag,form_tag,reduce)
{
	document.getElementById(tag).dir.value = dir;
	document.getElementById(tag).reduce.value = reduce;
	document.getElementById(tag).show_tag.value = show_tag;
	document.getElementById(tag).form_tag.value = form_tag;
	show_box(box,320,90);
}
function do_upload(tag,flag)
{
	var dir = document.getElementById(tag).dir.value;
	var file = document.getElementById(tag).file_path.value;
	if(flag == 1)
	{
		var show_tag = document.getElementById(tag).show_tag.value;
		var form_tag = document.getElementById(tag).form_tag.value;
	}
	if(file != "")
	{
		var site = file.lastIndexOf(".");
		if(site != -1)
		{
			site = file.lastIndexOf("\\");
			file = file.substr(site + 1,file.length - site);
			ajax("post","?/deal/","cmd=get_upl_file_name&dir="+dir+"&file="+file,
			function(data)
			{
				file = data;
				document.getElementById(tag).file.value = file;
				document.getElementById(tag).submit();
				if(flag == 1)
				{
					var func = "after_upload('"+tag+"','"+show_tag+"','"+form_tag+"')"
				}else{
					var func = "after_upload2('"+tag+"')"
				}
				njb_colck = setInterval(func,700);
			});
		}
	}
}
function after_upload(tag,show_tag,form_tag)
{
	var data = get_cookie("img");
	if(data != "")
	{
		hide_box(njb_box);
		del_cookie("img");
		clearInterval(njb_colck);
		var show_tag = document.getElementById(tag).show_tag.value;
		var form_tag = document.getElementById(tag).form_tag.value;
		if(show_tag != "")
		{
			document.getElementById(show_tag).innerHTML = "<img src='" + data + "' height='100px' />";
			document.getElementById(form_tag).value = data;
		}else{
			var obj = document.getElementById(form_tag);
			if(obj.value == "")
			{
				obj.value = data;
			}else{
				obj.value = obj.value + "|" + data;
			}
		}
	}
	data = get_cookie("file");
	if(data != "")
	{
		hide_box(njb_box);
		del_cookie("file");
		clearInterval(njb_colck);
		var show_tag = document.getElementById(tag).show_tag.value;
		var form_tag = document.getElementById(tag).form_tag.value;	
		document.getElementById(show_tag).innerHTML = data;
		document.getElementById(form_tag).value = data;
	}
}
function after_upload2(tag)
{
	var data = get_cookie("img");
	if(data != "")
	{
		del_cookie("img");
		location.replace(location.href);
	}
	data = get_cookie("file");
	if(data != "")
	{
		del_cookie("file");
		location.replace(location.href);
	}
}
function set_seo(val)
{
	var key = document.getElementById(val+"_keywords").value;
	var des = document.getElementById(val+"_description").value;
	document.getElementById("form_seo").seo_key.value = key;
	document.getElementById("form_seo").seo_des.value = des;
	show_box("seo",430,220);
}
function get_seo(val)
{
	var key = document.getElementById("form_seo").seo_key.value;
	var des = document.getElementById("form_seo").seo_des.value;
	document.getElementById(val+"_keywords").value = key;
	document.getElementById(val+"_description").value = des;
	hide_box("seo");
}
function before_set_url(box,tag,show_tag,form_tag)
{
	document.getElementById(tag).show_tag.value = show_tag;
	document.getElementById(tag).form_tag.value = form_tag;
	show_box(box,320,90);
}
function set_web_url(tag)
{
	var data = document.getElementById(tag).file_path.value;
	var show_tag = document.getElementById(tag).show_tag.value;
	var form_tag = document.getElementById(tag).form_tag.value;
	document.getElementById(show_tag).innerHTML = data;
	document.getElementById(form_tag).value = data;
	hide_box(njb_box);
}
function change_lang(val)
{
	if(val.indexOf("/id-") == -1)
	{
		document.location.href = val;
	}else{
		show_box("no_change_lang",280,95);
	}
}
function page_jump(val)
{
	var obj = document.getElementById("form_jump");
	var url = obj.url.value;
	var page = obj.page.value;
	url = url.replace("/page-" + val + "/","/page-" + page + "/");
	document.location.href = url;
}
//新秀