using System;
using System.Data;
using System.Collections.Generic;
using YSCMS.Common;
using YSCMS.Model;
using YSCMS.DALFactory;
using YSCMS.IDAL;
namespace YSCMS.CMS
{
    /// <summary>
    /// DefineSave
    /// </summary>
    public partial class DefineSave
    {
        private readonly IDefineSave dal = DataAccess.CreateDefineSave();
        public DefineSave()
        { }
        #region  Method
        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(string DsNewsID)
        {
            return dal.Exists(DsNewsID);
        }

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public bool Add(YSCMS.Model.DefineSave model)
        {
            return dal.Add(model);
        }

        /// <summary>
        /// 更新一条数据
        /// </summary>
        public bool Update(YSCMS.Model.DefineSave model)
        {
            return dal.Update(model);
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public bool Delete(string DsNewsID)
        {

            return dal.Delete(DsNewsID);
        }
        /// <summary>
        /// 删除一条数据
        /// </summary>
        public bool DeleteList(string DsNewsIDlist)
        {
            return dal.DeleteList(DsNewsIDlist);
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public YSCMS.Model.DefineSave GetModel(string DsNewsID)
        {

            return dal.GetModel(DsNewsID);
        }

        /// <summary>
        /// 得到一个对象实体，从缓存中
        /// </summary>
        public YSCMS.Model.DefineSave GetModelByCache(string DsNewsID)
        {

            string CacheKey = "DefineSaveModel-" + DsNewsID;
            object objModel = Common.DataCache.GetCache(CacheKey);
            if (objModel == null)
            {
                try
                {
                    objModel = dal.GetModel(DsNewsID);
                    if (objModel != null)
                    {
                        int ModelCache = Common.ConfigHelper.GetConfigInt("ModelCache");
                        Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
                    }
                }
                catch { }
            }
            return (YSCMS.Model.DefineSave)objModel;
        }

        /// <summary>
        /// 获得数据列表
        /// </summary>
        public DataTable GetList(string strWhere)
        {
            return dal.GetList(strWhere);
        }
        /// <summary>
        /// 获得前几行数据
        /// </summary>
        public DataTable GetList(int Top, string strWhere, string filedOrder)
        {
            return dal.GetList(Top, strWhere, filedOrder);
        }
        /// <summary>
        /// 获得数据列表
        /// </summary>
        public List<YSCMS.Model.DefineSave> GetModelList(string strWhere)
        {
            DataTable ds = dal.GetList(strWhere);
            return DataTableToList(ds);
        }
        /// <summary>
        /// 获得数据列表
        /// </summary>
        public List<YSCMS.Model.DefineSave> DataTableToList(DataTable dt)
        {
            List<YSCMS.Model.DefineSave> modelList = new List<YSCMS.Model.DefineSave>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                YSCMS.Model.DefineSave model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new YSCMS.Model.DefineSave();
                    if (dt.Rows[n]["id"] != null && dt.Rows[n]["id"].ToString() != "")
                    {
                        model.id = int.Parse(dt.Rows[n]["id"].ToString());
                    }
                    if (dt.Rows[n]["DsNewsID"] != null && dt.Rows[n]["DsNewsID"].ToString() != "")
                    {
                        model.DsNewsID = dt.Rows[n]["DsNewsID"].ToString();
                    }
                    if (dt.Rows[n]["DsEname"] != null && dt.Rows[n]["DsEname"].ToString() != "")
                    {
                        model.DsEname = dt.Rows[n]["DsEname"].ToString();
                    }
                    if (dt.Rows[n]["DsNewsTable"] != null && dt.Rows[n]["DsNewsTable"].ToString() != "")
                    {
                        model.DsNewsTable = dt.Rows[n]["DsNewsTable"].ToString();
                    }
                    if (dt.Rows[n]["DsType"] != null && dt.Rows[n]["DsType"].ToString() != "")
                    {
                        model.DsType = int.Parse(dt.Rows[n]["DsType"].ToString());
                    }
                    if (dt.Rows[n]["DsContent"] != null && dt.Rows[n]["DsContent"].ToString() != "")
                    {
                        model.DsContent = dt.Rows[n]["DsContent"].ToString();
                    }
                    if (dt.Rows[n]["DsApiID"] != null && dt.Rows[n]["DsApiID"].ToString() != "")
                    {
                        model.DsApiID = dt.Rows[n]["DsApiID"].ToString();
                    }
                    if (dt.Rows[n]["SiteID"] != null && dt.Rows[n]["SiteID"].ToString() != "")
                    {
                        model.SiteID = dt.Rows[n]["SiteID"].ToString();
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        /// <summary>
        /// 获得数据列表
        /// </summary>
        public DataTable GetAllList()
        {
            return GetList("");
        }

        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        public int GetRecordCount(string strWhere)
        {
            return dal.GetRecordCount(strWhere);
        }
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        public DataTable GetListByPage(string strWhere, string orderby, int startIndex, int endIndex)
        {
            return dal.GetListByPage(strWhere, orderby, startIndex, endIndex);
        }
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        //public DataTable GetList(int PageSize,int PageIndex,string strWhere)
        //{
        //return dal.GetList(PageSize,PageIndex,strWhere);
        //}

        #endregion  Method
    }
}

