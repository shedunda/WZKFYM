<%@ Page Language="C#" AutoEventWireup="true" Inherits="Collect_List" CodeBehind="Collect_List.aspx.cs" %>

<%@ Register Src="../../controls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
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
 <!--
        function Handle(op, tp, id) {
            var retype = 'վ��';
            var ob = 'Site';
            if (tp == 0) {
                retype = '��Ŀ';
                ob = 'Folder';
            }
            var opt = 'Delete';
            var confm = '��ȷ��Ҫɾ����' + retype + '��?���ݽ����ɻָ�!';
            if (op == 0) {
                opt = 'Reproduce';
                confm = '��ȷ��Ҫ���Ƹ�' + retype + '��?';
            }

            if (window.confirm(confm)) {
                var param = 'Option=' + opt + ob + '&ID=' + id + "&Ma=" + Math.random(); 
                SendAjax(param);
            }
        }
        function SendAjax(param) {
            $.get("Collect_List.aspx?" + param, function (transport) {
                alert(transport);
                location.reload();
            });
        }
        function Collect(id, flag) {
            if (flag != '��Ч') {
                alert('��վ�����û���������,���ܲɼ�!\r����"��"���ò���...');
                return;
            }

            var WWidth = (window.screen.width - 500) / 2;
            var Wheight = (window.screen.height - 150) / 2;
            document.getElementById('HidClNum').value = 0;
            window.open('Collect_NumSet.aspx?id=' + id, '�ɼ�����', 'status=0,directories=0,resizable=0,top=' + Wheight + ', left=' + WWidth + ',toolbar=0,location=0,scrollbars=0,width=360px,height=165px');
        }
 //-->
    </script>
</head>
<body>
    <form id="Form2" runat="server">
    <div class="mian_body">
        <div class="mian_wei">
            <!--<div class="mian_wei_1"><img src="imges/lie_10.gif" alt="" /></div>-->
            <div class="mian_wei_min">
                <div class="mian_wei_left">
                    <h3>
                        �ɼ�ϵͳ
                    </h3>
                </div>
                <div class="mian_wei_right">
                    ������<a href="#">��ҳ</a>>><a href="#">���Ź���</a> >><a href="#">��������</a>>><a href="#">�����б�</a>
                </div>
            </div>
            <!--<div class="mian_wei_2"><img src="imges/lie_12.gif" alt="" /></div>-->
        </div>
        <div class="mian_cont">
            <div class="nwelie">
                <div class="jslie_lan">
                    <span>���ܣ� <a class="topnavichar" href="Collect_Add.aspx?Type=Folder">�½���Ŀ</a>��<a
                        class="topnavichar" href="Collect_Add.aspx?Type=Site">�½�վ��</a>��<a class="topnavichar"
                            href="Collect_RuleList.aspx">�ؼ��ֹ���</a>��<a class="topnavichar" href="Collect_News.aspx">���Ŵ���</a>
                      </span>
                </div>
                <div class="jslie_lie">
                    <asp:Repeater runat="server" ID="RptSite" OnItemDataBound="RptSite_ItemDataBound">
                        <HeaderTemplate>
                            <table id="tablist" class="jstable">
                                <tr class="off" onmouseover="this.className='on'" onmouseout="this.className='off'">
                                    <th width="40%">
                                        �� ��
                                    </th>
                                    <th width="15%">
                                        ״̬
                                    </th>
                                    <th width="15%">
                                        �ɼ�����ҳ
                                    </th>
                                    <th width="30%">
                                        �� ��
                                    </th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr class="off" onmouseover="this.className='on'" onmouseout="this.className='off'">
                                <td>
                                    <asp:Image CssClass="na1" runat="server" ID="ImgRowCaption" AlternateText='<%# DataBinder.Eval(Container.DataItem, "TP")%>' />
                                    <%# DataBinder.Eval(Container.DataItem, "SName")%>
                                </td>
                                <td align="center">
                                    <asp:Label runat="server" ID="LblState" Text='<%# DataBinder.Eval(Container.DataItem, "LockState")%>' />
                                </td>
                                <td align="center">
                                    <a href="<%# DataBinder.Eval(Container.DataItem, "objURL")%>" target="_blank">
                                        <asp:Image runat="server" ID="ImgLink" ImageUrl="../imges/objpage.gif" border="0"
                                            AlternateText='<%# DataBinder.Eval(Container.DataItem, "TP")%>' /></a>
                                </td>
                                <td align="center">
                                    <asp:Panel runat="server" ID="PnlFolder" Visible='<%# ((int)(DataBinder.Eval(Container.DataItem, "TP"))==0)%>'>
                                        <asp:LinkButton ID="LnkBtnEnter" runat="server" CssClass="list_link" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID")%>'
                                            OnClick="LnkBtnEnter_Click" Text="����" />
                                        &nbsp;��&nbsp; <a href="javascript:Handle(0,0,<%# DataBinder.Eval(Container.DataItem, "ID")%>);">
                                            ����</a> &nbsp;��&nbsp; <a href="Collect_Add.aspx?Type=Folder&ID=<%# DataBinder.Eval(Container.DataItem, "ID")%>">
                                                ����</a> &nbsp;��&nbsp; <a href="javascript:Handle(1,0,<%# DataBinder.Eval(Container.DataItem, "ID")%>);">
                                                    ɾ��</a>
                                    </asp:Panel>
                                    <asp:Panel runat="server" ID="PnlSite" Visible='<%# ((int)(DataBinder.Eval(Container.DataItem, "TP"))==1)%>'>
                                        <a href="javascript:Handle(0,1,<%# DataBinder.Eval(Container.DataItem, "ID")%>);">����</a>
                                        <a href="Collect_Add.aspx?Type=Site&ID=<%# DataBinder.Eval(Container.DataItem, "ID")%>">
                                            ��</a> <a href="javascript:Handle(1,1,<%# DataBinder.Eval(Container.DataItem, "ID")%>);">
                                                ɾ��</a> <a href="javascript:Collect(<%# DataBinder.Eval(Container.DataItem, "ID")%>,'<%# DataBinder.Eval(Container.DataItem, "LockState")%>');">
                                                    �ɼ�</a>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <asp:HiddenField runat="server" ID="HidFolderID" Value="" />
                    <input type="hidden" id="HidClNum" value="0" />
                    <div class="fanye1">
                        <div class="fanye_le">
                            <uc1:PageNavigator ID="PageNavigator1" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
