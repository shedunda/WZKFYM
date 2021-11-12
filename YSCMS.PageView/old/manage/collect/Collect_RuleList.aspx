<%@ Page Language="C#" AutoEventWireup="true" Inherits="Collect_RuleList" Codebehind="Collect_RuleList.aspx.cs" %>

<%@ Register Src="../../controls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>FoosunCMS For .NET v1.0.0</title>
    <link rel="stylesheet" type="text/css" href="/CSS/base.css" />
    <link rel="stylesheet" type="text/css" href="/CSS/style.css" />
    <link rel="stylesheet" type="text/css" href="/CSS/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/blue.css" />
    <script language="javascript" type="text/javascript" src="/Scripts/jquery.js"></script> <script src="/Scripts/public.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
 function DeleteMe(id)
 {
     if (window.confirm('��ȷ��Ҫɾ���ù��������ݽ������ٻָ���')) {
         var param = 'Option=DeleteRule&ID=' + id;
		$.get("Collect_RuleList.aspx?" + param + "&md=" + Math.random(), function (transport) {
		    OnRecv(transport);
        });
    }
 }
 function OnRecv(retv)
 {
     var n = retv.indexOf('%');
    if(parseInt(retv.substr(0,n)) > 0)
    {
        __doPostBack('PageNavigator1$LnkBtnGoto','');
    }
 }
    </script>

</head>
<body>
    <form id="Form2" runat="server">
    <div class="mian_body">
<div class="mian_wei">
    <!--<div class="mian_wei_1"><img src="imges/lie_10.gif" alt="" /></div>-->
   <div class="mian_wei_min">
      <div class="mian_wei_left"><h3>�ɼ�ϵͳ </h3></div>
      <div class="mian_wei_right">
          ������<a href="javascript:openmain('../main.aspx')">��ҳ</a>>><a href="Collect_List.aspx">�ɼ�ϵͳ</a> >>�ؼ��ֹ���
      </div>
   </div>
   <!--<div class="mian_wei_2"><img src="imges/lie_12.gif" alt="" /></div>-->
</div>
<div class="mian_cont">
   <div class="nwelie">
      <div class="jslie_lan">
         <span>���ܣ�</span><a class="topnavichar" href="Collect_RuleAdd.aspx">�½�����</a>��<a class="topnavichar" href="Collect_List.aspx">վ������</a>��<a class="topnavichar" href="Collect_News.aspx">���Ŵ���</a>
      </div>
      <div class="jslie_lie">
      <asp:Repeater runat="server" ID="RptRule">
                <HeaderTemplate>
                    <table class="jstable">
                        <tr class="off" onmouseover="this.className='on'"onmouseout="this.className='off'">
                           <th width="50%">��������</th>
                           <th width="20%">����ʱ��</th>
                           <th width="30%">����</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr onmouseover="this.className='on'"onmouseout="this.className='off'">
                        <td>
                            <span class="span1"><%# DataBinder.Eval(Container.DataItem, "RuleName")%></span>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "AddDate")%>
                        </td>
                        <td align="center">
                            <a href="Collect_RuleAdd.aspx?RID=<%# DataBinder.Eval(Container.DataItem, "ID")%>"
                                class="xa3">�޸�</a> <a href="javascript:DeleteMe(<%# DataBinder.Eval(Container.DataItem, "ID")%>);"
                                    class="xa3">����ɾ��</a></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <asp:HiddenField runat="server" ID="HidFolderID" Value="" />
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
