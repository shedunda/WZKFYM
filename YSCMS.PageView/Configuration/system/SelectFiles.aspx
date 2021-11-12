﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectFiles.aspx.cs" Inherits="YSCMS.PageView.Configuration.system.SelectFiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>
		<%Response.Write(YSCMS.Config.UIConfig.HeadTitle); %></title>
        <link rel="stylesheet" type="text/css" href="/CSS/base.css"/>
<link rel="stylesheet" type="text/css" href="/CSS/style.css"/>
<link rel="stylesheet" type="text/css" href="/CSS/popup_window.css"/>
<link rel="stylesheet" type="text/css" href="/CSS/<%Response.Write(YSCMS.Config.UIConfig.CssPath());%>/css/blue.css"/>
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
      <script src="/Scripts/jquery-ui-1.10.2.custom.min.js" type="text/javascript"></script>

</head>
<body>
	<form id="Templetslist" action="" runat="server" method="post" style="margin-right:30px;_margin-right:15px;">
	<div id="addfiledir" runat="server" class="files_fid">
	</div>
	<div id="File_List" runat="server" class="files_list">
	</div>
	<input type="hidden" name="Type" />
	<input type="hidden" name="Path" />
	<input type="hidden" name="ParentPath" />
	<input type="hidden" name="OldFileName" />
	<input type="hidden" name="NewFileName" />
	<input type="hidden" name="filename" />
	<input type="hidden" name="Urlx" />
	<input type="hidden" name="FilePath" />
	</form>
</body>
</html>
<script language="javascript" type="text/javascript">
    function ListGo(Path, ParentPath, strFileName) {
        //self.location='?Path='+Path+'&ParentPath='+ParentPath;
        document.Templetslist.Path.value = Path;
        document.Templetslist.ParentPath.value = ParentPath;
        if (strFileName) {
            document.Templetslist.FilePath.value = strFileName;
        }
        document.Templetslist.submit();
    }
    function EditFolder(path, filename) {
        var ReturnValue = '';
        ReturnValue = prompt('修改的名称：', filename.replace(/'|"/g, ''));
        if ((ReturnValue != '') && (ReturnValue != null)) {
            //self.location.href='?Type=EidtDirName&Path='+path+'&OldFileName='+filename+'&NewFileName='+ReturnValue;
            document.Templetslist.Type.value = "EidtDirName";
            document.Templetslist.Path.value = path;
            document.Templetslist.OldFileName.value = filename;
            document.Templetslist.NewFileName.value = ReturnValue;
            document.Templetslist.submit();
        }
        else {
            if (ReturnValue != null) {
                alert('请填写要更名的名称');
            }
        }
    }
    function EditFile(path, filename) {
        var ReturnValue = '';
        ReturnValue = prompt('修改的名称：', filename.replace(/'|"/g, ''));
        if ((ReturnValue != '') && (ReturnValue != null)) {
            //self.location.href='?Type=EidtFileName&Path='+path+'&OldFileName='+filename+'&NewFileName='+ReturnValue;
            document.Templetslist.Type.value = "EidtFileName";
            document.Templetslist.Path.value = path;
            document.Templetslist.OldFileName.value = filename;
            document.Templetslist.NewFileName.value = ReturnValue;
            document.Templetslist.submit();
        }
        else {
            if (ReturnValue != null) {
                alert('请填写要更名的名称');
            }
        }
    }
    function DelDir(path) {
        if (confirm('确定删除此文件夹以及此文件夹下所有文件吗?')) {
            document.Templetslist.Type.value = "DelDir";
            document.Templetslist.Path.value = path;
            document.Templetslist.submit();
        }
    }
    function DelFile(path, filename) {
        if (confirm('确定删除此文件吗?')) {
            document.Templetslist.Type.value = "DelFile";
            document.Templetslist.Path.value = path;
            document.Templetslist.filename.value = filename;
            document.Templetslist.submit();
        }
    }
    function AddDir(path) {
        var ReturnValue = '';
        var filename = '';
        ReturnValue = prompt('要添加的文件夹名称', filename.replace(/'|"/g, ''));
        if ((ReturnValue != '') && (ReturnValue != null)) {
            document.Templetslist.Type.value = "AddDir";
            document.Templetslist.Path.value = path;
            document.Templetslist.filename.value = ReturnValue;
            document.Templetslist.submit();
        }
        else {
            if (ReturnValue != null) {
                alert('请填写要添加的文件夹名称');
            }
        }
    }
    function sFiles(obj) {
        document.Templetslist.sUrl.value = obj;
    }

    function ReturnValue(obj) {
        var controls = '<%= Request["controlName"]%>';
	    var Str = obj;
	    var Edit = '<% Response.Write(Request.QueryString["Edit"]);%>'
	    if (Edit != null && Edit != "") {
	        parent.parent.$("#" + controls).val(Str);
	    }
	    else {
	        parent.parent.$("#" + controls).val(Str);
	    }
	    parent.parent.$('#dialog-message').dialog("close");
    }

    function ReturndefineValue(obj, str) {
        window.opener.sdefine(obj, str);
        window.close();
    }


    function UpFile(path, type, ParentPath) {
        var WWidth = (window.screen.width - 500) / 2;
        var Wheight = (window.screen.height - 150) / 2;
        window.open("Upload.aspx?Path=" + path + "&UpfilesType=" + type + "&ParentPath=" + ParentPath, '文件上传', 'height=300, width=600, top=' + Wheight + ', left=' + WWidth + ', toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
    }
</script>
