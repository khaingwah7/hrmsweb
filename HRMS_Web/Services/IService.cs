using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace HRMS_Web.Services
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService" in both code and config file together.
    [ServiceContract]
    public interface IService
    {
        [OperationContract]
        EmployeeData Get();

        [OperationContract]
        void Insert(string name, string date, string phone, string email, string gender, string address, string status);

        [OperationContract]
        void Update(int employeeId, string name, string date, string phone, string email, string gender, string address, string status);

        [OperationContract]
        void Delete(int employeeId);
    }

    [DataContract]
    public class EmployeeData
    {
        public EmployeeData()
        {
            this.EmployeeTable = new DataTable("Employee");
        }

        [DataMember]
        public DataTable EmployeeTable { get; set; }
    }
}

