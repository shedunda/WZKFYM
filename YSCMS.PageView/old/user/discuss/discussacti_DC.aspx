<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" AutoEventWireup="true" Inherits="user_discussacti_DC" EnableEventValidation="true" Codebehind="discussacti_DC.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><%Response.Write(Foosun.Config.UIConfig.HeadTitle); %></title>
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
          <td width="57%" class="matop_tab_left"><strong  style="font-size:14px; line-height:35px; margin-left:10px;">���ۻ����</strong></td>
    <td width="43%" class="list_link"  style="PADDING-LEFT: 14px" ><div style="text-align:right; margin-right:10px;">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../images/navidot.gif" border="0" /><a href="discussacti_list.aspx" class="menulist">���ۻ����</a><img alt="" src="../images/navidot.gif" border="0" />���ϸ����</div></td>
        </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
  <tr>
     <td><span class="topnavichar" style="PADDING-LEFT: 14px"><a href="discussacti_list.aspx" class="menulist">���ۻ�б�</a>��<a href="discussactijoin_list.aspx" class="menulist">�Ҽ���Ļ</a>&nbsp;&nbsp; <a href="discussactiestablish_list.aspx" class="menulist">�ҽ����Ļ</a>&nbsp;&nbsp; <a href="#" class="menulist">�����</a></span></td>
  </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="Tablist tab">
  <tr class="TR_BG_list">
    <td class="list_link" width="15%">
        �����</td>
    <td class="list_link" width="35%">
        <asp:Label ID="Activesubject" runat="server" Height="100%" Width="100%"></asp:Label></td>
    <td class="list_link" width="15%">
        ��ص�</td>
    <td class="list_link" width="35%">
        <asp:Label ID="ActivePlace" runat="server" Height="100%" Width="100%"></asp:Label></td>
  </tr>
  <tr class="TR_BG_list">
    <td class="list_link">
        �����</td>
    <td class="list_link">
        <asp:Label ID="ActiveExpense" runat="server" Height="100%" Width="100%"></asp:Label></td>
    <td class="list_link">
        ��������</td>
    <td class="list_link">
        <asp:Label ID="Anum" runat="server" Height="100%" Width="100%"></asp:Label></td>
  </tr>
  <tr class="TR_BG_list">
    <td class="list_link">
        ��ϵ��ʽ</td>
    <td class="list_link">
        <asp:Label ID="Contactmethod" runat="server" Height="100%" Width="100%"></asp:Label></td>
    <td class="list_link">
        ������ֹʱ��</td>
    <td class="list_link">
        <asp:Label ID="Cutofftime" runat="server" Height="100%" Width="100%"></asp:Label></td>
  </tr>
  <tr class="TR_BG_list">
    <td class="list_link">
        �ʱ��</td>
    <td class="list_link">
        <asp:Label ID="CreaTime" runat="server" Height="100%" Width="100%"></asp:Label></td>
    <td class="list_link">
        ������</td>
    <td class="list_link">
        <asp:Label ID="UserName" runat="server" Height="100%" Width="100%"></asp:Label></td>
  </tr>
   <tr class="TR_BG_list">
       <td class="list_link" >
                       &nbsp;����巽��</td>
                   <td  colspan="3" style="width: 85%; height: 184px"><asp:Label ID="ActivePlan" runat="server" Height="100%" Width="100%"></asp:Label></td>
  </tr>
     <tr class="TR_BG_list">
    <td class="list_link" colspan="4" align="center">
        <asp:Button ID="Button1" runat="server" Text="ȷ  ��" Width="93px" Style="margin-bottom:8px;" OnClick="Button1_Click" CssClass="form "/></td>
  </tr>
</table>
<div style="PADDING-top: 50px"></div>
<table width="100%" height="74" border="0" cellpadding="0" cellspacing="0" class="copyright_bg">
  <tr>
    <td><div align="center"><%Response.Write(CopyRight); %></div></td>
  </tr>
</table> 
</form>
</body>
</html>
