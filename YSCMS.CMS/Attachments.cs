using System;
using System.Collections.Generic;
using System.Text;
using YSCMS.Model;
using YSCMS.DALFactory;
using YSCMS.IDAL;
using System.Data;

namespace YSCMS.CMS
{
    public class Attachments
    {
        private readonly IAttachments dal = DataAccess.CreateAttachments();
        public Attachments()
        { }
        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(YSCMS.Model.Attachments model)
        {
            return dal.Add(model);
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public bool Delete(int Id)
        {

            return dal.Delete(Id);
        }
        /// <summary>
        /// 删除一条数据
        /// </summary>
        public bool DeleteList(string Idlist)
        {
            return dal.DeleteList(Idlist);
        }

        /// <summary>
        /// 分页获取数据
        /// </summary>
        /// <param name="fileType"></param>
        /// <param name="PageIndex"></param>
        /// <param name="PageSize"></param>
        /// <param name="RecordCount"></param>
        /// <param name="PageCount"></param>
        /// <returns></returns>
        public DataTable GetPage(string fileType, string beginDate, string endDate, int PageIndex, int PageSize, out int RecordCount, out int PageCount)
        {
            return dal.GetPage(fileType, beginDate, endDate, PageIndex, PageSize, out RecordCount, out PageCount);
        }
    }
}
