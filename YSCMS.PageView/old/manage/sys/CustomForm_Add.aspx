<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomForm_Add.aspx.cs" Inherits="Foosun.PageView.manage.Sys.CustomForm_Add" %>
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
		function changetm(flag) {
			var f = 'none';
			if (flag == 0)
				f = '';
			document.getElementById('tr_tms').style.display = f;
			document.getElementById('tr_tme').style.display = f;
		}
		function LoadMe(i) {
			var f = 0;
			if (document.getElementById('RadTimeNotLmt').checked)
				f = 1;
			changetm(f);
		}
		function GetPY1(obj) {
			//if(document.getElementById('ClassID').value=="")
		    //{
			var s = obj.value;
			if (s != '') {
				document.getElementById('TxtTableName').value = GetPY(s);
			}
			//}
		}
	</script>
</head>
<body onload="LoadMe(Math.random())">
	<form id="Form1" runat="server">
    <div class="mian_body">
        <div class="mian_wei">
            <!--<div class="mian_wei_1"><img src="imges/lie_10.gif" alt="" /></div>-->
           <div class="mian_wei_min">
              <div class="mian_wei_left"><h3>�Զ��������</h3></div>
              <div class="mian_wei_right">
                  ������<a href="javascript:openmain('../main.aspx')">��ҳ</a>>><a href="CustomForm.aspx" class="topnavichar">�Զ��������</a>>><asp:Literal runat="server" ID="LtrCaption"></asp:Literal> 
              </div>
           </div>
           <!--<div class="mian_wei_2"><img src="imges/lie_12.gif" alt="" /></div>-->
        </div>
        <div class="mian_cont">
           <div class="nwelie">
              <div class="lanlie_lie">
                <div class="newxiu_base">
	                <table id="tablist" class="nxb_table">
		                <tr>
			                <td width="20%" align="right">
				                �����ƣ�
			                </td>
			                <td width="80%" align="left">
				                <asp:TextBox runat="server" ID="TxtName" Width="309px" onChange="javascript:GetPY1(this);" CssClass="input8" MaxLength="50"></asp:TextBox>
				                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtName" Display="Dynamic" ErrorMessage="����д������" SetFocusOnError="True"></asp:RequiredFieldValidator>
			                </td>
		                </tr>
		                <tr>
			                <td align="right">
				                �����ƣ�
			                </td>
			                <td>
				                &nbsp;&nbsp;&nbsp;<asp:Label runat="server" ID="LblTablePre"></asp:Label>
				                <asp:TextBox runat="server" ID="TxtTableName" Width="222px" CssClass="input8" MaxLength="30"></asp:TextBox>
				                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtTableName" Display="Dynamic" ErrorMessage="����д������" SetFocusOnError="True"></asp:RequiredFieldValidator>
				                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtTableName" Display="Dynamic" ErrorMessage="����������Ӣ����ĸ�����֡��»������!" SetFocusOnError="True" ValidationExpression="^[A-Za-z0-9_]+$"></asp:RegularExpressionValidator>
			                </td>
		                </tr>
		                <tr>
			                <td width="20%" align="right">
				                �ϴ����������ַ��
			                </td>
			                <td width="80%" align="left">
				                <asp:TextBox runat="server" ID="TxtFolder" Width="309px" CssClass="input8" MaxLength="50"></asp:TextBox><%--<img src="../../sysImages/folder/s.gif" alt="ѡ������" border="0" style="cursor:pointer;" onclick="selectFile('path',document.Form1.TxtFolder,250,500);document.Form1.TxtFolder.focus();" />--%>
			                </td>
		                </tr>
		                <tr>
			                <td width="20%" align="right">
				                �ϴ��ļ���С��
			                </td>
			                <td width="80%" align="left">
				                &nbsp;&nbsp;&nbsp;���ֵ<asp:TextBox runat="server" ID="TxtMaxSize" Width="66px" CssClass="input8" MaxLength="10"></asp:TextBox>KB
				                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TxtMaxSize" Display="Dynamic" ErrorMessage="�ļ���С������������" MaximumValue="2147483647" MinimumValue="1" SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
			                </td>
		                </tr>
		                <tr>
			                <td width="20%" align="right">
				                ״̬��
			                </td>
			                <td width="80%" align="left">
				                <asp:RadioButton runat="server" ID="RadNormal" CssClass="radio" GroupName="RadGrpState" Text="����" Checked="True" />
				                <asp:RadioButton runat="server" ID="RadLock" CssClass="radio" GroupName="RadGrpState" Text="����" />
				                &nbsp;
			                </td>
		                </tr>
		                <tr>
			                <td width="20%" align="right">
				                ����ʱ�����ƣ�
			                </td>
			                <td width="80%" align="left">
				                <asp:RadioButton runat="server" ID="RadTimeLimited" CssClass="radio" onclick="changetm(0)" GroupName="RadGrpTimeSet" Text="����" />
				                <asp:RadioButton runat="server" ID="RadTimeNotLmt" CssClass="radio" onclick="changetm(1)" GroupName="RadGrpTimeSet" Text="������" Checked="True" />
			                </td>
		                </tr>
		                <tr id="tr_tms">
			                <td width="20%" align="right">
				                ��ʼʱ�䣺
			                </td>
			                <td width="80%" align="left">
				                <asp:TextBox runat="server" ID="TxtStartTm" Width="150px" CssClass="input8"></asp:TextBox><img src="../../sysImages/folder/s.gif" alt="ѡ������" border="0" style="cursor: pointer;" onclick="selectFile('date',document.Form1.TxtStartTm,250,500);document.Form1.TxtStartTm.focus();" />
			                </td>
		                </tr>
		                <tr id="tr_tme">
			                <td width="20%" align="right">
				                ����ʱ�䣺
			                </td>
			                <td width="80%" align="left">
				                <asp:TextBox runat="server" ID="TxtEndTm" Width="150px" CssClass="input8"></asp:TextBox><img src="../../sysImages/folder/s.gif" alt="ѡ������" border="0" style="cursor: pointer;" onclick="selectFile('date',document.Form1.TxtEndTm,250,500);document.Form1.TxtEndTm.focus();" />
			                </td>
		                </tr>
		                <tr>
			                <td width="20%" align="right">
				                ��֤�����ã�
			                </td>
			                <td width="80%" align="left">
				                <asp:CheckBox runat="server" CssClass="checkbox2" ID="ChbShowValidate" Text="��ʾ��֤��" />
			                </td>
		                </tr>
		                <tr>
			                <td width="20%" align="right">
				                ��˵����
			                </td>
			                <td width="80%" align="left">
				                <asp:TextBox TextMode="multiLine" CssClass="textarea4" runat="server" ID="TxtMemo" Height="140px" Width="292px"></asp:TextBox>
				                (255���ַ�������Ч)
			                </td>
		                </tr>
		                <tr>
			                <td align="center" colspan="2">
				                
			                </td>
		                </tr>
	                </table>
                <div class="nxb_submit" >
                    <asp:Button runat="server" ID="BtnOK" Text=" ȷ�� " CssClass="xsubmit1 mar" OnClick="BtnOK_Click" />
				                <input type="reset" value=" ��д " class="xsubmit1 mar" />
                 </div>
	<asp:HiddenField runat="server" ID="HidID" />
                </div>
                </div>
            </div>
        </div>
    </div>
	</form>
</body>
</html>
