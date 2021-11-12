<%@ Page Language="C#" AutoEventWireup="true" Inherits="Collect_News" CodeBehind="Collect_News.aspx.cs" %>

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
        function GetAllChecked() {
            var retstr = "";
            var tb = document.getElementById("tablist");
            var j = 0;
            for (var i = 1; i < tb.rows.length - 1; i++) {
                var objtr = tb.rows[i];
                var objtd = objtr.cells[0];
                var objnd = objtd.childNodes[0];
                if (objnd.type == "checkbox" && objnd.checked) {
                    if (j > 0)
                        retstr += ",";
                    retstr += objnd.value;
                    j++;
                }
            }
            return retstr;
        }
        function GetAllHistoryNews()//����������
        {
            var retstr = "";
            var tb = document.getElementById("tablist");
            var j = 0;
            for (var i = 1; i < tb.rows.length - 1; i++) {
                var objtr = tb.rows[i];
                var objtd = objtr.cells[2];
                var objtdid = objtr.cells[0];
                var objnd = objtdid.childNodes[0];
                if (objtd.innerText == "�����") {
                    if (j > 0)
                        retstr += ",";
                    retstr += objnd.value;
                    j++;
                }
            }
            return retstr;
        }
        function Transfer(id) {
            var l;
            var m = "����δ���";
            if (id == -1) {
                l = GetAllChecked();
                if (l == "") {
                    alert("��û��ѡ��Ҫ��������!");
                    return;
                }
                m = "ѡ��";
            }
            else if (id == 0) {
                l = id;
            }
            if (confirm('ȷ��Ҫ���' + m + '��������?')) {
                location.href = 'Store.aspx?ID=' + l;
            }
        }
        function DeleteCllNews(id) {
            var option = "DeleteNews";
            var l;
            var m = '��ǰ';
            if (id == -1) {
                l = GetAllChecked();
                if (l == "") {
                    alert("��û��ѡ��Ҫɾ��������!");
                    return;
                }
                m = "ѡ��";
            }
            else if (id == 0) {
                m = "���������";
                // l = id;
                option = "DeleteAllHistory";
                l = GetAllHistoryNews();
            }
            else {
                l = id;
            }
            if (confirm('ȷ��Ҫ����ɾ��' + m + '������?���ݽ����ָܻ�!')) {
                SendAjax(option, l);
            }
        }

        function SendAjax(op, id) {
            var param = 'Option=' + op + '&NewsID=' + id + '&rd=' + Math.random();
            jQuery.get("Collect_News.aspx?" + param, function (transport) {
                location.href = location.href;
            });
        }

        function ChooseAll(obj) {
            var flag = obj.checked;
            var tb = document.getElementById("tablist");
            for (var i = 1; i < tb.rows.length - 1; i++) {
                var objtr = tb.rows[i];
                var objtd = objtr.cells[0];
                var objnd = objtd.childNodes[0];
                if (objnd.type == "checkbox")
                    objnd.checked = flag;
            }
        }
//-->
    </script>
</head>
<body>
    <form id="Form2" runat="server">
    <div class="mian_body">
<div class="mian_wei">
   <div class="mian_wei_min">
      <div class="mian_wei_left"><h3>�ɼ�ϵͳ </h3></div>
      <div class="mian_wei_right">
          ������<a href="javascript:openmain('../main.aspx')">��ҳ</a>>><a href="Collect_List.aspx">�ɼ�����</a> >>�ɼ����Ŵ��� 
      </div>
   </div>
</div>
<div class="mian_cont">
   <div class="nwelie">
      <div class="jslie_lan">
         <span>���ܣ�</span>
         <a class="topnavichar" href="Collect_List.aspx">վ�����</a>��<a class="topnavichar" href="Collect_RuleList.aspx">�ؼ��ֹ���</a>
      </div>
      <div class="jslie_lie">
        <asp:Repeater ID="RptNews" runat="server" OnItemDataBound="RptNews_ItemDataBound">
            <HeaderTemplate>
                <table class="jstable" id="tablist">
                    <tr class="off" onmouseover="this.className='on'"onmouseout="this.className='off'">
                       <th width="5%"></th>
                       <th width="40%">��������</th>
                       <th width="10%">״̬</th>
                       <th width="15%">�ɼ�վ��</th>
                       <th width="15%">�������</th>
                       <th width="15%">����</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr onmouseover="this.className='on'"onmouseout="this.className='off'">
                    <td align="center">
                        <input type="checkbox" value="<%# DataBinder.Eval(Container.DataItem, "ID")%>" />
                    </td>
                    <td>
                        <span class="span1"><%# DataBinder.Eval(Container.DataItem, "Title")%></span>
                    </td>
                    <td align="center">
                        <asp:Label runat="server" ID="LblState" Text='<%# DataBinder.Eval(Container.DataItem, "History")%>' />
                    </td>
                    <td align="center">
                        <%# DataBinder.Eval(Container.DataItem, "SiteName")%>
                    </td>
                    <td align="center">
                        <%# DataBinder.Eval(Container.DataItem, "AddDate")%>
                    </td>
                    <td align="center">
                        <a href="Collect_NewsModify.aspx?ID=<%# DataBinder.Eval(Container.DataItem, "ID")%>">�޸�</a> <a href="javascript:DeleteCllNews(<%# DataBinder.Eval(Container.DataItem, "ID")%>);"
                                   >
                                    <img src="../imges/lie_65.gif" border="0" alt="����ɾ��" /></a>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                <tr class="TR_BG_list">
                    <td colspan="7">
                        <table border="0" width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                 <td width="5%" align="center">
                                    <input type="checkbox" onclick="ChooseAll(this)" />
                                </td>                               
                                <td width="40%" align="left">
                                    <span class="span1">ѡ������</span>
                                </td>
                                <td colspan="55%" align="right" valign="top">
                                    <input type="button" class="xsubmits" name="BnRecyle" value="ɾ���������������" onclick="DeleteCllNews(0);" />
                                    <input type="button" class="xsubmits" name="BnDelete" value="�������δ�������" onclick="Transfer(0);" />
                                    <input type="button" class="xsubmits" name="BnProperty" value="���ѡ������" onclick="Transfer(-1)" />
                                    <input type="button" class="xsubmits" name="BnMove" value="ɾ��ѡ������" onclick="DeleteCllNews(-1)" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                </table>
            </FooterTemplate>
        </asp:Repeater>
         <div class="fanye1">
            <div class="fanye_le"><uc1:PageNavigator ID="PageNavigator1" runat="server" /></div>
         </div>
      </div>
   </div>
</div>
</div>
    </form>
</body>
</html>
