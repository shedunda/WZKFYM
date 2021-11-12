<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Collect_NumSet.aspx.cs" Inherits="YSCMS.PageView.Manage.Collect.Collect_NumSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<title>确认采集新闻</title>
	<link rel="stylesheet" type="text/css" href="/CSS/base.css" />
    <link rel="stylesheet" type="text/css" href="/CSS/style.css" />
    <link rel="stylesheet" type="text/css" href="/CSS/<%Response.Write(YSCMS.Config.UIConfig.CssPath());%>/css/blue.css" />
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/public.js" type="text/javascript"></script>
	<script type="text/javascript">
	    function OnOK() {
	        var _n = document.getElementById('TxtNum').value;
	        var reg = /^[0-9]+$/;
	        if (!reg.test(_n)) {
	            alert("采集数量请输入正整数");
	            document.getElementById("TxtNum").focus();
	            return;
	        }
	        var n = parseInt(_n);
	        if (n < 1) {
	            alert("采集数量必须为正整数");
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
					<div style="padding-left:10px; line-height:20px;">欢迎使用月思内容管理系统 V3.0 For .Net<br />
					如果涉及到版权问题与靖安县致远信息科技有限公司无关<br />
					您同意上述内容并确定要使用吗？如果同意，请输入采集数量!<br /></div>
				</td>
			</tr>
			<tr>
				<td width="35%" align="right">
					重复设置：
				</td>
				<td width="65%" align="left">
					<input type="checkbox" id="ChkNoRepeat" checked="checked" style="margin:0 10px;" />标题相同则不重复采集
				</td>
			</tr>
			<tr>
				<td align="right">
					设置本次采集数量：
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
					<input type="button" onclick="OnOK()" class="form" value=" 确 定 " />&nbsp;&nbsp;
					<input type="button" onclick="OnCancel()" class="form" value=" 取 消 " />
				</td>
			</tr>
		</table>
	</div>
	</form>
</body>
</html>
