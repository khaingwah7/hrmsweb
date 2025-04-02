using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS_Web
{
    public partial class Employee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }

        private void BindGrid()
        {
            ServiceReference.ServiceClient client = new ServiceReference.ServiceClient();
            GridView1.DataSource = client.Get().EmployeeTable;
            GridView1.DataBind();
        }

        protected void Insert(object sender, EventArgs e)
        {
            ServiceReference.ServiceClient client = new ServiceReference.ServiceClient();
            if (txtName.Text != "" && txtDate.Text != "" && txtPhone.Text != "" && txtEmail.Text != "" && txtGender.Text != "" && txtAddress.Text != "" && txtStatus.Text != "")
            {
                client.Insert(txtName.Text.Trim(), txtDate.Text.Trim(), txtPhone.Text.Trim(), txtEmail.Text.Trim(), txtGender.Text.Trim(), txtAddress.Text.Trim(), txtStatus.Text.Trim());
                this.BindGrid();
                txtName.Text = ""; txtDate.Text = ""; txtPhone.Text = ""; txtEmail.Text = "";
                txtGender.Text = ""; txtAddress.Text = ""; txtStatus.Text = "";
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
            int employeeId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string name = (row.FindControl("txtName") as TextBox).Text;
            string date = (row.FindControl("txtDate") as TextBox).Text;
            string phone = (row.FindControl("txtPhone") as TextBox).Text;
            string email = (row.FindControl("txtEmail") as TextBox).Text;
            string gender = (row.FindControl("txtGender") as TextBox).Text;
            string address = (row.FindControl("txtAddress") as TextBox).Text;
            string status = (row.FindControl("txtStatus") as TextBox).Text;
            ServiceReference.ServiceClient client = new ServiceReference.ServiceClient();
            client.Update(employeeId, name, date, phone, email, gender, address, status);
            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
            {
                (e.Row.Cells[7].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int employeeId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            ServiceReference.ServiceClient client = new ServiceReference.ServiceClient();
            client.Delete(employeeId);
            this.BindGrid();
        }

        protected void Search(object sender, EventArgs e)
        {
            this.SearchEmployees();
        }

        protected void All(object sender, EventArgs e)
        {
            this.BindGrid();
        }
        private void SearchEmployees()
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    string sql = "SELECT Id, Name, BirthDate, Phone, Email, Gender, Address, Status FROM Employee";
                    if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
                    {
                        sql += " WHERE Name LIKE '%' + @Name + '%'";
                        cmd.Parameters.AddWithValue("@Name", txtSearch.Text.Trim());
                        sql += " OR BirthDate = @BirthDate ";
                        cmd.Parameters.AddWithValue("@BirthDate", txtSearch.Text.Trim());
                        sql += " OR Phone = @Phone ";
                        cmd.Parameters.AddWithValue("@Phone", txtSearch.Text.Trim());
                        sql += " OR Email LIKE '%' + @Email + '%'";
                        cmd.Parameters.AddWithValue("@Email", txtSearch.Text.Trim());
                        sql += " OR Gender LIKE '%' + @Gender + '%'";
                        cmd.Parameters.AddWithValue("@Gender", txtSearch.Text.Trim());
                        sql += " OR Address LIKE '%' + @Address + '%'";
                        cmd.Parameters.AddWithValue("@Address", txtSearch.Text.Trim());
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
            this.SearchEmployees();
        }

    }
}