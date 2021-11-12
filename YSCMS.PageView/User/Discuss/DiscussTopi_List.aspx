﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DiscussTopi_List.aspx.cs" Inherits="YSCMS.PageView.User.Discuss.DiscussTopi_List" %>
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

 <table width="98%" align="center">
 <tr><td>
<div>
    <div style="width:98%;display:none;" align="right"><a class="list_link" href="discussPhotoalbumlist.aspx?DisID=<%Response.Write(Request.QueryString["DisID"]); %>">相册</a></div>
    <asp:Repeater ID="DataList1" runat="server">
    <HeaderTemplate>
    <table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table">
    <tr class="TR_BG">
    <td class="sys_topBg" style="width:40%;">主题</td>
    <td class="sys_topBg">发表者</td>
    <td class="sys_topBg">发表时间</td>
    <td class="sys_topBg" style="width:10%;">操作</td>
    </tr>
    <tr class="TR_BG_list">
    <td class="navi_link" colspan="4" align="left" width="100%"><span style="color: #ff0000">公告：<%#D_anno%></span></td>
    </tr>
    </HeaderTemplate>
    <ItemTemplate>
       <tr onmouseout="this.className='off'" onmouseover="this.className='on'" class="off">
        <td style="width:40%;"><%#((DataRowView)Container.DataItem)["Titlea"]%></td>
        <td><%#((DataRowView)Container.DataItem)["UserName"]%></td>
        <td><%#((DataRowView)Container.DataItem)["creatTimess"]%></td>
        <td style="width:10%;"><%#((DataRowView)Container.DataItem)[8]%></td>            
        </tr>
     </ItemTemplate>
     <FooterTemplate>
     </table>
     </FooterTemplate>
    </asp:Repeater>
</div>
</td></tr>
<tr><td align="right" style="width: 928px"><uc1:PageNavigator ID="PageNavigator1" runat="server" /></td></tr>
</table>
<br />
<br />
<table width="100%" height="74" border="0" cellpadding="0" cellspacing="0" class="copyright_bg">
  <tr>
    <td><div align="center"><%Response.Write(this.CopyRight); %> </div></td>
  </tr>
</table>
</form>
</body>
<script language="javascript" type="text/javascript">
    function PDel() {
        if (confirm("你确定要彻底删除吗?")) {
            document.form1.action = "?Type=PDel";
            document.form1.submit();
        }
    }
</script>
</html>
