<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" AutoEventWireup="true" Inherits="user_discussacti" EnableEventValidation="true" Codebehind="discussacti.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><%Response.Write(Foosun.Config.UIConfig.HeadTitle); %></title>
	<link type="text/css" rel="stylesheet" href="../css/base.css" />
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/public.js" type="text/javascript"></script>
    
 <link href="/CSS/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery-ui-1.10.2.custom.min.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            $("#CutofftimeBox").datepicker({changeMonth: true,changeYear: true});
        });    
    </script>
</head>
<body class="main_big">
<form id="form1" name="form1" method="post" action="" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
        <tr>
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="57%" class="matop_tab_left"><strong  style="font-size:14px; line-height:35px; margin-left:10px;">���ۻ����</strong></td>
    <td width="43%" class="list_link"  style="PADDING-LEFT: 14px" ><div style="text-align:right; margin-right:10px;">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../images/navidot.gif" border="0" /><a href="discussacti_list.aspx" class="menulist">���ۻ����</a><img alt="" src="../images/navidot.gif" border="0" />�����</div></td>
        </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
  <tr>
     <td><span class="topnavichar" style="PADDING-LEFT: 14px"><a href="discussacti_list.aspx" class="menulist">���ۻ�б�</a>��<a href="discussactijoin_list.aspx" class="menulist">�Ҽ���Ļ</a>&nbsp;&nbsp; <a href="discussactiestablish_list.aspx" class="menulist">�ҽ����Ļ</a>&nbsp;&nbsp; <a href="#" class="menulist">�����</a></span></td>
  </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="Tablist tab">  
  <tr class="TR_BG_list">
    <td  class="list_link" width="20%" align="right">����⣺</td>
    <td  class="list_link" width="80%">
        <asp:TextBox ID="ActivesubjectBox" runat="server" Width="348px" CssClass="form"></asp:TextBox>&nbsp;
        <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_discussacti_0001',this)">����</span>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="����������" ControlToValidate="ActivesubjectBox" Display="Dynamic"></asp:RequiredFieldValidator></td>
  </tr>
  <tr class="TR_BG_list">
    <td  class="list_link" width="20%" align="right">��ص㣺</td>
    <td class="list_link">
        <asp:TextBox ID="ActivePlaceBox" runat="server" Width="348px" CssClass="form"></asp:TextBox>&nbsp;
        <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_discussacti_0002',this)">����</span>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="�������ص�" ControlToValidate="ActivePlaceBox" Display="Dynamic"></asp:RequiredFieldValidator></td>
  </tr>
    <tr class="TR_BG_list">
    <td  class="list_link" width="20%" align="right">������ֹʱ�䣺</td>
    <td class="list_link">
        <asp:TextBox ID="CutofftimeBox" runat="server" Width="348px" CssClass="form"></asp:TextBox>&nbsp;
        
        <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_discussacti_0003',this)">����</span>
        &nbsp;&nbsp; &nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="�������ֹʱ��" ControlToValidate="CutofftimeBox" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="���ڸ�ʽ����" ControlToValidate="CutofftimeBox" ValidationExpression="^[12]{1}(\d){3}[-][01]?(\d){1}[-][0123]?(\d){1}$"></asp:RegularExpressionValidator></td>
  </tr>
    <tr class="TR_BG_list">
    <td  class="list_link" width="20%" align="right">����������</td>
    <td class="list_link">
        <asp:TextBox ID="AnumBox" runat="server" Width="348px" CssClass="form">0</asp:TextBox>&nbsp;
        <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_discussacti_0004',this)">����</span>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="������μ�����" ControlToValidate="AnumBox" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="����ĸ�ʽ����" ControlToValidate="AnumBox" Display="Dynamic" ValidationExpression="^[1-9]\d*|0$"></asp:RegularExpressionValidator></td>
  </tr>
      <tr class="TR_BG_list">
    <td  class="list_link" width="20%" align="right">��ǩ��</td>
    <td class="list_link">
        <asp:RadioButtonList ID="ALabelList" runat="server" RepeatDirection="Horizontal"
            Width="242px"  RepeatLayout="Flow">
            <asp:ListItem Selected="True">����</asp:ListItem>
            <asp:ListItem>�Ƽ�</asp:ListItem>
        </asp:RadioButtonList></td>
  </tr>
  
  
    <tr class="TR_BG_list">
    <td  class="list_link" width="20%" align="right">����ã�</td>
    <td class="list_link">
        <asp:TextBox ID="ActiveExpenseBox" runat="server" Width="346px" CssClass="form"></asp:TextBox>&nbsp;
        <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_discussacti_0005',this)">����</span>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ActiveExpenseBox"
            ErrorMessage="����������"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="ActiveExpenseBox"
            ErrorMessage="����ĸ�ʽ����" ValidationExpression="^[1-9]\d*|0$"></asp:RegularExpressionValidator></td>
  </tr>
    <tr class="TR_BG_list">
    <td  class="list_link" width="20%" align="right">��ϵ��ʽ��</td>
    <td class="list_link">
        <asp:TextBox ID="ContactmethodBox" runat="server" Width="348px" CssClass="form"></asp:TextBox>&nbsp;
        <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_discussacti_0006',this)">����</span>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="��������ϵ��ʽ" ControlToValidate="ContactmethodBox"></asp:RequiredFieldValidator></td>
  </tr>
    <tr class="TR_BG_list">
    <td  class="list_link" width="20%" align="right">����巽����</td>
    <td class="list_link">
        <asp:TextBox ID="ActivePlanBox" runat="server" TextMode="MultiLine" Height="76px" Width="348px" CssClass="form"></asp:TextBox>&nbsp;
        <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_discussacti_0007',this)">����</span>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="��������巽��" ControlToValidate="ActivePlanBox" Display="Dynamic"></asp:RequiredFieldValidator></td>
  </tr>
      <tr class="TR_BG_list">
    <td  class="list_link"></td>
    <td class="list_link">
        &nbsp;&nbsp;
        <asp:Button ID="inBox" runat="server" Text="ȷ ��" OnClick="inBox_Click" CssClass="form"/>
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<input type="reset" name="Submit3" value="�� ��" class="form"></td>
  </tr>
</table>
<table width="100%" height="74" border="0" cellpadding="0" cellspacing="0" class="copyright_bg">
  <tr>
    <td><div align="center"><%Response.Write(CopyRight); %></div></td>
  </tr>
</table> 
 </form>
</body>
</html>
