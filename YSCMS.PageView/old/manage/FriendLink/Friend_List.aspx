<%@ Page Language="C#" AutoEventWireup="true" Inherits="Friend_List" CodeBehind="Friend_List.aspx.cs" validateRequest="false" %>

<%@ Register Src="~/controls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="/CSS/base.css" />
    <link rel="stylesheet" type="text/css" href="/CSS/style.css" />
    <link rel="stylesheet" type="text/css" href="/CSS/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/blue.css" />
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/public.js" type="text/javascript"></script>
    <link href="/CSS/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery-ui-1.10.2.custom.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.bgiframe.js" type="text/javascript"></script>
    <script src="/Scripts/SelectAction.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
     <div id="dialog-message" title="���ģ��"></div>
    <div class="mian_body">
        <div class="mian_wei_min">
            <div class="mian_wei_left">
                <h3>��������</h3>
            </div>
            <div class="mian_wei_right">
                ������<a href="javascript:openmain('../main.aspx')">��ҳ</a> >>��������
            </div>
        </div>
        <div class="mian_cont">
            <div class="nwelie">
                <div id="ShowNavi" runat="server" />
                <div id="NoContent" runat="server" />
                <div id="NoContent_Link" runat="server" />
        
            <%
                string type = Request.QueryString["type"];
                if (type == "pram")
                {
            %>
            <div class="newxiu_base">
            <table class="nxb_table" width="99%">
                <tr>
                    <td colspan="2"><font>�������Ӳ�������</font></td>
                </tr>
                <tr>
                    <td  width="20%" align="right">
                        �Ƿ񿪷������������룺
                    </td>
                    <td>
                        <asp:CheckBox ID="IsOpen" runat="server" CssClass="checkbox2" />
                        <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_friendParam_0001',this)">
                            ����</span>
                    </td>
                </tr>
                <tr>
                    <td  width="20%" align="right">
                        ע���Ա�������룺
                    </td>
                    <td>
                        <asp:CheckBox ID="IsRegister" runat="server" CssClass="checkbox2" />
                        <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_friendParam_0002',this)">
                            ����</span>
                    </td>
                </tr>
                <tr>
                    <td  width="20%" align="right">
                        ��������ͼƬ�����С�ߴ磺
                    </td>
                    <td>
                        <asp:TextBox ID="ArrSize" runat="server" CssClass="input9" />
                        <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_friendParam_0003',this)">
                            ����</span>
                    </td>
                </tr>
                <tr>
                    <td  width="20%" align="right">
                        ����������֪��<br />
                        (֧��html��ʽ)&nbsp;&nbsp;
                    </td>
                    <td>
                        <div class="textdiv4"><textarea id="Content" runat="server" style="width: 358px; height: 137px; font-size:12px;" />
                        <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_friendParam_0004',this)">
                            ����</span></div>
                    </td>
                </tr>
                <tr>
                    <td  width="20%" align="right">
                        ���������Ƿ���´��ڣ�
                    </td>
                    <td>
                        <asp:CheckBox ID="isBlank" runat="server" CssClass="checkbox2" />
                    </td>
                </tr>
                <tr>
                    <td  width="20%" align="right">
                        ͼƬ�����Ƿ���´��ڣ�
                    </td>
                    <td>
                        <asp:CheckBox ID="isImgBlank" runat="server" CssClass="checkbox2" />
                    </td>
                </tr>
                <tr>
                    <td  width="20%" align="right">
                        ����������Ƿ�Ҫ��ˣ�
                    </td>
                    <td>
                        <asp:CheckBox ID="isLock" runat="server" CssClass="checkbox2" />
                        <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_friendParam_0005',this)">
                            ����</span>
                    </td>
                </tr>
            </table>
            
            <div class="nxb_submit" >
                <input type="submit" name="Save" value=" �� �� " class="xsubmit1" id="SavePram" runat="server"
                                onserverclick="SavePram_ServerClick" />
               <input type="submit" name="Clear" value="����" id="ClearPram" class="xsubmit1"/>
           </div>
           </div>
            <%
}
            %>
            <%
                if (type == "class")
                {
            %>
            <div class="trash">
            <a href="?type=add_class" class="topnavichar">��ӷ���</a>��<asp:LinkButton ID="delP_class" runat="server" CssClass="topnavichar" OnClientClick="{if(confirm('ȷ��ɾ����ѡ��Ϣ��?\n���µ�����Ҳ����ɾ��!')){return true;}return false;}"
                            OnClick="delP_class_Click">����ɾ��</asp:LinkButton>��<asp:LinkButton ID="delall_class" runat="server" CssClass="topnavichar" OnClientClick="{if(confirm('ȷ��ɾ��ȫ����Ϣ��?\n���µ�����Ҳ����ɾ��!')){return true;}return false;}"
                            OnClick="delall_class_Click">ɾ��ȫ��</asp:LinkButton>
                        <input type="checkbox" id="friend_checkbox1" value="-1" name="friend_checkbox1" onclick="javascript:return selectAll(this.form,this.checked);" />
         </div>
            <asp:Repeater ID="DataList1" runat="server">
                <HeaderTemplate>
                    <table class="jstable">
                        <tr  class="off" onmouseover="this.className='on'"onmouseout="this.className='off'">
                            <th width="30%">�������</th>
                             <th width="30%">����</th>
                             <th width="40%">����</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <%#((DataRowView)Container.DataItem)["Colum"]%>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <div class="fanye1">
               <div class="fanye_le"><uc1:PageNavigator ID="PageNavigator1" runat="server" /></div>
            </div>
            <%
                }
            %>
            <%
                if (type == "add_class")
                {
            %>
            <div class="newxiu_base">
            <table  class="nxb_table" id="Add_Class">
                <tr>
                    <td colspan="2"><font>�����������ӷ�����Ϣ</font></td>
                 </tr>
                <tr>
                    <td  width="20%" align="right">
                        �����ţ�
                    </td>
                    <td>
                        <asp:TextBox ID="ParentID" runat="server" Enabled="false" CssClass="input9" />
                        <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_friendClass_001',this)">
                            ����</span>
                    </td>
                </tr>
                <tr>
                    <td  width="20%" align="right">
                        ������ƣ�
                    </td>
                    <td>
                        <asp:TextBox ID="ClassCName" runat="server" onChange="javascript:GetPY1(this);" CssClass="input9" />
                        <span class="reshow">(*)</span> <span class="helpstyle" style="cursor: help;" title="����鿴����"
                            onclick="Help('H_friendClass_0001',this)">����</span>
                    </td>
                </tr>
                <tr>
                    <td  width="20%" align="right">
                        Ӣ�����ƣ�
                    </td>
                    <td>
                        <asp:TextBox ID="ClassEName" runat="server" CssClass="input9" />
                        <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_friendClass_0002',this)">
                            ����</span>
                    </td>
                </tr>
                <tr>
                    <td  width="20%" align="right">
                        ����˵����
                    </td>
                    <td>
                        <div class="textdiv4"><textarea id="Content_Class" runat="server" style="width: 266px; height: 99px"  />
                        <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_friendClass_0003',this)">
                            ����</span></div>
                    </td>
                </tr>
            </table>

            <div class="nxb_submit" > 
            <input type="submit" name="SaveA" value=" �� �� " class="xsubmit1" id="SaveAddClass" runat="server" onserverclick="SaveAddClass_ServerClick" />
               <input type="reset" name="ClearA" value=" �� �� " class="xsubmit1" id="ClearAddClass" runat="server" />
           </div>
            </div>
            <%
                }
            %>
            <%
                if (type == "edit_class")
                {
            %>
            <div class="newxiu_base">
            <table class="nxb_table" id="Edit_Class">
                <tr>
                    <td colspan="2"><font>�޸��������ӷ�����Ϣ</font></td>
                 </tr>
                <tr>
                    <td width="20%" align="right">
                        �����ţ�
                    </td>
                    <td>
                        <asp:TextBox ID="ParentIDEdit" runat="server" Enabled="false" CssClass="input9" />
                        <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_friendClass_001',this)">
                            ����</span>
                    </td>
                </tr>
                <tr>
                    <td width="20%" align="right">
                        ������ƣ�
                    </td>
                    <td>
                        <asp:TextBox ID="ClassCNameEdit" runat="server" CssClass="input9" />
                        <span class="reshow">(*)</span> <span class="helpstyle" style="cursor: help;" title="����鿴����"
                            onclick="Help('H_friendClass_0001',this)">����</span>
                    </td>
                </tr>
                <tr>
                    <td width="20%" align="right">
                        Ӣ�����ƣ�
                    </td>
                    <td>
                        <asp:TextBox ID="ClassENameEdit" runat="server" CssClass="input9" />
                        <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_friendClass_0002',this)">
                            ����</span>
                    </td>
                </tr>
                <tr>
                    <td width="20%" align="right">
                        ����˵����
                    </td>
                    <td>
                       <div class="textdiv4"><textarea id="DescriptionE" runat="server" style="width: 266px; height: 99px" />
                        <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_friendClass_0003',this)">
                            ����</span></div>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2" class="list_link">
                        <label>
                            
                        </label>
                        &nbsp;&nbsp;
                        <label>
                            
                        </label>
                    </td>
                </tr>
            </table>
            <div class="nxb_submit" >
               <input type="submit" name="SaveE" value=" �� �� " class="xsubmit1" id="UpdateClass" runat="server" onserverclick="UpdateClass_ServerClick" />
               <input type="reset" name="ClearE" value=" �� �� " class="xsubmit1" id="ResetClass" runat="server" />
           </div>
            </div>
            <%
                }
            %>
            <%
                if (type == "link")
                {
            %>

            <div class="trash">
            <a href="?type=add_link" class="topnavichar">�������</a>��<asp:LinkButton ID="SuoP" runat="server" CssClass="topnavichar" OnClientClick="{if(confirm('ȷ��������ѡ��Ϣ��?')){return true;}return false;}"
                            OnClick="SuoP_Click">��������</asp:LinkButton>��<asp:LinkButton ID="UnsuoP" runat="server" CssClass="topnavichar" OnClientClick="{if(confirm('ȷ�Ͻ�����ѡ��Ϣ��?')){return true;}return false;}"
                            OnClick="UnsuoP_Click">��������</asp:LinkButton>��<asp:LinkButton ID="delP_link" runat="server" CssClass="topnavichar" OnClientClick="{if(confirm('ȷ��ɾ����ѡ��Ϣ��?')){return true;}return false;}"
                            OnClick="delP_link_Click">����ɾ��</asp:LinkButton>��<asp:LinkButton ID="delall_link" runat="server" CssClass="topnavichar" OnClientClick="{if(confirm('ȷ��ɾ��ȫ����Ϣ��?')){return true;}return false;}"
                            OnClick="delall_link_Click">ɾ��ȫ��</asp:LinkButton>
                        <input type="checkbox" id="friend_checkbox_link1" value="-1" name="friend_checkbox_link1" onclick="javascript:return selectAll(this.form,this.checked);" />
         </div>
            <asp:Repeater ID="DataList2" runat="server">
                <HeaderTemplate>
                    <table width="98%" border="0" align="center" cellpadding="4" cellspacing="1" class="jstable">
                        <tr  class="off" onmouseover="this.className='on'"onmouseout="this.className='off'">
                            <th width="10%">���</th>
                             <th width="10%">վ��</th>
                             <th width="10%">���</th>
                             <th width="10%">����</th>
                             <th width="10%">����</th>
                             <th width="12%">״̬</th>
                             <th width="15%">����</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                      <tr  class="off" onmouseover="this.className='on'"onmouseout="this.className='off'">
                        <td  align="center" valign="middle">
                            <%#((DataRowView)Container.DataItem)[0]%>
                        </td>
                        <td align="center" valign="middle">
                            <%#((DataRowView)Container.DataItem)[1]%>
                        </td>
                        <td align="center" valign="middle">
                            <%#((DataRowView)Container.DataItem)["class"]%>
                        </td>
                        <td align="center" valign="middle">
                            <%#((DataRowView)Container.DataItem)["type"]%>
                        </td>
                        <td  align="center" valign="middle">
                            <%#((DataRowView)Container.DataItem)["author"]%>
                        </td>
                        <td align="center" valign="middle">
                            <%#((DataRowView)Container.DataItem)["lock"]%>
                        </td>
                        <td align="center" valign="middle">
                            <%#((DataRowView)Container.DataItem)["operate"]%>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <div class="fanye1">
               <div class="fanye_le"><uc1:PageNavigator ID="PageNavigator2" runat="server" /></div>
            </div>

            <%
                }
            %>
            <%
                if (type == "add_link")
                {
            %>
            <div class="newxiu_base">
            <table class="nxb_table" id="Table1">
                <tr>
                    <td colspan="2"><font>������������������Ϣ</font></td>
                </tr>
                <tr>
                    <td width="20%" align="right">
                        ѡ�����
                    </td>
                    <td>
                        <asp:DropDownList ID="SelectClass" runat="server" CssClass="select4">
                        </asp:DropDownList>
                        <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_FriendLink_0001',this)">
                            ����</span>
                    </td>
                </tr>
                <tr>
                    <td width="20%" align="right">
                        վ�����ƣ�
                    </td>
                    <td>
                        <asp:TextBox ID="Name" runat="server" Width="124px" CssClass="input9" />
                        <font color="red">(*)</font><span class="helpstyle" style="cursor: help;" title="����鿴����"
                            onclick="Help('H_FriendLink_0002',this)">����</span>
                    </td>
                </tr>
                <tr>
                    <td width="20%" align="right">
                        �������ͣ�
                    </td>
                    <td>
                        <asp:DropDownList ID="Type" runat="server" CssClass="select1" onchange="Select(this.value)">
                            <asp:ListItem Selected="True" Value="1">����</asp:ListItem>
                            <asp:ListItem Value="0">ͼƬ</asp:ListItem>
                        </asp:DropDownList>
                        <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_FriendLink_0003',this)">
                            ����</span>
                    </td>
                </tr>
                <tr>
                    <td  width="20%" align="right">
                        ���ӵ�ַ��
                    </td>
                    <td>
                        <asp:TextBox ID="Url" runat="server" Width="124px" CssClass="input9" />
                        <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_FriendLink_0004',this)">
                            ����</span>
                    </td>
                </tr>
                <tr>
                    <td width="20%" align="right">
                        վ��˵����
                    </td>
                    <td>
                        <div class="textdiv4"><textarea id="ContentFri" runat="server" style="width: 240px; height: 104px" />
                        <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_FriendLink_0005',this)">
                            ����</span>
                            </div>
                    </td>
                </tr>
                <tr id="Waterpicurl" style="display: none">
                    <td  width="20%" align="right">
                        ͼƬ��ַ��
                    </td>
                    <td>
                        <asp:TextBox ID="PicUrl" runat="server" CssClass="input9" />
                        &nbsp;
                        <label>
                            <img src="../imges/bgxiu_14.gif" alt="ѡ��ͼƬ" style="cursor: pointer;" onclick="selectFile('PicUrl','ͼƬѡ��','pic','500','500')" />
                        </label>
                        <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_FriendLink_0006',this)">
                            ����</span>
                    </td>
                </tr>
                <tr>
                    <td width="20%" align="right">
                        �Ƿ�������
                    </td>
                    <td>
                        <asp:CheckBox ID="Lock" runat="server" CssClass="checkbox2" />
                        <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_FriendLink_0007',this)">
                            ����</span>
                    </td>
                </tr>
                <tr>
                    <td style="width: 257px" colspan="2">
                        <font>��ʾ�߼�ѡ�</font>
                        <asp:CheckBox ID="chkAdvance" runat="server" onclick="DispChange()" />
                        <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_FriendLink_0008',this)">
                            ����</span>
                    </td>
                </tr>
                <tr id="Friend_Link_DisP" style="display: none;">
                    <td colspan="2">
                        <table width="100%" style="border-collapse:collapse;" border="0">
                            <tr>
                                <td width="20%" align="right">
                                    <div align="right">
                                        ǰ̨��Ա���룺</div>
                                </td>
                                <td width="80%" align="left">
                                    <asp:CheckBox ID="IsUser" runat="server" CssClass="checkbox2" />
                                    <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_FriendLink_0009',this)">
                                        ����</span>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" align="right">
                                    <div align="right">
                                        ����������(���)��</div>
                                </td>
                                <td class="list_link">
                                    <asp:TextBox ID="Author" runat="server" Enabled="false" CssClass="input9" />
                                    <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_FriendLink_0010',this)">
                                        ����</span>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" align="right">
                                    <div align="right">
                                        �����˵����ʼ���</div>
                                </td>
                                <td class="list_link">
                                    <asp:TextBox ID="Mail" runat="server" CssClass="input9" />
                                    <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_FriendLink_0011',this)">
                                        ����</span>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" align="right">
                                    <div align="right">
                                        �������ɣ�</div>
                                </td>
                                <td class="list_link">
                                    <div class="textdiv4"><textarea rows="5" id="ContentFor" runat="server" style="width: 240px; height: 104px"/>
                                    <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_FriendLink_0012',this)">
                                        ����</span></div>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" align="right">
                                    <div align="right">
                                        ������ϵ��ʽ��</div>
                                </td>
                                <td class="list_link">
                                    <div class="textdiv4"><textarea rows="5" id="LinkContent" style="width: 240px; height: 104px" runat="server"  />
                                    <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_FriendLink_0013',this)">
                                        ����</span></div>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" align="right">
                                    <div align="right">
                                        �������ڣ�</div>
                                </td>
                                <td class="list_link">
                                    <asp:TextBox ID="Addtime" runat="server" CssClass="input9" />
                                    &nbsp;&nbsp;
                                    <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_FriendLink_0014',this)">
                                        ����</span>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2" class="list_link">
                        <label>
                            
                        </label>
                        &nbsp;&nbsp;
                        <label>
                           
                        </label>
                    </td>
                </tr>
            </table>
            </div>

            <div class="nxb_submit" >
            <input type="submit" name="SaveAl" value=" �� �� " class="xsubmit1" id="SaveLink" runat="server" onserverclick="SaveLink_ServerClick" />
             <input type="reset" name="ClearAl" value=" �� �� " class="xsubmit1" id="CancelLink" runat="server" />
           </div>
            <%
                }
            %>
            <%
                if (type == "edit_link")
                {     
            %>
            <div class="newxiu_base">
            <table  class="nxb_table" id="Table2">
                <tr>
                    <td colspan="2"><font>�޸���������������Ϣ</font></td>
                 </tr>
                <tr>
                    <td width="20%" align="right">
                        ѡ�����
                    </td>
                    <td>
                        <asp:DropDownList ID="Sclass" runat="server" CssClass="select4">
                        </asp:DropDownList>
                        <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_FriendLink_0001',this)">
                            ����</span>
                    </td>
                </tr>
                <tr>
                    <td width="20%" align="right">
                        վ�����ƣ�
                    </td>
                    <td>
                        <asp:TextBox ID="SiteName" runat="server" Width="124px" CssClass="input9" />
                        <font color="red">(*)</font><span class="helpstyle" style="cursor: help;" title="����鿴����"
                            onclick="Help('H_FriendLink_0002',this)">����</span>
                    </td>
                </tr>
                <tr>
                    <td width="20%" align="right">
                        �������ͣ�
                    </td>
                    <td>
                        <asp:DropDownList ID="LinkType" runat="server" CssClass="select1" onchange="SelectE(this.value)">
                            <asp:ListItem Selected="True" Value="1">����</asp:ListItem>
                            <asp:ListItem Value="0">ͼƬ</asp:ListItem>
                        </asp:DropDownList>
                        <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_FriendLink_0003',this)">
                            ����</span>
                    </td>
                </tr>
                <tr>
                    <td width="20%" align="right">
                        ���ӵ�ַ��
                    </td>
                    <td>
                        <asp:TextBox ID="linkUrl" runat="server" Width="124px" CssClass="input9" />
                        <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_FriendLink_0004',this)">
                            ����</span>
                    </td>
                </tr>
                <tr>
                    <td width="20%" align="right">
                        վ��˵����
                    </td>
                    <td>
                        <div class="textdiv4"><textarea id="siteDesc" runat="server" style="width: 240px; height: 104px"  />
                        <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_FriendLink_0005',this)">
                            ����</span></div>
                    </td>
                </tr>
                <tr id="editP" style="display: none">
                    <td width="20%" align="right">
                        ͼƬ��ַ��
                    </td>
                    <td>
                        <asp:TextBox ID="PicUrll" runat="server" CssClass="input9" />
                        &nbsp;
                             <img src="../imges/bgxiu_14.gif" alt="ѡ��ͼƬ" style="cursor: pointer;" onclick="selectFile('PicUrll','ͼƬѡ��','pic','500','500')" />
                        <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_FriendLink_0006',this)">
                            ����</span>
                    </td>
                </tr>
                <tr>
                    <td width="20%" align="right">
                        �Ƿ�������
                    </td>
                    <td>
                        <asp:CheckBox ID="isSuo" runat="server" CssClass="checkbox2"/>
                        <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_FriendLink_0007',this)">
                            ����</span>
                    </td>
                </tr>
                <tr>
                    <td style="width: 257px" colspan="2">
                        <font>��ʾ�߼�ѡ�</font>
                        <asp:CheckBox ID="DisAdv" runat="server" onclick="change()" CssClass="checkbox1" />
                        <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_FriendLink_0008',this)">
                            ����</span>
                    </td>
                </tr>
                <tr id="FriAdvance_Edit" style="display: none;">
                    <td colspan="2" class="list_link">
                        <table width="100%" style="border-collapse:collapse;" border="0">
                            <tr>
                                <td width="20%" align="right">
                                    <div align="right">
                                        ǰ̨��Ա���룺</div>
                                </td>
                                <td align="left">
                                    <asp:CheckBox ID="isUserr" runat="server" CssClass="checkbox2" />
                                    <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_FriendLink_0009',this)">
                                        ����</span>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" align="right">
                                    <div align="right">
                                        ����������(���)��</div>
                                </td>
                                <td>
                                    <asp:TextBox ID="Authorr" runat="server" Enabled="false" CssClass="input9" />
                                    <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_FriendLink_0010',this)">
                                        ����</span>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" align="right">
                                    <div align="right">
                                        �����˵����ʼ���</div>
                                </td>
                                <td>
                                    <asp:TextBox ID="Emaill" runat="server" CssClass="input9" />
                                    <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_FriendLink_0011',this)">
                                        ����</span>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" align="right">
                                    <div align="right">
                                        �������ɣ�</div>
                                </td>
                                <td>
                                    <div class="textdiv4"><textarea rows="5" id="forfor" runat="server" style="width: 240px; height: 104px" />
                                    <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_FriendLink_0012',this)">
                                        ����</span></div>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" align="right">
                                    <div align="right">
                                        ������ϵ��ʽ��</div>
                                </td>
                                <td>
                                    <div class="textdiv4"><textarea rows="5" id="otherl" style="width: 240px; height: 104px" runat="server"  />
                                    <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_FriendLink_0013',this)">
                                        ����</span></div>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" align="right">
                                    <div align="right">
                                        �������ڣ�</div>
                                </td>
                                <td>
                                    <asp:TextBox ID="datetime" runat="server" CssClass="input9" />
                                    &nbsp;&nbsp;
                                    
                                    <span class="helpstyle" style="cursor: help;" title="����鿴����" onclick="Help('H_FriendLink_0014',this)">
                                        ����</span>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <div class="nxb_submit" >
            <input type="submit" name="SaveAle" value=" �� �� " class="xsubmit1" id="EditFriend" runat="server" onserverclick="EditFriend_ServerClick" />
            <input type="reset" name="ClearAle" value=" �� �� " class="xsubmit1" id="EditFriendc" runat="server" />
           </div>
            </div>
            <%
                }
            %>
            </div>
        </div>
    </div>
    </form>
</body>
<script language="javascript">
    $(function () {
        $("#Addtime").datepicker({changeMonth: true,changeYear: true});
        $("#datetime").datepicker({changeMonth: true,changeYear: true});
    });    
    //�߼�ѡ��
    function DispChange() {
        var objadd = document.getElementById("chkAdvance").checked;
        if (objadd) {
            document.getElementById("Friend_Link_DisP").style.display = "";
        }
        else {
            document.getElementById("Friend_Link_DisP").style.display = "none";
        }
    }
    function change() {
        var objedit = document.getElementById("DisAdv").checked;
        if (objedit) {
            document.getElementById("FriAdvance_Edit").style.display = "";
        }
        else {
            document.getElementById("FriAdvance_Edit").style.display = "none";
        }
    }
    function Select(value) {
        switch (parseInt(value)) {
            case 1:
                document.getElementById("Waterpicurl").style.display = "none";
                break;
            case 0:
                document.getElementById("Waterpicurl").style.display = "";
                break;
        }
    }
    function SelectE(value) {
        switch (parseInt(value)) {
            case 1:
                document.getElementById("editP").style.display = "none";
                break;
            case 0:
                document.getElementById("editP").style.display = "";
                break;
        }
    }

    function GetPY1(obj) {
        if (document.getElementById('ClassCName').value != "") {
            document.getElementById('ClassEName').value = GetPY(obj.value);
        }
    }
</script>
</html>
