<%@ Control Language="C#" AutoEventWireup="true" Inherits="controls_PageNavigator" Codebehind="PageNavigator.ascx.cs" %>
��<asp:Label runat="server" ID="LblRecordCount"/>����¼,��<asp:Label runat="server" ID="LblPageCount"/>ҳ,��ǰ��<asp:Label runat="server" ID="LblPageIndex" />ҳ
 <asp:LinkButton ID="LnkBtnFirst" runat="server" CommandName="Page" OnClick="LnkBtnFirst_Click">��ҳ</asp:LinkButton> 
 
 <asp:LinkButton ID="LnkBtnPrevious" runat="server" CommandName="Page" OnClick="LnkBtnPrevious_Click">��һҳ</asp:LinkButton> 

 <asp:LinkButton ID="LnkBtnNext" runat="server" CommandName="Page" OnClick="LnkBtnNext_Click">��һҳ</asp:LinkButton> 
 
 <asp:LinkButton ID="LnkBtnLast" runat="server" CommandName="Page" OnClick="LnkBtnLast_Click">βҳ</asp:LinkButton> 
<asp:textbox id="txtNewPageIndex" runat="server" width="20px"/>
<asp:linkbutton id="LnkBtnGoto" runat="server" causesvalidation="False" commandargument="-1" commandname="Page" text="ת����ҳ" OnClick="LnkBtnGoto_Click" />
