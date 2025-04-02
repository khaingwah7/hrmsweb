using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace HRMS_Web
{
    public partial class JobHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            { 
                this.BindGrid();
                ddlEmployee.DataSource = GetData("SELECT DISTINCT Name FROM Employee");
                ddlEmployee.DataTextField = "Name";
                ddlEmployee.DataValueField = "Name";
                ddlEmployee.DataBind();
                ddlEmployee.Items.Insert(0, new ListItem("Please select"));
                ddlEmployee.SelectedIndex = 0;

                ddlrole.DataSource = GetData("SELECT DISTINCT Title FROM JobRole");
                ddlrole.DataTextField = "Title";
                ddlrole.DataValueField = "Title";
                ddlrole.DataBind();
                ddlrole.Items.Insert(0, new ListItem("Please select"));
                ddlrole.SelectedIndex = 0;
            }
        }

        private void BindGrid()
        {
            JobHistoryServiceReference.JobHistoryServiceClient client = new JobHistoryServiceReference.JobHistoryServiceClient();
            GridView1.DataSource = client.Get().JobHistoryTable;
            GridView1.DataBind();

            
        }

        protected void Insert(object sender, EventArgs e)
        {
            JobHistoryServiceReference.JobHistoryServiceClient client = new JobHistoryServiceReference.JobHistoryServiceClient();
            if (ddlEmployee.SelectedValue != "" && txtStartDate.Text != "" && txtEndDate.Text != "" && ddlrole.SelectedValue != "" && txtManager.Text != "" && txtComments.Text != "" && txtStatus.Text != "")
            {
                client.Insert(ddlEmployee.SelectedValue.Trim(), txtManager.Text.Trim(), ddlrole.Text.Trim(), txtStartDate.Text.Trim(), txtEndDate.Text.Trim(), txtStatus.Text.Trim(), txtComments.Text.Trim());
                this.BindGrid();
                ddlEmployee.SelectedIndex = 0; txtStartDate.Text = ""; txtEndDate.Text = ""; ddlrole.SelectedIndex = 0;
                txtManager.Text = ""; txtComments.Text = ""; txtStatus.Text = "";
            }
            else
                Response.Write("<script LANGUAGE='JavaScript' >alert('All form fields are required.')</script>");

        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int Id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string employee = (row.FindControl("ddlEmployee") as DropDownList).Text;
            string date = (row.FindControl("txtStartDate") as TextBox).Text;
            string enddate = (row.FindControl("txtEndDate") as TextBox).Text;
            string role = (row.FindControl("ddlrole") as DropDownList).Text;
            string manager = (row.FindControl("txtManager") as TextBox).Text;
            string comments = (row.FindControl("txtComments") as TextBox).Text;
            string status = (row.FindControl("txtStatus") as TextBox).Text;
            JobHistoryServiceReference.JobHistoryServiceClient client = new JobHistoryServiceReference.JobHistoryServiceClient();
            client.Update(Id, employee, manager, role, date, enddate, status, comments);
            GridView1.EditIndex = -1;
            this.BindGrid();
        }


        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int Id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            JobHistoryServiceReference.JobHistoryServiceClient client = new JobHistoryServiceReference.JobHistoryServiceClient();
            client.Delete(Id);
            this.BindGrid();
        }

        protected void Search(object sender, EventArgs e)
        {
            this.SearchJobHistory();
        }

        protected void All(object sender, EventArgs e)
        {
            this.BindGrid();
        }
        private void SearchJobHistory()
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    string sql = "SELECT Id, Employee, Manager,JobRole,StartDate,EndDate,Status,Comments FROM JobHistory";
                    if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
                    {
                        sql += " WHERE Employee LIKE '%' + @Employee + '%'";
                        cmd.Parameters.AddWithValue("@Employee", txtSearch.Text.Trim());
                        sql += " OR Manager LIKE '%' + @Manager + '%'";
                        cmd.Parameters.AddWithValue("@Manager", txtSearch.Text.Trim());
                        sql += " OR JobRole LIKE '%' + @JobRole + '%'";
                        cmd.Parameters.AddWithValue("@JobRole", txtSearch.Text.Trim());
                        sql += " OR StartDate = @StartDate ";
                        cmd.Parameters.AddWithValue("@StartDate", txtSearch.Text.Trim());
                        sql += " OR EndDate = @EndDate ";
                        cmd.Parameters.AddWithValue("@EndDate", txtSearch.Text.Trim());
                        sql += " OR Comments LIKE '%' + @Comments + '%'";
                        cmd.Parameters.AddWithValue("@Comments", txtSearch.Text.Trim());
                        sql += " OR Status LIKE '%' + @Status + '%'";
                        cmd.Parameters.AddWithValue("@Status", txtSearch.Text.Trim());
                    }
                    cmd.CommandText = sql;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.SearchJobHistory();
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex == e.Row.RowIndex)
            {
                DropDownList ddlEmployee = (DropDownList)e.Row.FindControl("ddlEmployee");
                ddlEmployee.DataSource = GetData("SELECT DISTINCT Name FROM Employee");
                ddlEmployee.DataTextField = "Name";
                ddlEmployee.DataValueField = "Name";
                ddlEmployee.DataBind();

                ddlEmployee.Items.Insert(0, new ListItem("Please select"));
                ddlEmployee.Items.FindByValue((e.Row.FindControl("lblEmployee") as Label).Text).Selected = true;
                //string employee = (e.Row.FindControl("lblEmployee") as Label).Text;
                //ddlEmployee.Items.FindByValue(employee).Selected = true;


                //  for job role  
                DropDownList ddlrole = (DropDownList)e.Row.FindControl("ddlrole");
                ddlrole.DataSource = GetData("SELECT DISTINCT Title FROM JobRole");
                ddlrole.DataTextField = "Title";
                ddlrole.DataValueField = "Title";
                ddlrole.DataBind();

                ddlrole.Items.Insert(0, new ListItem("Please select"));
                ddlrole.Items.FindByValue((e.Row.FindControl("lblrole") as Label).Text).Selected = true;
                //string role = (e.Row.FindControl("lblrole") as Label).Text;
                //ddlrole.Items.FindByValue(role).Selected = true;

            }

            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
            {
                (e.Row.Cells[7].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }
        private DataSet GetData(string query)
        {
            string conString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            SqlCommand cmd = new SqlCommand(query);
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataSet ds = new DataSet())
                    {
                        sda.Fill(ds);
                        return ds;
                    }
                }
            }
        }
    }
}