<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" AutoEventWireup="true" Inherits="user_arealist_add" EnableEventValidation="true"  Codebehind="arealist_add.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="/CSS/base.css"/>
<link rel="stylesheet" type="text/css" href="/CSS/style.css"/>
<link rel="stylesheet" type="text/css" href="/CSS/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/blue.css"/>
<script src="/Scripts/jquery.js" type="text/javascript"></script>
<script src="/Scripts/public.js" type="text/javascript"></script>
<title></title>
</head>
<body>
<form id="form1" name="form1" method="post" action="" runat="server">
  <div class="mian_body">
    <div class="mian_wei">
      <div class="mian_wei_min">
        <div class="mian_wei_left">
          <h3>������� </h3>
        </div>
        <div class="mian_wei_right"> ������<a href="javascript:openmain('../main.aspx')">��ҳ</a>>><a href="arealist.aspx">�������</a> >>����/�༭���򶥼��� </div>
      </div>
    </div>
    <div class="mian_cont">
      <div class="nwelie">
        <div class="jslie_lan" align="left"><font color="#ff0000">����:</font> ��<a href="arealist.aspx" class="menulist">����</a>|<a href="arealist_add.aspx" class="menulist">��Ӵ���</a>|<span class="topnavichar" style="PADDING-right: 25px" id="pdel" runat="server"></span></div>
        <div class="lanlie_lie">
          <div class="newxiu_base">
            <table class="nxb_table">
              <tr>
                <td width="15%" align="right"> �������ƣ�</td>
                <td width="85%" align="left">
                    <asp:TextBox ID="cityName" runat="server" class="input8"></asp:TextBox>
                  �������������</td>
              </tr>
              <tr>
                <td width="15%" align="right">  ����</td>
                <td width="85%" align="left">
                <asp:TextBox ID="OrderID" runat="server" class="input8"></asp:TextBox>
                  �����������
                  &nbsp;����Խ��Խ��ǰ��</td>
              </tr>
            </table>
            <div class="nxb_submit">
                <asp:Button ID="Button1" runat="server" Text="��  ��"  class="xsubmit1 mar" OnClick="but1_Click" />
              <input type="reset" name="Submit3" value="��  ��"  class="xsubmit1 mar"/>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</form>
</body>
</html>