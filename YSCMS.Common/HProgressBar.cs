﻿using System;
using System.Collections.Generic;
using System.Text;

namespace YSCMS.Common
{
    /// <summary>
    /// 网页进度条
    /// </summary>
    public class HProgressBar
    {
        /// <summary>
        /// 进度条的初始化
        /// </summary>
        public static void Start()
        {
            Start("正在加载...");
        }
        /// <summary>
        /// 进度条的初始化
        /// </summary>
        /// <param name="msg">最开始显示的信息</param>
        public static void Start(string msg)
        {
            string s = "<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<title></title>\r\n\r\n";
            s += "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\" />";
            s += "<link href=\"/CSS/" + YSCMS.Config.UIConfig.CssPath() + "/css/blue.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n";
            s += "<style>body {text-align:center;margin-top: 10px;}#ProgressBarSide {height:15px;border:1px #2F2F2F;width:65%;background:#EEFAFF;}</style>\r\n";
            s += "<script language=\"javascript\"  charset=\"gb2312\">\r\n";
            s += "function SetPorgressBar(msg, pos)\r\n";
            s += "{\r\n";
            s += "document.getElementById('ProgressBar').style.width = pos + \"%\";\r\n";
            s += "WriteText('Msg1',msg + \" 已完成\" + pos + \"%\");\r\n";
            s += "}\r\n";
            s += "function SetCompleted(msg)\r\n{\r\nif(msg==\"\")\r\nWriteText(\"Msg1\",\"完成。\");\r\n";
            s += "else\r\nWriteText(\"Msg1\",msg);\r\n}\r\n";
            s += "function WriteText(id, str)\r\n";
            s += "{\r\n";
            s += "var strTag = '<span style=\"font-family:Verdana, Arial, Helvetica;font-size=11.5px;color:#DD5800\">' + unescape(str) + '</span>';\r\n ";
            s += "document.getElementById(id).innerHTML = strTag;\r\n";
            s += "}\r\n";
            s += "</script>\r\n</head>\r\n<body>\r\n";
            s += "<div id=\"Msg1\"><span style=\"font-family:Verdana, Arial, Helvetica;font-size=11.5px;color:#DD5800\">" + msg + "</span></div>\r\n";
            s += "<div id=\"ProgressBarSide\" align=\"left\" style=\"color:Silver;border-width:1px;border-style:Solid;margin:0 auto;\">\r\n";
            s += "<div id=\"ProgressBar\" style=\"background-color:#008BCE; height:15px; width:0%;color:#fff;\"></div>\r\n";
            s += "</div>\r\n</body>\r\n</html>\r\n";
            System.Web.HttpContext.Current.Response.Write(s);
            System.Web.HttpContext.Current.Response.Flush();
        }

        /// <summary>
        /// 滚动进度条
        /// </summary>
        /// <param name="Msg">在进度条上方显示的信息</param>
        /// <param name="Pos">显示进度的百分比数字</param>
        public static void Roll(string Msg, int Pos)
        {
            string jsBlock = "<script language=\"javascript\" charset=\"utf-8\">SetPorgressBar('" + Msg + "'," + Pos + ");</script>";
            System.Web.HttpContext.Current.Response.Write(jsBlock);
            System.Web.HttpContext.Current.Response.Flush();
        }
    }
}
