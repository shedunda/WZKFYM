﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FriendManage_Add.aspx.cs" Inherits="YSCMS.PageView.User.Friend.FriendManage_Add" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><%Response.Write(YSCMS.Config.UIConfig.HeadTitle); %></title>
	<link type="text/css" rel="stylesheet" href="../css/base.css" />
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/public.js" type="text/javascript"></script>
</head>
<body class="main_big">
<form id="form1" name="form1" method="post" action="" runat="server">
  <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
        <tr>
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="57%" class="matop_tab_left"><strong  style="font-size:14px; line-height:35px; margin-left:10px;">好友管理</strong></td>
    <td width="43%" class="list_link"  style="PADDING-LEFT: 14px" ><div style="text-align:right; margin-right:10px;">位置导航：<a href="../main.aspx" target="sys_main" class="list_link">首页</a><img alt="" src="/sysImages/folder/navidot.gif" border="0" /><a href="friendList.aspx" class="menulist">好友管理</a><img alt="" src="/sysImages/folder/navidot.gif" border="0" />好友分类</div></td>
        </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
  <tr>
     <td><span class="topnavichar" style="PADDING-LEFT: 14px"><a href="friendList.aspx" class="menulist">好友管理</a>　<a href="friendmanage.aspx" class="menulist">好友分类</a>&nbsp;&nbsp; <a href="friend_add.aspx" class="menulist">添加好友</a>&nbsp;&nbsp; <a href="friendmanage_add.aspx" class="menulist">添加好友分类</a>&nbsp;&nbsp; <a href="friend_Establishment.aspx" class="menulist">好友设置</a></span></td>
  </tr>
</table>

<table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" class="Tablist tab">
  

  <tr class="TR_BG_list">
    <td class="list_link" width="25%" align="right">分类名称：</td>
      <td class="list_link" width="75%">
          <asp:TextBox ID="FriendNameBox" runat="server" Width="280px" CssClass="form"></asp:TextBox>&nbsp;<span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('u_friendmanage_add_0001',this)">帮助</span>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="分类名称不能为空" ControlToValidate="FriendNameBox"></asp:RequiredFieldValidator></td>
 </tr>
    <tr class="TR_BG_list">
    <td class="list_link"  align="right">分类说明</td>
      <td class="list_link">
          <asp:TextBox ID="ContentBox" runat="server" Height="98px" TextMode="MultiLine" Width="280px" CssClass="form"></asp:TextBox>&nbsp;<span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('u_friendmanage_add_0002',this)">帮助</span></td>
 </tr>
    <tr class="TR_BG_list">
        <td class="list_link"  align="right"></td>
        <td class="list_link" colspan="2">
             
             <asp:Button ID="sumbitsave" runat="server" CssClass="form1" Text=" 确 定 "  OnClick="shortCutsubmit" />
      
             <input id="reset" type="reset" value="重 置" class="form1" style="width: 74px"/>
        </td>
 </tr>
</table>
<table width="100%" height="74" border="0" cellpadding="0" cellspacing="0" class="copyright_bg">
  <tr>
    <td><div align="center"><%Response.Write(this.CopyRight); %></div></td>
  </tr>
</table>
</form>
</body>
</html>
