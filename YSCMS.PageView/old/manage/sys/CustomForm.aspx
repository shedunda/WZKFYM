<%@ Page Language="C#" AutoEventWireup="true" Codebehind="CustomForm.aspx.cs" Inherits="Foosun.PageView.manage.Sys.CustomForm" %>

<%@ Register Src="../../controls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="/CSS/base.css"/>
    <link rel="stylesheet" type="text/css" href="/CSS/style.css"/>
    <link rel="stylesheet" type="text/css" href="/CSS/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/blue.css"/>
       <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/public.js" type="text/javascript"></script>
    <script src="/Scripts/jspublic.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript">
<!--
function GetJS(id)
{
    var WWidth = (window.screen.width-500)/2;
    var Wheight = (window.screen.height-150)/2-50;
    window.open ('CustomForm_JS.aspx?ID='+id, '��ȡJS', 'height=165px, width=400px,toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no,top='+Wheight+', left='+WWidth+', status=no');
}
function DeleteFrm(id)
{
    if(window.confirm('��ȷ��Ҫɾ���ñ���?���ݽ����ܱ��ָ�!'))
    {
        var options={
            method:'post',
            parameters:"Option=DeleteForm&ID="+ id,
            onComplete:
                function(transport)
	            {
	                var retv =transport.responseText;
	                OnRcvMsg(retv);
	            } 
	    }
	    new  Ajax.Request('CustomForm.aspx',options);
    }
}
function OnRcvMsg(rtstr)
{
   var n = rtstr.indexOf("%");
   alert(rtstr.substr(n+1,rtstr.length-n-1));
   if(parseInt(rtstr.substr(0,n)) > 0)
   {
      __doPostBack('PageNavigator1$LnkBtnGoto','');
   }
}
function GetHtml(id,f)
{
    var WWidth = (window.screen.width-600)/2;
    var Wheight = (window.screen.height-500)/2-50;
    window.open('CustomForm_HtmlCode.aspx?ID='+id +'&op='+ f, '��ȡHTML', 'height=500px, width=600px,toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no,top='+Wheight+', left='+WWidth+', status=no'); 
}
//-->
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="mian_body">
        <div class="mian_wei">
            <div class="mian_wei_min">
              <div class="mian_wei_left"><h3>�Զ��������</h3></div>
              <div class="mian_wei_right">
                  ������<a href="javascript:openmain('../main.aspx')">��ҳ</a>>>�Զ��������
              </div>
           </div>
        </div>
        <div class="mian_cont">
            <div class="nwelie">
                <div class="jslie_lan">
                    <a href="CustomForm_Add.aspx" class="topnavichar">�½���</a>
                  </div>
                <div class="jslie_lie">
                <asp:Repeater ID="RptData" runat="server">
                    <HeaderTemplate>
                        <table id="tablist" class="jstable">
                            <tr class="off" onmouseover="this.className='on'"onmouseout="this.className='off'">
                                <th width="15%">
                                    ������</th>
                                <th width="10%">
                                    ����</th>
                                <th width="35%">
                                    ˵��</th>
                                <th width="40%">
                                    ����</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="off" onmouseover="this.className='on'"onmouseout="this.className='off'">
                            <td align="center">
                                <%# DataBinder.Eval(Container.DataItem, "formname")%>
                            </td>
                            <td align="center">
                                <%# DataBinder.Eval(Container.DataItem, "formtablename")%>
                            </td>
                            <td align="center">
                                <%# DataBinder.Eval(Container.DataItem, "memo")%>
                            </td>
                            <td align="center"><a class="xa3" href="CustomForm_Item.aspx?ID=<%# DataBinder.Eval(Container.DataItem, "id")%>">�������</a> <a class="xa3" href="CustomForm_Data.aspx?id=<%# DataBinder.Eval(Container.DataItem, "id")%>">����</a> <a class="xa3" href="CustomForm_Add.aspx?ID=<%# DataBinder.Eval(Container.DataItem, "id")%>">�޸�</a> <a class="xa3" href="javascript:DeleteFrm(<%# DataBinder.Eval(Container.DataItem, "id")%>);">ɾ��</a></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
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
