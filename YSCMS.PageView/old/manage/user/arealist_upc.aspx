<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" AutoEventWireup="true" Inherits="user_arealist_upc" EnableEventValidation="true"  Codebehind="arealist_upc.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="/CSS/base.css"/>
<link rel="stylesheet" type="text/css" href="/CSS/style.css"/>
<link rel="stylesheet" type="text/css" href="/CSS/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/blue.css"/>
<script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/public.js" type="text/javascript"></script>
</head>
<body>
<form id="form1" name="form1" method="post" action="" runat="server">
<div class="mian_body">
    <div class="mian_wei">
       <div class="mian_wei_min">
          <div class="mian_wei_left"><h3>������� </h3></div>
          <div class="mian_wei_right">
              ������<a href="javascript:openmain('../main.aspx')">��ҳ</a>>><a href="arealist.aspx">�������</a> >>����/�༭��������
          </div>
       </div>
    </div>
<div class="mian_cont">
   <div class="nwelie">
   <div class="jslie_lan" align="left"><font color="#ff0000">����:</font> ��<a href="arealist.aspx" class="menulist">����</a>|<a href="arealist_add.aspx" class="menulist">��Ӵ���</a>|<span class="topnavichar" style="PADDING-right: 25px" id="pdel" runat="server"></span></div>
    <div class="lanlie_lie">
         <div class="newxiu_base">
  <table class="nxb_table">
  <tr>
    <td width="10%" align="left" style="width: 11%; height: 29px;">
        �������ƣ�</td>
    <td width="90%" align="left" style="height: 29px">
         <asp:DropDownList ID="DropDownList1" runat="server" Width="167px">
        </asp:DropDownList></td>
  </tr>
  <tr>
    <td>
        С�����ƣ�</td>
    <td>
        <asp:TextBox ID="cityName" runat="server" Width="163px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="cityName"
            ErrorMessage="������ʡ����"></asp:RequiredFieldValidator></td>
  </tr>
  <tr>
    <td>
        ����</td>
    <td>
         <asp:TextBox ID="OrderID" runat="server" MaxLength="2" Width="163">0</asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="OrderID"
            ErrorMessage="�����������"></asp:RequiredFieldValidator>&nbsp;����Խ��Խ��ǰ��</td>
  </tr>

  </table>

    <div class="nxb_submit">
          <asp:Button ID="but1" runat="server" Text="��  ��" OnClick="but1_Click" class="xsubmit1 mar" />
        <input type="reset" name="Submit3" value="��  ��" class="xsubmit1 mar" />
             </div>
    </div>
  </div>
   </div>
</div>
</div>
<table width="100%" height="74" border="0" cellpadding="0" cellspacing="0" class="copyright_bg">
  <tr>
    <td><div align="center"><%Response.Write(CopyRight); %> </div></td>
  </tr>
</table>
</form>
</body>
</html>