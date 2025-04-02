using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Runtime.InteropServices.ComTypes;
using System.Xml.Linq;

namespace HRMS_Web.Services
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "JobHistoryService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select JobHistoryService.svc or JobHistoryService.svc.cs at the Solution Explorer and start debugging.
    public class JobHistoryService : IJobHistoryService
    {
        public JobHistoryData Get()
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Id, Employee, Manager, JobRole, StartDate, EndDate, Status, Comments FROM JobHistory"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            JobHistoryData jobhistory = new JobHistoryData();
                            sda.Fill(jobhistory.JobHistoryTable);
                            return jobhistory;
                        }
                    }
                }
            }
        }

        public void Insert(string employee, string manager, string jobrole, string startdate, string enddate, string status, string comments)
        {
            try
            {
                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO JobHistory (Employee, Manager, JobRole, StartDate, EndDate, Status, Comments) VALUES (@Employee, @Manager, @JobRole, @StartDate, @EndDate, @Status, @Comments)"))
                    {
                        cmd.Parameters.AddWithValue("@Employee", employee);
                        cmd.Parameters.AddWithValue("@Manager", manager);
                        cmd.Parameters.AddWithValue("@JobRole", jobrole);
                        cmd.Parameters.AddWithValue("@StartDate", startdate);
                        cmd.Parameters.AddWithValue("@EndDate", enddate);
                        cmd.Parameters.AddWithValue("@Status", status);
                        cmd.Parameters.AddWithValue("@Comments", comments);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
            catch (Exception ex) { throw ex; }
        }

        public void Update(int Id, string employee, string manager, string jobrole, string startdate, string enddate, string status, string comments)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE JobHistory SET Employee=@Employee, Manager=@Manager, JobRole=@JobRole, StartDate=@StartDate, EndDate=@EndDate, Status=@Status, Comments=@Comments WHERE Id = @Id"))
                {
                    cmd.Parameters.AddWithValue("@Id", Id);
                    cmd.Parameters.AddWithValue("@Employee", employee);
                    cmd.Parameters.AddWithValue("@Manager", manager);
                    cmd.Parameters.AddWithValue("@JobRole", jobrole);
                    cmd.Parameters.AddWithValue("@StartDate", startdate);
                    cmd.Parameters.AddWithValue("@EndDate", enddate);
                    cmd.Parameters.AddWithValue("@Status", status);
                    cmd.Parameters.AddWithValue("@Comments", comments);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }

        public void Delete(int Id)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM JobHistory WHERE Id = @Id"))
                {
                    cmd.Parameters.AddWithValue("@Id", Id);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
    }
}
