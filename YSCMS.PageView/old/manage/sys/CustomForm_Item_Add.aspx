<%@ Page Language="C#" AutoEventWireup="true" Codebehind="CustomForm_Item_Add.aspx.cs" Inherits="Foosun.PageView.manage.Sys.CustomForm_Item_Add" %>

<%@ Register Src="../../controls/UserPop.ascx" TagName="UserPop" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/base.css" />
    <link rel="stylesheet" type="text/css" href="/css/style.css" />
    <link rel="stylesheet" type="text/css" href="/CSS/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/blue.css" />
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/public.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
    <!--
    function changetype(obj)
    {
        var val = obj.options[obj.selectedIndex].value;
        var f = 'none';
        if(val == 'RadioBox' || val == 'CheckBox' || val == 'DropList' || val == 'List')
            f = '';
        document.getElementById('tr_sel').style.display = f;
    }
    function LoadMe(i)
    {
        changetype(document.getElementById('DdlItemType')); 
    }
    //-->
    </script>
</head>
<body onload="LoadMe(Math.random())">
    <form id="Form1" runat="server">
        <div class="mian_body">
            <div class="mian_wei">
           <div class="mian_wei_min">
              <div class="mian_wei_left"><h3>�Զ������</h3></div>
              <div class="mian_wei_right">
                  ������<a href="javascript:openmain('../main.aspx')" target="sys_main" class="topnavichar">��ҳ</a>>>
                  <a href="CustomForm.aspx" class="topnavichar">�Զ����</a>>>
                  <asp:HyperLink ID="HlkManage" runat="server" class="topnavichar">�������</asp:HyperLink>>>
                  <asp:Literal runat="server" ID="LtrCaption"></asp:Literal>
              </div>
           </div>
        </div>
        <div class="mian_cont">
           <div class="nwelie">
              <div class="lanlie_lie">
                 <div class="newxiu_base">
        <table id="tablist" class="nxb_table">
             <tr>
                <td width="20%" align="right">
                    ��ǰ����</td>
                <td>
                    &nbsp;&nbsp;&nbsp;<asp:Label runat="server" ID="LblFormName"></asp:Label>
                </td>
            </tr>
            <tr>
                <td width="20%" align="right">
                    �������ƣ�</td>
                <td>
                    <asp:TextBox runat="server" ID="TxtName" Width="310px" CssClass="input8" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtName"
                        Display="Dynamic" ErrorMessage="����д��������" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td width="20%" align="right">
                    �ֶ�����</td>
                <td>
                    <asp:TextBox runat="server" ID="TxtFieldName" Width="310px" CssClass="input8" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtFieldName"
                        Display="Dynamic" ErrorMessage="����д�ֶ���" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtFieldName"
                        Display="Dynamic" ErrorMessage="�ֶ���������Ӣ����ĸ�����֡��»������!" SetFocusOnError="True"
                        ValidationExpression="^[A-Za-z0-9_]+$"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td align="right">
                    ������ţ�</td>
                <td>
                    <asp:DropDownList ID="DdlSN" runat="server" CssClass="select4">
                    </asp:DropDownList>���ԽС������Խǰ��</td>
            </tr>
             <tr>
                <td width="20%" align="right">
                    �Ƿ����ã�</td>
                <td>
                    <asp:RadioButton runat="server" ID="RadOpenYes" CssClass="radio" GroupName="RadGrpState" Text="��" Checked="True" />
                    <asp:RadioButton runat="server" ID="RadOpenNo" CssClass="radio" GroupName="RadGrpState" Text="��" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    �Ƿ���</td>
                <td>
                    <asp:RadioButton ID="RadNotNullYes" runat="server" CssClass="radio" Text="��" GroupName="RadGrpNull" />
                    <asp:RadioButton ID="RadNotNullNo" runat="server" CssClass="radio" Text="��" GroupName="RadGrpNull"  /></td>
            </tr>
            <tr>
                <td width="20%" align="right">
                    �������ͣ�</td>
                <td>
                    <asp:DropDownList ID="DdlItemType" CssClass="select4" runat="server" onchange="changetype(this);">
                    </asp:DropDownList></td>
            </tr>
            <tr>
               <td align="right">
                    �ı�����</td>
               <td>
                    <asp:TextBox runat="server" ID="TxtMaxSize" Width="66px" CssClass="input8" MaxLength="10">20</asp:TextBox>0��ʾ������<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TxtMaxSize"
                       Display="Dynamic" ErrorMessage="�ı����ȱ���������" MaximumValue="4000" MinimumValue="0"
                       SetFocusOnError="True" Type="Integer"></asp:RangeValidator></td>
            </tr>
            <tr>
                <td width="20%" align="right">
                    Ĭ��ֵ��</td>
                <td>
                    <asp:TextBox ID="TxtDefault" runat="server" MaxLength="50" CssClass="input8" Width="310px"></asp:TextBox></td>
            </tr>
            <tr id="tr_sel">
                <td width="20%" align="right">
                    ѡ�</td>
                <td>
                    <asp:TextBox ID="TxtSelectItem" runat="server" Height="143px" TextMode="MultiLine" CssClass="textarea4" Width="288px"></asp:TextBox>
                    ÿһ��Ϊһ���б�ѡ��</td>
            </tr>
            <tr>
                <td width="20%" align="right">
                    ������ʾ��</td>
                <td>
                    <asp:TextBox TextMode="multiLine" runat="server" ID="TxtPrompt" CssClass="textarea4" Height="140px" Width="292px"></asp:TextBox>
                    (�������Ե���ʾ��Ϣ��255���ַ�������Ч)</td>
            </tr>
        </table>
        <div class="nxb_submit" >
            <asp:Button runat="server" ID="BtnOK" Text=" ȷ�� " CssClass="xsubmit1 mar" OnClick="BtnOK_Click" />
                    <input type="reset" value=" ��д " class="xsubmit1 mar" />
             </div>
        <asp:HiddenField runat="server" ID="HidItemID" />
        <asp:HiddenField runat="server" ID="HidFormID" />
        </div>
        </div>
        </div>
        </div>
        </div>
    </form>
</body>
</html>
