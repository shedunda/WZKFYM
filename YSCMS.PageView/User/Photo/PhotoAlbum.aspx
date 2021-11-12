﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PhotoAlbum.aspx.cs" Inherits="YSCMS.PageView.User.Photo.PhotoAlbum" %>
<%@ Register Src="../../controls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<%@ Import NameSpace="System.Data"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link type="text/css" rel="stylesheet" href="../css/base.css" />
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/public.js" type="text/javascript"></script>
<title><%Response.Write(YSCMS.Config.UIConfig.HeadTitle); %></title>
</head>
<body class="main_big"><form id="form1" name="form1" method="post" action="" runat="server"> 
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
    <tr>
      <td height="1" colspan="2"></td>
    </tr>
    <tr>
      <td width="57%" class="matop_tab_left"><strong  style="font-size:14px; line-height:35px; margin-left:10px;">相册管理</strong></td>
      <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">位置导航：<a href="../main.aspx" target="sys_main" class="list_link">首页</a><img alt="" src="../images/navidot.gif" border="0" /><a href="Photoalbum.aspx" target="sys_main" class="list_link">相册管理</a><img alt="" src="../images/navidot.gif" border="0" />相册管理</div></td>
    </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
  <tr>
     <td><span class="topnavichar" style="PADDING-LEFT: 14px"><a href="Photoalbumlist.aspx" class="menulist">相册首页</a>　<a href="photo_add.aspx" class="menulist">添加图片</a>&nbsp;&nbsp;<a href="photoclass.aspx" class="menulist">相册分类</a> &nbsp;&nbsp; <a href="Photoalbum.aspx" class="menulist">添加相册</a></span></td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="Tablist tab" id="insert">
  <tr class="TR_BG_list">
    <td class="list_link" width="25%" style="text-align: right">
        相册名称：</td>
    <td class="list_link" width="75%">
        <asp:TextBox ID="PhotoalbumName" runat="server" Width="241px" CssClass="form" MaxLength="14"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="PhotoalbumName"
            ErrorMessage="相册名不能为空"></asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr class="TR_BG_list">
    <td class="list_link" width="25%" style="text-align: right">相册权限：</td>
    <td class="list_link" width="75%">
        &nbsp;<input id="Radio1" type="radio" onclick="DispChanges()" runat="server" />所有人可以上传 &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<input id="Radio2" type="radio" runat="server" onclick="    DispChanges()" checked="true"/>只有我能上传</td>
  </tr>
  <tr class="TR_BG_list" style="display:none" id="numbers">
    <td class="list_link" width="25%" style="text-align: right">最大上传图片数目：</td>
    <td class="list_link" width="75%">&nbsp;<asp:TextBox ID="number" runat="server" Width="235px" CssClass="form">0</asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="number" ErrorMessage="你输入的格式不对" ValidationExpression="^[1-9]\d*|0$"></asp:RegularExpressionValidator>
    </td>
  </tr>
    <tr class="TR_BG_list">
    <td class="list_link" width="25%" style="text-align: right">相册类型：</td>
    <td class="list_link" width="75%">&nbsp;<asp:DropDownList ID="Photoalbum" runat="server" Width="141px"></asp:DropDownList>&nbsp; &nbsp;<input type="checkbox" id="chkAdvance" onclick="DispChange()" />密码保护
    </td>
  </tr>
    <tr class="TR_BG_list" id="pwd" style="display:none">
    <td class="list_link" width="25%" style="text-align: right" >密码：</td>
    <td class="list_link" width="75%">
        <asp:TextBox ID="TextBox1" runat="server" Width="242px" Height="18px" CssClass="form" TextMode="Password"></asp:TextBox>
    </td>
  </tr>
  <tr class="TR_BG_list" id="pwds" style="display:none">
    <td class="list_link" width="25%" style="text-align: right">确认密码：</td>
    <td class="list_link" width="75%"><asp:TextBox ID="TextBox2" runat="server" Width="242px" Height="18px" CssClass="form" TextMode="Password"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="pwd" ControlToValidate="pwds" ErrorMessage="两次密码不一致"></asp:CompareValidator>
    </td>
  </tr>
  <tr class="TR_BG_list">
    <td class="list_link"></td>
    <td class="list_link">
        <asp:Button ID="Button1" runat="server" Text="创 建" Width="75px" OnClick="Button1_Click"  CssClass="form"/>
        &nbsp;&nbsp;&nbsp;
        <input name="reset" type="reset" value=" 重 置 "  class="form"/>
    </td>
  </tr>
</table>
<table width="100%" height="74" border="0" cellpadding="0" cellspacing="0" class="copyright_bg">
  <tr>
    <td style="height: 74px"><div align="center"><%Response.Write(this.CopyRight); %>  </div></td>
  </tr>
</table>
</form>
</body>
</html>
<script language="javascript">
    function DispChange() {
        var obj = document.getElementById("chkAdvance").checked;
        if (obj) {
            document.getElementById("pwd").style.display = "";
            document.getElementById("pwds").style.display = "";
        }
        else {
            document.getElementById("pwds").style.display = "none";
            document.getElementById("pwd").style.display = "none";
        }
    }
    function DispChanges() {
        var obj = document.getElementById("Radio1").checked;
        var objs = document.getElementById("Radio2").checked;
        if (obj) {
            document.getElementById("numbers").style.display = "";
        }
        if (objs) {
            document.getElementById("numbers").style.display = "none";
        }
    }
</script>