﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConstrAccount.aspx.cs" Inherits="YSCMS.PageView.User.Constr.ConstrAccount" %>
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
<script language="JavaScript" type="text/javascript">
    function Constrclass(sa) {
        switch (sa) {
            case 0: //参数设置
                document.getElementById("all").style.display = "";
                document.getElementById("insert").style.display = "none";
                break;
            case 1: //参数设置
                document.getElementById("all").style.display = "none";
                document.getElementById("insert").style.display = "";
                break;
        }
    }
</script>
</head>
<body class="main_big"><form id="form1" name="form1" method="post" action="" runat="server"> 
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
        <tr>
          <td colspan="2" style="height: 1px"></td>
        </tr>
        <tr>
          <td width="57%"  class="matop_tab_left"><strong  style="font-size:14px; line-height:35px; margin-left:10px;">账号管理</strong></td>
          <td width="43%" class="list_link"  style="PADDING-LEFT: 14px" ><div style="text-align:right; margin-right:10px;">位置导航：<a href="../main.aspx" target="sys_main" class="list_link">首页</a><img alt="" src="../images/navidot.gif" border="0" /><a href="Constrlist.aspx" class="menulist">文章管理</a><img alt="" src="../images/navidot.gif" border="0" />账号管理</div>
          </td>
        </tr>
</table>
      <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
        <tr>
          <td style="padding-left:14px;">
          <a href="Constr.aspx" class="menulist">发表文章</a>&nbsp; &nbsp;<a href="Constrlistpass.aspx" class="topnavichar" >所有退稿</a>&nbsp; &nbsp;<a href="Constrlist.aspx" class="menulist">文章管理</a>&nbsp; &nbsp;<a href="ConstrClass.aspx" class="menulist">分类管理</a>&nbsp; &nbsp;<a href="Constraccount.aspx" class="menulist">账号管理</a>&nbsp; &nbsp;<a href="Constraccount_add.aspx" class="menulist">添加账号</a>
          </td>
          <td align="right" style="padding-right:28px;"><span id="addcount" runat="server"></span></td>
        </tr>
</table>
<div id="no" runat="server"></div>
    <asp:Repeater ID="DataList1" runat="server" >
    <HeaderTemplate>
    <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="liebtable">
        <tr onmouseout="this.className='off'" onmouseover="this.className='on'" class="off">
    <th class="sys_topBg" align="center" width="15%">开户名</th>
    <th class="sys_topBg" align="center" width="25%">开户银行</th>
    <th class="sys_topBg" align="center" width="25%">银行账号</th>
    <th class="sys_topBg" align="center" width="15%">卡号</th>
    <th class="sys_topBg" align="center" width="20%">操作</th>
    </tr>
    <div id="tnzlist" runat="server"></div>
    </HeaderTemplate>
    <ItemTemplate>
        <tr onmouseout="this.className='off'" onmouseover="this.className='on'" class="off">
        <td align="center" width="15%"><%#((DataRowView)Container.DataItem)[5]%></td>
        <td align="center" width="15%"><%#((DataRowView)Container.DataItem)[2]%></td>
        <td align="center" width="15%"><%#((DataRowView)Container.DataItem)[3]%></td>
        <td align="center" width="15%"><%#((DataRowView)Container.DataItem)[4]%></td>
        <td align="center" width="40%"><%#((DataRowView)Container.DataItem)[6]%></td>            
        </tr>
     </ItemTemplate>
     <FooterTemplate>
     </table>
     </FooterTemplate>
    </asp:Repeater>
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="2" style="height: 20px">
<tr>
<td align="right" style="width: 928px"><uc1:PageNavigator ID="PageNavigator1" runat="server" /></td>
</tr>
</table>
<table width="100%" height="74" border="0" cellpadding="0" cellspacing="0" class="copyright_bg">
  <tr>
    <td><div align="center"><%Response.Write(this.CopyRight); %> </div></td>
  </tr>
</table>
</form>
</body>
<script language="javascript" type="text/javascript">
    function del(ID) {
        if (confirm("你确定要删除吗?")) {
            self.location = "?Type=del&ID=" + ID;
        }
    }
</script>
</html>
