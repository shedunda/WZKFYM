<%@ Page Language="C#" AutoEventWireup="true" Inherits="Collect_RuleAdd" Codebehind="Collect_RuleAdd.aspx.cs" %>

<%@ Register Src="CollectEditor.ascx" TagName="CollectEditor" TagPrefix="uc1" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>FoosunCMS For .NET v2.0.0</title>
    <link rel="stylesheet" type="text/css" href="/CSS/base.css" />
    <link rel="stylesheet" type="text/css" href="/CSS/style.css" />
    <link rel="stylesheet" type="text/css" href="/CSS/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/blue.css" />
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/public.js" type="text/javascript"></script>

</head>
<body>
    <form id="Form2" runat="server">
    <div class="mian_body">
<div class="mian_wei">
    <!--<div class="mian_wei_1"><img src="imges/lie_10.gif" alt="" /></div>-->
   <div class="mian_wei_min">
      <div class="mian_wei_left"><h3>�ɼ�ϵͳ</h3></div>
      <div class="mian_wei_right">
          ������<a href="javascript:openmain('../main.aspx')">��ҳ</a>>><a href="Collect_List.aspx">�ɼ�ϵͳ</a> >><asp:Label ID="LblTitle" runat="server"></asp:Label>
      </div>
   </div>
   <!--<div class="mian_wei_2"><img src="imges/lie_12.gif" alt="" /></div>-->
</div>
<div class="mian_cont">
   <div class="nwelie">
      <div class="jslie_lan">
        <span>���ܣ�</span>
        <a class="topnavichar" href="Collect_List.aspx">վ������</a>&nbsp;��&nbsp;<a class="topnavichar"
                            href="Collect_News.aspx">���Ŵ���</a>&nbsp;��&nbsp;<a class="topnavichar" href="Collect_RuleList.aspx">���˹����б�</a>
      </div>
      <div class="lanlie_lie">
         <div class="newxiu_base">
         <table class="nxb_table">
                <tr>
                    <td  width="15%" align="right">
                        �������ƣ�
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="TxtRuleName" MaxLength="50" CssClass="input4"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="����д��������!"
                            ControlToValidate="TxtRuleName" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td  width="15%" align="right">
                        �����ַ�����
                    </td>
                    <td>
                        <uc1:CollectEditor ID="EdtOldStr" runat="server" SetMaxLength="100" />
                        <asp:CheckBox runat="server" ID="ChbCase" Text="���Դ�Сд" CssClass="checkbox2" />
                    </td>
                </tr>
                <tr>
                    <td width="15%" align="right">
                        �滻Ϊ��
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="TxtNewStr" Width="58%" Height="51px" TextMode="MultiLine"
                            MaxLength="100" CssClass="textarea2"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td  width="15%" align="right">
                        Ӧ�õ���
                    </td>
                    <td>
                        <div style="width: 520px; padding-left:10px; line-height:30px; margin-top:10px; height: 120px; overflow: auto; background-color: White; border-color: #cccccc; border-width: 1px; border-style: groove; margin-left:10px;">
                            <asp:CheckBoxList runat="server" ID="TabRuleApply" RepeatLayout="Flow"></asp:CheckBoxList>
                        </div>
                        <span style="color: #ff0033; margin-left:10px; line-height:20px; padding-bottom:8px;">ע��ÿ��վ��ֻ��Ӧ��һ������ÿ���������Ӧ�õ����վ��;
                            <br />
                            &nbsp;&nbsp;&nbsp;��ɫ�ֱ�ʾ�òɼ�վ���Ѿ�Ӧ�������Ĺ���</span></td>
                </tr>
                <tr>
                    <td class="list_link" colspan="2" align="center">
                        
                    </td>
                </tr>
            </table>
            <div class="nxb_submit" >
            <asp:HiddenField ID="RID" runat="server" />
                        <asp:Button ID="BtnOK" Text=" �� �� " runat="server" CssClass="xsubmit1" OnClick="BtnOK_Click" />
                        <asp:Button ID="Button1" Text=" �� �� " runat="server" CssClass="xsubmit1" CausesValidation="False" />
           </div>
         </div>
      </div>
   </div>
</div>
</div>
    </form>
</body>
</html>
