<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" validateRequest="false"  AutoEventWireup="true" Inherits="user_Message_write" EnableEventValidation="true" Codebehind="Message_write.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><%Response.Write(Foosun.Config.UIConfig.HeadTitle); %></title>
	<link type="text/css" rel="stylesheet" href="../css/base.css" />
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/public.js" type="text/javascript"></script>
    <script src="/controls/kindeditor/kindeditor-min.js" type="text/javascript"></script>
<link href="/controls/kindeditor/themes/default/default.css" rel="stylesheet" type="text/css" />
<script src="/controls/kindeditor/lang/zh_CN.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript">
    var editor;
    KindEditor.ready(function (K) {
        editor = K.create('textarea[name="ContentBox"]', {
            resizeType: 1,
            allowPreviewEmoticons: false,
            allowImageUpload: false,
            items: [
						'source', '|', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
						'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist', '|', 'emoticons', 'image', 'link']
        });
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
      <td width="57%" class="matop_tab_left"><strong  style="font-size:14px; line-height:35px; margin-left:10px;">���Ź���</strong></td>
      <td width="43%" class="list_link"  style="PADDING-LEFT: 14px" ><div style="text-align:right; margin-right:10px;">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../images/navidot.gif" border="0" />���Ź���</div></td>
</table>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
    <tr>
        <td style="padding-left:14px;">
            <a href="Message_write.aspx" class="navi_link">д����Ϣ</a> &nbsp; &nbsp;<a href="Message_box.aspx?Id=1" class="navi_link">�ռ���</a> &nbsp; &nbsp;<a href="Message_box.aspx?Id=2" class="navi_link">������</a>&nbsp; &nbsp;<a href="Message_box.aspx?Id=3" class="navi_link">�ݸ���</a>&nbsp; &nbsp;<a href="Message_box.aspx?Id=4" class="navi_link">�ϼ���</a>
        </td>
    </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF"  class="Tablist tab">
  <tr class="TR_BG_list">
    <td class="list_link" width="20%" style="text-align: right">
        �û�����</td>
    <td class="list_link">
        <asp:TextBox ID="UserNameBox" runat="server" Width="252px" CssClass="form"></asp:TextBox>&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" Width="127px" CssClass="form" onchange="javascript:_add(this.options[this.selectedIndex].text);"></asp:DropDownList>&nbsp;
        <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_Message_write_0001',this)">����</span>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserNameBox"
            Display="Dynamic" ErrorMessage="������������"></asp:RequiredFieldValidator>
        <asp:Label ID="Label1" runat="server"  ForeColor="Red"></asp:Label>
    </td>
  </tr>
  <tr class="TR_BG_list">
    <td class="list_link" style="text-align: right">
        ��Ϣ���⣺</td>
    <td class="list_link">
        <asp:TextBox ID="TitleBox" runat="server" Width="387px" CssClass="form"></asp:TextBox>&nbsp;
        
        <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_Message_write_0002',this)">����</span>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TitleBox"
            Display="Dynamic" ErrorMessage="��������Ϣ����"></asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr class="TR_BG_list">
    <td class="list_link" style="text-align: right">
        ��Ϣ���ݣ�</td>
    <td class="list_link">
        <div style="margin-top:3px;">
        <textarea rows="1" cols="1" name="ContentBox" style="width:90%;height:400px;visibility:hidden;" id="ContentBox" runat="server" ></textarea>
        <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_Message_write_0003',this)">����</span>
        </div>
    </td>
  </tr>
    <tr class="TR_BG_list">
    <td class="list_link" style="text-align: right">������Ϣ��</td>
    <td class="list_link">
        <asp:CheckBox ID="CheckBox1" runat="server" Text="���浽�ݸ���" />
    </td>
  </tr>
    <tr class="TR_BG_list">
    <td class="list_link" style="text-align: right">
        ��Ҫ�̶ȣ�</td>
    <td class="list_link">
        <asp:RadioButtonList ID="LevelFlagList" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
            <asp:ListItem Selected="True"><span style="margin:0 5px;">��ͨ</span></asp:ListItem>
            <asp:ListItem><span style="margin:0 5px;">�Ӽ�</span></asp:ListItem>
            <asp:ListItem><span style="margin:0 5px;">����</span></asp:ListItem>
        </asp:RadioButtonList>
    </td>
  </tr>
  <tr class="TR_BG_list">
    <td class="list_link" style="text-align: right">
        ������</td>
    <td class="list_link">
        <asp:FileUpload ID="MessFilesUpload" runat="server" Width="389px" CssClass="form" />&nbsp;
        <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_Message_write_0004',this)">����</span>
    </td>
  </tr>
  <tr class="TR_BG_list">
    <td class="list_link"></td>
    <td class="list_link">&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="������Ϣ" OnClick="Button1_Click" CssClass="form"/>
        &nbsp; &nbsp; &nbsp;&nbsp;<input type="reset" name="Submit3" value="������д" class="form">
<%--        &nbsp; &nbsp; &nbsp;&nbsp;<asp:Button ID="Button2" runat="server" Text="������Ϣ" OnClick="Button2_Click" CssClass="form"/>
--%>     </td>
  </tr>
</table>
<table width="100%" height="74" border="0" cellpadding="0" cellspacing="0" class="copyright_bg">
  <tr>
    <td><div align="center"><%Response.Write(CopyRight); %></div></td>
  </tr>
</table>
</form>
</body>  
<script language="javascript" type="text/javascript">
function _add(value)
{
    if(value!="��ѡ��")
    {
        var objs = document.getElementById("UserNameBox");
        if(objs.value.indexOf(value)==-1)
        {
            if(objs.value!="")
            {
                objs.value += ','+value;
            }
            else
            {
                objs.value += value ;
            }
        }
    }
}
</script>
</html>
