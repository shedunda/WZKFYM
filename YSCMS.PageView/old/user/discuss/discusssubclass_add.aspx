<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" AutoEventWireup="true" Inherits="user_discusssubclass_add" EnableEventValidation="true"  Codebehind="discusssubclass_add.aspx.cs" %>
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
          <td width="57%" class="matop_tab_left"><strong  style="font-size:14px; line-height:35px; margin-left:10px;">���������</strong></td>
    <td width="43%" class="list_link"  style="PADDING-LEFT: 14px" ><div style="text-align:right; margin-right:10px;">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../images/navidot.gif" border="0" /><a href="discussManage_list.aspx" class="menulist">���������</a><img alt="" src="../images/navidot.gif" border="0" />������������</div></td>
        </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
  <tr>
     <td style="PADDING-LEFT: 14px"><a href="discusssubsclass.aspx" class="menulist">���������</a> &nbsp;&nbsp; <a href="discusssubclass_add.aspx" class="menulist">������������</a></span></td>
  </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="Tablist tab" id="addmanage">
  <tr class="TR_BG_list">
    <td class="list_link" Width="25%" align="right">
        �����鸸���ࣺ</td>
    <td class="list_link" Width="75%"><asp:DropDownList ID="ClassIDList1" runat="server" Width="172px">
        </asp:DropDownList>&nbsp;
        <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_discusssubclass_add_0001',this)">����</span></td>
  </tr>
 <tr class="TR_BG_list">
    <td class="list_link" Width="25%" align="right">
        ������������ƣ�</td>
    <td class="list_link" Width="75%">
        <asp:TextBox ID="Cname" runat="server" Width="314px" CssClass="form"></asp:TextBox>&nbsp;
        <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_discusssubclass_add_0002',this)">����</span>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Cname"
            ErrorMessage="�������������������"></asp:RequiredFieldValidator></td>
  </tr>
    <tr class="TR_BG_list">
    <td class="list_link" Width="25%" align="right">
        ���������������</td>
    <td class="list_link" Width="75%">
        <asp:TextBox ID="Content" runat="server" Height="77px" TextMode="MultiLine" Width="314px" CssClass="form"></asp:TextBox>&nbsp;
        <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_discusssubclass_add_0003',this)">����</span>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Content"
            ErrorMessage="�������������������"></asp:RequiredFieldValidator></td>
  </tr>

   <tr class="TR_BG_list">
    <td class="list_link"></td>
    <td class="list_link">
        &nbsp; &nbsp; &nbsp;
        <asp:Button ID="but1" runat="server" Text="��  ��" OnClick="but1_Click" CssClass="form" />
        &nbsp; &nbsp;&nbsp;
        <input type="reset" name="Submit3" value="��  ��" class="form"></td>  
   </tr>
</table>
<br />
<br />
<table width="100%" height="74" border="0" cellpadding="0" cellspacing="0" class="copyright_bg">
  <tr>
    <td><div align="center"><%Response.Write(CopyRight); %></div></td>
  </tr>
</table>
</form>
</body>
</html>