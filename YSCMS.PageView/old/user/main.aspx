<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" Inherits="user_main" CodeBehind="main.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>
<%Response.Write(Foosun.Config.UIConfig.HeadTitle); %>
</title>
<link type="text/css" rel="stylesheet" href="css/base.css" />
<link type="text/css" rel="stylesheet" href="css/style.css"/>
</head>
<body class="main_big">
<form id="Form1" runat="server">
  <table width="100%" height="30" class="matop_tab" border="0" cellpadding="0" cellspacing="0" background="../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/admin/reght_1_bg.gif">
    <tr>
      <td class="matop_tab_left">&nbsp;&nbsp;<span id="welcome" runat="server" />&nbsp;&nbsp;&nbsp;
        <label id="messageID"
				runat="server" />
        &nbsp;&nbsp;&nbsp;&nbsp;<a href="info/userinfo_update.aspx" class="list_link"
				target="sys_main">[����ά��]</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="friend/friendlist.aspx"
				class="list_link" target="sys_main">[�ҵĺ���]</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="discuss/discussManage_list.aspx"
				class="list_link" target="sys_main">[�ҵ�������]</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="../Help/help.aspx?HelpID=UserHelp"
				class="list_link" target="sys_main"><span style="color: Red;">[������·��]</span></a></td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="5" class="mimin_tab">
    <tr>
      <td width="50%" align="left" valign="top"><table width="100%" border="0" align="center"  class="table">
          <tr class="TR_BG">
            <th> <span class="span1">��Ϣͳ��<a href="friend/friendList.aspx" class="list_link"></a></span> </th>
          </tr>
          <tr>
            <td width="50%"><div style="padding-bottom: 5px; margin-left:10px; width:100%;">
                <label style="font-size: 12px; text-decoration: underline; float:left; padding-bottom: 5px;"> <img src="images/contenttitle.gif" border="0" alt="" />�ҵ�����</label>
                &nbsp;&nbsp;&nbsp;<a href="Constr/Constrlist.aspx" class="list_link">more...</a></div>
              <div runat="server" style="padding-left: 15px; width:100%; line-height:24px; float:left; _margin:4px 0;" id="ContentList" />
              <div style="padding-top: 15px; width:100%; margin-left:10px;  float:left;">
                <label style="font-size: 12px; padding-bottom: 5px; text-decoration: underline;"> <img src="images/contenttitle.gif" border="0" />�ҵ�������</label>
                &nbsp;&nbsp;&nbsp;<a
										href="discuss/discussManageestablish_list.aspx" class="list_link">more...</a></div>
              <div style="padding-left: 15px; width:100%; float:left;" runat="server" id="GroupList" /></td>
          </tr>
        </table></td>
      <td width="25%" align="left" valign="top"><table width="100%" border="0" cellspacing="1" cellpadding="3" class="table">
          <tr class="TR_BG">
            <th> <span class="span1">�����б� <a href="friend/friendList.aspx" class="list_link">[����]</a></span> </th>
          </tr>
          <tr>
            <td style="background-color: #FFFFFF;"><div id="frindlist" runat="server"></div></td>
          </tr>
        </table></td>
      <td width="25%" align="left" valign="top"><table width="98%" border="0" cellspacing="1" cellpadding="3" class="table">
          <tr class="TR_BG">
            <th> <span class="span1">����</span> </th>
          </tr>
          <tr>
            <td style="background-color: #FFFFFF; height: 113px;" valign="top"><asp:Calendar ID="Calendar1" runat="server" BackColor="Transparent" BorderColor="Transparent"
								Font-Names="����" Font-Size="Small" Width="100%" BorderWidth="0px" ShowGridLines="True"
								Font-Underline="False" ForeColor="DimGray" SelectMonthText="����">
                <DayStyle BackColor="White" BorderColor="Control" />
                <SelectedDayStyle BackColor="WhiteSmoke" ForeColor="#FF8000" />
                <TodayDayStyle BackColor="Gainsboro" BorderColor="Transparent" Font-Bold="True" ForeColor="Red"
									Wrap="False" />
                <WeekendDayStyle BackColor="White" />
                <OtherMonthDayStyle BackColor="Transparent" ForeColor="LightGray" />
                <NextPrevStyle BackColor="Transparent" />
                <TitleStyle BackColor="Transparent" />
                <DayHeaderStyle BackColor="WhiteSmoke" BorderColor="WhiteSmoke" Font-Names="Arial Black" />
              </asp:Calendar></td>
          </tr>
          <tr>
            <td style="background-color: #FFFFFF; height: 8px;"><span class="span1">
              <label id="Todaydate" runat="server" />
              </span></td>
          </tr>
          <tr>
            <td align="left" class="Lion_2" style="background-color: #FFFFFF; height: 20px;"><span class="span1"><a href="info/Logscreat.aspx" target="sys_main" class="list_link_o">�����±���¼</a> <span class="list_link_o">|</span> <a href="info/Logs.aspx" target="sys_main" class="list_link_o">������¼</a></span></td>
          </tr>
        </table></td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg"
		style="height: 38px">
    <tr>
      <td align="center"><label id="copyright" runat="server" /></td>
    </tr>
  </table>
</form>
</body>
</html>
