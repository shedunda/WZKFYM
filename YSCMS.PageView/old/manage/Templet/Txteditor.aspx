<%@ Page Language="C#" AutoEventWireup="true" validateRequest="false" Inherits="Txteditor" ResponseEncoding="utf-8" CodeBehind="Txteditor.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="/CSS/base.css"/>
    <link rel="stylesheet" type="text/css" href="/CSS/style.css"/>
    <link rel="stylesheet" type="text/css" href="/CSS/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/blue.css"/>
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/public.js" type="text/javascript"></script>
    <link href="/CSS/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery-ui-1.10.2.custom.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.bgiframe.js" type="text/javascript"></script>
    <script src="/Scripts/SelectAction.js" type="text/javascript"></script>
</head>
<body>
	<form id="fromeditor" runat="server" method="post" action="">
    <div class="mian_body">
    <div class="mian_wei">
   <div class="mian_wei_min">
      <div class="mian_wei_left"><h3>�ı��༭ </h3></div>
      <div class="mian_wei_right">
          ������<a href="javascript:openmain('../main.aspx')">��ҳ</a>&gt;&gt;<a href="TempletManageList.aspx">ģ�����</a>&gt;&gt;�ı��༭<asp:TextBox ID="FilePath" runat="server" Visible="False"></asp:TextBox>
      </div>
   </div>
  <!-- <div class="../mian_wei_2"><img src="../imges/lie_12.gif" alt="" /></div>-->
</div>
<div class="mian_cont">
   <div class="nwelie">
      <div class="lanlie_lie">
         <div class="newxiu_base">
           <table class="nxb_table">
             <tr>
               <td>
                  <div class="mo_bj">
                  <span>����ҳ���ǩ��</span>
                  <asp:DropDownList ID="LabelList1" runat="server" class="select2">
						<asp:ListItem Value="">=��ҳ���ǩ=</asp:ListItem>
						<asp:ListItem Value="{#Page_Title}">ҳ�����</asp:ListItem>
						<asp:ListItem Value="{#Page_MetaKey}">meta�ؼ���</asp:ListItem>
						<asp:ListItem Value="{#Page_MetaDesc}">meta����</asp:ListItem>
						<asp:ListItem Value="{#Page_Split}">���ݷ�ҳ</asp:ListItem>
						<asp:ListItem Value="{#Page_Content}">����</asp:ListItem>
						<asp:ListItem Value="{#Page_Navi}">����</asp:ListItem>
					</asp:DropDownList>
					<input id="Button1" class="insubt1"  type="button" value="����" onclick="javascript:getValue(document.fromeditor.LabelList1.value);" />
					<select id="history" class="select2">
						<option value="">=�鵵ҳ���ǩ=</option>
						<optgroup label="�б��ǩ">
							<option value="{#history_list}">�б�</option>
							<option value="{#history_PageTitle}">ҳ�����</option>
						</optgroup>
						<optgroup label="����ҳ��ǩ">
							<option value="{#history_PageTitle}">���ݱ���</option>
							<option value="{#history_PageAuthor}">����</option>
							<option value="{#history_PageSouce}">��Դ</option>
							<option value="{#history_PageContent}">����</option>
							<option value="{#history_PageCreatTime}">����ʱ��</option>
						</optgroup>
					</select>
					<input id="Button3" class="insubt1"  type="button" value="����" onclick="javascript:getValue(document.fromeditor.history.value);" />
					<asp:DropDownList ID="Search1" runat="server" CssClass="mselect5">
						<asp:ListItem Value="">=����ҳ���ǩ=</asp:ListItem>
						<asp:ListItem Value="{#Page_SearchContent}">�б�(����/����)</asp:ListItem>
						<asp:ListItem Value="{#Page_SearchPages}">��ҳ</asp:ListItem>
					</asp:DropDownList>
					<input id="Button4" class="insubt1"  type="button" value="����" onclick="javascript:getValue(document.fromeditor.Search1.value);" />
					<asp:DropDownList ID="Comm1" runat="server" CssClass="mselect5">
						<asp:ListItem Value="">=����ҳ���ǩ=</asp:ListItem>
						<asp:ListItem Value="{#Page_CommTitle}">��������[ͨ��]</asp:ListItem>
						<asp:ListItem Value="{#Page_Commidea}">��ʾ�۵�ͳ��[ͨ��]</asp:ListItem>
						<asp:ListItem Value="{#Page_CommPages}">��ҳ[ͨ��]</asp:ListItem>
						<asp:ListItem Value="{#Page_CommStat}">��������ͳ��[ͨ��]</asp:ListItem>
						<asp:ListItem Value="{#Page_PageTitle}">����ҳ�����[���۶����б�]</asp:ListItem>
						<asp:ListItem Value="{#Page_PostComm}">��������[���۶����б�]</asp:ListItem>
						<asp:ListItem Value="{#Page_NewsURL}">��������[���۶����б�]</asp:ListItem>
					</asp:DropDownList>
					<input id="Button5" class="insubt1"  type="button" value="����" onclick="javascript:getValue(document.fromeditor.Comm1.value);" />                    
                  </div>
                  <div class="mo_bj">
                  <asp:DropDownList ID="LabelList" runat="server" CssClass="mselect5">
						</asp:DropDownList>
						<input id="sbutton1" class="insubt1" type="button" value="����" onclick="javascript:getValue(document.fromeditor.LabelList.value);" />
						<input id="sbutton2" class="xsubmit6" type="button" value="ϵͳ��ǩ(����)" onclick="javascript:selectFile('FileContent','ϵͳ��ǩ','Label1',500,500)" />
						<input id="sbutton3" class="xsubmit8" type="button" value="��̬��Ŀ/ר���ǩ(����)" onclick="javascript:selectFile('FileContent','��̬��Ŀ/ר���ǩ','Labelm',800,500)" />
						<input id="sbutton4" class="xsubmit6" style="color: Red;" type="button" value="�Զ����ǩ" onclick="javascript:selectFile('FileContent','�Զ����ǩ','Label',600,500)" />
						<input id="sbutton5" class="xsubmit6" type="button" value="ѡ�����ɱ�ǩ" onclick="javascript:selectFile('FileContent','�Զ����ǩ','freeLabel',600,500)" />
                        <asp:DropDownList ID="classlist" runat="server">
                    <asp:ListItem Value="">=�ռ��б��ҳ[ѡ��]=</asp:ListItem>
                    <asp:ListItem Value="{PageLists}">��ҳ�ڲ���λ����ʾ</asp:ListItem>
                    </asp:DropDownList>
                    <input id="Button8" style="width: 35px;" type="button" value="����" onclick="javascript:getValue(document.fromeditor.classlist.value);" />
       </div>
                  <div class="mo_bj">
                  <asp:Button ID="Button6" runat="server" Text="����ģ��" OnClick="Button2_Click" class="xsubmit5" />
				<input type="button" name="Submit" value=" �� �� " class="xsubmit5" onclick="javascript:UnDo();" />
				<span id="dirPath" runat="server"></span>
                  </div>
                  <div class="mo_bi">
                    <asp:TextBox ID="FileContent" runat="server" Width="98%" Height="350px" TextMode="MultiLine"></asp:TextBox><div id="test" runat="server">
                  </div>
                  <div class="mo_bi">
                     վ��Ŀ¼��{$InstallDir}   ģ��·����{@dirTemplet} ������ֱ����ģ���в���˱�ǩ�������ͼƬ��<br />
                     �Զ����ǩ��ʽ��{FS_xx}<br />
                     (����)ϵͳ��ǩ��{FS_S_xx}<br />
                     (����)��̬��Ŀ��ǩ��{FS_Class*_xx}(����������)��{FS_Class*C_xx}(��������)��xxΪ��Ŀ��ClassID<br />
                     (����)��̬ר���ǩ��{FS_Special*_xx}��xxΪר���SpecialID<br />
                     ���ɱ�ǩ��{FS_FREE_xx}<br />
                     <span>�ر�ע�⣺��ǩ�ϸ����ִ�Сд</span>
                  </div>
                  <div class="mo_bj">
                  <asp:Button ID="Button2" runat="server" Text="����ģ��" OnClick="Button2_Click" class="xsubmit2" />
				<input type="button" name="Submit" value=" �� �� " onclick="javascript:UnDo();" class="xsubmit2" />
				&nbsp;&nbsp;<a style="color: Red;" onclick="{if(confirm('ȷ��Ҫ�л������߱༭��?�����л�ǰ�ȱ����������ݣ�����ᶪʧ!\nȷ���л���')){return true;}return false;}" href="TempletEditor.aspx?dir=<%Response.Write(dir); %>&filename=<%Response.Write(filename); %>">�л������߱༭��</a>
                  </div>
               </td>
             </tr>
           </table>
         </div>
      </div>
   </div>
</div>
    </div>
    <div id="dialog-message" title="��ʾ"></div>
	</form>
</body>
<script language="javascript" type="text/javascript">

	function UnDo() {
		if (confirm('��ȷ��Ҫȡ�������ĸ�����?')) {
			document.fromeditor.reset();
		}
	}
	function getValue(value) {
		if (value != "")
		    Insert(value);
}

function Insert(str) {
    var obj = document.getElementById('FileContent');
    if (document.selection) {
        obj.focus();
        var sel = document.selection.createRange();
        document.selection.empty();
        sel.text = str;
    } else {
        var prefix, main, suffix;
        prefix = obj.value.substring(0, obj.selectionStart);
        main = obj.value.substring(obj.selectionStart, obj.selectionEnd);
        suffix = obj.value.substring(obj.selectionEnd);
        obj.value = prefix + str + suffix;
    }
    obj.focus();
} 
</script>
</html>
