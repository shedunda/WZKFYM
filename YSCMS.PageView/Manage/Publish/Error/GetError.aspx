﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetError.aspx.cs" Inherits="YSCMS.PageView.Manage.Publish.Error.GetError" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="/CSS/base.css" />
    <link rel="stylesheet" type="text/css" href="/CSS/style.css" />
    <link rel="stylesheet" type="text/css" href="/CSS/<%Response.Write(YSCMS.Config.UIConfig.CssPath());%>/css/blue.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align:center;">
      <asp:TextBox ID="FileContent" runat="server" Width="99%" BorderColor="#0066ff" BorderStyle="None" Height="560px" TextMode="MultiLine"></asp:TextBox><div id="test" runat="server"></div>
    </div>
    </form>
</body>
</html>