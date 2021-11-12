<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreeLabelAddEnd.aspx.cs" Inherits="YSCMS.PageView.Manage.Label.FreeLabelAddEnd" %>
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
    <script type="text/javascript">
        function comeform(loca_name, loca_itemname, loca_fieldname) {
            this.loca_name = loca_name;
            this.loca_itemname = loca_itemname;
            this.loca_fieldname = loca_fieldname;
        }
    </script>
    <script language="javascript" type="text/javascript">
        var start = 0;

        var end = 0;
        function savePos(textBox) {

            //�����Firefox(1.5)�Ļ��������ܼ�

            if (typeof (textBox.selectionStart) == "number") {

                start = textBox.selectionStart;

                end = textBox.selectionEnd;
            }
                //������IE(6.0)�ķ������鷳�úܣ���Ҫ������'\n'

            else if (document.selection) {

                var range = document.selection.createRange();

                if (range.parentElement().id == textBox.id) {

                    // create a selection of the whole textarea

                    var range_all = document.body.createTextRange();

                    range_all.moveToElementText(textBox);

                    //����range��һ�����Ѿ�ѡ���text(range)��һ��������textarea(range_all)

                    //range_all.compareEndPoints()�Ƚ������˵㣬���range_all��range������(further to the left)���� //����С��0��ֵ����range_all������һ�㣬ֱ������range��start��ͬ��

                    // calculate selection start point by moving beginning of range_all to beginning of range

                    for (start = 0; range_all.compareEndPoints("StartToStart", range) < 0; start++)

                        range_all.moveStart('character', 1);

                    // get number of line breaks from textarea start to selection start and add them to start

                    // ����һ��\n

                    for (var i = 0; i <= start; i++) {

                        if (textBox.value.charAt(i) == '\n')

                            start++;

                    }
                    // create a selection of the whole textarea

                    var range_all = document.body.createTextRange();

                    range_all.moveToElementText(textBox);

                    // calculate selection end point by moving beginning of range_all to end of range

                    for (end = 0; range_all.compareEndPoints('StartToEnd', range) < 0; end++)

                        range_all.moveStart('character', 1);

                    // get number of line breaks from textarea start to selection end and add them to end

                    for (var i = 0; i <= end; i++) {

                        if (textBox.value.charAt(i) == '\n')

                            end++;

                    }

                }

            }
        }

        function setCaret() {
            if (this.createTextRange) {
                this.caretPos = document.selection.createRange().duplicate();
            }
        }
        var contenttb = jQuery("#EdtContent");
        contenttb.onclick = setCaret;
        contenttb.onselect = setCaret;
        contenttb.onkeyup = setCaret;

        function AddTag(textFeildValue) {
            var textBox = document.getElementById("EdtContent"); //����ID��ö���
            var pre = textBox.value.substr(0, start);

            var post = textBox.value.substr(end);

            textBox.value = pre + textFeildValue + post;
        }
        function AddDate() {
            var str = $.trim(document.getElementById('TxtDateStyle').value);
            if (str != '') {
                str = '[$' + str + '$]'
                AddTag(str);
            }
        }
    </script>
</head>
<body>
    <form id="Form1" runat="server">
    <div  class="mian_body">
      <div class="mian_wei">
   <div class="mian_wei_min">
      <div class="mian_wei_left"><h3>���ɱ�ǩSQL������</h3></div>
      <div class="mian_wei_right">
          ������<a href="javascript:openmain('../main.aspx')">��ҳ</a>>><a href="FreeLabelList.aspx">���ɱ�ǩ</a>>><asp:Label ID="LblCaption" runat="server" Text="������ɱ�ǩ"></asp:Label>
      </div>
   </div>
</div>
      <div class="lanlie">
         <ul>
            <li><a class="topnavichar" href="javascript:history.back();" id="PreSteps" runat="server">
                        ��һ��</a>��</li>
            <li><asp:LinkButton CssClass="topnavichar" ID="LnkBtnSave" runat="server" OnClick="LnkBtnSave_Click">����</asp:LinkButton>��</li>
            <li><asp:LinkButton CssClass="topnavichar" ID="reviewBtn" runat="server" OnClick="reviewBtn_Click">Ԥ��</asp:LinkButton></li>
         </ul>
      </div>
        <div runat="server" id="review">
        </div>
       <div class="lanlie_lie">
         <div class="newxiu_base">
        <table width="98%" cellpadding="5" cellspacing="1" align="center" class="nxb_table">
            <tr>
                <td align="right" width="15%">
                    ��ǩ���ƣ�
                </td>
                <td width="85%">
                    <asp:TextBox runat="server" Width="200" ID="TxtLabelName" CssClass="input8"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ǩ˵����
                </td>
                <td>
                    <asp:TextBox runat="server" Width="200" ID="TxtDescrpt" CssClass="select5" TextMode="MultiLine"
                        MaxLength="200"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �Զ��壺
                </td>
                <td>
                    <input type="button" value="ѭ������" onclick="javascript: AddTag('{# ��Ҫ�ӵ����� #}')" class="xsubmit1" />
                    <input type="button" value="��ѭ������" onclick="javascript: AddTag('{*��¼��� ��Ҫ�ӵ����� *}')" class="xsubmit3" />
                    <input type="button" value="����" onclick="javascript: AddTag('(#��������#)')" class="xsubmit1" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    �����ֶΣ�
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="DdlField1" onchange="AddTag(this.options[this.selectedIndex].value)" CssClass="select5">
                        <asp:ListItem Value="">��ѡ���ֶ�</asp:ListItem>
                    </asp:DropDownList>
                    ��
                    <asp:DropDownList runat="server" ID="DdlField2" onchange="AddTag(this.options[this.selectedIndex].value)" CssClass="select5">
                        <asp:ListItem Value="">��ѡ���ֶ�</asp:ListItem>
                    </asp:DropDownList>
                    <span style="color: Red">���ű�ź�������Ŀ��Ż��Զ��滻Ϊ����</span>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ������ʽ��
                </td>
                <td>
                    <asp:TextBox runat="server" ID="TxtDateStyle" Text="YY02��MM��DD��" CssClass="select5"
                        MaxLength="200"></asp:TextBox>
                    <input type="button" value=" ���� " onclick="AddDate()" class="xsubmit1" />
                    <span style="color: Red">��Ҫѡ��ʱ���ֶΣ���ʽ��˵�� 2</span>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ǩ���ݣ�
                </td>
                <td>
                    <span style="color: Red">��HTML�������ѡ���ֶΡ��Զ��庯����ɣ����������ѯ��¼����ʾ��ʽ</span>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <textarea rows="15" cols="100" style="width: 99%;" onkeydown="savePos(this)" onkeyup="savePos(this)"
                        onmousedown="savePos(this)" onmouseup="savePos(this)" onfocus="savePos(this)"
                        name="EdtContent" runat="server" id="EdtContent"></textarea>
                </td>
            </tr>
        </table>
          </div>
        </div>
        <div style="color: Red">
            <p>˵  ����</p>
            <p>
                1.Ԥ�����ֶ���Ҫѡ����Զ�Ӧ��š����������·����Ҫѡ�����ű�ţ���Ŀ���·����Ҫѡ����Ŀ���(ע�⣺�����ű�ţ����Ǳ��)��</p>
            <p>
                2.���ڸ�ʽ:YY02����2λ�����(��13��ʾ2013��),YY04��ʾ4λ�������(2013)��MM�����£�DD�����գ�HH����Сʱ��MI����֣�SS�����롣</p>
            <p>
                3.�Զ��庯����ѭ������{#...#}����ѭ������{*n...*}(n>0)�����¼��š�����(#...#)����(#Left([*NewsTitle*],20)#)
            </p>
        </div>
        <br />
        <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg"
            style="height: 76px">
            <tr>
                <td align="center">
                    <%Response.Write(this.CopyRight);%>
                </td>
            </tr>
        </table>
    </div>
    <asp:HiddenField ID="HidID" runat="server" />
    <asp:HiddenField ID="HidName" runat="server" />
    <asp:HiddenField ID="HidSQL" runat="server" />
    </form>
</body>
</html>
