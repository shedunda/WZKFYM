﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowUser.aspx.cs" Inherits="YSCMS.PageView.User.ShowUser" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><%Response.Write(YSCMS.Config.UIConfig.HeadTitle); %>_查看用户资料</title>
    <link type="text/css" rel="stylesheet" href="css/base.css" />
    <link type="text/css" rel="stylesheet" href="css/login.css"/>
    <link rel="icon" href="../favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" /> 
</head>
<body scrolling="no">
<form id="form1" runat = "Server">
<div style="width:100%" id="topshow">
    <table border="0" cellpadding="2" class="2" style="width:100%;">
    <tr>
        <td style="width:30%;"><a href="http://www.foosun.net" target="_blank"><img src="../sysImages/user/userlogo.gif" border="0" /></a></td>
        <td style="width:70%;">此处插入您的广告</td>
    </tr>
    </table>
</div>
 <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
   <tr>
     <td style="padding:5px 8px 5 5px;"><a href="../" class="list_link" target="_self">首页</a>&nbsp;&nbsp;┊&nbsp;&nbsp;<a href="show/info.aspx?uid=<%Response.Write(Request.QueryString["uid"]); %>" class="list_link" target="sys_main">用户资料</a>&nbsp;&nbsp;┊&nbsp;&nbsp;<a href="show/info.aspx?s=content&uid=<%Response.Write(Request.QueryString["uid"]); %>" class="list_link" target="sys_main">文章</a>&nbsp;&nbsp;┊&nbsp;&nbsp;<a href="show/info.aspx?s=photo&uid=<%Response.Write(Request.QueryString["uid"]); %>" class="list_link" target="sys_main">相册</a>&nbsp;&nbsp;┊&nbsp;&nbsp;<a href="show/info.aspx?s=group&uid=<%Response.Write(Request.QueryString["uid"]); %>" class="list_link" target="sys_main">讨论组/社群</a>&nbsp;&nbsp;┊&nbsp;&nbsp;<a href="show/info.aspx?s=bbs&uid=<%Response.Write(Request.QueryString["uid"]); %>" class="list_link" target="sys_main">话题</a>&nbsp;&nbsp;┊&nbsp;&nbsp;<a href="show/info.aspx?s=link&uid=<%Response.Write(Request.QueryString["uid"]); %>" class="list_link" target="sys_main">友情连接</a>&nbsp;&nbsp;┊&nbsp;&nbsp;<a href="index.aspx?urls=Message/Message_write.aspx?uid=<%Response.Write(Request.QueryString["uid"]); %>" class="list_link" target="_blank">发送消息</a>&nbsp;&nbsp;┊&nbsp;&nbsp;<a href="index.aspx?urls=friend/friend_add.aspx?uid=<%Response.Write(Request.QueryString["uid"]); %>" class="list_link" target="_blank">加为好友</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label id="myinfo" runat="server" /></td>
   </tr>
 </table>
 <div style="width:100%;padding-left:0px;">
	<iframe style="width:100%;" scrolling="no" onunload="this.height=480;" onload="foosun_iframeResize();foosun_Scrolliframe();" frameborder="0" id="sys_main" name="sys_main" src="<%Response.Write(URL); %>">您的浏览器不支持此功能，请您使用最新的版本。</iframe>
</div>
</form>
</body>
</html>