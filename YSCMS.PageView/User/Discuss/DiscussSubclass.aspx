﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DiscussSubclass.aspx.cs" Inherits="YSCMS.PageView.User.Discuss.DiscussSubclass" %>
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
<form id="form1" runat="server">
    <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
    <tr>
      <td height="1" colspan="2"></td>
    </tr>
    <tr>
      <td width="57%" class="matop_tab_left"><strong  style="font-size:14px; line-height:35px; margin-left:10px;">讨论组管理</strong></td>
      <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">位置导航：<a href="../main.aspx" target="sys_main" class="list_link">首页</a><img alt="" src="../images/navidot.gif" border="0" /><a href="discussManage_list.aspx" class="menulist">讨论组管理</a><img alt="" src="../images/navidot.gif" border="0" />讨论组分类</div></td>
    </tr>
    </table>
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
      <tr>
         <td style="PADDING-LEFT: 14px"><a href="discusssubclass.aspx" class="menulist">讨论组分类</a> &nbsp;&nbsp; <a href="discusssubclass_add.aspx" class="menulist">添加讨论组分类</a></span></td>
      </tr>
    </table>
    <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" class="Tablist tab">
      <tr>
         <td style="PADDING-LEFT: 14px; line-height:30px;">系统分类：<label id="sysClass" runat="server" /></td>
      </tr>
      <tr class="TR_BG_list">
         <td style="PADDING-LEFT: 14px; line-height:30px;"><label id="classLists" runat="server" /></td>
      </tr>
    </table>
    </form>
<br />
<br />
<table width="100%" height="74" border="0" cellpadding="0" cellspacing="0" class="copyright_bg">
  <tr>
    <td><div align="center"><%Response.Write(this.CopyRight); %></div></td>
  </tr>
</table>
</body>
</html>