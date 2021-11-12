﻿<%@ Page Language="C#" AutoEventWireup="true" ResponseEncoding="utf-8" Inherits="User_ChangePassword" Codebehind="User_ChangePassword.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title><%Response.Write(Foosun.Config.UIConfig.HeadTitle); %></title>
	<link type="text/css" rel="stylesheet" href="../css/base.css" />
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/public.js" type="text/javascript"></script>
     
    
</head>
<body class="main_big">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="toptable">
        <tr>
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="57%" class="matop_tab_left"><strong  style="font-size:14px; line-height:35px; margin-left:10px;">修改密码</strong></td>
          <td width="43%" height="32" class="topnavichar"  style="PADDING-LEFT: 14px" ><div style="text-align:right; margin-right:10px;">位置导航：<a href="../main.aspx" target="sys_main" class="list_link">首页</a><img alt="" src="../images/navidot.gif" border="0" />修改密码</div></td>
        </tr>
</table>
       <form id="form1" runat="server">
       <table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="Tablist tab">
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right" style="margin-right:10px;">您的原来密码</div></td>
          <td class="list_link" ><asp:TextBox ID="oPass" runat="server"  Width="250"  MaxLength="20" TextMode="Password"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;" title="点击查看帮助" onclick="Help('H_ChangePass_0001',this)">帮助</span><asp:RequiredFieldValidator ID="f_oPass" runat="server" ControlToValidate="oPass" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)请填写原始密码</span>"></asp:RequiredFieldValidator></td>
        </tr>                                                                                                                                                                                                                                                                                             
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right" style="margin-right:10px;">新密码</div></td>
          <td class="list_link"><asp:TextBox ID="newPass" runat="server" Width="250" MaxLength="20" TextMode="Password" CssClass="form"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="点击查看帮助" onclick="Help('H_ChangePass_0002',this)">帮助</span><asp:RequiredFieldValidator ID="f_newPass" runat="server" ControlToValidate="newPass" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)请填写新密码</span>"></asp:RequiredFieldValidator>
          </td>
        </tr> 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right" style="margin-right:10px;">确认密码</div></td>
          <td class="list_link">
          <asp:TextBox ID="pnewPass" runat="server"  Width="250" TextMode="Password" CssClass="form" /> 
          <span class="helpstyle" style="cursor:help"; title="点击查看帮助"  onclick="Help('H_ChangePass_0003',this)">帮助</span>&nbsp;
              <asp:CompareValidator ID="f_pnewPass" runat="server" ControlToCompare="pnewPass"
                  ControlToValidate="newPass" ErrorMessage="(*)2次密码填写需一致！"></asp:CompareValidator></td>
        </tr>
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px; height: 28px;">&nbsp;</td>
          <td class="list_link" style="height: 28px">&nbsp;<asp:Button ID="sumbitsave" runat="server" onclick="saveSumbit" CssClass="form" Text=" 修　改 " />
            <input name="reset" type="reset" value=" 重　置 "  class="form"/>         </td>
        </tr>

</table> </form>
<br />
<br />
 <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
   <tr>
     <td align="center"><%Response.Write(CopyRight); %></td>
   </tr>
 </table>

</body>
</html>