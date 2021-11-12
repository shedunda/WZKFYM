<%@ Page Language="C#" AutoEventWireup="true" Inherits="Collect_Add" Codebehind="Collect_Add.aspx.cs" %>

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
    <link href="/CSS/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery-ui-1.10.2.custom.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.bgiframe.js" type="text/javascript"></script>
    <script src="/Scripts/SelectAction.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
    <!--
    function ChangeUrl()
    {
        var obj = document.getElementById("A_Preview");
        obj.href = $(obj).parent().children().eq(0).val();
    }
    function ChooseEncode(obj)
    {
        obj.parentNode.firstChild.value = obj.innerText;
    }
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
          ������<a href="#">��ҳ</a>>><a href="Collect_List.aspx">�ɼ�ϵͳ</a> >><asp:Label ID="LblTitle" runat="server"></asp:Label>
      </div>
   </div>
   <!--<div class="mian_wei_2"><img src="imges/lie_12.gif" alt="" /></div>-->
</div>
<div class="mian_cont">
   <div class="nwelie">
      <div class="jslie_lan">
        <span>���ܣ�</span><a href="Collect_List.aspx">վ���б�</a>��<a
                        class="topnavichar" href="Collect_Add.aspx?Type=Site">�½�վ��</a>��<a class="topnavichar"
                            href="Collect_RuleList.aspx">�ؼ��ֹ���</a>��<a class="topnavichar" href="Collect_News.aspx">���Ŵ���</a>
      </div>
      <div class="lanlie_lie">
         <asp:Panel runat="server" ID="PnlFolder" Width="100%">
         <div class="newxiu_base">
           <table class="nxb_table">
             <tr>
               <td width="20%" align="right">��Ŀ���ƣ�</td>
                    <td>
                       <asp:TextBox runat="server" ID="TxtFolderName" Width="300px" MaxLength="40" CssClass="input8"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="����д��Ŀ����!"
                                ControlToValidate="TxtFolderName" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
             </tr>
             <tr>
                <td width="20%" align="right">��Ŀ˵����</td>
                <td>
                    <div class="textdiv1">
                       <asp:TextBox runat="server" ID="TxtFolderMemo" Width="400px" Height="131px" TextMode="MultiLine"
                                CssClass="textarea1"></asp:TextBox>
                    </div>
                </td>
             </tr>
           </table>
           <div class="nxb_submit" >
           <asp:HiddenField ID="HddFolderID" runat="server" />
               <asp:Button ID="BtnFolderOK" Text=" �� �� " runat="server" CssClass="xsubmit1" OnClick="BtnFolderOK_Click" />
               <input type="submit" name="bc" value="����" class="xsubmit1"/>
           </div>
         </div>
         </asp:Panel>

         <asp:Panel runat="server" ID="PnlSite" Width="100%">
            <div class="newxiu_base">
                <table class="nxb_table">
                    <tr>
                        <td width="20%" align="right">
                            �ɼ�վ�����ƣ�
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="TxtSiteName" Width="300" MaxLength="40" CssClass="input8"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="����д�ɼ�վ������!"
                                ControlToValidate="TxtSiteName" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td width="20%" align="right">
                            �ɼ�վ����ࣺ
                        </td>
                        <td>
                            <asp:DropDownList ID="DdlSiteFolder" runat="server" CssClass="input8">
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td width="20%" align="right">
                            �ɼ�����ҳ��
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="TxtSiteURL" Width="300px" onchange="ChangeUrl()"
                                MaxLength="250" CssClass="input8">http://</asp:TextBox>
                            <a id="A_Preview" href="#" target="_blank" class="list_link">Ԥ��</a>

                            <script language="javascript" type="text/javascript">
                                ChangeUrl();
                            </script>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtSiteURL"
                                Display="Dynamic" ErrorMessage="����д�ɼ�����ҳ!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtSiteURL"
                                Display="Dynamic" ErrorMessage="������ȷ��URL��ʽ����http://��https://��ͷ" SetFocusOnError="True"
                                ValidationExpression="^[hH][tT]{2}[pP][sS]?://.+"></asp:RegularExpressionValidator></td>
                    </tr>
                    <tr>
                        <td width="20%" align="right">
                            �ɼ�ҳ���뷽ʽ��
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="TxtEncode" Width="200px" MaxLength="50" Text="GB2312"
                                CssClass="input8" />
                            ����: <span style="cursor: hand" onclick="ChooseEncode(this)">GB2312</span>��<span style="cursor: hand"
                                onclick="ChooseEncode(this)">UTF-8</span>��<span style="cursor: hand" onclick="ChooseEncode(this)">BIG5</span>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" align="right">
                            ��������������Ŀ��
                        </td>
                        <td>
                            <asp:TextBox ID="TxtClassName" Width="200px" runat="server" CssClass="input8"></asp:TextBox>
                            <img src="../imges/bgxiu_14.gif" alt="ѡ����Ŀ" style="cursor: pointer;" onclick="selectFile('TxtClassName,HidClassID','��Ŀѡ��','newsclass','400','300')" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtClassName"
                                ErrorMessage="��ѡ������������Ŀ" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:HiddenField ID="HidClassID" runat="server" Value="" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" align="right">
                            ���״̬��
                        </td>
                        <td>
                            <asp:DropDownList ID="DdlAudit" runat="server" Height="21px" Width="92px" CssClass="input8">
                                <asp:ListItem Value="0">�����</asp:ListItem>
                                <asp:ListItem Value="1">һ�����</asp:ListItem>
                                <asp:ListItem Value="2">�������</asp:ListItem>
                                <asp:ListItem Value="3">�������</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" align="right">
                            �ɼ�������
                        </td>
                        <td>
                            <asp:CheckBox runat="server" ID="ChbSavePic" Text="����Զ��ͼƬ" CssClass="checkbox2" />
                            <asp:CheckBox runat="server" ID="ChbReverse" Text="�Ƿ���ɼ�" CssClass="checkbox2"/>
                            <asp:CheckBox runat="server" ID="ChbPicNews" Text="�����а���ͼƬʱ����ΪͼƬ����" CssClass="checkbox2" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" align="right">
                            ����ѡ�
                        </td>
                        <td>
                            <asp:CheckBox runat="server" ID="ChbHTML" Text="HTML"  CssClass="checkbox2"/>
                            <asp:CheckBox runat="server" ID="ChbSTYLE" Text="STYLE" CssClass="checkbox2"/>
                            <asp:CheckBox runat="server" ID="ChbDIV" Text="DIV" CssClass="checkbox2"/>
                            <asp:CheckBox runat="server" ID="ChbA" Text="A" CssClass="checkbox2"/>
                            <asp:CheckBox runat="server" ID="ChbCLASS" Text="CLASS" CssClass="checkbox2"/>
                            <asp:CheckBox runat="server" ID="ChbFONT" Text="FONT" CssClass="checkbox2"/>
                            <asp:CheckBox runat="server" ID="ChbSPAN" Text="SPAN" CssClass="checkbox2"/>
                            <asp:CheckBox runat="server" ID="ChbOBJECT" Text="OBJECT" CssClass="checkbox2"/>
                            <asp:CheckBox runat="server" ID="ChbIFRAME" Text="IFRAME" CssClass="checkbox2"/>
                            <asp:CheckBox runat="server" ID="ChbSCRIPT" Text="SCRIPT" CssClass="checkbox2"/>
                        </td>
                    </tr>
                </table>
                <div class="nxb_submit" >
                    <asp:HiddenField ID="HidSiteID" runat="server" />
                            <asp:Button ID="BtnSiteOK" Text=" �� �� " runat="server" CssClass="xsubmit1" OnClick="BtnSiteOK_Click" />
                            <asp:Button ID="BtnNext" Text="��һ��" CssClass="xsubmit1" runat="server" OnClick="BtnNext_Click" />
                            <input type="reset" value=" �� �� " class="xsubmit1" />
                </div>
            </div>
            </asp:Panel>
      </div>
   </div>
</div>
</div>
    </form>
</body>
</html>