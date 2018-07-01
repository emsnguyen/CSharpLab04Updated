using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Lab04_Updated
{
    public partial class frmBook : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["LibraryCSharpConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            PopulateDropDownList();
        }
        void PopulateDropDownList()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = @"SELECT ID, Title From Book";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        while (reader.Read())
                        {
                            int id = (int)reader.GetValue(0);
                            string title = (string)reader.GetValue(1);
                            ListItem listItem = new ListItem(title, id.ToString());
                            BookIDList.Items.Add(listItem);
                        }

                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
        protected void btnAddBook_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = @"INSERT INTO [Book]
                                           ([Title]
                                           ,[Author]
                                           ,[Publisher])
                                     VALUES
                                           (@Title
                                           ,@Author
                                           ,@Publisher)
                                ";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.Add("@Title", SqlDbType.NVarChar).Value = txtTitle.Text;
                        command.Parameters.Add("@Author", SqlDbType.NVarChar).Value = txtAuthor.Text;
                        command.Parameters.Add("@Publisher", SqlDbType.NVarChar).Value = txtPublisher.Text;
                        connection.Open();
                        command.ExecuteNonQuery();
                        gridBookList.DataBind();
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }

        }

        protected void btnAddCopy_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = @"INSERT INTO [Copy]
                                           ([BookID]
                                           ,[SequenceNumber]
                                           ,[Type]
                                           ,[Price])
                                     VALUES
                                           (@BookID
                                           ,@SequenceNumber
                                           ,@Type
                                           ,@Price)";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.Add("@BookID", SqlDbType.NVarChar).Value = BookIDList.SelectedValue;
                        command.Parameters.Add("@SequenceNumber", SqlDbType.NVarChar).Value = txtSequenceNumber.Text;
                        command.Parameters.Add("@Type", SqlDbType.NVarChar).Value = txtType.Text;
                        command.Parameters.Add("@Price", SqlDbType.Float).Value = txtPrice.Text;
                        connection.Open();
                        command.ExecuteNonQuery();
                        gridCopyList.DataBind();
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void gridCopyList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int rowIdx = gridCopyList.SelectedRow.RowIndex;
            GridViewRow row = gridCopyList.Rows[rowIdx];
            int idx = 1;
            txtCopyID.Text = row.Cells[idx++].Text;
            BookIDList.SelectedValue = row.Cells[idx++].Text;
            txtSequenceNumber.Text = row.Cells[idx++].Text;
            txtType.Text = row.Cells[idx++].Text;
            txtPrice.Text = row.Cells[idx++].Text;
        }

        protected void gridBookList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int rowIdx = gridBookList.SelectedRow.RowIndex;
            GridViewRow row = gridBookList.Rows[rowIdx];

            int idx = 1;
            txtBookID.Text = BookIDList.SelectedValue = row.Cells[idx++].Text;
            txtTitle.Text = row.Cells[idx++].Text;
            txtAuthor.Text = row.Cells[idx++].Text;
            txtPublisher.Text = row.Cells[idx++].Text;


        }

        protected void gridBookList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridBookList.PageIndex = e.NewPageIndex;
            gridBookList.DataBind();
        }
    }
}