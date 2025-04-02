using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace HRMS_Web.Services
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IJobHistoryService" in both code and config file together.
    [ServiceContract]
    public interface IJobHistoryService
    {
        [OperationContract]
        JobHistoryData Get();

        [OperationContract]
        void Insert(string employee, string manager, string jobrole, string startdate, string enddate, string status, string comments);

        [OperationContract]
        void Update(int Id, string employee, string manager, string jobrole, string startdate, string enddate, string status, string comments);

        [OperationContract]
        void Delete(int Id);
    }

    [DataContract]
    public class JobHistoryData
    {
        public JobHistoryData()
        {
            this.JobHistoryTable = new DataTable("JobHistory");
        }

        [DataMember]
        public DataTable JobHistoryTable { get; set; }
    }
}