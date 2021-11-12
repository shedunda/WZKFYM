<%@ Page Language="C#" AutoEventWireup="true" Inherits="Collect_NumSet" CodeBehind="Collect_NumSet.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<title>ȷ�ϲɼ�����</title>
	<link rel="stylesheet" type="text/css" href="/CSS/base.css" />
    <link rel="stylesheet" type="text/css" href="/CSS/style.css" />
    <link rel="stylesheet" type="text/css" href="/CSS/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/blue.css" />
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/public.js" type="text/javascript"></script>
	<script type="text/javascript">
		function OnOK() {
			var _n = document.getElementById('TxtNum').value;
			var reg = /^[0-9]+$/;
			if (!reg.test(_n)) {
				alert("�ɼ�����������������");
				document.getElementById("TxtNum").focus();
				return;
			}
			var n = parseInt(_n);
			if (n < 1) {
				alert("�ɼ���������Ϊ������");
				document.getElementById('TxtNum').focus();
				return;
			}
			var norpt = 0;
			if (document.getElementById('ChkNoRepeat').checked)
				norpt = 1;
			window.opener.location.href = 'Collect.aspx?num=' + n + '&norepeat=' + norpt + '&id=<%= nid %>';
			self.close();
		}
		function OnCancel() {
			window.returnValue = 0;
			self.close();
		}

		function KeyDown() {
			if (event.keyCode == 13) {
				OnOK();
			}
		}
	</script>
</head>
<body>
	<form id="Form1" runat="server">
	<div>
		<table class="nxb_table" style="line-height:30px; border-collapse:collapse;">
			<tr>
				<td align="left" colspan="2">
					<div style="padding-left:10px; line-height:20px;">��ӭʹ��Foosun Inc. Collect System V2.0 For .Net<br />
					����漰����Ȩ�������Ĵ���Ѷ�Ƽ���չ���޹�˾�޹�<br />
					��ͬ���������ݲ�ȷ��Ҫʹ�������ͬ�⣬������ɼ�����!<br /></div>
				</td>
			</tr>
			<tr>
				<td width="35%" align="right">
					�ظ����ã�
				</td>
				<td width="65%" align="left">
					<input type="checkbox" id="ChkNoRepeat" checked="checked" style="margin:0 10px;" />������ͬ���ظ��ɼ�
				</td>
			</tr>
			<tr>
				<td align="right">
					���ñ��βɼ�������
				</td>
				<td>
					<input type="text" id='TxtNum' onkeydown="KeyDown();" class="input1" />
					<script type="text/javascript">
						document.getElementById('TxtNum').focus();
					</script>
				</td>
			</tr>
			<tr>
				<td class="list_link" align="center" colspan="2">
					<input type="button" onclick="OnOK()" class="form" value=" ȷ �� " />&nbsp;&nbsp;
					<input type="button" onclick="OnCancel()" class="form" value=" ȡ �� " />
				</td>
			</tr>
		</table>
	</div>
	</form>
</body>
</html>
