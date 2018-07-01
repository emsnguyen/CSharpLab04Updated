using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab04_Updated
{
    public partial class frmMember : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["LibraryCSharpConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //DisableAllValidators();
        }

        protected void btnAddMember_Click(object sender, EventArgs e)
        {
            try
            {

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO [Borrower] ([Name], [Sex], [Address], [Email], [Phone]) " +
                        "VALUES (@Name, @Sex, @Address, @Email, @Phone)";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.Add("@Name", SqlDbType.NVarChar).Value = txtName.Text;
                        command.Parameters.Add("@Sex", SqlDbType.Bit).Value = SexList.SelectedValue;
                        command.Parameters.Add("@Address", SqlDbType.NVarChar).Value = txtAddress.Text;
                        command.Parameters.Add("@Email", SqlDbType.NVarChar).Value = txtEmail.Text;
                        command.Parameters.Add("@Phone", SqlDbType.NVarChar).Value = txtPhone.Text;
                        connection.Open();
                        command.ExecuteNonQuery();
                        gridMemberList.DataBind();
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
        void DisableAllValidators()
        {
            foreach (IValidator cValidator in Page.GetValidators(null))
            {
                BaseValidator bv = (cValidator as BaseValidator);
                bv.CssClass = "Error";
                bv.Enabled = false;
            }
        }
        void EnableAllValidators()
        {
            foreach (IValidator cValidator in Page.GetValidators(null))
            {
                BaseValidator bv = (cValidator as BaseValidator);
                bv.CssClass = "Error";
                bv.Enabled = true;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            EnableAllValidators();
            int rowIdx = gridMemberList.SelectedRow.RowIndex;
            GridViewRow row = gridMemberList.Rows[rowIdx];
            int idx = 1;
            txtID.Text = row.Cells[idx++].Text;
            txtName.Text = row.Cells[idx++].Text;
            SexList.SelectedValue = row.Cells[idx++].Text;
            txtAddress.Text = row.Cells[idx++].Text;
            txtEmail.Text = row.Cells[idx++].Text;
            txtPhone.Text = row.Cells[idx++].Text;
        }
    }
}