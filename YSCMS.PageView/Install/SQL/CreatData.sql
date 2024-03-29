if exists (select * from sysobjects where id = object_id(N'[FK_ys_Collect_RuleRender_ys_Collect_Rule]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [ys_Collect_RuleApply] DROP CONSTRAINT FK_ys_Collect_RuleRender_ys_Collect_Rule
;

if exists (select * from sysobjects where id = object_id(N'[ys_Attachments]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_Attachments]
;

if exists (select * from sysobjects where id = object_id(N'[ys_Collect_News]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_Collect_News]
;

if exists (select * from sysobjects where id = object_id(N'[ys_Collect_Rule]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_Collect_Rule]
;

if exists (select * from sysobjects where id = object_id(N'[ys_Collect_RuleApply]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_Collect_RuleApply]
;

if exists (select * from sysobjects where id = object_id(N'[ys_Collect_Site]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_Collect_Site]
;

if exists (select * from sysobjects where id = object_id(N'[ys_Collect_SiteFolder]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_Collect_SiteFolder]
;

if exists (select * from sysobjects where id = object_id(N'[ys_News_URL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_News_URL]
;

if exists (select * from sysobjects where id = object_id(N'[ys_User_URL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_User_URL]
;

if exists (select * from sysobjects where id = object_id(N'[ys_User_URLClass]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_User_URLClass]
;

if exists (select * from sysobjects where id = object_id(N'[ys_ads]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_ads]
;

if exists (select * from sysobjects where id = object_id(N'[ys_ads_class]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_ads_class]
;

if exists (select * from sysobjects where id = object_id(N'[ys_ads_stat]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_ads_stat]
;

if exists (select * from sysobjects where id = object_id(N'[ys_adstxt]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_adstxt]
;

if exists (select * from sysobjects where id = object_id(N'[ys_api_commentary]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_api_commentary]
;

if exists (select * from sysobjects where id = object_id(N'[ys_api_faviate]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_api_faviate]
;

if exists (select * from sysobjects where id = object_id(N'[ys_api_navi]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_api_navi]
;

if exists (select * from sysobjects where id = object_id(N'[ys_classdroptemplet]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_classdroptemplet]
;

if exists (select * from sysobjects where id = object_id(N'[ys_customform]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_customform]
;

if exists (select * from sysobjects where id = object_id(N'[ys_customform_item]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_customform_item]
;

if exists (select * from sysobjects where id = object_id(N'[ys_define_class]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_define_class]
;

if exists (select * from sysobjects where id = object_id(N'[ys_define_data]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_define_data]
;

if exists (select * from sysobjects where id = object_id(N'[ys_define_save]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_define_save]
;

if exists (select * from sysobjects where id = object_id(N'[ys_friend_class]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_friend_class]
;

if exists (select * from sysobjects where id = object_id(N'[ys_friend_link]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_friend_link]
;

if exists (select * from sysobjects where id = object_id(N'[ys_friend_pram]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_friend_pram]
;

if exists (select * from sysobjects where id = object_id(N'[ys_news]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_news]
;

if exists (select * from sysobjects where id = object_id(N'[ys_news_Class]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_news_Class]
;

if exists (select * from sysobjects where id = object_id(N'[ys_news_Gen]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_news_Gen]
;

if exists (select * from sysobjects where id = object_id(N'[ys_news_JS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_news_JS]
;

if exists (select * from sysobjects where id = object_id(N'[ys_news_JSFile]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_news_JSFile]
;

if exists (select * from sysobjects where id = object_id(N'[ys_news_JST_Class]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_news_JST_Class]
;

if exists (select * from sysobjects where id = object_id(N'[ys_news_JSTemplet]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_news_JSTemplet]
;

if exists (select * from sysobjects where id = object_id(N'[ys_news_page]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_news_page]
;

if exists (select * from sysobjects where id = object_id(N'[ys_news_site]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_news_site]
;

if exists (select * from sysobjects where id = object_id(N'[ys_news_special]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_news_special]
;

if exists (select * from sysobjects where id = object_id(N'[ys_news_sub]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_news_sub]
;

if exists (select * from sysobjects where id = object_id(N'[ys_news_topline]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_news_topline]
;

if exists (select * from sysobjects where id = object_id(N'[ys_news_unNews]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_news_unNews]
;

if exists (select * from sysobjects where id = object_id(N'[ys_news_vote]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_news_vote]
;

if exists (select * from sysobjects where id = object_id(N'[ys_newsdroptemplet]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_newsdroptemplet]
;

if exists (select * from sysobjects where id = object_id(N'[ys_old_news]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_old_news]
;

if exists (select * from sysobjects where id = object_id(N'[ys_special_news]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_special_news]
;

if exists (select * from sysobjects where id = object_id(N'[ys_specialdroptemplet]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_specialdroptemplet]
;

if exists (select * from sysobjects where id = object_id(N'[ys_stat_Info]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_stat_Info]
;

if exists (select * from sysobjects where id = object_id(N'[ys_stat_class]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_stat_class]
;

if exists (select * from sysobjects where id = object_id(N'[ys_stat_content]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_stat_content]
;

if exists (select * from sysobjects where id = object_id(N'[ys_stat_param]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_stat_param]
;

if exists (select * from sysobjects where id = object_id(N'[ys_sys_City]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_sys_City]
;

if exists (select * from sysobjects where id = object_id(N'[ys_sys_Help]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_sys_Help]
;

if exists (select * from sysobjects where id = object_id(N'[ys_sys_Label]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_sys_Label]
;

if exists (select * from sysobjects where id = object_id(N'[ys_sys_LabelClass]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_sys_LabelClass]
;

if exists (select * from sysobjects where id = object_id(N'[ys_sys_LabelFree]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_sys_LabelFree]
;

if exists (select * from sysobjects where id = object_id(N'[ys_sys_LabelStyle]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_sys_LabelStyle]
;

if exists (select * from sysobjects where id = object_id(N'[ys_sys_PramUser]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_sys_PramUser]
;

if exists (select * from sysobjects where id = object_id(N'[ys_sys_Pramother]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_sys_Pramother]
;

if exists (select * from sysobjects where id = object_id(N'[ys_sys_User]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_sys_User]
;

if exists (select * from sysobjects where id = object_id(N'[ys_sys_UserLevel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_sys_UserLevel]
;

if exists (select * from sysobjects where id = object_id(N'[ys_sys_admin]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_sys_admin]
;

if exists (select * from sysobjects where id = object_id(N'[ys_sys_admingroup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_sys_admingroup]
;

if exists (select * from sysobjects where id = object_id(N'[ys_sys_logs]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_sys_logs]
;

if exists (select * from sysobjects where id = object_id(N'[ys_sys_newsIndex]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_sys_newsIndex]
;

if exists (select * from sysobjects where id = object_id(N'[ys_sys_param]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_sys_param]
;

if exists (select * from sysobjects where id = object_id(N'[ys_sys_parmConstr]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_sys_parmConstr]
;

if exists (select * from sysobjects where id = object_id(N'[ys_sys_parmPrint]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_sys_parmPrint]
;

if exists (select * from sysobjects where id = object_id(N'[ys_sys_styleclass]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_sys_styleclass]
;

if exists (select * from sysobjects where id = object_id(N'[ys_sys_userfields]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_sys_userfields]
;

if exists (select * from sysobjects where id = object_id(N'[ys_sys_userother]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_sys_userother]
;

if exists (select * from sysobjects where id = object_id(N'[ys_user_Card]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_user_Card]
;

if exists (select * from sysobjects where id = object_id(N'[ys_user_Constr]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_user_Constr]
;

if exists (select * from sysobjects where id = object_id(N'[ys_user_ConstrClass]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_user_ConstrClass]
;

if exists (select * from sysobjects where id = object_id(N'[ys_user_Discuss]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_user_Discuss]
;

if exists (select * from sysobjects where id = object_id(N'[ys_user_DiscussActive]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_user_DiscussActive]
;

if exists (select * from sysobjects where id = object_id(N'[ys_user_DiscussActiveMember]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_user_DiscussActiveMember]
;

if exists (select * from sysobjects where id = object_id(N'[ys_user_DiscussClass]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_user_DiscussClass]
;

if exists (select * from sysobjects where id = object_id(N'[ys_user_DiscussContribute]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_user_DiscussContribute]
;

if exists (select * from sysobjects where id = object_id(N'[ys_user_DiscussMember]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_user_DiscussMember]
;

if exists (select * from sysobjects where id = object_id(N'[ys_user_DiscussTopic]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_user_DiscussTopic]
;

if exists (select * from sysobjects where id = object_id(N'[ys_user_Friend]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_user_Friend]
;

if exists (select * from sysobjects where id = object_id(N'[ys_user_FriendClass]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_user_FriendClass]
;

if exists (select * from sysobjects where id = object_id(N'[ys_user_Ghistory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_user_Ghistory]
;

if exists (select * from sysobjects where id = object_id(N'[ys_user_Group]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_user_Group]
;

if exists (select * from sysobjects where id = object_id(N'[ys_user_Guser]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_user_Guser]
;

if exists (select * from sysobjects where id = object_id(N'[ys_user_MessFiles]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_user_MessFiles]
;

if exists (select * from sysobjects where id = object_id(N'[ys_user_Message]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_user_Message]
;

if exists (select * from sysobjects where id = object_id(N'[ys_user_Photo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_user_Photo]
;

if exists (select * from sysobjects where id = object_id(N'[ys_user_Photoalbum]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_user_Photoalbum]
;

if exists (select * from sysobjects where id = object_id(N'[ys_user_PhotoalbumClass]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_user_PhotoalbumClass]
;

if exists (select * from sysobjects where id = object_id(N'[ys_user_Requestinformation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_user_Requestinformation]
;

if exists (select * from sysobjects where id = object_id(N'[ys_user_constrPay]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_user_constrPay]
;

if exists (select * from sysobjects where id = object_id(N'[ys_user_news]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_user_news]
;

if exists (select * from sysobjects where id = object_id(N'[ys_user_note]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_user_note]
;

if exists (select * from sysobjects where id = object_id(N'[ys_user_userlogs]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_user_userlogs]
;

if exists (select * from sysobjects where id = object_id(N'[ys_user_vote]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_user_vote]
;

if exists (select * from sysobjects where id = object_id(N'[ys_vote_Item]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_vote_Item]
;

if exists (select * from sysobjects where id = object_id(N'[ys_vote_Steps]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_vote_Steps]
;

if exists (select * from sysobjects where id = object_id(N'[ys_vote_class]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_vote_class]
;

if exists (select * from sysobjects where id = object_id(N'[ys_vote_manage]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_vote_manage]
;

if exists (select * from sysobjects where id = object_id(N'[ys_vote_param]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_vote_param]
;

if exists (select * from sysobjects where id = object_id(N'[ys_vote_title]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ys_vote_title]
;

CREATE TABLE [ys_Attachments] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[FileName] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[FileType] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[UploadDate] [datetime] NULL ,
	[FileSize] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[FilePath] [varchar] (200) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_Collect_News] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[Title] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Links] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Author] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[Source] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[AddDate] [datetime] NULL ,
	[ImagesCount] [int] NULL ,
	[SiteID] [int] NOT NULL ,
	[Catched_Form] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[History] [bit] NOT NULL ,
	[RecTF] [bit] NOT NULL ,
	[TodayNewsTF] [bit] NOT NULL ,
	[MarqueeNews] [bit] NOT NULL ,
	[SBSNews] [bit] NOT NULL ,
	[ReviewTF] [bit] NOT NULL ,
	[CollectTime] [datetime] NOT NULL ,
	[ChannelID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ClassID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_Collect_Rule] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[RuleName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[OldContent] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ReContent] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[AddDate] [datetime] NOT NULL ,
	[IgnoreCase] [bit] NOT NULL ,
	[ChannelID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_Collect_RuleApply] (
	[SiteID] [int] NOT NULL ,
	[RuleID] [int] NOT NULL ,
	[RefreshTime] [datetime] NOT NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_Collect_Site] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[SiteName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[objURL] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Encode] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[OtherPara] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[MaxNum] [int] NOT NULL ,
	[ListSetting] [nvarchar] (4000) COLLATE Chinese_PRC_CI_AS NULL ,
	[LinkSetting] [nvarchar] (4000) COLLATE Chinese_PRC_CI_AS NULL ,
	[OtherType] [int] NULL ,
	[OtherPageSetting] [nvarchar] (4000) COLLATE Chinese_PRC_CI_AS NULL ,
	[StartPageNum] [int] NULL ,
	[EndPageNum] [int] NULL ,
	[PagebodySetting] [nvarchar] (4000) COLLATE Chinese_PRC_CI_AS NULL ,
	[PageTitleSetting] [nvarchar] (4000) COLLATE Chinese_PRC_CI_AS NULL ,
	[OtherNewsType] [int] NULL ,
	[OtherNewsPageSetting] [nvarchar] (4000) COLLATE Chinese_PRC_CI_AS NULL ,
	[AuthorSetting] [nvarchar] (4000) COLLATE Chinese_PRC_CI_AS NULL ,
	[SourceSetting] [nvarchar] (4000) COLLATE Chinese_PRC_CI_AS NULL ,
	[AddDateSetting] [nvarchar] (4000) COLLATE Chinese_PRC_CI_AS NULL ,
	[IsAutoCollect] [bit] NOT NULL ,
	[CollectDate] [int] NULL ,
	[TextTF] [bit] NOT NULL ,
	[SaveRemotePic] [bit] NOT NULL ,
	[Audit] [int] NOT NULL ,
	[IsStyle] [bit] NOT NULL ,
	[IsDIV] [bit] NOT NULL ,
	[IsA] [bit] NOT NULL ,
	[IsClass] [bit] NOT NULL ,
	[IsFont] [bit] NOT NULL ,
	[IsSpan] [bit] NOT NULL ,
	[IsObject] [bit] NOT NULL ,
	[IsIFrame] [bit] NOT NULL ,
	[IsScript] [bit] NOT NULL ,
	[IsReverse] [bit] NOT NULL ,
	[IsAutoPicNews] [bit] NOT NULL ,
	[HandSetAuthor] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[HandSetSource] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[HandSetAddDate] [datetime] NULL ,
	[Folder] [int] NULL ,
	[ClassID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ChannelID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_Collect_SiteFolder] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[SiteFolder] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[SiteFolderDetail] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[ChannelID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_News_URL] (
	[id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[URLName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[NewsID] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[DataLib] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[FileURL] [nvarchar] (220) COLLATE Chinese_PRC_CI_AS NULL ,
	[CreatTime] [datetime] NULL ,
	[OrderID] [tinyint] NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_User_URL] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[ClassID] [int] NULL ,
	[URLName] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[URL] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[URLColor] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[CreatTime] [datetime] NULL ,
	[Content] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[UserNum] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_User_URLClass] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[ClassName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[ParentID] [int] NULL ,
	[UserNum] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_ads] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[AdID] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[adName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[ClassID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[CusID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[adType] [tinyint] NULL ,
	[leftPic] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[rightPic] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[leftSize] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[rightSize] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[LinkURL] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[CycTF] [tinyint] NULL ,
	[CycAdID] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[CycSpeed] [int] NULL ,
	[CycDic] [tinyint] NULL ,
	[ClickNum] [int] NULL ,
	[ShowNum] [int] NULL ,
	[CondiTF] [tinyint] NULL ,
	[maxShowClick] [int] NULL ,
	[TimeOutDay] [datetime] NULL ,
	[maxClick] [int] NULL ,
	[creatTime] [datetime] NULL ,
	[AdTxtNum] [int] NULL ,
	[isLock] [tinyint] NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_ads_class] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[AcID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[Cname] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[ParentID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[creatTime] [datetime] NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[Adprice] [int] NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_ads_stat] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[AdID] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[IP] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[Address] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[creatTime] [datetime] NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_adstxt] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[AdID] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[AdTxt] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[AdCss] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[AdLink] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_api_commentary] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[Commid] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[InfoID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[APIID] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[DataLib] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[Title] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[Content] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[creatTime] [datetime] NULL ,
	[IP] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[QID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[UserNum] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[isRecyle] [tinyint] NULL ,
	[islock] [tinyint] NULL ,
	[OrderID] [int] NULL ,
	[GoodTitle] [tinyint] NULL ,
	[isCheck] [tinyint] NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[commtype] [tinyint] NULL ,
	[ChID] [int] NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_api_faviate] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[FID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[Infotitle] [nvarchar] (80) COLLATE Chinese_PRC_CI_AS NULL ,
	[UserNum] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[CreatTime] [datetime] NULL ,
	[APIID] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[DataLib] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[ChID] [int] NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_api_navi] (
	[am_ID] [int] IDENTITY (1, 1) NOT NULL ,
	[am_ClassID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[am_Name] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[am_FilePath] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[am_ChildrenID] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[am_creatTime] [datetime] NULL ,
	[am_orderID] [int] NULL ,
	[isSys] [tinyint] NULL ,
	[siteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[userNum] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[popCode] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[imgPath] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[imgwidth] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[imgheight] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_classdroptemplet] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[ClassId] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Templet] [varchar] (1000) COLLATE Chinese_PRC_CI_AS NULL ,
	[ReadNewsTemplet] [varchar] (1000) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_customform] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[formname] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[formtablename] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[accessorypath] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[accessorysize] [int] NULL ,
	[memo] [nvarchar] (255) COLLATE Chinese_PRC_CI_AS NULL ,
	[islock] [bit] NOT NULL ,
	[timelimited] [bit] NOT NULL ,
	[starttime] [datetime] NULL ,
	[endtime] [datetime] NULL ,
	[showvalidatecode] [bit] NOT NULL ,
	[submitonce] [bit] NOT NULL ,
	[isdelpoint] [tinyint] NOT NULL ,
	[gpoint] [int] NOT NULL ,
	[ipoint] [int] NOT NULL ,
	[groupnumber] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[addtime] [datetime] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_customform_item] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[seriesnumber] [int] NOT NULL ,
	[formid] [int] NOT NULL ,
	[fieldname] [nvarchar] (50) NOT NULL ,
	[itemname] [nvarchar] (50) NOT NULL ,
	[itemtype] [nvarchar] (50) NOT NULL ,
	[defaultvalue] [nvarchar] (50) NULL ,
	[isnotnull] [bit] NOT NULL ,
	[itemsize] [int] NULL ,
	[islock] [bit] NOT NULL ,
	[prompt] [nvarchar] (255) NULL ,
	[selectitem] [ntext] NULL ,
	[addtime] [datetime] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_define_class] (
	[DefineId] [int] IDENTITY (1, 1) NOT NULL ,
	[DefineInfoId] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[DefineName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ParentInfoId] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_define_data] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[defineInfoId] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[defineCname] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[defineColumns] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[defineType] [int] NULL ,
	[IsNull] [tinyint] NULL ,
	[defineValue] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[defineExpr] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[definedvalue] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_define_save] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[DsNewsID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[DsEname] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[DsNewsTable] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[DsType] [tinyint] NULL ,
	[DsContent] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[DsApiID] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_friend_class] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[ClassID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[ClassCName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[ClassEName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[ParentID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_friend_link] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[Name] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Type] [tinyint] NULL ,
	[Url] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL ,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[PicUrl] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL ,
	[Lock] [tinyint] NULL ,
	[IsUser] [tinyint] NULL ,
	[Author] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Mail] [nvarchar] (150) COLLATE Chinese_PRC_CI_AS NULL ,
	[ContentFor] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[LinkContent] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[Addtime] [datetime] NULL ,
	[isAdmin] [tinyint] NULL ,
	[ClassID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_friend_pram] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[IsOpen] [tinyint] NULL ,
	[IsRegister] [tinyint] NULL ,
	[ArrSize] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[isLock] [tinyint] NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_news] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[NewsID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[NewsType] [tinyint] NULL ,
	[OrderID] [tinyint] NULL ,
	[NewsTitle] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[sNewsTitle] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[TitleColor] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[TitleITF] [tinyint] NULL ,
	[TitleBTF] [tinyint] NULL ,
	[CommLinkTF] [tinyint] NULL ,
	[SubNewsTF] [tinyint] NULL ,
	[URLaddress] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[PicURL] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[SPicURL] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[ClassID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[SpecialID] [nvarchar] (400) COLLATE Chinese_PRC_CI_AS NULL ,
	[Author] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[Souce] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[Tags] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[NewsProperty] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[NewsPicTopline] [tinyint] NULL ,
	[Templet] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[Metakeywords] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[Metadesc] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[naviContent] [nvarchar] (255) COLLATE Chinese_PRC_CI_AS NULL ,
	[Click] [int] NULL ,
	[CreatTime] [datetime] NULL ,
	[EditTime] [datetime] NULL ,
	[SavePath] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[FileName] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[FileEXName] [nvarchar] (6) COLLATE Chinese_PRC_CI_AS NULL ,
	[isDelPoint] [tinyint] NULL ,
	[Gpoint] [int] NULL ,
	[iPoint] [int] NULL ,
	[GroupNumber] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[ContentPicTF] [tinyint] NULL ,
	[ContentPicURL] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[ContentPicSize] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[CommTF] [tinyint] NULL ,
	[DiscussTF] [tinyint] NULL ,
	[TopNum] [int] NULL ,
	[VoteTF] [tinyint] NULL ,
	[CheckStat] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[isLock] [tinyint] NULL ,
	[isRecyle] [tinyint] NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[DataLib] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[DefineID] [tinyint] NULL ,
	[isVoteTF] [tinyint] NULL ,
	[Editor] [nvarchar] (18) COLLATE Chinese_PRC_CI_AS NULL ,
	[isHtml] [tinyint] NULL ,
	[isConstr] [tinyint] NULL ,
	[isFiles] [tinyint] NULL ,
	[vURL] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_news_Class] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[ClassID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ClassCName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ClassEName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ParentID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[IsURL] [tinyint] NULL ,
	[OrderID] [tinyint] NULL ,
	[URLaddress] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[Domain] [nvarchar] (150) COLLATE Chinese_PRC_CI_AS NULL ,
	[ClassTemplet] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[ReadNewsTemplet] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[SavePath] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[SaveClassframe] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[Checkint] [tinyint] NULL ,
	[ClassSaveRule] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[ClassIndexRule] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[NewsSavePath] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[NewsFileRule] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[PicDirPath] [nvarchar] (150) COLLATE Chinese_PRC_CI_AS NULL ,
	[ContentPicTF] [tinyint] NULL ,
	[ContentPICurl] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[ContentPicSize] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[InHitoryDay] [int] NULL ,
	[DataLib] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[NaviShowtf] [tinyint] NULL ,
	[NaviPIC] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[NaviContent] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL ,
	[MetaKeywords] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[MetaDescript] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[isDelPoint] [tinyint] NULL ,
	[Gpoint] [int] NULL ,
	[iPoint] [int] NULL ,
	[GroupNumber] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL ,
	[FileName] [nvarchar] (6) COLLATE Chinese_PRC_CI_AS NULL ,
	[isLock] [tinyint] NULL ,
	[isRecyle] [tinyint] NULL ,
	[NaviPosition] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[NewsPosition] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[isComm] [tinyint] NULL ,
	[Defineworkey] [nvarchar] (220) COLLATE Chinese_PRC_CI_AS NULL ,
	[CreatTime] [datetime] NULL ,
	[isPage] [tinyint] NULL ,
	[PageContent] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[ModelID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[isunHTML] [tinyint] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_news_Gen] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[Cname] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[gType] [tinyint] NULL ,
	[URL] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[EmailURL] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[isLock] [tinyint] NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_news_JS] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[JsID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[jsType] [tinyint] NOT NULL ,
	[JSName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[JsTempletID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[jsNum] [int] NULL ,
	[jsLenTitle] [int] NULL ,
	[jsLenNavi] [int] NULL ,
	[jsLenContent] [int] NULL ,
	[jsContent] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[jsColsNum] [int] NULL ,
	[CreatTime] [datetime] NULL ,
	[jsfilename] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[jssavepath] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_news_JSFile] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[JsID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Njf_title] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[NewsId] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[NewsTable] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[PicPath] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[ClassId] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[CreatTime] [datetime] NULL ,
	[TojsTime] [datetime] NULL ,
	[ReclyeTF] [tinyint] NOT NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_news_JST_Class] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[ClassID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[CName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ParentID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Description] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[CreatTime] [datetime] NOT NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_news_JSTemplet] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[TempletID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[CName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[JSClassid] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[JSTType] [tinyint] NOT NULL ,
	[JSTContent] [ntext] COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[CreatTime] [datetime] NOT NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_news_page] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[title] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[CreatTime] [datetime] NULL ,
	[ClassID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[SavePath] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[fileName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[isDelPoint] [tinyint] NULL ,
	[Gpoint] [int] NULL ,
	[iPoint] [int] NULL ,
	[GroupNumber] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[KeyMeta] [nvarchar] (150) COLLATE Chinese_PRC_CI_AS NULL ,
	[DescMeta] [nvarchar] (150) COLLATE Chinese_PRC_CI_AS NULL ,
	[Editor] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[Templet] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_news_site] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[ChannelID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ParentID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[CName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[EName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ChannCName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[IsURL] [tinyint] NOT NULL ,
	[Urladdress] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[DataLib] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[IndexTemplet] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[ClassTemplet] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[ReadNewsTemplet] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[SpecialTemplet] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[isLock] [tinyint] NULL ,
	[Domain] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[isDelPoint] [tinyint] NULL ,
	[Gpoint] [int] NULL ,
	[iPoint] [int] NULL ,
	[GroupNumber] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[isCheck] [tinyint] NULL ,
	[Keywords] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[Descript] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[ContrTF] [tinyint] NULL ,
	[ShowNaviTF] [tinyint] NULL ,
	[UpfileType] [nvarchar] (150) COLLATE Chinese_PRC_CI_AS NULL ,
	[UpfileSize] [int] NULL ,
	[NaviContent] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[NaviPicURL] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[SaveType] [tinyint] NULL ,
	[PicSavePath] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[SaveFileType] [tinyint] NULL ,
	[SaveDirPath] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[SaveDirRule] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[SaveFileRule] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[NaviPosition] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[IndexEXName] [nvarchar] (6) COLLATE Chinese_PRC_CI_AS NULL ,
	[ClassEXName] [nvarchar] (6) COLLATE Chinese_PRC_CI_AS NULL ,
	[NewsEXName] [nvarchar] (6) COLLATE Chinese_PRC_CI_AS NULL ,
	[SpecialEXName] [nvarchar] (6) COLLATE Chinese_PRC_CI_AS NULL ,
	[classRefeshNum] [int] NULL ,
	[infoRefeshNum] [int] NULL ,
	[DelNum] [int] NULL ,
	[SpecialNum] [int] NULL ,
	[CreatTime] [datetime] NOT NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[isRecyle] [tinyint] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_news_special] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[SpecialID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[SpecialCName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[specialEName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[ParentID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[Domain] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[isDelPoint] [tinyint] NULL ,
	[Gpoint] [int] NULL ,
	[iPoint] [int] NULL ,
	[GroupNumber] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[saveDirPath] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[SavePath] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[FileName] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[FileEXName] [nvarchar] (6) COLLATE Chinese_PRC_CI_AS NULL ,
	[NaviPicURL] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[NaviContent] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[Templet] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[isLock] [tinyint] NULL ,
	[isRecyle] [tinyint] NULL ,
	[CreatTime] [datetime] NULL ,
	[NaviPosition] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[ModelID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_news_sub] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[NewsID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[getNewsID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[NewsTitle] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[DataLib] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[TitleCSS] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[colsNum] [tinyint] NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[CreatTime] [datetime] NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_news_topline] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[NewsTF] [tinyint] NULL ,
	[NewsID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[DataLib] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[tl_font] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[tl_style] [tinyint] NULL ,
	[tl_size] [tinyint] NULL ,
	[tl_color] [nvarchar] (8) COLLATE Chinese_PRC_CI_AS NULL ,
	[tl_space] [tinyint] NULL ,
	[tl_PicColor] [nvarchar] (8) COLLATE Chinese_PRC_CI_AS NULL ,
	[tl_SavePath] [nvarchar] (220) COLLATE Chinese_PRC_CI_AS NULL ,
	[creattime] [datetime] NULL ,
	[tl_Title] [nvarchar] (150) COLLATE Chinese_PRC_CI_AS NULL ,
	[tl_Width] [int] NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_news_unNews] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[UnID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[unName] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[TitleCSS] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[SubCSS] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[ONewsID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[Rows] [int] NULL ,
	[unTitle] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[NewsTable] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[CreatTime] [datetime] NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_news_vote] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[voteNum] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[NewsID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[DataLib] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[voteTitle] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[voteContent] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[creattime] [datetime] NULL ,
	[ismTF] [tinyint] NULL ,
	[isMember] [tinyint] NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[isTimeOutTime] [datetime] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_newsdroptemplet] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[NewsId] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Templet] [varchar] (1000) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_old_news] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[NewsID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[NewsType] [tinyint] NOT NULL ,
	[OrderID] [tinyint] NOT NULL ,
	[NewsTitle] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[sNewsTitle] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[TitleColor] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[TitleITF] [tinyint] NULL ,
	[TitleBTF] [tinyint] NULL ,
	[CommLinkTF] [tinyint] NULL ,
	[SubNewsTF] [tinyint] NULL ,
	[URLaddress] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[PicURL] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[SPicURL] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[ClassID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[SpecialID] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[Author] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[Souce] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[Tags] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[NewsProperty] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[NewsPicTopline] [tinyint] NULL ,
	[Templet] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[Metakeywords] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[Metadesc] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[naviContent] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[Click] [int] NULL ,
	[CreatTime] [datetime] NULL ,
	[EditTime] [datetime] NULL ,
	[SavePath] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[FileName] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[FileEXName] [nvarchar] (6) COLLATE Chinese_PRC_CI_AS NULL ,
	[isDelPoint] [tinyint] NULL ,
	[Gpoint] [int] NULL ,
	[iPoint] [int] NULL ,
	[GroupNumber] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[ContentPicTF] [tinyint] NULL ,
	[ContentPicURL] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[ContentPicSize] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[CommTF] [tinyint] NULL ,
	[DiscussTF] [tinyint] NULL ,
	[TopNum] [int] NULL ,
	[VoteTF] [tinyint] NULL ,
	[CheckStat] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[isLock] [tinyint] NULL ,
	[isRecyle] [tinyint] NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[DataLib] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[DefineID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[isVoteTF] [tinyint] NULL ,
	[Editor] [nvarchar] (18) COLLATE Chinese_PRC_CI_AS NULL ,
	[isHtml] [tinyint] NULL ,
	[oldtime] [datetime] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_special_news] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[SpecialID] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[NewsID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_specialdroptemplet] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[SpecialId] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Templet] [varchar] (1000) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_stat_Info] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[vyear] [int] NULL ,
	[vmonth] [int] NULL ,
	[vday] [int] NULL ,
	[vhour] [int] NULL ,
	[vtime] [datetime] NULL ,
	[vweek] [int] NULL ,
	[vip] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[vwhere] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL ,
	[vwheref] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[vcome] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL ,
	[vpage] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL ,
	[vsoft] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[vOS] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[vwidth] [int] NULL ,
	[classid] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_stat_class] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[statid] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[classname] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_stat_content] (
	[today] [bigint] NULL ,
	[yesterday] [bigint] NULL ,
	[vdate] [datetime] NULL ,
	[vtop] [bigint] NULL ,
	[starttime] [datetime] NULL ,
	[vhigh] [bigint] NULL ,
	[vhightime] [datetime] NULL ,
	[classid] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_stat_param] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[SystemName] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[SystemNameE] [nvarchar] (150) COLLATE Chinese_PRC_CI_AS NULL ,
	[ipCheck] [tinyint] NULL ,
	[isOnlinestat] [tinyint] NULL ,
	[ipTime] [int] NULL ,
	[pageNum] [int] NULL ,
	[cookies] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[pointNum] [int] NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_sys_City] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[Cid] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[orderID] [int] NULL ,
	[cityName] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[Pid] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[creatTime] [datetime] NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_sys_Help] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[HelpID] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[TitleCN] [nvarchar] (80) COLLATE Chinese_PRC_CI_AS NULL ,
	[ContentCN] [ntext] COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_sys_Label] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[LabelID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ClassID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Label_Name] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Label_Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[Description] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[CreatTime] [datetime] NOT NULL ,
	[isBack] [tinyint] NOT NULL ,
	[isRecyle] [tinyint] NULL ,
	[isSys] [tinyint] NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[isShare] [tinyint] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_sys_LabelClass] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[ClassID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ClassName] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Content] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[CreatTime] [datetime] NOT NULL ,
	[isRecyle] [tinyint] NOT NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_sys_LabelFree] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[LabelID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[LabelName] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[LabelSQL] [nvarchar] (1000) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[StyleContent] [ntext] COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Description] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[CreatTime] [datetime] NOT NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_sys_LabelStyle] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[styleID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ClassID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[StyleName] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Description] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[CreatTime] [datetime] NOT NULL ,
	[isRecyle] [tinyint] NOT NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_sys_PramUser] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[RegGroupNumber] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[ConstrTF] [tinyint] NULL ,
	[RegTF] [tinyint] NULL ,
	[UserLoginCodeTF] [tinyint] NULL ,
	[CommCodeTF] [tinyint] NULL ,
	[CommCheck] [tinyint] NULL ,
	[SendMessageTF] [tinyint] NULL ,
	[UnRegCommTF] [tinyint] NULL ,
	[CommHTMLLoad] [tinyint] NULL ,
	[Commfiltrchar] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[IPLimt] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[GpointName] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[LoginLock] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[LevelID] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[RegContent] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[setPoint] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[regItem] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[returnemail] [tinyint] NULL ,
	[returnmobile] [tinyint] NULL ,
	[onpayType] [tinyint] NULL ,
	[o_userName] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[o_key] [nvarchar] (128) COLLATE Chinese_PRC_CI_AS NULL ,
	[o_sendurl] [nvarchar] (220) COLLATE Chinese_PRC_CI_AS NULL ,
	[o_returnurl] [nvarchar] (220) COLLATE Chinese_PRC_CI_AS NULL ,
	[o_md5] [nvarchar] (128) COLLATE Chinese_PRC_CI_AS NULL ,
	[o_other1] [nvarchar] (220) COLLATE Chinese_PRC_CI_AS NULL ,
	[o_other2] [nvarchar] (220) COLLATE Chinese_PRC_CI_AS NULL ,
	[o_other3] [nvarchar] (220) COLLATE Chinese_PRC_CI_AS NULL ,
	[GhClass] [tinyint] NULL ,
	[cPointParam] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[aPointparam] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_sys_Pramother] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[FtpTF] [tinyint] NULL ,
	[FTPIP] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[Ftpport] [nvarchar] (5) COLLATE Chinese_PRC_CI_AS NULL ,
	[FtpUserName] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[FTPPASSword] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[RssNum] [int] NULL ,
	[RssContentNum] [int] NULL ,
	[RssTitle] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[RssPicURL] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[WapTF] [tinyint] NULL ,
	[WapPath] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[WapDomain] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[WapLastNum] [int] NULL ,
	[SiteId] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_sys_User] (
	[Id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[UserNum] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[UserName] [nvarchar] (18) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[UserPassword] [nvarchar] (32) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[NickName] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[RealName] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[isAdmin] [tinyint] NOT NULL ,
	[UserGroupNumber] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[PassQuestion] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[PassKey] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[CertType] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[CertNumber] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[Email] [nvarchar] (220) COLLATE Chinese_PRC_CI_AS NULL ,
	[mobile] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[Sex] [tinyint] NULL ,
	[birthday] [datetime] NULL ,
	[Userinfo] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[UserFace] [nvarchar] (220) COLLATE Chinese_PRC_CI_AS NULL ,
	[userFacesize] [nvarchar] (8) COLLATE Chinese_PRC_CI_AS NULL ,
	[marriage] [tinyint] NULL ,
	[iPoint] [int] NOT NULL ,
	[gPoint] [int] NOT NULL ,
	[cPoint] [int] NOT NULL ,
	[ePoint] [int] NOT NULL ,
	[aPoint] [int] NOT NULL ,
	[isLock] [tinyint] NOT NULL ,
	[RegTime] [datetime] NOT NULL ,
	[LastLoginTime] [datetime] NULL ,
	[OnlineTime] [int] NOT NULL ,
	[OnlineTF] [int] NOT NULL ,
	[LoginNumber] [int] NOT NULL ,
	[FriendClass] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[LoginLimtNumber] [int] NULL ,
	[LastIP] [nvarchar] (16) COLLATE Chinese_PRC_CI_AS NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[Addfriend] [int] NULL ,
	[isOpen] [tinyint] NULL ,
	[ParmConstrNum] [int] NULL ,
	[isIDcard] [tinyint] NULL ,
	[IDcardFiles] [nvarchar] (220) COLLATE Chinese_PRC_CI_AS NULL ,
	[Addfriendbs] [tinyint] NULL ,
	[EmailATF] [tinyint] NULL ,
	[EmailCode] [nvarchar] (32) COLLATE Chinese_PRC_CI_AS NULL ,
	[isMobile] [tinyint] NULL ,
	[BindTF] [tinyint] NULL ,
	[MobileCode] [nvarchar] (32) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_sys_UserLevel] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[LevelID] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[LTitle] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Lpicurl] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[iPoint] [int] NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_sys_admin] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[UserNum] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[isSuper] [tinyint] NOT NULL ,
	[adminGroupNumber] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[PopList] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[OnlyLogin] [tinyint] NOT NULL ,
	[isChannel] [tinyint] NOT NULL ,
	[isLock] [tinyint] NOT NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[isChSupper] [tinyint] NULL ,
	[Iplimited] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[verCode] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_sys_admingroup] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[adminGroupNumber] [nvarchar] (8) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[GroupName] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[ClassList] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[SpecialList] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[channelList] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[CreatTime] [datetime] NOT NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_sys_logs] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[title] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[content] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[creatTime] [datetime] NULL ,
	[IP] [nvarchar] (16) COLLATE Chinese_PRC_CI_AS NULL ,
	[usernum] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[ismanage] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_sys_newsIndex] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[TableName] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[CreatTime] [datetime] NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_sys_param] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[SiteName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[SiteDomain] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[IndexTemplet] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[IndexFileName] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[ReadNewsTemplet] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[ClassListTemplet] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[SpecialTemplet] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[FileEXName] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[ReadType] [tinyint] NULL ,
	[LoginTimeOut] [int] NULL ,
	[Email] [nvarchar] (150) COLLATE Chinese_PRC_CI_AS NULL ,
	[LinkType] [tinyint] NULL ,
	[CopyRight] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[CheckInt] [tinyint] NULL ,
	[UnLinkTF] [tinyint] NULL ,
	[LenSearch] [nvarchar] (8) COLLATE Chinese_PRC_CI_AS NULL ,
	[CheckNewsTitle] [tinyint] NULL ,
	[CollectTF] [tinyint] NULL ,
	[SaveClassFilePath] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[SaveIndexPage] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[SaveNewsFilePath] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[SaveNewsDirPath] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[ConstrTF] [tinyint] NULL ,
	[PicServerTF] [tinyint] NULL ,
	[PicServerDomain] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[PicUpLoad] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[UpfilesType] [nvarchar] (150) COLLATE Chinese_PRC_CI_AS NULL ,
	[UpFilesSize] [int] NULL ,
	[RemoteSavePath] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[ReMoteDomainTF] [tinyint] NULL ,
	[RemoteDomain] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[HotNewsJs] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[LastNewsJs] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[RecNewsJS] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[HotCommJS] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[TNewsJS] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[ClassListNum] [int] NULL ,
	[NewsNum] [int] NULL ,
	[BatDelNum] [int] NULL ,
	[SpecialNum] [int] NULL ,
	[Pram_Index] [int] NULL ,
	[InsertPicPosition] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[HistoryNum] [int] NULL ,
	[SiteId] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[publishType] [int] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_sys_parmConstr] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[PCId] [nvarchar] (18) COLLATE Chinese_PRC_CI_AS NULL ,
	[ConstrPayName] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[gPoint] [int] NULL ,
	[iPoint] [int] NULL ,
	[money] [int] NULL ,
	[Gunit] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_sys_parmPrint] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[PrintTF] [tinyint] NULL ,
	[PrintPicTF] [tinyint] NULL ,
	[PrintWord] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Printfontsize] [int] NULL ,
	[Printfontfamily] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[Printfontcolor] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[PrintBTF] [tinyint] NULL ,
	[PintPicURL] [nvarchar] (150) COLLATE Chinese_PRC_CI_AS NULL ,
	[PrintPicsize] [nvarchar] (8) COLLATE Chinese_PRC_CI_AS NULL ,
	[PintPictrans] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[PrintPosition] [tinyint] NULL ,
	[PrintSmallTF] [tinyint] NULL ,
	[PrintSmallSize] [nvarchar] (8) COLLATE Chinese_PRC_CI_AS NULL ,
	[PrintSmallinv] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[PrintSmallSizeStyle] [tinyint] NULL ,
	[SiteId] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_sys_styleclass] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[ClassID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[Sname] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[CreatTime] [datetime] NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[isRecyle] [tinyint] NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_sys_userfields] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[userNum] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[province] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[City] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[Address] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Postcode] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[FaTel] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[WorkTel] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[QQ] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[MSN] [nvarchar] (150) COLLATE Chinese_PRC_CI_AS NULL ,
	[Fax] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[character] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[UserFan] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[Nation] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[nativeplace] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[Job] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[education] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[Lastschool] [nvarchar] (80) COLLATE Chinese_PRC_CI_AS NULL ,
	[orgSch] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_sys_userother] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[ConID] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[address] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[postcode] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[RealName] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[bankName] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[bankaccount] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[bankcard] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[bankRealName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[UserNum] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_user_Card] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[CaID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[CardNumber] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[CardPassWord] [nvarchar] (150) COLLATE Chinese_PRC_CI_AS NULL ,
	[creatTime] [datetime] NULL ,
	[Money] [money] NULL ,
	[Point] [int] NULL ,
	[isBuy] [tinyint] NULL ,
	[isUse] [tinyint] NULL ,
	[isLock] [tinyint] NULL ,
	[UserNum] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[siteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[TimeOutDate] [datetime] NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_user_Constr] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[ConID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[ClassID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[Title] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[creatTime] [datetime] NULL ,
	[Source] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[Tags] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[Author] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[UserNum] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[isCheck] [tinyint] NULL ,
	[PicURL] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[ispass] [tinyint] NULL ,
	[passcontent] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[isadmidel] [tinyint] NULL ,
	[isuserdel] [tinyint] NULL ,
	[Contrflg] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[fileURL] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_user_ConstrClass] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[Ccid] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[UserNum] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[cName] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[creatTime] [datetime] NULL ,
	[Content] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_user_Discuss] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[DisID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[Cname] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[Authority] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[Authoritymoney] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[UserName] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[Browsenumber] [int] NULL ,
	[D_Content] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[D_anno] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[Creatime] [datetime] NULL ,
	[ClassID] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Fundwarehouse] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[GroupSize] [int] NULL ,
	[GroupPerNum] [int] NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_user_DiscussActive] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[AId] [nvarchar] (18) COLLATE Chinese_PRC_CI_AS NULL ,
	[Activesubject] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[ActivePlace] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[ActiveExpense] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Anum] [int] NULL ,
	[ActivePlan] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[Contactmethod] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Cutofftime] [datetime] NULL ,
	[CreaTime] [datetime] NULL ,
	[UserName] [nvarchar] (18) COLLATE Chinese_PRC_CI_AS NULL ,
	[AJurisdiction] [int] NULL ,
	[ALabel] [int] NULL ,
	[FileWay] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Filename] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[siteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_user_DiscussActiveMember] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[AId] [nvarchar] (18) COLLATE Chinese_PRC_CI_AS NULL ,
	[PId] [nvarchar] (18) COLLATE Chinese_PRC_CI_AS NULL ,
	[UserNum] [nvarchar] (18) COLLATE Chinese_PRC_CI_AS NULL ,
	[Telephone] [nvarchar] (18) COLLATE Chinese_PRC_CI_AS NULL ,
	[ParticipationNum] [int] NULL ,
	[isCompanion] [int] NULL ,
	[CreaTime] [datetime] NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_user_DiscussClass] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[DcID] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Cname] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Content] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[Creatime] [datetime] NULL ,
	[indexnumber] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[beordered] [int] NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[UserNum] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_user_DiscussContribute] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[Member] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[Membermoney] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[DisID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[Creatime] [datetime] NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_user_DiscussMember] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[Member] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[DisID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[UserNum] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[Creatime] [datetime] NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_user_DiscussTopic] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[DtID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[Title] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[UserNum] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[ParentID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[IP] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[creatTime] [datetime] NULL ,
	[VoteTF] [tinyint] NULL ,
	[voteTime] [datetime] NULL ,
	[DisID] [nvarchar] (18) COLLATE Chinese_PRC_CI_AS NULL ,
	[source] [tinyint] NULL ,
	[DtUrl] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_user_Friend] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[FriendUserNum] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[UserNum] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[bUserNum] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[UserName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[HailFellow] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[CreatTime] [datetime] NULL ,
	[hyyz] [tinyint] NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_user_FriendClass] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[UserNum] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[FriendName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Content] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[CreatTime] [datetime] NULL ,
	[HailFellow] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[gdfz] [int] NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_user_Ghistory] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[GhID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[ghtype] [tinyint] NULL ,
	[Gpoint] [int] NULL ,
	[iPoint] [int] NULL ,
	[Money] [money] NULL ,
	[CreatTime] [datetime] NULL ,
	[UserNUM] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[gtype] [tinyint] NULL ,
	[content] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_user_Group] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[GroupNumber] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[GroupName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[iPoint] [int] NULL ,
	[Gpoint] [int] NULL ,
	[Rtime] [int] NULL ,
	[Discount] [float] NULL ,
	[LenCommContent] [int] NULL ,
	[CommCheckTF] [tinyint] NULL ,
	[PostCommTime] [int] NULL ,
	[upfileType] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[upfileNum] [int] NULL ,
	[upfileSize] [int] NULL ,
	[DayUpfilenum] [int] NULL ,
	[ContrNum] [int] NULL ,
	[DicussTF] [tinyint] NULL ,
	[PostTitle] [tinyint] NULL ,
	[ReadUser] [tinyint] NULL ,
	[MessageNum] [int] NULL ,
	[MessageGroupNum] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[IsCert] [tinyint] NULL ,
	[CharTF] [tinyint] NULL ,
	[CharHTML] [tinyint] NULL ,
	[CharLenContent] [int] NULL ,
	[RegMinute] [int] NULL ,
	[PostTitleHTML] [tinyint] NULL ,
	[DelSelfTitle] [tinyint] NULL ,
	[DelOTitle] [tinyint] NULL ,
	[EditSelfTitle] [tinyint] NULL ,
	[EditOtitle] [tinyint] NULL ,
	[ReadTitle] [tinyint] NULL ,
	[MoveSelfTitle] [tinyint] NULL ,
	[MoveOTitle] [tinyint] NULL ,
	[TopTitle] [tinyint] NULL ,
	[GoodTitle] [tinyint] NULL ,
	[LockUser] [tinyint] NULL ,
	[UserFlag] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[CheckTtile] [tinyint] NULL ,
	[IPTF] [tinyint] NULL ,
	[EncUser] [tinyint] NULL ,
	[OCTF] [tinyint] NULL ,
	[StyleTF] [tinyint] NULL ,
	[UpfaceSize] [int] NULL ,
	[GIChange] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[GTChageRate] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[LoginPoint] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[RegPoint] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[GroupTF] [tinyint] NULL ,
	[GroupSize] [int] NULL ,
	[GroupPerNum] [int] NULL ,
	[GroupCreatNum] [int] NULL ,
	[CreatTime] [datetime] NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_user_Guser] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[UserNum] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[InfoID] [int] NULL ,
	[CreatTime] [datetime] NOT NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[ErrorNum] [int] NOT NULL ,
	[IP] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[LastErrorTime] [datetime] NOT NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_user_MessFiles] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[MfID] [nvarchar] (18) COLLATE Chinese_PRC_CI_AS NULL ,
	[mID] [nvarchar] (18) COLLATE Chinese_PRC_CI_AS NULL ,
	[UserNum] [nvarchar] (16) COLLATE Chinese_PRC_CI_AS NULL ,
	[FileName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[IsDown] [tinyint] NULL ,
	[FileUrl] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[Content] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[CreatTime] [datetime] NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_user_Message] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[Mid] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[UserNum] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[Title] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[CreatTime] [datetime] NULL ,
	[Send_DateTime] [datetime] NULL ,
	[SortType] [tinyint] NULL ,
	[Rec_UserNum] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[FileTF] [tinyint] NULL ,
	[MakeList] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[AppointTimeTF] [tinyint] NULL ,
	[AppointTime] [datetime] NULL ,
	[LevelFlag] [tinyint] NULL ,
	[issDel] [tinyint] NULL ,
	[issRecyle] [tinyint] NULL ,
	[isRdel] [tinyint] NULL ,
	[isRecyle] [tinyint] NULL ,
	[isRead] [tinyint] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_user_Photo] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[PhotoalbumID] [nvarchar] (18) COLLATE Chinese_PRC_CI_AS NULL ,
	[PhotoID] [nvarchar] (18) COLLATE Chinese_PRC_CI_AS NULL ,
	[PhotoName] [nvarchar] (18) COLLATE Chinese_PRC_CI_AS NULL ,
	[PhotoContent] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[PhotoUrl] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[PhotoTime] [datetime] NULL ,
	[UserNum] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_user_Photoalbum] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[PhotoalbumID] [nvarchar] (18) COLLATE Chinese_PRC_CI_AS NULL ,
	[PhotoalbumName] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[DisID] [nvarchar] (18) COLLATE Chinese_PRC_CI_AS NULL ,
	[ClassID] [nvarchar] (18) COLLATE Chinese_PRC_CI_AS NULL ,
	[UserName] [nvarchar] (18) COLLATE Chinese_PRC_CI_AS NULL ,
	[PhotoalbumJurisdiction] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[isDisPhotoalbum] [tinyint] NULL ,
	[pwd] [nvarchar] (18) COLLATE Chinese_PRC_CI_AS NULL ,
	[PhotoalbumUrl] [nvarchar] (220) COLLATE Chinese_PRC_CI_AS NULL ,
	[Creatime] [datetime] NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_user_PhotoalbumClass] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[ClassID] [nvarchar] (18) COLLATE Chinese_PRC_CI_AS NULL ,
	[ClassName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Creatime] [datetime] NULL ,
	[UserName] [nvarchar] (18) COLLATE Chinese_PRC_CI_AS NULL ,
	[isDisclass] [tinyint] NULL ,
	[DisID] [nvarchar] (18) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_user_Requestinformation] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[qUsername] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[bUsername] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[datatime] [datetime] NULL ,
	[Content] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[ischick] [tinyint] NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_user_constrPay] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[constrPayID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[userNum] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[Money] [int] NULL ,
	[payTime] [datetime] NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[payAdmin] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_user_news] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[newsID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[Title] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[content] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[creatTime] [datetime] NULL ,
	[GroupNumber] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[getPoint] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[SiteId] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[isLock] [tinyint] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_user_note] (
	[id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[infoType] [tinyint] NULL ,
	[infoID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[logTime] [datetime] NULL ,
	[IP] [nvarchar] (16) COLLATE Chinese_PRC_CI_AS NULL ,
	[UserNum] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_user_userlogs] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[logID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[Title] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[content] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[creatTime] [datetime] NULL ,
	[dateNum] [smallint] NULL ,
	[LogDateTime] [datetime] NULL ,
	[userNum] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_user_vote] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[DtID] [nvarchar] (18) COLLATE Chinese_PRC_CI_AS NULL ,
	[VoteID] [nvarchar] (18) COLLATE Chinese_PRC_CI_AS NULL ,
	[votegenre] [tinyint] NULL ,
	[Voteitem] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[VoteNum] [int] NULL ,
	[CreaTime] [datetime] NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_vote_Item] (
	[IID] [int] IDENTITY (1, 1) NOT NULL ,
	[TID] [int] NULL ,
	[ItemName] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[ItemValue] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[ItemMode] [tinyint] NULL ,
	[PicSrc] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[DisColor] [nvarchar] (7) COLLATE Chinese_PRC_CI_AS NULL ,
	[VoteCount] [int] NULL ,
	[ItemDetail] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [ys_vote_Steps] (
	[SID] [int] IDENTITY (1, 1) NOT NULL ,
	[TIDS] [int] NULL ,
	[Steps] [int] NULL ,
	[TIDU] [int] NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_vote_class] (
	[VID] [int] IDENTITY (1, 1) NOT NULL ,
	[ClassName] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[Description] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_vote_manage] (
	[RID] [int] IDENTITY (1, 1) NOT NULL ,
	[IID] [int] NULL ,
	[TID] [int] NULL ,
	[OtherContent] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[VoteIp] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[VoteTime] [datetime] NULL ,
	[UserNumber] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_vote_param] (
	[SysID] [int] IDENTITY (1, 1) NOT NULL ,
	[IPtime] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[IsReg] [tinyint] NULL ,
	[IpLimit] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

CREATE TABLE [ys_vote_title] (
	[TID] [int] IDENTITY (1, 1) NOT NULL ,
	[VID] [int] NULL ,
	[Title] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Type] [tinyint] NULL ,
	[MaxNum] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[DisMode] [tinyint] NULL ,
	[StartDate] [datetime] NULL ,
	[EndDate] [datetime] NULL ,
	[ItemMode] [tinyint] NULL ,
	[isSteps] [tinyint] NULL ,
	[SiteID] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
;

ALTER TABLE [ys_Attachments] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_fileinfo] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_Collect_News] WITH NOCHECK ADD 
	CONSTRAINT [PK_Collect_News] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_Collect_Rule] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_Rule] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_Collect_RuleApply] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_Collect_RuleRender] PRIMARY KEY  CLUSTERED 
	(
		[SiteID]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_Collect_Site] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_Site] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_Collect_SiteFolder] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_SiteFolder] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_News_URL] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_News_URL] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_User_URL] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_User_URL] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_User_URLClass] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_User_URLClass] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_ads] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_ads] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_ads_class] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_ads_class] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_ads_stat] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_ads_stat] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_adstxt] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_adstxt] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_api_commentary] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_API_commentary] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_api_faviate] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_API_Faviate] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_api_navi] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_api_navi] PRIMARY KEY  CLUSTERED 
	(
		[am_ID]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_classdroptemplet] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_classdroptemplet] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_customform] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_customform] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_customform_item] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_customform_field] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_define_class] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_Define_Class] PRIMARY KEY  CLUSTERED 
	(
		[DefineId]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_define_data] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_Define_Data] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_define_save] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_define_save] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_friend_class] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_friend_class] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_friend_link] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_friend_link] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_friend_pram] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_friend_pram] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_news] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_News] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_news_Class] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_news_Class] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_news_Gen] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_News_Gen] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_news_JS] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_News_JS] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_news_JSFile] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_News_JSFile] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_news_JST_Class] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_JSTemplets_Class] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_news_JSTemplet] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_News_JSTemplet] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_news_page] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_news_page] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_news_site] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_News_site] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_news_special] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_News_special] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_news_sub] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_News_Sub] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_news_topline] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_news_topline] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_news_unNews] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_News_unNews] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_news_vote] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_news_vote] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_newsdroptemplet] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_newsdroptemplet] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_old_news] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_old_News] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_special_news] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_Special_News] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_specialdroptemplet] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_specialdroptemplet] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_stat_Info] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_stat_Info] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_stat_class] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_stat_class] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_stat_param] WITH NOCHECK ADD 
	CONSTRAINT [PK_statParam] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_sys_City] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_Sys_City] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_sys_Help] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_sys_Help] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_sys_Label] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_sys_Label] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_sys_LabelClass] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_sys_LabelClass] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_sys_LabelFree] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_sys_LabelFree] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_sys_LabelStyle] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_sys_LabelStyle] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_sys_PramUser] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_SYS_UserPram] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_sys_Pramother] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_sys_pramother] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_sys_User] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_sys_User] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_sys_UserLevel] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_Sys_UserLevel] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_sys_admin] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_sys_admin] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_sys_admingroup] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_sys_AdminGroup] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_sys_logs] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_sys_logs] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_sys_newsIndex] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_sys_newsIndex] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_sys_param] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_sys_Param] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_sys_parmConstr] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_sys_ParmConstr] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_sys_parmPrint] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_SYS_ParmPrint] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_sys_styleclass] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_sys_styleclass] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_sys_userfields] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_sys_userfields] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_sys_userother] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_sys_userother] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_user_Card] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_User_Card] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_user_Constr] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_User_Constr] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_user_ConstrClass] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_User_ConstrClass] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_user_Discuss] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_user_Discuss] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_user_DiscussActive] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_user_DiscussActive] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_user_DiscussActiveMember] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_user_DiscussActiveMember] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_user_DiscussClass] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_user_DiscussClass] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_user_DiscussContribute] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_user_DiscussContribute] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_user_DiscussMember] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_user_DiscussMember] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_user_DiscussTopic] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_User_DiscussTopic] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_user_Friend] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_User_Friend] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_user_FriendClass] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_User_FriendClass] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_user_Ghistory] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_User_Ghistory] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_user_Group] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_User_Group] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_user_Guser] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_User_Guser] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_user_MessFiles] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_User_MessFiles] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_user_Message] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_User_Message] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_user_Photo] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_user_Photo] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_user_Photoalbum] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_user_Photoalbum] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_user_PhotoalbumClass] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_user_PhotoalbumClass] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_user_Requestinformation] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_User_requestinformation] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_user_constrPay] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_user_constrPay] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_user_news] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_user_news] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_user_note] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_user_note] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_user_userlogs] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_user_userlogs] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_user_vote] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_User_Vote] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_vote_Item] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_vote_Item] PRIMARY KEY  CLUSTERED 
	(
		[IID]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_vote_Steps] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_vote_Steps] PRIMARY KEY  CLUSTERED 
	(
		[SID]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_vote_class] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_vote_Class] PRIMARY KEY  CLUSTERED 
	(
		[VID]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_vote_manage] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_vote_Manage] PRIMARY KEY  CLUSTERED 
	(
		[RID]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_vote_param] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_vote_Pram] PRIMARY KEY  CLUSTERED 
	(
		[SysID]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_vote_title] WITH NOCHECK ADD 
	CONSTRAINT [PK_ys_vote_Title] PRIMARY KEY  CLUSTERED 
	(
		[TID]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_Collect_News] ADD 
	CONSTRAINT [DF__ys_News__History__32AB8735] DEFAULT (0) FOR [History],
	CONSTRAINT [DF__ys_News__RecTF__3493CFA7] DEFAULT (0) FOR [RecTF],
	CONSTRAINT [DF__ys_News__TodayNe__3587F3E0] DEFAULT (0) FOR [TodayNewsTF],
	CONSTRAINT [DF__ys_News__Marquee__367C1819] DEFAULT (0) FOR [MarqueeNews],
	CONSTRAINT [DF__ys_News__SBSNews__37703C52] DEFAULT (0) FOR [SBSNews],
	CONSTRAINT [DF__ys_News__ReviewT__3864608B] DEFAULT (0) FOR [ReviewTF]
;

ALTER TABLE [ys_Collect_Rule] ADD 
	CONSTRAINT [DF_ys_Collect_Rule_IgnoreCase] DEFAULT (1) FOR [IgnoreCase]
;

ALTER TABLE [ys_Collect_Site] ADD 
	CONSTRAINT [DF__ys_Site__MaxNum__3C34F16F] DEFAULT (0) FOR [MaxNum],
	CONSTRAINT [DF__ys_Site__OtherTy__3D2915A8] DEFAULT (0) FOR [OtherType],
	CONSTRAINT [DF__ys_Site__OtherNe__3E1D39E1] DEFAULT (0) FOR [OtherNewsType],
	CONSTRAINT [DF__ys_Site__IsAutoC__3F115E1A] DEFAULT (0) FOR [IsAutoCollect],
	CONSTRAINT [DF__ys_Site__Collect__40058253] DEFAULT (0) FOR [CollectDate],
	CONSTRAINT [DF__ys_Site__TextTF__41EDCAC5] DEFAULT (0) FOR [TextTF],
	CONSTRAINT [DF__ys_Site__SaveRem__42E1EEFE] DEFAULT (0) FOR [SaveRemotePic],
	CONSTRAINT [DF__ys_Site__Audit__43D61337] DEFAULT (1) FOR [Audit],
	CONSTRAINT [DF__ys_Site__IsStyle__44CA3770] DEFAULT (0) FOR [IsStyle],
	CONSTRAINT [DF__ys_Site__IsDIV__45BE5BA9] DEFAULT (0) FOR [IsDIV],
	CONSTRAINT [DF__ys_Site__IsA__46B27FE2] DEFAULT (0) FOR [IsA],
	CONSTRAINT [DF__ys_Site__IsClass__47A6A41B] DEFAULT (0) FOR [IsClass],
	CONSTRAINT [DF__ys_Site__IsFont__489AC854] DEFAULT (0) FOR [IsFont],
	CONSTRAINT [DF__ys_Site__IsSpan__498EEC8D] DEFAULT (0) FOR [IsSpan],
	CONSTRAINT [DF__ys_Site__IsObjec__4A8310C6] DEFAULT (0) FOR [IsObject],
	CONSTRAINT [DF__ys_Site__IsIFram__4B7734FF] DEFAULT (0) FOR [IsIFrame],
	CONSTRAINT [DF__ys_Site__IsScrip__4C6B5938] DEFAULT (0) FOR [IsScript],
	CONSTRAINT [DF__ys_Site__IsAutoP__5224328E] DEFAULT (0) FOR [IsAutoPicNews]
;

ALTER TABLE [ys_api_commentary] ADD 
	CONSTRAINT [DF_ys_api_commentary_isRecyle] DEFAULT (0) FOR [isRecyle],
	CONSTRAINT [DF_ys_api_commentary_OrderID] DEFAULT (0) FOR [OrderID],
	CONSTRAINT [DF_ys_api_commentary_GoodTitle] DEFAULT (0) FOR [GoodTitle],
	CONSTRAINT [DF_ys_api_commentary_isCheck] DEFAULT (0) FOR [isCheck]
;

ALTER TABLE [ys_define_class] ADD 
	CONSTRAINT [DF_ys_Define_Class_ParentId] DEFAULT (0) FOR [ParentInfoId]
;

ALTER TABLE [ys_friend_class] ADD 
	CONSTRAINT [DF_ys_friend_class_ParentID] DEFAULT (0) FOR [ParentID]
;

ALTER TABLE [ys_news] ADD 
	CONSTRAINT [DF_ys_News_OrderID] DEFAULT (50) FOR [OrderID],
	CONSTRAINT [DF_ys_News_Click] DEFAULT (0) FOR [Click],
	CONSTRAINT [DF_ys_News_CheckStat] DEFAULT ('0|0|0') FOR [CheckStat],
	CONSTRAINT [DF_ys_News_isLock] DEFAULT (0) FOR [isLock],
	CONSTRAINT [DF_ys_News_isRecyle] DEFAULT (0) FOR [isRecyle]
;

ALTER TABLE [ys_news_Gen] ADD 
	CONSTRAINT [DF_ys_News_Gen_isLock] DEFAULT (0) FOR [isLock]
;

ALTER TABLE [ys_news_JS] ADD 
	CONSTRAINT [IX_ys_news_JS] UNIQUE  NONCLUSTERED 
	(
		[JsID]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_news_JSFile] ADD 
	CONSTRAINT [DF_ys_news_JSFile_ReclyeTF] DEFAULT (0) FOR [ReclyeTF]
;

ALTER TABLE [ys_news_JST_Class] ADD 
	CONSTRAINT [IX_ys_news_JST_Class] UNIQUE  NONCLUSTERED 
	(
		[ClassID]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_news_JSTemplet] ADD 
	CONSTRAINT [DF_ys_news_JSTemplet_jsTType] DEFAULT (0) FOR [JSTType],
	CONSTRAINT [IX_ys_news_JSTemplet] UNIQUE  NONCLUSTERED 
	(
		[TempletID]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_news_site] ADD 
	CONSTRAINT [DF_ys_news_site_isRecyle] DEFAULT (0) FOR [isRecyle],
	CONSTRAINT [IX_ys_news_site] UNIQUE  NONCLUSTERED 
	(
		[EName]
	)  ON [PRIMARY] ,
	CONSTRAINT [IX_ys_news_site_1] UNIQUE  NONCLUSTERED 
	(
		[ChannelID]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_news_topline] ADD 
	CONSTRAINT [DF_ys_news_topline_TodayPic_space] DEFAULT (0) FOR [tl_space],
	CONSTRAINT [DF_ys_news_topline_TodayWidth] DEFAULT (300) FOR [tl_Width]
;

ALTER TABLE [ys_old_news] ADD 
	CONSTRAINT [DF_ys_old_News_OrderID] DEFAULT (50) FOR [OrderID],
	CONSTRAINT [DF_ys_old_News_Click] DEFAULT (0) FOR [Click],
	CONSTRAINT [DF_ys_old_News_CheckStat] DEFAULT ('0|0|0') FOR [CheckStat],
	CONSTRAINT [DF_ys_old_News_isLock] DEFAULT (0) FOR [isLock],
	CONSTRAINT [DF_ys_old_News_isRecyle] DEFAULT (0) FOR [isRecyle]
;

ALTER TABLE [ys_stat_content] ADD 
	CONSTRAINT [DF_ys_stat_content_today] DEFAULT (1) FOR [today],
	CONSTRAINT [DF_ys_stat_content_yesterday] DEFAULT (0) FOR [yesterday],
	CONSTRAINT [DF_ys_stat_content_vdate] DEFAULT (0 - 0 - 0) FOR [vdate],
	CONSTRAINT [DF_ys_stat_content_vtop] DEFAULT (1) FOR [vtop],
	CONSTRAINT [DF_ys_stat_content_starttime] DEFAULT (0 - 0 - 0) FOR [starttime],
	CONSTRAINT [DF_ys_stat_content_vhigh] DEFAULT (1) FOR [vhigh],
	CONSTRAINT [DF_ys_stat_content_vhightime] DEFAULT (0 - 0 - 0) FOR [vhightime]
;

ALTER TABLE [ys_stat_param] ADD 
	CONSTRAINT [DF_ys_stat_param_ipCheck] DEFAULT (0) FOR [ipCheck],
	CONSTRAINT [DF_ys_stat_param_isOnlinestat] DEFAULT (1) FOR [isOnlinestat]
;

ALTER TABLE [ys_sys_LabelFree] ADD 
	CONSTRAINT [IX_ys_sys_LabelFree] UNIQUE  NONCLUSTERED 
	(
		[LabelID]
	)  ON [PRIMARY] 
;

ALTER TABLE [ys_sys_PramUser] ADD 
	CONSTRAINT [DF_ys_sys_PramUser_GhClass] DEFAULT (1) FOR [GhClass]
;

ALTER TABLE [ys_sys_User] ADD 
	CONSTRAINT [DF_ys_sys_User_Sex] DEFAULT (0) FOR [Sex],
	CONSTRAINT [DF_ys_sys_User_marriage] DEFAULT (0) FOR [marriage],
	CONSTRAINT [DF_ys_sys_User_iPoint] DEFAULT (0) FOR [iPoint],
	CONSTRAINT [DF_ys_sys_User_gPoint] DEFAULT (0) FOR [gPoint],
	CONSTRAINT [DF_ys_sys_User_cPoint] DEFAULT (0) FOR [cPoint],
	CONSTRAINT [DF_ys_sys_User_ePoint] DEFAULT (0) FOR [ePoint],
	CONSTRAINT [DF_ys_sys_User_aPoint] DEFAULT (0) FOR [aPoint],
	CONSTRAINT [DF_ys_sys_User_isLock] DEFAULT (0) FOR [isLock],
	CONSTRAINT [DF_ys_sys_User_OnlineTime] DEFAULT (0) FOR [OnlineTime],
	CONSTRAINT [DF_ys_sys_User_OnlineTF] DEFAULT (0) FOR [OnlineTF],
	CONSTRAINT [DF_ys_sys_User_LoginNumber] DEFAULT (0) FOR [LoginNumber],
	CONSTRAINT [DF_ys_sys_User_LoginLimtNumber] DEFAULT (0) FOR [LoginLimtNumber],
	CONSTRAINT [DF_ys_sys_User_Addfriend] DEFAULT (2) FOR [Addfriend],
	CONSTRAINT [DF_ys_sys_User_isOpen] DEFAULT (0) FOR [isOpen],
	CONSTRAINT [DF_ys_sys_User_ParmConstrNum] DEFAULT (0) FOR [ParmConstrNum],
	CONSTRAINT [DF_ys_sys_User_isIDcard] DEFAULT (0) FOR [isIDcard],
	CONSTRAINT [DF_ys_sys_User_friendEstablishment] DEFAULT (2) FOR [Addfriendbs],
	CONSTRAINT [DF_ys_sys_User_EmailATF] DEFAULT (0) FOR [EmailATF],
	CONSTRAINT [DF_ys_sys_User_isMobile] DEFAULT (0) FOR [isMobile],
	CONSTRAINT [DF_ys_sys_User_BindTF] DEFAULT (0) FOR [BindTF]
;

ALTER TABLE [ys_sys_UserLevel] ADD 
	CONSTRAINT [DF_ys_Sys_UserLevel_iPoint] DEFAULT (0) FOR [iPoint]
;

ALTER TABLE [ys_sys_param] ADD 
	CONSTRAINT [DF_ys_sys_Param_ConstrTF] DEFAULT (1) FOR [ConstrTF],
	CONSTRAINT [DF_ys_sys_Param_PicServerTF] DEFAULT (0) FOR [PicServerTF],
	CONSTRAINT [DF_ys_sys_Param_ReMoteDomainTF] DEFAULT (1) FOR [ReMoteDomainTF],
	CONSTRAINT [DF_ys_sys_Param_Pram_Index] DEFAULT (10) FOR [Pram_Index],
	CONSTRAINT [DF_ys_sys_param_SiteId] DEFAULT (0) FOR [SiteId],
	CONSTRAINT [DF_ys_sys_param_publishType] DEFAULT (0) FOR [publishType]
;

ALTER TABLE [ys_sys_styleclass] ADD 
	CONSTRAINT [DF_ys_sys_styleclass_isRecyle] DEFAULT (0) FOR [isRecyle]
;

ALTER TABLE [ys_user_Discuss] ADD 
	CONSTRAINT [DF_ys_user_Discuss_Browsenumber] DEFAULT (0) FOR [Browsenumber]
;

ALTER TABLE [ys_user_DiscussActive] ADD 
	CONSTRAINT [DF_ys_user_DiscussActive_AJurisdiction] DEFAULT (0) FOR [AJurisdiction]
;

ALTER TABLE [ys_user_Group] ADD 
	CONSTRAINT [DF_ys_user_Group_MessageGroupNum] DEFAULT (0 | 0) FOR [MessageGroupNum]
;

ALTER TABLE [ys_user_Message] ADD 
	CONSTRAINT [DF_ys_user_Message_islock] DEFAULT (0) FOR [isRead]
;

ALTER TABLE [ys_vote_title] ADD 
	CONSTRAINT [DF_ys_vote_Title_isSteps] DEFAULT (0) FOR [isSteps]
;

ALTER TABLE [ys_Collect_RuleApply] ADD 
	CONSTRAINT [FK_ys_Collect_RuleRender_ys_Collect_Rule] FOREIGN KEY 
	(
		[RuleID]
	) REFERENCES [ys_Collect_Rule] (
		[ID]
	)
;

