<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateLabelOther.aspx.cs" Inherits="YSCMS.PageView.Configuration.system.CreateLabelOther" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
<link rel="stylesheet" type="text/css" href="/CSS/base.css"/>
<link rel="stylesheet" type="text/css" href="/CSS/style.css"/>
<link rel="stylesheet" type="text/css" href="/CSS/<%Response.Write(YSCMS.Config.UIConfig.CssPath());%>/css/blue.css"/>
<script src="/Scripts/jquery.js" type="text/javascript"></script>
<script src="/Scripts/SelectAction.js" type="text/javascript"></script>
<link href="/CSS/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css" />
<script src="/Scripts/jquery-ui-1.10.2.custom.min.js" type="text/javascript"></script>
<script src="/Scripts/jquery.bgiframe.js" type="text/javascript"></script>
</head>
<body>
<div id="dialog-message" title="提示"></div>
  <form id="ListLabel" runat="server">
   <div class="newxiu_base">
       <table class="nxb_table">
        <tr>
            <td align="right" style="width: 28%">
                标签类型：
            </td>
            <td width="79%" align="left">
                <asp:DropDownList ID="LabelType" runat="server" class="select5" onchange="javascript:selectLabelType(this.value);">
                    <asp:ListItem Value="">请选择标签类型</asp:ListItem>
                    <asp:ListItem Value="frindlink">友情链接</asp:ListItem>
                    <asp:ListItem Value="freeJS">自由JS</asp:ListItem>
                    <asp:ListItem Value="sysJS">系统JS</asp:ListItem>
                    <asp:ListItem Value="adJS">广告JS</asp:ListItem>
                    <asp:ListItem Value="statJS">统计JS</asp:ListItem>
                    <asp:ListItem Value="surveyJS">调查JS</asp:ListItem>
                    <asp:ListItem Value="OtherJS">其它JS</asp:ListItem>
                </asp:DropDownList>
                <span id="spanLabelType"></span>
            </td>
        </tr>
        <tr id="TrfreeLabel" style="display: none;">
            <td align="right" style="width: 28%">
                自由标签：
            </td>
            <td width="79%" align="left">
                <asp:DropDownList ID="freeLabelID" runat="server" class="select5">
                </asp:DropDownList>
                <span id="spanfreeLabel"></span>
            </td>
        </tr>
        <tr id="TrfreeJS" style="display: none;">
            <td align="right" style="width: 28%">
                自由JS编号：
            </td>
            <td width="79%" align="left">
                <asp:DropDownList ID="freeJSID" runat="server" class="select5">
                </asp:DropDownList>
                <span id="spanfreeJS"></span>
            </td>
        </tr>
        <tr id="TrsysJS" style="display: none;">
            <td align="right" style="width: 28%">
                系统JS编号：
            </td>
            <td width="79%" align="left">
                <asp:DropDownList ID="sysJSID" runat="server" class="select5">
                </asp:DropDownList>
                <span id="spansysJS"></span>
            </td>
        </tr>
        <tr id="TradJS" style="display: none;">
            <td align="right" style="width: 28%">
                广告JS编号：
            </td>
            <td width="79%" align="left">
                <asp:DropDownList ID="adJSID" runat="server" class="select5">
                </asp:DropDownList>
                <span id="spanadJS"></span>
            </td>
        </tr>
        <tr id="TrsurveyJS" style="display: none;">
            <td align="right" style="width: 28%">
                调查JS编号：
            </td>
            <td width="79%" align="left">
                <asp:RadioButton ID="rdb1" runat="server" Checked="True" GroupName="1" class="checkbox2" />多主题投票<asp:RadioButton ID="rdb2" runat="server"  GroupName="1" class="checkbox2" />多步投票
                    <br/>
                <asp:DropDownList ID="surveyJSID" runat="server" class="select5" Height="100px" multiple>
                </asp:DropDownList>
                 <asp:DropDownList ID="surveyJSID1" runat="server" class="select5" style="display: none;"></asp:DropDownList>
                <span id="spansurveyJS"></span>
            </td>
        </tr>
        <tr id="TrShowtype" style="display: none;">
            <td align="right" style="width: 28%">
                统计表现形式：
            </td>
            <td width="79%" align="left">
                <asp:DropDownList ID="statShowType" runat="server" class="select5">
                    <asp:ListItem Value="2">图标统计样式</asp:ListItem>
                    <asp:ListItem Value="1">滚动统计样式</asp:ListItem>
                    <asp:ListItem Value="0" Selected="true">文字统计样式</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr id="TrstatJS" style="display: none;">
            <td align="right" style="width: 28%">
                统计JS编号：
            </td>
            <td width="79%" align="left">
                <asp:DropDownList ID="statJSID" runat="server" class="select5">
                </asp:DropDownList>
                <span id="spanstatJS"></span>
            </td>
        </tr>
        <tr id="TrOtherJS" style="display: none;">
            <td align="right" style="width: 28%">
                其它JS编号：
            </td>
            <td width="79%" align="left">
                <asp:DropDownList ID="OtherJSID" runat="server" class="select5">
                    <asp:ListItem Value="">请选择JS</asp:ListItem>
                </asp:DropDownList>
                <span id="spanOtherJS"></span>
            </td>
        </tr>
        <tr style="display: none;" id="selectLinkTypes">
            <td align="right">
                选择类别：
            </td>
            <td align="left">
                <asp:DropDownList ID="SelectClass" runat="server" class="select5">
                </asp:DropDownList>
            </td>
        </tr>
        <tr id="Trfrindlink" style="display: none;">
            <td align="right" style="width: 28%">
                调用数量：
            </td>
            <td width="79%" align="left">
                <asp:TextBox ID="fNumber"  class="input1" runat="server">20</asp:TextBox>
                每行<asp:TextBox class="input1" ID="Cols" runat="server">10</asp:TextBox>个
                div+css，请在前台CSS中设置
            </td>
        </tr>
        <tr id="TrTarget" style="display: none;">
            <td align="right" style="width: 28%">
                类型：
            </td>
            <td width="79%" align="left">
                <asp:DropDownList ID="fType" runat="server" class="select5">
                    <asp:ListItem Value="1">文字类</asp:ListItem>
                    <asp:ListItem Value="0">图片类</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="isDiv" runat="server" class="select5">
                    <asp:ListItem Value="">输出格式</asp:ListItem>
                    <asp:ListItem Value="true">div(默认)</asp:ListItem>
                    <asp:ListItem Value="false">table</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr id="TrUser" style="display: none;">
            <td align="right" style="width: 28%">
                其他：
            </td>
            <td width="79%" align="left">
                <asp:DropDownList ID="isAdmin" runat="server" class="select5">
                    <asp:ListItem Value="">所有</asp:ListItem>
                    <asp:ListItem Value="0">管理员录入</asp:ListItem>
                    <asp:ListItem Value="1">会员申请</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 28%">
            </td>
            <td width="79%" align="left">
                &nbsp;<input class="form" type="button" value=" 确 定 " onclick="javascript: ReturnDivValue();" />&nbsp;<input
                    class="form" type="button" value=" 关 闭 " onclick="javascript: CloseDiv();" />
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
<script language="javascript" type="text/javascript">
    jQuery(function () {
        jQuery('#rdb1').click(function () {
            jQuery('#surveyJSID').show();
            jQuery('#surveyJSID1').hide();
        });
        jQuery('#rdb2').click(function () {
            jQuery('#surveyJSID').hide();
            jQuery('#surveyJSID1').show();
        });
    });
    function selectLabelType(type) {
        allhide();
        switch (type) {
            case "freeJS":
                document.getElementById("TrfreeJS").style.display = "";
                break;
            case "sysJS":
                document.getElementById("TrsysJS").style.display = "";
                break;
            case "adJS":
                document.getElementById("TradJS").style.display = "";
                break;
            case "surveyJS":
                document.getElementById("TrsurveyJS").style.display = "";
                break;
            case "statJS":
                document.getElementById("TrstatJS").style.display = "";
                document.getElementById("TrShowtype").style.display = "";
                break;
            case "OtherJS":
                document.getElementById("TrOtherJS").style.display = "";
                break;
            case "frindlink":
                document.getElementById("Trfrindlink").style.display = "";
                document.getElementById("TrTarget").style.display = "";
                document.getElementById("TrUser").style.display = "";
                document.getElementById("selectLinkTypes").style.display = "";
        }

    }
    function allhide() {
        document.getElementById("TrfreeJS").style.display = "none";
        document.getElementById("TrsysJS").style.display = "none";
        document.getElementById("TradJS").style.display = "none";
        document.getElementById("TrsurveyJS").style.display = "none";
        document.getElementById("TrstatJS").style.display = "none";
        document.getElementById("TrOtherJS").style.display = "none";
        document.getElementById("TrShowtype").style.display = "none";
        document.getElementById("Trfrindlink").style.display = "none";
        document.getElementById("TrTarget").style.display = "none";
        document.getElementById("TrUser").style.display = "none";
        document.getElementById("selectLinkTypes").style.display = "none";
    }
    function ReturnDivValue() {
        spanClear();
        var CheckStr = true;
        var rvalue = "";
        switch (ListLabel.LabelType.value) {
            case "frindlink":
                rvalue += "[YS:Loop,YS:SiteID=<%Response.Write(APIID); %>,YS:LabelType=";
                rvalue += "Frindlink";
                if (ListLabel.SelectClass.value != "") {
                    rvalue += ",YS:TypeClassID=" + ListLabel.SelectClass.value + "";
                }
                if (ListLabel.fNumber.value != "") {
                    rvalue += ",YS:Number=" + ListLabel.fNumber.value + "";
                }
                if (ListLabel.Cols.value != "") {
                    rvalue += ",YS:Cols=" + ListLabel.Cols.value + "";
                }
                if (ListLabel.fType.value != "") {
                    rvalue += ",YS:FType=" + ListLabel.fType.value + "";
                }
                if (ListLabel.isAdmin.value != "") {
                    rvalue += ",YS:isAdmin=" + ListLabel.isAdmin.value + "";
                }
                if (ListLabel.isDiv.value != "") {
                    rvalue += ",YS:isDiv=" + ListLabel.isDiv.value + "";
                }
                rvalue += "][/YS:Loop]";
                break;
            case "freeJS":
                rvalue += "[YS:unLoop,YS:SiteID=<%Response.Write(APIID); %>,YS:LabelType=";
                if (checkIsNull(ListLabel.freeJSID, document.getElementById("spanfreeJS"), "请选择自由JS"))
                    CheckStr = false;
                rvalue += "freeJS,YS:JSID=" + ListLabel.freeJSID.value + "][/YS:unLoop]";
                break;
            case "sysJS":
                rvalue += "[YS:unLoop,YS:SiteID=<%Response.Write(APIID); %>,YS:LabelType=";
                if (checkIsNull(ListLabel.sysJSID, document.getElementById("spansysJS"), "请选择系统JS"))
                    CheckStr = false;
                rvalue += "sysJS,YS:JSID=" + ListLabel.sysJSID.value + "][/YS:unLoop]";
                break;
            case "adJS":
                rvalue += "[YS:unLoop,YS:SiteID=<%Response.Write(APIID); %>,YS:LabelType=";
                if (checkIsNull(ListLabel.adJSID, document.getElementById("spanadJS"), "请选择广告JS"))
                    CheckStr = false;
                rvalue += "adJS,YS:JSID=" + ListLabel.adJSID.value + "][/YS:unLoop]";
                break;
            case "surveyJS":
                rvalue += "[YS:unLoop,YS:SiteID=<%Response.Write(APIID); %>,YS:LabelType=";
                var list = "";
                if (document.getElementById("rdb1").checked) {
                    list = ListLabel.surveyJSID.value;
                }
                else {
                    list = ListLabel.surveyJSID1.value;
                }
                if (checkIsNulls(list, document.getElementById("spansurveyJS"), "请选择调查JS")) {
                    CheckStr = false;
                }
                rvalue += "surveyJS,YS:JSID=";
                if (document.getElementById("rdb1").checked) {
                    for (var i = 0; i < ListLabel.surveyJSID.options.length; i++) {
                        if (ListLabel.surveyJSID.options[i].selected) {
                            rvalue += ListLabel.surveyJSID.options[i].value + "|";
                        }
                    }
                } else {

                    rvalue += ListLabel.surveyJSID1.value + "|";
                }


                rvalue = rvalue.substring(0, rvalue.length - 1);
                rvalue += "][/YS:unLoop]";
                break;
            case "statJS":
                rvalue += "[YS:unLoop,YS:SiteID=<%Response.Write(APIID); %>,YS:LabelType=";
                if (checkIsNull(ListLabel.statJSID, document.getElementById("spanstatJS"), "请选择统计JS"))
                    CheckStr = false;
                rvalue += "statJS,YS:JSID=" + ListLabel.statJSID.value;
                rvalue += ",YS:statShowType=" + ListLabel.statShowType.value;
                rvalue += "][/YS:unLoop]";
                break;
            case "OtherJS":
                rvalue += "[YS:unLoop,YS:SiteID=<%Response.Write(APIID); %>,YS:LabelType=";
                if (checkIsNull(ListLabel.OtherJSID, document.getElementById("spanOtherJS"), "请选择其它JS"))
                    CheckStr = false;
                rvalue += "OtherJS,YS:JSID=?";
                rvalue += "][/YS:unLoop]";
                break;
            default:
                if (checkIsNull(ListLabel.LabelType, document.getElementById("spanLabelType"), "请选择JS类型"))
                    CheckStr = false;
                break;
        }
        if (CheckStr == true)
            parent.parent.getValue(rvalue);
    }
    function spanClear() {
        document.getElementById("spanfreeJS").innerHTML = "";
        document.getElementById("spansysJS").innerHTML = "";
        document.getElementById("spanadJS").innerHTML = "";
        document.getElementById("spansurveyJS").innerHTML = "";
        document.getElementById("spanstatJS").innerHTML = "";
        document.getElementById("spanOtherJS").innerHTML = "";
    }
    function checkIsNull(obj, spanobj, error) {
        if (obj.value == "") {
            spanobj.innerHTML = "<span class=reshow>(*)" + error + "</spna>";
            return true;
        }
        return false;
    }
    function checkIsNulls(obj, spanobj, error) {
        if (obj == "") {
            spanobj.innerHTML = "<span class=reshow>(*)" + error + "</spna>";
            return true;
        }
        return false;
    }
    function CloseDiv() {
        parent.parent.$('#dialog-message').dialog("close");
    }
    function loadNum() {
        var numkey = Math.random();
        numkey = Math.round(numkey * 100000);
        document.getElementById('SPANID').value = "JsSpanID_" + numkey;
    }
</script>