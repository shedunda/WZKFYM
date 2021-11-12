<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreeLabelList.aspx.cs" Inherits="YSCMS.PageView.Manage.Label.FreeLabelList" %>
<%@ Register Src="../../controls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title></title>
<link rel="stylesheet" type="text/css" href="/CSS/base.css"/>
<link rel="stylesheet" type="text/css" href="/CSS/style.css"/>
<link rel="stylesheet" type="text/css" href="/CSS/<%Response.Write(YSCMS.Config.UIConfig.CssPath());%>/css/blue.css"/>
 <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/public.js" type="text/javascript"></script>
 <link href="/CSS/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css" />
<script src="/Scripts/jquery-ui-1.10.2.custom.min.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
<!--
    function DeleteFreeLabel(id) {
        if (window.confirm("��ȷ��Ҫɾ�������ɱ�ǩ��,���ݽ����ָܻ�?")) {
            PostForm("Option=DeleteFreeLabel&ID=" + id);
        }
    }
    function PostForm(datas) {
        $.ajax({
            type: "POST",
            url: "FreeLabelList.aspx",
            async: false,
            //�Ƿ�ajaxͬ��       
            data: datas,
            success: function (data) {
                $("#dialog-message").html("<div class=\"msgboxs\">" + data + "</div>");
                $("#dialog-message").dialog({
                    modal: true,
                    close: function () {
                        __doPostBack('PageNavigator1$LnkBtnGoto', '');
                    }
                });
            }
        });
    }

</script>
</head>
<body>
<div id="dialog-message" title="��ʾ"></div>
<form id="Form1" runat="server">
<div class="mian_body">
<div class="mian_wei">
   <div class="mian_wei_min">
      <div class="mian_wei_left"><h3>���ɱ�ǩ</h3></div>
      <div class="mian_wei_right">
          ������<a href="javascript:openmain('../main.aspx')">��ҳ</a>>><a href="FreeLabelList.aspx">���ɱ�ǩ</a>
      </div>
   </div>
</div>
<div class="mian_cont">
   <div class="nwelie">
      <div class="lanlie">
         <ul>
            <li><a class="topnavichar" href="FreeLabelAdd.aspx">�½����ɱ�ǩ</a></li>        
         </ul>
      </div>
      <div class="lanlie_lie">
         <div class="jslie_lie">
         <asp:Repeater runat="server" ID="RptFreeLabel">
<HeaderTemplate>
  <table class="jstable">
  <tr class="off" onmouseover="this.className='on'"onmouseout="this.className='off'">
    <th  width="20%" align="center">��ǩ����</td>
    <th width="20%" align="center">��������</td>
    <th width="45%" align="center">����</td>
    <th  width="15%" align="center">����</td>
  </tr>
 </HeaderTemplate>
 <ItemTemplate>
   <tr class="off" onmouseover="this.className='on'"onmouseout="this.className='off'">
    <td><span class="span1"><%# DataBinder.Eval(Container.DataItem, "LabelName")%></span></td>
    <td  align="center"><%# DataBinder.Eval(Container.DataItem, "CreatTime")%></td>
    <td><span class="span1"><%# DataBinder.Eval(Container.DataItem, "Description")%></span></td>
    <td  align="center"><a  href="FreeLabelAdd.aspx?id=<%# DataBinder.Eval(Container.DataItem, "Id")%>">�޸�</a> <a href="javascript:DeleteFreeLabel(<%# DataBinder.Eval(Container.DataItem, "Id")%>)">ɾ��</a></td>
 </tr>
 </ItemTemplate>
 <FooterTemplate>
  </table>
  </FooterTemplate>
  </asp:Repeater>
        </div>
        <div class="fanye">
          <div class="fanye_le"><uc1:PageNavigator ID="PageNavigator1" runat="server" /></div>         
          </div>
      </div>
   </div>
</div>
</div>
</form>
</body>
</html>
