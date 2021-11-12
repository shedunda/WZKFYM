<%@ Page Language="C#" AutoEventWireup="true" Inherits="SpecialList" ResponseEncoding="utf-8"
    CodeBehind="SpecialList.aspx.cs" %>

<%@ Import Namespace="System.Data" %>
<%@ Register Src="../../controls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="/CSS/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/blue.css"
        rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/css/base.css" />
    <link rel="stylesheet" type="text/css" href="/css/style.css" />
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/public.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="mian_body">
        <div class="mian_wei">
   <div class="mian_wei_min">
      <div class="mian_wei_left"><h3>ר�����</h3></div>
      <div class="mian_wei_right">
          ������<a href="javascript:openmain('../main.aspx')" target="sys_main" class="xa3">��ҳ</a><span id="naviClassName" runat="server" />>><label id="m_NewsChar" runat="server" /> 
      </div>
   </div>
</div>
        <div class="mian_cont">
            <div class="nwelie">
                <div class="lanlie">
                    <div class="zhlie_left">
                        <a href="SpecialAdd.aspx" class="topnavichar">���ר��</a></div>
                    <div class="zhlie_right">
                        <a href="javascript:PDel();" class="topnavichar">����ɾ��</a>&nbsp;��&nbsp;<a href="javascript:PRDel();"
                            class="topnavichar">ɾ��������վ</a>&nbsp;��&nbsp;<a href="javascript:PUnlock();" class="topnavichar">��������</a>&nbsp;��&nbsp;<a
                                href="javascript:Plock();" class="topnavichar">��������</a>&nbsp;��&nbsp;<a href="javascript:Publish();"
                                    class="topnavichar">���ɾ�̬�ļ�</a>&nbsp;��&nbsp;<a href="SpecialTemplet.aspx" class="topnavichar">��������ģ��</a>
                        <span id="channelList" runat="server" style="display: none;" />
                    </div>
                </div>
                <div class="nwelie_lan2">
                    ����ר�����ƣ�<asp:TextBox ID="search_SpecialCName" runat="server" class="xinput2"></asp:TextBox><asp:Button
                        ID="search_button" runat="server" Text="��ѯ" OnClick="search_button_Click" class="xsubmit2" />
                </div>
                <div class="lanlie_lie">
                    <asp:Repeater ID="DataList1" runat="server">
                        <HeaderTemplate>
                            <table class="lanlie_table">
                                <tr class="off" onmouseover="this.className='on'"onmouseout="this.className='off'">
                                    <th width="30%">
                                        ר������
                                    </th>
                                    <th width="15%">
                                        ���ʱ��
                                    </th>
                                    <th  width="10%">
                                        ״̬
                                    </th>
                                    <th width="15%">
                                        ר��������Ϣ
                                    </th>
                                    <th width="30%">
                                        ����
                                        <input type="checkbox" value="'-1'" name="S_ID" id="S_ID" onclick="javascript:selectAll(this.form,this.checked)" />
                                    </th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%#((DataRowView)Container.DataItem)["Colum"]%>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                <div class="fanye">
                    <div class="fanye_le">
                        <uc1:PageNavigator ID="PageNavigator1" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
<script language="javascript" type="text/javascript">
    function Lock(ID) {
        self.location = "?Type=Lock&ID=" + ID;
    }
    function UnLock(ID) {
        self.location = "?Type=UnLock&ID=" + ID;
    }
    function Del(ID) {
        if (confirm('��ȷ��ɾ����ר��\n�Լ���ר�����ר����?')) {
            self.location = "?Type=Del&ID=" + ID;
        }
    }
    function Update(ID) {
        self.location = "SpecialEdit.aspx?ID=" + ID;
    }
    function AddChild(ID) {
        self.location = "SpecialAdd.aspx?parentID=" + ID;
    }

    function PDel() {
        if (confirm("��ȷ��Ҫ����ɾ����?\r�˲�������ɾ��ѡ�е�ר��\r�Լ�ѡ��ר�����ר��\rɾ��֮���޷��ָ���")) {
            document.form1.action = "?Type=PDel&Mode=Del";
            document.form1.submit();
        }
    }
    function PUnlock() {
        if (confirm("��ȷ��Ҫ����������?")) {
            document.form1.action = "?Type=PUnlock";
            document.form1.submit();
        }
    }
    function Plock() {
        if (confirm("��ȷ��Ҫ����������?\r�˲�����������ѡ�е�ר��\r�Լ�ѡ��ר�����ר��")) {
            document.form1.action = "?Type=Plock";
            document.form1.submit();
        }
    }
    function PRDel() {
        if (confirm("��ȷ��Ҫɾ��������վ��?\r�˲��������ѡ�е�ר��\r�Լ�ѡ��ר�����ר����뵽����վ��\rɾ��֮����Դӻ���վ�лָ���")) {
            document.form1.action = "?Type=PDel&Mode=Re";
            document.form1.submit();
        }
    }

    function Publish() {
        document.form1.action = "?Type=Publish";
        document.form1.submit();
    }

    function getchanelInfo(obj) {
        var SiteID = obj.value;
        window.location.href = "SpecialList.aspx?SiteID=" + SiteID + "";
    }
</script>
</html>
