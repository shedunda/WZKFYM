<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" AutoEventWireup="true" Inherits="user_info_history" Debug="true" Codebehind="history.aspx.cs" %>
<%@ Register Src="../../controls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<%@ Import NameSpace="System.Data"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><%Response.Write(Foosun.Config.UIConfig.HeadTitle); %></title>
	<link type="text/css" rel="stylesheet" href="../css/base.css" />
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/public.js" type="text/javascript"></script>
</head>
<body class="main_big">
<form id="form1" runat = "Server">
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="toptable">
        <tr>
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="57%" class="matop_tab_left"><strong  style="font-size:14px; line-height:35px; margin-left:10px;">��������</strong></td>
    <td width="43%" class="list_link"  style="PADDING-LEFT: 14px" ><div style="text-align:right; margin-right:10px;">λ�õ���<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../images/navidot.gif" border="0" />��������<a href="userinfo.aspx" class="list_link"></a></div></td>
        </tr>
</table>
      <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
        <tr><td  style="padding-left:12px;"><a href="?type=0" class="topnavichar">ȫ������</a>&nbsp; &nbsp;<a href="?type=2" class="topnavichar">���߳�ֵ</a>&nbsp; &nbsp;<a href="?type=3" class="topnavichar" >���ֶһ�</a>&nbsp; &nbsp;<a href="?type=4" class="topnavichar" >���</a>&nbsp; &nbsp;<a href="?type=5" class="topnavichar" >�Ķ�Ȩ��</a>&nbsp; &nbsp;<a href="?type=1" class="topnavichar" >����</a>&nbsp; &nbsp;<a href="?type=6" class="topnavichar" >��¼���</a>&nbsp; &nbsp;<a href="?type=7" class="topnavichar" >ע����</a> &nbsp; &nbsp;<a href="?ghtype=2" class="menulist">����</a>&nbsp; &nbsp;<a href="?ghtype=1" class="menulist">֧��</a></td>
        </tr>
</table>

    <div id="no" runat="server"></div>
<asp:Repeater ID="userlists" runat="server">
   <HeaderTemplate>
       <table width="98%" border="0" align="center" cellpadding="4" cellspacing="1" class="liebtable">
        <tr onmouseout="this.className='off'" onmouseover="this.className='on'" class="off">
        <th class="sys_topBg" align="center" width="15%">�û���</th>
        <th class="sys_topBg" align="center" width="10%">����/֧��</th>
        <th class="sys_topBg" align="center" width="10%">G��</th>
        <th class="sys_topBg" align="center" width="10%">����</th>   
        <th class="sys_topBg" align="center" width="10%">�ֽ�</th> 
        <th class="sys_topBg" align="center" width="18%">˵��</th>              
        <th class="sys_topBg" align="center" width="17%">��������</th>
        </tr>
    </HeaderTemplate>
      <ItemTemplate>
        <tr onmouseout="this.className='off'" onmouseover="this.className='on'" class="off">
        <td align="center" valign="middle"><%#((DataRowView)Container.DataItem)["UserName"]%></td>
        <td align="center" valign="middle" ><%#((DataRowView)Container.DataItem)["ghtypes"]%></td>
        <td align="center" valign="middle" ><%#((DataRowView)Container.DataItem)["Gpoint"]%></td>
        <td align="center" valign="middle" ><%#((DataRowView)Container.DataItem)["iPoint"]%></td>
        <td align="center" valign="middle" ><%#((DataRowView)Container.DataItem)["Moneys"]%></td>
        <td align="center" valign="middle" ><%#((DataRowView)Container.DataItem)["content"]%></td>
        <td align="center" valign="middle" ><%#((DataRowView)Container.DataItem)["CreatTime"]%></td>
        </tr>
      </ItemTemplate>
      <FooterTemplate>
      </table>
     </FooterTemplate>
</asp:Repeater> 

<table width="98%" border="0" align="center" cellpadding="3" cellspacing="2" style="height: 20px">
   <tr><td align="right">
         <uc1:PageNavigator ID="PageNavigator1" runat="server" /></td>
   </tr>
</table>
<table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
   <tr>
     <td align="center"><label id="copyright" runat="server" /></td>
   </tr>
</table>
</form>
</body>
</html>
