﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PublishNewsClass.aspx.cs" Inherits="YSCMS.PageView.Manage.Publish.PublishNewsClass" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><%Response.Write(YSCMS.Config.UIConfig.HeadTitle); %>栏目发布</title>
    <link rel="stylesheet" type="text/css" href="/CSS/base.css" />
    <link rel="stylesheet" type="text/css" href="/CSS/style.css" />
    <link rel="stylesheet" type="text/css" href="/CSS/<%Response.Write(YSCMS.Config.UIConfig.CssPath());%>/css/blue.css" />
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/public.js" type="text/javascript"></script>
    <link href="/CSS/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery-ui-1.10.2.custom.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.bgiframe.js" type="text/javascript"></script>
    <script src="/Scripts/SelectAction.js" type="text/javascript"></script>
    <script>
        function showclass(obj) {
            var divobj = document.getElementById('unHTMLclass');
            var div_classsobj = document.getElementById('div_classs');
            if (divobj.style.display == "") {
                //            divobj.style.display="none";
            }
            else {
                divobj.style.display = "";
            }
            if (div_classsobj.style.display = "") {
            }
            else {
                div_classsobj.style.display = "";
            }
        }

        function showclass1(obj) {
            var divobj = document.getElementById('div_classs');
            divobj.style.display = "none";
        }
        function checkform() {

        }

        function AjaxPublish() {
            checkform();
            var url = "Publish.aspx?publishIndex=false&bakIndex=false";
            var para = "";
            var classall = document.getElementById("classall").checked;
            var newClass = document.getElementById("divClassClass");
            var intvalue = "";
            if (classall != true) {
                for (var i = 0; i < newClass.length; i++) {
                    if (newClass.options[i].selected) {
                        intvalue += newClass.options[i].value + "$";
                    }
                }
                if (intvalue.length > 0) {
                    intvalue = intvalue.substring(0, intvalue.length - 1);
                }
            } else {
                intvalue = "classall";
            }
            para = "type=classclass&newclassids=" + intvalue + "&unhtmlclass=" + document.getElementById("unHTMLclass").checked;
            if (para != "") {
                url += "&" + para;
            }
            var cw = document.body.clientWidth - 400;
            var ch = $(window).height() - 100;
            if (navigator.userAgent.indexOf("MSIE") > 0) {
                ch = $(document).height() - 100;
            }
            window.open(url, 'newwindow', 'height=150, width=730, top=' + ch + ', left=' + cw + ', toolbar=no, menubar=no, scrollbars=no,resizable=no,location=no, status=no')
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="dialog-message" title="提示">
    </div>
    <div class="mian_body">
        <div class="mian_wei">
            <!--<div class="mian_wei_1"><img src="imges/lie_10.gif" alt="" /></div>-->
            <div class="mian_wei_min">
                <div class="mian_wei_left">
                    <h3>
                        发布系统-首页栏目发布</h3>
                </div>
                <div class="mian_wei_right">
                    导航：<a href="javascript:openmain('../main.aspx')">首页</a>>>发布管理</div>
            </div>
            <!--<div class="mian_wei_2"><img src="imges/lie_12.gif" alt="" /></div>-->
        </div>
        <div class="mian_cont">
            <div class="nwelie">
                <div class="jslie_lan">
                    <span>功能：</span><a href="PublishIndex.aspx">首页、新闻生成设置</a>┊<a href="PublishNewsClass.aspx">栏目生成设置</a>┊<a href="PublishSpecial.aspx">专题生成设置</a>┊<a href="PublishPage.aspx">单页生成设置</a>
                </div>
                <div class="lanlie_lie">
                    <div class="newxiu_base">
                        <table class="nxb_table">
                            <tr>
                                <td width="15%" align="right">
                                    生成栏目：
                                </td>
                                <td>
                                    &nbsp;
                                    <input type="checkbox" id="classall" class="checkbox2" onclick="showclass(this)" /><label for="classall">发布所有栏目</label>
						            &nbsp;<asp:RadioButton ID="classselect" runat="server" GroupName="class" onclick="showclass1(this)" Text="选择栏目" Visible="false" />
						            <label id="div_classs" style="display: none">
							            <asp:CheckBox ID="unHTMLclass" runat="server" EnableTheming="True" Text="只发布未发布的" /></label>
						            <asp:CheckBox ID="pIndex" runat="server" Text="同时发布索引文件" />
						            <span class="helpstyle" onclick="Help('H_public_index',this)" style="cursor: help" title="点击查看帮助">帮助</span>
						            <br />
						            <asp:ListBox ID="divClassClass" Width="485px" runat="server" Rows="20" SelectionMode="Multiple"
                                        Height="240px" CssClass="textarea2"></asp:ListBox>
                                </td>
                            </tr>
                        </table>
                        <div class="nxb_submit">
                            <input type="button" value="立刻发布" class="xsubmit1" onclick="AjaxPublish()" />
                            <input type="reset" value="重新选择" class="xsubmit1" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>

