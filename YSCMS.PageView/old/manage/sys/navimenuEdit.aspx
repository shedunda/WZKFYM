<%@ Page Language="C#" AutoEventWireup="true" Inherits="navimenuEdit" Codebehind="navimenuEdit.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
    <link rel="stylesheet" type="text/css" href="/css/base.css" />
    <link rel="stylesheet" type="text/css" href="/css/style.css" />
    <link rel="stylesheet" type="text/css" href="/CSS/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/blue.css" />
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/public.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
<div class="mian_body">
    <div class="mian_wei">
    <!--<div class="mian_wei_1"><img src="imges/lie_10.gif" alt="" /></div>-->
       <div class="mian_wei_min">
          <div class="mian_wei_left"><h3>�����ܲ˵� </h3></div>
          <div class="mian_wei_right">
              ������<a href="javascript:openmain('../main.aspx')">��ҳ</a>>>�������ܲ˵�
          </div>
       </div>
       <!--<div class="mian_wei_2"><img src="imges/lie_12.gif" alt="" /></div>-->
    </div>
    <div class="mian_cont">
   <div class="nwelie">
    <div class="lanlie_lie">
    <div class="newxiu_base">

      <table class="nxb_table">
        <tr>
          <td width="15%" align="right"><div align="right">�˵����ƣ�</div></td>
          <td><asp:TextBox ID="menuName" runat="server"  Width="250"  MaxLength="50" CssClass="input8"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_navimenu_0001',this)">����</span><asp:RequiredFieldValidator ID="f_menuName" runat="server" ControlToValidate="menuName" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)����д�˵����ƣ�����Ϊ20�ֽ�</span>"></asp:RequiredFieldValidator></td>
        </tr>     
        <tr>
          <td style="width: 114px; height: 23px;"><div align="right">ϵͳ���ܣ�</div></td>
          <td style="height: 23px"><asp:CheckBox ID="isSys" runat="server" CssClass="checkbox2" /><span class="helpstyle" style="cursor:help;"  title="����鿴����" onClick="Help('H_navimenu_0005',this)">����</span></td>
        </tr>
        <tr>
          <td width="15%" align="right"><div align="right">����·����</div></td>
          <td><asp:TextBox ID="FilePath" runat="server" Width="250" MaxLength="200" CssClass="input8"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onClick="Help('H_navimenu_0006',this)">����</span><asp:RequiredFieldValidator ID="f_FilePath" runat="server" ControlToValidate="FilePath" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)����д��ݲ˵�����·��������Ϊ200�ֽ�</span>"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
          <td width="15%" align="right"><div align="right">����˳��</div></td>
          <td>
          <asp:TextBox ID="orderID" runat="server" Text="10" Width="100" CssClass="input8" />
          <asp:HiddenField ID="am_id" runat="server" />
          <asp:HiddenField ID="Hiddenissys" runat="server" />
          <span class="helpstyle" style="cursor:help"; title="����鿴����"  onclick="Help('H_navimenu_0007',this)">����</span><asp:RequiredFieldValidator ID="f_orderID_1" runat="server" ControlToValidate="orderID" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)����д���</span>"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="f_orderID" runat="server" ControlToValidate="orderID"  Display="Static" ErrorMessage="(*)������Ų���ȷ" ValidationExpression="^[0-9]{0,2}"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
          <td width="15%" align="right"><div align="right">Ȩ�޴��룺</div></td>
          <td>
          <asp:TextBox ID="popCode" runat="server" MaxLength="50" Width="100" CssClass="input8" />
          <span class="helpstyle" style="cursor:help"; title="����鿴����"  onclick="Help('H_navimenu_pop',this)">����</span></td>
        </tr>
        <tr>
            <td width="15%" align="right">ͼƬ·����</td>
            <td>
                <asp:TextBox ID="imgPath" runat="server" CssClass="input8"></asp:TextBox>
                <img src="../imges/bgxiu_14.gif"  align="middle" alt="ѡ������ͼƬ" border="0" style="cursor: pointer;"
                                            onclick="selectFile('imgPath','ѡ��ͼƬ','imgPath',500,500);document.form1.imgPath.focus();" />
                <span class="helpstyle" style="cursor:help"; title="����鿴����"  onclick="Help('H_navimenu_path',this)">����</span>
            </td>
        </tr>
        <tr>
            <td width="15%" align="right">ͼƬ��С��</td>
            <td>
                <span class="span1">��</span><asp:TextBox ID="imgwidth" runat="server" CssClass="input1" Text="0" onkeypress="if (event.keyCode < 48 || event.keyCode >57) event.returnValue = false;"></asp:TextBox>
                <span class="span1">��</span><asp:TextBox ID="imgheight" runat="server" CssClass="input1" Text="0" onkeypress="if (event.keyCode < 48 || event.keyCode >57) event.returnValue = false;"></asp:TextBox>
            </td>
        </tr>
        </table>
<div class="nxb_submit" >
    <asp:Button ID="sumbitsave" runat="server" CssClass="xsubmit1" Text=" ȷ �� " OnClick="naviedit" />
    <input name="reset" type="reset" value=" �� �� "  class="xsubmit1"/>
</div>
</div>
</div>
</div>
</div>
 </div>
</form>


<script language="JavaScript" type="text/javascript">
function changevalue(value)
{
	if(value=='0')
	{
		form1.position.value="99999";
	}
	else
	{
		form1.position.value="88888";
	}
}
</script>
</html>
