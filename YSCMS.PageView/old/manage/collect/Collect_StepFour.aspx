<%@ Page Language="C#" AutoEventWireup="true" Inherits="Collect_StepFour" Codebehind="Collect_StepFour.aspx.cs" validateRequest="false" %>

<%@ Register Src="CollectEditor.ascx" TagName="CollectEditor" TagPrefix="uc1" %>
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
        function ChangeSet(obj) {
        var td2=jQuery(obj).parent().next();
        if (obj.checked) {
            jQuery(td2).children().first().hide();
            jQuery(td2).children().last().show();
        }
        else {
            jQuery(td2).children().first().show();
            jQuery(td2).children().last().hide();

        }
    }
    function ChangePage()
    {
        var flag;
        if(document.getElementById('RadPageNone').checked)
            flag = 0;
        else if(document.getElementById('RadPageOther').checked)
            flag = 1;
        else if(document.getElementById('RadPageCode').checked)
            flag = 2;
        var tr1 = document.getElementById("Tr_PageOther");
        var tr2 = document.getElementById("Tr_PageCode");
        switch(flag)
        {
            case 0:
                tr1.style.display = 'none';
                tr2.style.display = 'none';
                break;
            case 1:
                tr1.style.display = '';
                tr2.style.display = 'none';
                break;
            case 2:
                tr1.style.display = 'none';
                tr2.style.display = '';
                break;
        }
    }
    function ChangeDiv(ID)
    {
	    document.getElementById('td_baseinfo').className='m_up_bg';
	    document.getElementById('td_preview').className='m_up_bg';
        document.getElementById('tr_baseinfo').style.display='none';
        document.getElementById('tr_preview').style.display='none';
        document.getElementById('td_'+ ID).className='m_down_bg';
        document.getElementById('tr_'+ ID).style.display='';
	}
	function ChangeUrl(obj)
	{
	    var url = obj.options[obj.selectedIndex].value;
	    var frm = document.getElementById("PreviewArea");
	    frm.src = url;
    }
	function StepBack()
	{
	    location.href = "Collect_StepThree.aspx?ID="+ document.getElementById("HidSiteID").value;
	}
	function LoadMe(flag)
	{
	    ChangeDiv('baseinfo');
        ChangeSet(document.getElementById('ChbAuthor'));
        ChangeSet(document.getElementById('ChbSource'));
        ChangeSet(document.getElementById('ChbTime'));
        ChangePage();
    }
    //-->
    </script>

</head>
<body onload="LoadMe(Math.random())">
    <form id="Form2" runat="server">
    <div class="mian_body">
        <div class="mian_wei">
            <!--<div class="mian_wei_1"><img src="imges/lie_10.gif" alt="" /></div>-->
           <div class="mian_wei_min">
              <div class="mian_wei_left"><h3>�ɼ�ϵͳ</h3></div>
              <div class="mian_wei_right">
                  ������<a href="javascript:openmain('../main.aspx')">��ҳ</a>>><a href="Collect_List.aspx" target="sys_main">վ������</a> >>������  
              </div>
           </div>
           <!--<div class="mian_wei_2"><img src="imges/lie_12.gif" alt="" /></div>-->
        </div>
        <div class="mian_cont">
            <div class="nwelie">
                <div class="jslie_lan">
                    <span>���ܣ�</span><a href="Collect_List.aspx" class="list_link">վ���б�</a>&nbsp;��&nbsp;<a class="topnavichar"
                            href="Collect_RuleList.aspx">�ؼ��ֹ���</a>&nbsp;��&nbsp;<a class="topnavichar" href="Collect_News.aspx">���Ŵ���</a>
                  </div>
                  <div class="lanlie_lie">
                    <div class="newxiu_base">
            <table class="nxb_table">
                <tr>
                    <td width="50%" class="m_down_bg" id="td_baseinfo" onclick="javascript:ChangeDiv('baseinfo');"
                        style="cursor: hand;" align="center">
                        ��������</td>
                    <td width="50%" class="m_up_bg" id="td_preview" onclick="javascript:ChangeDiv('preview');"
                        style="cursor: hand;" align="center">
                        Ԥ��</td>
                </tr>
                <tr id="tr_baseinfo">
                    <td colspan="3" valign="top" class="list_link">
                        <table width="100%" align="center" cellpadding="5" cellspacing="1" style="border-collapse:collapse; border:none;">
                            <tr>
                                <td width="15%" align="right">
                                    ���⣺
                                </td>
                                <td>
                                    <div style=" margin-bottom:10px; float:left; width:100%;"><uc1:CollectEditor ID="EdtCaption" runat="server" /></div>
                                </td>
                            </tr>
                            <tr>
                                <td width="15%" align="right">
                                    ���ݣ�
                                </td>
                                <td>
                                    <div style=" margin-bottom:10px; float:left; width:100%;"><uc1:CollectEditor ID="EdtContent" runat="server" /></div>
                                </td>
                            </tr>
                            <tr>
                                <td width="15%" align="right">
                                    ���ߣ�<br />
                                    <span class="span1">�ֶ�<asp:CheckBox runat="server" ID="ChbAuthor" onclick="ChangeSet(this)" /></span>
                                </td>
                                <td>
                                    <div>
                                        <uc1:CollectEditor ID="EdtAuthor" Text="[����]" runat="server" />
                                    </div>
                                    <div style="margin:10px; display:inline;">
                                        <asp:TextBox runat="server" ID="TxtAuthor" MaxLength="100" CssClass="input8" /></div>
                                </td>
                            </tr>
                            <tr>
                                <td width="15%" align="right">
                                    ��Դ��<br />
                                    <span class="span1">�ֶ�<asp:CheckBox runat="server" ID="ChbSource" onclick="ChangeSet(this)" /></span>
                                </td>
                                <td>
                                    <div>
                                        <uc1:CollectEditor Text="[����]" ID="EdtSource" runat="server" />
                                    </div>
                                    <div  style="margin:10px; display:inline;">
                                        <asp:TextBox runat="server" ID="TxtSource"  MaxLength="100" CssClass="input8" /></div>
                                </td>
                            </tr>
                            <tr>
                                <td width="15%" align="right">
                                    ʱ�䣺<br />
                                    <span class="span1">�ֶ�<asp:CheckBox runat="server" ID="ChbTime" onclick="ChangeSet(this)" /></span>
                                </td>
                                <td>
                                    <div>
                                        <uc1:CollectEditor Text="[����]" ID="EdtTime" runat="server" />
                                    </div>
                                    <div style="margin:10px; display:inline;">
                                        <asp:TextBox runat="server" ID="TxtTime"  MaxLength="25" CssClass="input8" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="list_link" align="center">
                                    ��ҳ��ʽ��</td>
                                <td class="list_link">
                                    <asp:RadioButton CssClass="radio" runat="server" Checked="true" onclick="ChangePage()" ID="RadPageNone" GroupName="RadGroupPage"
                                        Text="���������ŷ�ҳ" />
                                    <asp:RadioButton runat="server" onclick="ChangePage()" ID="RadPageOther" GroupName="RadGroupPage" CssClass="radio"
                                        Text="�ݹ��ҳ����" />
                                    <asp:RadioButton runat="server" onclick="ChangePage()" ID="RadPageCode" GroupName="RadGroupPage" CssClass="radio"
                                        Text="��ҳ��ȡ��ҳ����" />
                                </td>
                            </tr>
                            <tr runat="server" id="Tr_PageOther">
                                <td width="15%" align="right">
                                    �ݹ��ҳ���ã�
                                </td>
                                <td>
                                    <uc1:CollectEditor ID="EdtPageOther" runat="server" />
                                    <br />
                                    <span style="color: red;">��:&lt;a href="[��ҳ����]"&gt;��һҳ Ҫ��:��һҳ,����Ϊ����ҳ����Ψһ�ַ�,ֻ�е�һ��"[��ҳ����]"��Ч��</span>
                                </td>
                            </tr>
                            <tr runat="server" id="Tr_PageCode">
                                <td width="15%" align="right">
                                    ��ҳ��ȡ��ҳ���ã�
                                </td>
                                <td>
                                    <uc1:CollectEditor ID="EdtPageRule" runat="server" />
                                    <br />
                                    <span style="color: red;">��:&lt;a href="[��ҳ����]"&gt;[����]&lt;/a&gt; Ҫ�� [��ҳ����] ǰ�ַ�������Ϊ����ҳ����Ψһ����</span>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="tr_preview">
                    <td colspan="3" valign="top">
                        <table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" style="border-collapse:collapse;border:none;">
                            <tr class="TR_BG">
                                <td class="sys_topBg" align="center">
                                    <b>�ɼ�����ҳ��ַ��</b>
                                </td>
                            </tr>
                            <tr>
                                <td class="list_link" align="center">
                                    <asp:DropDownList runat="server" onchange="ChangeUrl(this)" ID="DdlObtUrl" Style="width: 770px; margin:8px 0;"
                                        CssClass="input8" />
                                </td>
                            </tr>
                            <tr class="TR_BG">
                                <td class="sys_topBg" align="center">
                                    <b>���</b>
                                </td>
                            </tr>
                            <tr>
                                <td class="list_link" align="center">
                                    <iframe frameborder="1" src="about:blank" id="PreviewArea" name="PreviewArea" marginheight="1"
                                        marginwidth="1" style="width: 770px; height: 371px; margin:10px;" scrolling="yes" class="input8">
                                    </iframe>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="list_link" align="center" colspan="3">
                        
                    </td>
                </tr>
            </table>
                        <div class="nxb_submit" >
                            <asp:HiddenField ID="HidSiteID" runat="server" />
                        <input type="button" value="��һ��" class="xsubmit1" onclick="StepBack()" />
                        <asp:Button runat="server" ID="BtnNext" Text="��һ��" CssClass="xsubmit1" OnClick="BtnNext_Click" />
                       </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
