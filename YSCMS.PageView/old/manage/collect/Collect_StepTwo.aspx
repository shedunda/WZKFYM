<%@ Page Language="C#" AutoEventWireup="true" Inherits="Collect_StepTwo" CodeBehind="Collect_StepTwo.aspx.cs" validateRequest="false"  %>

<%@ Register Src="CollectEditor.ascx" TagName="CollectEditor" TagPrefix="uc1" %>
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
    <script language="javascript" type="text/javascript">
        function ChangeCutPara(obj, flag) {
            var flag;
            if (document.getElementById('RadPageNone').checked)
                flag = 0;
            else if (document.getElementById('RadPageFlag').checked)
                flag = 1;
            else if (document.getElementById('RadPageSingle').checked)
                flag = 2;
            else if (document.getElementById('RadPageIndex').checked)
                flag = 3;
            var tb = document.getElementById('tabList');
            var n = 1;
            var sp = document.getElementById('SpanPage');
            switch (flag) {
                case 0:
                    tb.rows[n + 1].style.display = 'none';
                    tb.rows[n + 2].style.display = 'none';
                    break;
                case 1:
                    tb.rows[n + 1].style.display = '';
                    tb.rows[n + 2].style.display = 'none';
                    sp.innerText = '�ӵ�ǰҳ��ȡ��һҳ�ĵ�ַ���ٴ���һҳ�л�ȡ��һҳ�ĵ�ַ���Դ����ơ�����:<a href=[����ҳ��]>��һҳ,��ǰҳ�����һҳ����զһ';
                    break;
                case 2:
                    tb.rows[n + 1].style.display = '';
                    tb.rows[n + 2].style.display = 'none';
                    sp.innerText = '�ӵ�ǰҳ��ȡ���з�ҳ�ĵ�ַ��';
                    break;
                case 3:
                    tb.rows[n + 1].style.display = 'none';
                    tb.rows[n + 2].style.display = '';
                    break;
            }
        }
        function StepBack() {
            location.href = "Collect_Add.aspx?Type=Site&ID=" + document.getElementById("HidSiteID").value;
        }
        function LoadMe(flag) {
            ChangeCutPara();
        }
    </script>
</head>
<body onload="LoadMe(Math.random())">
    <form id="Form2" runat="server">
    <div class="mian_body">
        <div class="mian_wei">
            <!--<div class="mian_wei_1"><img src="imges/lie_10.gif" alt="" /></div>-->
            <div class="mian_wei_min">
                <div class="mian_wei_left">
                    <h3>
                        �ɼ�ϵͳ</h3>
                </div>
                <div class="mian_wei_right">
                    ������<a href="javascript:openmain('../main.aspx')">��ҳ</a>>><a href="Collect_List.aspx" target="sys_main">վ������</a>
                    >>������
                </div>
            </div>
            <!--<div class="mian_wei_2"><img src="imges/lie_12.gif" alt="" /></div>-->
        </div>
        <div class="mian_cont">
            <div class="nwelie">
                <div class="jslie_lan">
                    <span>���ܣ�</span><a href="Collect_List.aspx" class="list_link">վ���б�</a>&nbsp;��&nbsp;<a
                        class="topnavichar" href="Collect_RuleList.aspx">�ؼ��ֹ���</a>&nbsp;��&nbsp;<a class="topnavichar"
                            href="Collect_News.aspx">���Ŵ���</a>
                </div>
                <div class="lanlie_lie">
                    <div class="newxiu_base">
                        <table class="nxb_table" id="tabList">
                            <tr>
                                <td width="15%" align="right">
                                    �б����ݣ�
                                </td>
                                <td>
                                    <div class="textdiv1">
                                        <uc1:CollectEditor ID="EdtList" runat="server" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="15%" align="right">
                                    ��ҳ���ã�
                                </td>
                                <td>
                                    <asp:RadioButton onclick="ChangeCutPara();" runat="server" ID="RadPageNone" GroupName="RadPageSet" Text="����ҳ" CssClass="radio" />
                                    <asp:RadioButton onclick="ChangeCutPara();" runat="server" ID="RadPageFlag" GroupName="RadPageSet" Text="�ݹ��ҳ����" CssClass="radio" />
                                    <asp:RadioButton onclick="ChangeCutPara();" runat="server" ID="RadPageSingle" GroupName="RadPageSet" Text="��ҳ��ҳ����" OnCheckedChanged="RadPageSingle_CheckedChanged"  CssClass="radio"/>
                                    <asp:RadioButton onclick="ChangeCutPara();" runat="server" ID="RadPageIndex" GroupName="RadPageSet" Text="������ҳ����" CssClass="radio" />
                                </td>
                            </tr>
                            <tr>
                                <td width="15%" align="right">
                                    ����ҳ�棺
                                </td>
                                <td>
                                    <div style=" margin-bottom:10px; float:left; width:100%;">
                                    <uc1:CollectEditor ID="EdtPageFlag" runat="server" />
                                    <br />
                                    <span style="color: Red" id="SpanPage"></span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="15%" align="right">
                                    ��������
                                </td>
                                <td>
                                    <uc1:CollectEditor ID="EdtPageIndex" runat="server" />
                                    <span style=" margin-left:10px;">ҳ�뿪ʼ��</span>
                                    <asp:TextBox runat="server" size="5" ID="TxtPageStart"/>
                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TxtPageStart"
                                        Display="Dynamic" ErrorMessage="��ʼҳ�������1-1000���ڵ�����!" MaximumValue="1000" MinimumValue="1"
                                        SetFocusOnError="True" Type="Integer" CssClass="form"></asp:RangeValidator>
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; ҳ�������
                                    <asp:TextBox runat="server" size="5" ID="TxtPageEnd" />
                                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TxtPageEnd"
                                        Display="Dynamic" ErrorMessage="����ҳ�������1-1000���ڵ�����!" MaximumValue="1000" MinimumValue="1"
                                        SetFocusOnError="True" Type="Integer"></asp:RangeValidator><br>
                                    <font color="#ff4500">����:&lta href=?page=[ҳ��]&amp;class_ID=32&gt; ע: [ҳ��]Ϊ�����仯��ҳ��ֵ</font>
                                </td>
                            </tr>
                        </table>
                        <div class="nxb_submit">
                            <asp:HiddenField ID="HidSiteID" runat="server" />
                            <input type="button" value="��һ��" class="xsubmit1" onclick="StepBack()" />
                            <asp:Button runat="server" ID="BtnNext" Text="��һ��" CssClass="xsubmit1" OnClick="BtnNext_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
