<%@ Page Language="C#" AutoEventWireup="true" Inherits="Collect_StepThree" Codebehind="Collect_StepThree.aspx.cs" validateRequest="false" %>
<%@ Register Src="CollectEditor.ascx" TagName="CollectEditor" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>FoosunCMS For .NET v1.0.0</title>
    <link rel="stylesheet" type="text/css" href="/CSS/base.css" />
    <link rel="stylesheet" type="text/css" href="/CSS/style.css" />
    <link rel="stylesheet" type="text/css" href="/CSS/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/blue.css" />
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/public.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
    function StepBack()
	{
	    location.href = "Collect_StepTwo.aspx?ID="+ document.getElementById("HidSiteID").value;
	}
    </script>

</head>
<body>
    <form id="Form2" runat="server">
    <div class="mian_body">
<div class="mian_wei">
    <!--<div class="mian_wei_1"><img src="imges/lie_10.gif" alt="" /></div>-->
   <div class="mian_wei_min">
      <div class="mian_wei_left"><h3>�ɼ�ϵͳ</h3></div>
      <div class="mian_wei_right">
          ������<a href="javascript:openmain('../main.aspx')">��ҳ</a>>><a href="Collect_List.aspx">վ������</a> >>������ 
      </div>
   </div>
   <!--<div class="mian_wei_2"><img src="imges/lie_12.gif" alt="" /></div>-->
</div>
<div class="mian_cont">
   <div class="nwelie">
      <div class="jslie_lan">
        <span>���ܣ�</span><a href="Collect_List.aspx" class="list_link">վ���б�</a>&nbsp;��&nbsp;<a class="topnavichar" href="Collect_RuleList.aspx">�ؼ��ֹ���</a>&nbsp;��&nbsp;<a class="topnavichar" href="Collect_News.aspx">���Ŵ���</a>
      </div>
      <div class="lanlie_lie">
         <div class="newxiu_base">
           <table class="nxb_table">
             <tr>
               <td width="15%" align="right">�б�URL��</td>
                <td>
                    <div style=" margin-bottom:10px; float:left; width:100%;"><uc1:CollectEditor ID="EdtListURL" runat="server"/></div>
               </td>
             </tr>
             <tr>
                <td width="15%" align="right">���룺</td>
                <td>
                   <asp:TextBox runat="server" ReadOnly="true" ID="TxtContentCode" TextMode="MultiLine"
                            Height="271" Style="width: 770px; height: 130px" CssClass="textarea4" />
                </td>
             </tr>
             <tr>
               <td width="15%" align="right">�����</td>
                <td>
                    <iframe frameborder="1" src="about:blank" id="PreviewArea" name="PreviewArea" marginheight="1" marginwidth="1" style="width: 770px; height: 150px; line-height:20px;" scrolling="yes" class="textarea4">
                        </iframe>
                        <script language="javascript" type="text/javascript">
                            var txtarea = document.getElementById("TxtContentCode");
                            window.frames["PreviewArea"].document.write(unescape(txtarea.value));
                        </script>
               </td>
             </tr>
             
           </table>
           <div class="nxb_submit" >
            <asp:HiddenField ID="HidSiteID" runat="server" />
                        <asp:HiddenField ID="HidUrl" runat="server" />
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
