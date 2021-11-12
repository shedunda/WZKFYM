<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" AutoEventWireup="true" Inherits="user_discussacti_add" EnableEventValidation="true" Codebehind="discussacti_add.aspx.cs" %>
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
    <td width="43%" class="list_link"  style="PADDING-LEFT: 14px" ><div style="text-align:right; margin-right:10px;">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../images/navidot.gif" border="0" /><a href="discussacti_list.aspx" class="menulist">���ۻ����</a><img alt="" src="../images/navidot.gif" border="0" />����</div></td>
        </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
  <tr>
     <td><span class="topnavichar" style="PADDING-LEFT: 14px"><a href="discussacti_list.aspx" class="menulist">���ۻ�б�</a>��<a href="discussactijoin_list.aspx" class="menulist">�Ҽ���Ļ</a>&nbsp;&nbsp; <a href="discussactiestablish_list.aspx" class="menulist">�ҽ����Ļ</a>&nbsp;&nbsp; <a href="discussacti_add.aspx" class="menulist">�����</a></span></td>
  </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table">  
  <tr class="TR_BG_list">
    <td  class="list_link" width="20%">
        ��ϵ�绰</td>
    <td  class="list_link" width="80%">
        <asp:TextBox ID="TelephoneBox" runat="server" Width="348px" CssClass="form"></asp:TextBox>&nbsp;
        <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_discussacti_0008',this)">����</span>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TelephoneBox"
            ErrorMessage="�����������ϵ�绰"></asp:RequiredFieldValidator>
       </td>
  </tr>
  <tr class="TR_BG_list">
    <td  class="list_link">
        �μ�����</td>
    <td class="list_link">
        <asp:TextBox ID="ParticipationNumBox" runat="server" Width="348px" CssClass="form"></asp:TextBox>&nbsp;
        <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_discussacti_0009',this)">����</span>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="ParticipationNumBox"
            Display="Dynamic" ErrorMessage="�����ʽ����" ValidationExpression="^[1-9]\d*|0$"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ParticipationNumBox"
            Display="Dynamic" ErrorMessage="��������Ҫ�μӵ�����"></asp:RequiredFieldValidator></td>
  </tr>
    <tr class="TR_BG_list">
    <td  class="list_link">
        ����ͬ��</td>
    <td class="list_link">
        <asp:RadioButtonList ID="isCompanionList" runat="server" RepeatDirection="Horizontal"
            Width="286px">
            <asp:ListItem Selected="True">��</asp:ListItem>
            <asp:ListItem>��</asp:ListItem>
        </asp:RadioButtonList></td>
  </tr>
  <tr class="TR_BG_list">
    <td  class="list_link"></td>
    <td class="list_link">
        &nbsp;&nbsp;
        <asp:Button ID="inBox" runat="server" Text="ȷ ��" OnClick="inBox_Click" CssClass="form"/>
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<input type="reset" name="Submit3" value="�� ��" class="form"></td>
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
