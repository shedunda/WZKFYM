﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Url_Class.aspx.cs" Inherits="YSCMS.PageView.User.Info.Url_Class" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title><%Response.Write(YSCMS.Config.UIConfig.HeadTitle); %></title>
	<link type="text/css" rel="stylesheet" href="../css/base.css" />
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/public.js" type="text/javascript"></script>
</head>
<body class="main_big"><form id="form1" runat="server">
    <table id="top1" width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
            <tr>
              <td height="1" colspan="2"></td>
            </tr>
            <tr>
              <td width="57%" class="sysmain_navi" style="padding-left:14px;">网址收藏夹</td>
              <td width="43%">位置导航：<a href="../main.aspx" class="list_link" target="sys_main">首页</a><img alt="" src="../images/navidot.gif" border="0" /><a href="url.aspx" class="list_link" target="sys_main">网址收藏夹</a><img alt="" src="../images/navidot.gif" border="0" />添加/修改分类</td>
            </tr>
    </table>
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
      <tr>
        <td  style="padding-left:12px;"><a href="url.aspx" class="topnavichar">网址列表</a> ┊  <a href="url_add.aspx" class="topnavichar">添加网址</a> </td>
      </tr>
      </table>
    <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" class="table">
      <tr class="TR_BG_list">
        <td style="width:10%;">
            分类名称*
        </td>
        <td >
            <asp:TextBox ID="ClassName" runat="server" Width="200px"></asp:TextBox>
        </td>
      </tr>
      <tr class="TR_BG_list">
        <td style="width:10%;">
        </td>
        <td >
            <asp:Button ID="Button1" runat="server" Text="保存" OnClick="Button1_Click" />
        </td>
      </tr>
      </table>
    </form>
</body>
</html>
