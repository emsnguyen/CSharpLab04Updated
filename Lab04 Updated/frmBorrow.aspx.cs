using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Lab04_Updated
{
    public partial class frmBorrow : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["LibraryCSharpConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadMemberList();
        }

        protected void gridCopyList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int rowIdx = gridCopyList.SelectedRow.RowIndex;
            GridViewRow row = gridCopyList.Rows[rowIdx];
            int idx = 1;
            txtCopyID.Text = row.Cells[idx++].Text;
        }

        void LoadMemberList()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = @"SELECT [ID]
                                        ,[Name]
                                    FROM [Borrower]";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        while (reader.Read())
                        {
                            int id = (int)reader.GetValue(0);
                            string name = (string)reader.GetValue(1);
                            ListItem listItem = new ListItem(name, id.ToString());
                            MemberCodeList.Items.Add(listItem);
                        }

                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void btnBorrow_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = @"INSERT INTO [Borrow] ([BorrowerID], 
                            [CopyID], [BorrowedDate], [DueDate]) 
                            VALUES (@BorrowerID, @CopyID,
                            @BorrowedDate, @DueDate)";
                    int copyID = int.Parse(txtCopyID.Text);
                    int borrowerID = int.Parse(MemberCodeList.SelectedValue);
                    DateTime borrowDate = DateTime.Parse(calendarBorrowDate.SelectedDate.Date.ToShortDateString());
                    DateTime dueDate = DateTime.Parse(txtDueDate.Text);
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.Add("@CopyID", SqlDbType.Int).Value = copyID;
                        command.Parameters.Add("@BorrowerID", SqlDbType.Int).Value = borrowerID;
                        command.Parameters.Add("@BorrowedDate", SqlDbType.Date).Value = borrowDate;
                        command.Parameters.Add("@DueDate", SqlDbType.Date).Value = dueDate;
                        connection.Open();
                        command.ExecuteNonQuery();
                        gridBorrowList.DataBind();
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }

        }

        protected void calendarBorrowDate_SelectionChanged(object sender, EventArgs e)
        {
            DateTime borrowDate = calendarBorrowDate.SelectedDate.Date;
            DateTime dueDate = borrowDate.AddDays(14);
            txtDueDate.Text = dueDate.ToShortDateString();
        }
    }
}