﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DiscussActi_List.aspx.cs" Inherits="YSCMS.PageView.User.Discuss.DiscussActi_List" %>
<%@ Import NameSpace="System.Data"%>
<%@ Register Src="../../controls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
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
<div id="sc" runat="server"></div>
<div id="no" runat="server"></div>
  <asp:Repeater ID="DataList1" runat="server" >
    <HeaderTemplate>
    <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="liebtable">
     <tr onmouseout="this.className='off'" onmouseover="this.className='on'" class="off">
    <th class="sys_topBg" align="center" width="50%">活动名称</th>
    <th class="sys_topBg" align="center" width="15%">建立人</th>
    <th class="sys_topBg" align="center" width="15%">创建时间</th>
    <th class="sys_topBg" align="center" width="5%">参加人数</th>
    <th class="sys_topBg" align="center" width="15%">操作</th>
    </tr>
    <div id="tnzlist" runat="server"></div>
    </HeaderTemplate>
    <ItemTemplate>
       <tr onmouseout="this.className='off'" onmouseover="this.className='on'" class="off">
        <td align="left" width="50%"><span class="span1"><%#((DataRowView)Container.DataItem)[2]%></span></td>
        <td align="center" width="15%"><%#((DataRowView)Container.DataItem)[3]%></td>
        <td align="center" width="15%"><%#((DataRowView)Container.DataItem)[4]%></td>
        <td align="center" width="5%"><%#((DataRowView)Container.DataItem)[6]%></td>
        <td align="center" width="15%"><%#((DataRowView)Container.DataItem)[7]%></td>            
        </tr>
     </ItemTemplate>
     <FooterTemplate>
     </table>
     </FooterTemplate>
    </asp:Repeater>
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="2" style="height: 20px">
<tr><td align="right" style="width: 928px"><uc1:PageNavigator ID="PageNavigator1" runat="server" /></td></tr>
</table>
<table width="100%" height="74" border="0" cellpadding="0" cellspacing="0" class="copyright_bg">
  <tr>
    <td><div align="center"><%Response.Write(this.CopyRight); %></div></td>
  </tr>
</table>
</form>
</body>
</html>
