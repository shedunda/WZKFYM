<%@ Page Language="C#" AutoEventWireup="true" Inherits="Collect_NewsModify" Codebehind="Collect_NewsModify.aspx.cs" validateRequest="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>FoosunCMS For .NET v1.0.0</title>
    <link rel="stylesheet" type="text/css" href="/CSS/base.css" />
    <link rel="stylesheet" type="text/css" href="/CSS/style.css" />
    <link rel="stylesheet" type="text/css" href="/CSS/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/blue.css" />
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/public.js" type="text/javascript"></script>
    <script src="/Scripts/jquery-ui-1.10.2.custom.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.bgiframe.js" type="text/javascript"></script>
    <script src="/Scripts/SelectAction.js" type="text/javascript"></script>
    <link href="/CSS/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css" />
    <script src="/controls/kindeditor/kindeditor-min.js" type="text/javascript"></script>
<link href="/controls/kindeditor/themes/default/default.css" rel="stylesheet"
        type="text/css" />
    <link href="/controls/kindeditor/plugins/code/prettify.css" rel="stylesheet"
        type="text/css" />
    <script src="/controls/kindeditor/plugins/code/prettify.js" type="text/javascript"></script>
<script src="/controls/kindeditor/lang/zh_CN.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
    <!--
    function ChangeUrl()
    {
        var obj = document.getElementById("A_Preview");
        obj.href = obj.parentNode.firstChild.value;
    }
    function ChooseEncode(obj)
    {
        obj.parentNode.firstChild.value = obj.innerText;
    }

    KindEditor.ready(function (K) {
        var editor = K.create('#EdtContent', {
            cssPath: '../../controls/kindeditor/plugins/code/prettify.css',
            uploadJson: '../../controls/kindeditor/asp.net/upload.aspx',
            fileManagerJson: '../../controls/kindeditor/asp.net/file_manager_json.ashx',
            allowFileManager: true
        });
    });
    //-->
    </script>
</head>
<body>
    <form id="Form2" runat="server">
    <div id="dialog-message" title="��ʾ"></div>
    <div class="mian_body">
<div class="mian_wei">
    <!--<div class="mian_wei_1"><img src="imges/lie_10.gif" alt="" /></div>-->
   <div class="mian_wei_min">
      <div class="mian_wei_left"><h3>�ɼ�ϵͳ</h3></div>
      <div class="mian_wei_right">
          ������<a href="javascript:openmain('../main.aspx')">��ҳ</a>>><a href="Collect_News.aspx" target="sys_main" class="list_link">���Ŵ���</a> >>�޸Ĳɼ�����  
      </div>
   </div>
   <!--<div class="mian_wei_2"><img src="imges/lie_12.gif" alt="" /></div>-->
</div>
<div class="mian_cont">
   <div class="nwelie">
      <div class="jslie_lan">
        <span>���ܣ�</span><a class="topnavichar" href="Collect_RuleList.aspx">�ؼ��ֹ���</a>&nbsp;��&nbsp;<a class="topnavichar" href="Collect_News.aspx">���Ŵ���</a>
      </div>
      <div class="lanlie_lie">
         <div class="newxiu_base">
         <table id="tabList" class="nxb_table">
            <tr class="TR_BG_list">
                <td width="15%" align="right">
                    ���ű���:
                </td>
                <td>
                    <asp:TextBox runat="server" ID="TxtTitle" Width="98%" MaxLength="100" CssClass="input4"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="����д��Ŀ����!"
                        ControlToValidate="TxtTitle" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
            </tr>
            <tr class="TR_BG_list">
                <td width="15%" align="right">
                    ��������:
                </td>
                <td>
                    <asp:TextBox runat="server" ID="TxtLink" Width="98%" MaxLength="200" ReadOnly="true" CssClass="input4"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtLink" ErrorMessage="���ӵ�ַ����Ϊ��!" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr class="TR_BG_list">
                <td width="15%" align="right">
                    �ɼ�վ��:
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="DdlSite"></asp:DropDownList>
                </td>
            </tr>
            <tr class="TR_BG_list">
                <td width="15%" align="right">
                    ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��:
                </td>
                <td>
                    <asp:TextBox runat="server" ID="TxtAuthor" Width="98%" MaxLength="100" CssClass="input4"></asp:TextBox>
                </td>
            </tr>
            <tr class="TR_BG_list">
                <td width="15%" align="right">
                    ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Դ:
                </td>
                <td>
                    <asp:TextBox runat="server" ID="TxtSource" MaxLength="100" Width="98%" CssClass="input4"></asp:TextBox>
                </td>
            </tr>
            <tr class="TR_BG_list">
                <td width="15%" align="right">
                    �ɼ�����:
                </td>
                <td>
                    <asp:TextBox runat="server" ID="TxtDate" MaxLength="25" Width="98%" CssClass="input4"></asp:TextBox>
                </td>
            </tr>
            <tr class="TR_BG_list">
                <td width="15%" align="right">
                    ����������Ŀ:
                </td>
                <td>
                    <asp:TextBox ID="TxtClassName" Width="200px" runat="server" CssClass="input4"></asp:TextBox>
                            <img src="../imges/bgxiu_14.gif" alt="ѡ����Ŀ" style="cursor: pointer;" onclick="selectFile('TxtClassName,HidClassID','��Ŀѡ��','newsclass','400','300')" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtClassName"
                                ErrorMessage="��ѡ������������Ŀ" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:HiddenField ID="HidClassID" runat="server" Value="" />
                </td>
            </tr>
            <tr class="TR_BG_list">
                <td width="15%" align="right">
                    ʵ�ʲɼ�ʱ��:
                </td>
                <td>
                    <asp:Label runat="server" ID="LblClTime"></asp:Label>
                </td>
            </tr>
            <tr class="TR_BG_list">
                <td width="15%" align="right">
                    ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��:
                </td>
                <td>
	                <textarea style="width:98%; height:400px;visibility:hidden;" name="EdtContent" id="EdtContent" runat="server"></textarea>
                </td>
            </tr>
            <tr class="TR_BG_list">
                <td class="list_link" colspan="2" align="center">
                   
                </td>
            </tr>
        </table>
        <div class="nxb_submit" >
                 <asp:HiddenField ID="HidNewsID" runat="server" />
                    <asp:Button ID="BtnOK" Text=" �� �� " runat="server" CssClass="xsubmit1" OnClick="BtnOK_Click" />
                    <asp:Button ID="Button1" Text=" �� �� " runat="server" CssClass="xsubmit1" CausesValidation="False" />
           </div>
         </div>
      </div>
   </div>
</div>
</div>











        <div>
            
          
            <br />
            <br />
            <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg"
                style="height: 76px">
                <tr>
                    <td align="center">
                        <%Response.Write(CopyRight);%>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
