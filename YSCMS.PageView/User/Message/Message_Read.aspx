﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Message_Read.aspx.cs" Inherits="YSCMS.PageView.User.Message.Message_Read" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><%Response.Write(YSCMS.Config.UIConfig.HeadTitle); %></title>
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
<body>
<form id="form1" name="form1" method="post" action="" runat="server">
  <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
    <tr>
      <td width="57%" class="matop_tab_left"><strong  style="font-size:14px; line-height:35px; margin-left:10px;">短信管理</strong></td>
      <td width="43%" class="list_link"  style="PADDING-LEFT: 14px" ><div style="text-align:right; margin-right:10px;">位置导航：<a href="../main.aspx" target="sys_main" class="list_link">首页</a><img alt="" src="../images/navidot.gif" border="0" />短信管理</div></td>
    </tr>
  </table>
  <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
    <tr>
      <td style="padding-left:14px;"><a href="Message_write.aspx" class="navi_link">写新消息</a> &nbsp; &nbsp;<a href="Message_box.aspx?Id=1" class="navi_link">收件箱</a> &nbsp; &nbsp;<a href="Message_box.aspx?Id=2" class="navi_link">发件箱</a>&nbsp; &nbsp;<a href="Message_box.aspx?Id=3" class="navi_link">草稿箱</a>&nbsp; &nbsp;<a href="Message_box.aspx?Id=4" class="navi_link">废件箱</a></td>
    </tr>
  </table>
  <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table">
    <tr class="TR_BG_list">
      <td class="list_link" width="20%" style="text-align: right"> 收件人：</td>
      <td class="list_link"><asp:TextBox ID="Rec_UserNumBox" runat="server" Width="252px" CssClass="form"></asp:TextBox>
        &nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" Width="127px" CssClass="form" onchange="javascript:_add(this.options[this.selectedIndex].text);"></asp:DropDownList>
        &nbsp; <span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_Message_write_0001',this)">帮助</span>
        <asp:Label ID="FileTFLabel" runat="server" ForeColor="Red" Height="11px" Width="393px"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Rec_UserNumBox" Display="Dynamic" ErrorMessage="请输入收信人"></asp:RequiredFieldValidator></td>
    </tr>
    <tr class="TR_BG_list">
      <td class="list_link" style="text-align: right"> 消息标题：</td>
      <td class="list_link"><asp:TextBox ID="TitleBox" runat="server" Width="387px" CssClass="form" ReadOnly="True"></asp:TextBox>
        &nbsp; <span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_Message_write_0002',this)">帮助</span></td>
    </tr>
    <tr class="TR_BG_list">
      <td class="list_link" style="text-align: right"> 消息内容：</td>
      <td class="list_link"><div style="margin-top:3px;">
        <textarea rows="1" cols="1" name="ContentBox" style="width:90%;height:400px;visibility:hidden;" id="ContentBox" runat="server" ></textarea>
        <span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_Message_write_0003',this)">帮助</span></td>
    </tr>
    <tr class="TR_BG_list">
      <td class="list_link" style="text-align: right"> 重要程度：</td>
      <td class="list_link"><asp:Label ID="LevelFlagLabel" runat="server" Width="103px"></asp:Label></td>
    </tr>
    <tr class="TR_BG_list">
      <td class="list_link" style="text-align: right"> 附件下载：</td>
      <td class="list_link"><span id="FileTFLabelp" runat="server"></span>
        <asp:HiddenField ID="MidID" runat="server" />
        <%--        <asp:LinkButton ID="FileTFLabelp" runat="server" OnClick="LinkButton1_Click" CssClass="list_link"></asp:LinkButton>
--%></td>
    </tr>
    <tr class="TR_BG_list">
      <td class="list_link"></td>
      <td class="list_link">&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="转发消息" OnClick="Button1_Click" CssClass="form" />
        &nbsp; &nbsp; &nbsp;&nbsp;
        <input type="reset" name="Submit3" value="重新填写" class="form"></td>
    </tr>
  </table>
  <iframe id="Message_export" src="about:blank" border="0" height="0" width="0" style="visibility: hidden"></iframe>
  <br />
  <br />
  <table width="100%" height="74" border="0" cellpadding="0" cellspacing="0" class="copyright_bg">
    <tr>
      <td><div align="center">
          <%Response.Write(this.CopyRight); %>
        </div></td>
    </tr>
  </table>
</form>
</body>
<script language="javascript" type="text/javascript">
    function _add(value) {
        if (document.form1.Rec_UserNumBox.value != "") {
            document.form1.Rec_UserNumBox.value += ',';
        }
        document.form1.Rec_UserNumBox.value += value;
    }
    function sExport() {
        var ifm = document.getElementById("Message_export");
        var MidID = document.getElementById("MidID").value;
        ifm.src = "Message_file.aspx?Mid=" + MidID + "";
        alert(ifm.src);
    }
</script>
</html>
