<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="step_End.aspx.cs" Inherits="Foosun.PageView.Install.step_End" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title><%=Foosun.Install.Config.title%></title>
	<style type="text/css">
		.Greens { color: green; font-weight: bold; }
		.Reds { color: red; }
	</style>
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
</head>
<body bgcolor="#016AA9">
	<div class="setindexstyle" id="getLoading" style="display: none;" runat="server">
		<div style="font-family: Arial; line-height: 22px; text-align: left; font-size: 12px; font-weight: normal; color: red; padding: 30px 30px 10px 30px; border: 3px #000 solid; background-color: #eeffee; margin: auto 10px auto 10px; width: 400px; height: 100px;">
		</div>
	</div>
	<table width="700" border="0" align="center" cellpadding="0" cellspacing="1" style="margin-top:50px; background:#FFF;  border: 1px solid #B5E7FF; padding:3px; border-radius: 4px 4px 4px 4px;">
		<tr>
			<td bgcolor="#ffffff">
				<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td colspan="2" bgcolor="#333333">
							<table width="100%" border="0" cellspacing="0" cellpadding="8">
								<tr>
									<td background="image/01.jpg">
										<font color="#ffffff">������ʼֵ </font>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td width="180" valign="top">
							<%=Foosun.Install.Config.logo%>
						</td>
						<td width="520" valign="top" style="line-height:24px; font-size:12px">
							<br>
							<br>
							<table id="Table2" cellspacing="1" cellpadding="1" width="90%" align="center" border="0">
								<tr>
									<td>
										<span style="color: Red;">��������Ա�ɹ���</span>���ڿ�ʼ������ʼֵ
									</td>
								</tr>
								<tr>
									<td>
										<br />
										<strong>��Ҫ��������ݣ�</strong>
										<div>
											<ul style="padding: 0;">
												<li id="site_param">ϵͳ/վ�����</li>
												<li id="group">��Ա��/����Ա��</li>
												<li id="label">���ñ�ǩ</li>
												<li id="menu">���ܲ˵�</li>
												<li id="stat">ͳ��ϵͳ</li>
												<li id="friend">��������</li>
												<li id="collect">�ɼ�ϵͳ</li>
												<li id="help">����ϵͳ</li>
                                                <li id="classinfo">������Ŀ</li>
                                                <li id="newinfo">��������</li>
											</ul>
										</div>
									</td>
								</tr>
							</table>
							<p>
							</p>
						</td>
					</tr>
					<tr>
						<td>&nbsp;
							
						</td>
						<td>
							<table width="90%" border="0" cellspacing="0" cellpadding="8" style="margin-bottom: 20px;">
								<tr>
									<td style="padding-right: 30px;">
										<input id="cID" type="button" onclick="CreatValue();" value="��ʼ������ʼֵ" style="width:100px;height:21px;line-height:21px;border:medium none;margin:0;padding:0; background:url(../CSS/blue/imges/subite.gif) no-repeat;">
										<div id="MessageID" style="display: inline; padding: 20px; width: 300px;">
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<div style="margin-top:10px; font-size:12px; line-height:24px; color:#FFF;"><%=Foosun.Install.Config.corpRight%></div>
</body>
</html>
<script type="text/javascript">
	function CreatValue() {
		document.getElementById("MessageID").innerHTML = "��ʼ�������Ժ�....";
		document.getElementById("cID").disabled = true;
		document.getElementById("cID").value = "���ڴ�������...";
		var Action = 'start=1&error=false&set=site_param';
		$.get('step_End.aspx?' + Action + '&no-cache=' + Math.random(), function (returnvalue) {
		    if (returnvalue.indexOf("??") > -1) {
		        document.getElementById("MessageID").innerHTML = '��������';
		        document.getElementById("site_param").className = "Reds";
		        document.getElementById("cID").disabled = false;
		        document.getElementById("cID").value = "���µ�������";
		    } else {
		        document.getElementById("MessageID").innerHTML = returnvalue;
		        document.getElementById("site_param").className = "Greens";
		        setTimeout("SendNextParam('group')", 1000)
		    }        
        });
	}
	function SendNextParam(v) {
    var Action = 'start=1&error=false&set=' + v + '';
    $.get('step_End.aspx?' + Action + '&no-cache=' + Math.random(), function (returnvalue) {
        if (returnvalue.indexOf("??") > -1) {
            document.getElementById("MessageID").innerHTML = '��������';
            document.getElementById("site_param").className = "Reds";
            document.getElementById("cID").disabled = false;
            document.getElementById("cID").value = "���µ�������";
        }
        else {
            if (v == "domainName") {
                document.getElementById("MessageID").innerHTML = "<span style=\"color:red\">�������ݳɹ���<a href=\"finishinstall.aspx?stat=login\">��½��̨</a></span>";
                document.getElementById("cID").disabled = true;
                document.getElementById("cID").value = "�������ݳɹ�";
            } else {
                document.getElementById("MessageID").innerHTML = returnvalue;
            }
            $('#' + v).attr("class", "Greens");
            var nextp = "";
            switch (v) {
                case "group":
                    setTimeout("SendNextParam('label')", 1000)
                    break;
                case "label":
                    setTimeout("SendNextParam('menu')", 1000)
                    break;
                case "menu":
                    setTimeout("SendNextParam('stat')", 1000)
                    break;
                case "stat":
                    setTimeout("SendNextParam('friend')", 1000)
                    break;
                case "friend":
                    setTimeout("SendNextParam('collect')", 1000)
                    break;
                case "collect":
                    setTimeout("SendNextParam('help')", 1000)
                    break;
                case "help":
                    setTimeout("SendNextParam('classinfo')", 1000)
                    break;
                case "classinfo":
                    setTimeout("SendNextParam('newinfo')", 1000)
                    break;
                case "newinfo":
                    setTimeout("SendNextParam('domainName')", 1000)
                    break;

            }

        }

    });

	}
</script>
