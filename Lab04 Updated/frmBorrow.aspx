<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmBorrow.aspx.cs" Inherits="Lab04_Updated.frmBorrow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--//copy list--%>
    <div style="display: grid; grid-template-columns: 1fr 2fr">
        <div class="left">
            <asp:Table ID="Table1" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                    Member Code
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="MemberCodeList" runat="server"></asp:DropDownList>
                    </asp:TableCell>
                    
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                    Copy ID
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtCopyID" runat="server" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtCopyID"
                            runat="server" ErrorMessage="Oops! Data cannot be empty!"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                Borrow Date
                    </asp:TableCell><asp:TableCell>
                        <asp:Calendar ID="calendarBorrowDate" runat="server"
                            OnSelectionChanged="calendarBorrowDate_SelectionChanged"
                            ></asp:Calendar>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                Due Date
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtDueDate" runat="server" Enabled="false"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Button ID="btnBorrow" runat="server" Text="Add Book" OnClick="btnBorrow_Click" />
        </div>
        <div class="right">
            <asp:GridView ID="gridCopyList" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="CopyDataSource" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnSelectedIndexChanged="gridCopyList_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="BookID" HeaderText="BookID" SortExpression="BookID" />
                    <asp:BoundField DataField="SequenceNumber" HeaderText="SequenceNumber" SortExpression="SequenceNumber" />
                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
            <asp:SqlDataSource ID="CopyDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryCSharpConnectionString %>" DeleteCommand="DELETE FROM [Copy] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Copy] ([BookID], [SequenceNumber], [Type], [Price]) VALUES (@BookID, @SequenceNumber, @Type, @Price)" SelectCommand="SELECT * FROM [Copy]" UpdateCommand="UPDATE [Copy] SET [BookID] = @BookID, [SequenceNumber] = @SequenceNumber, [Type] = @Type, [Price] = @Price WHERE [ID] = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="BookID" Type="Int32" />
                    <asp:Parameter Name="SequenceNumber" Type="Int32" />
                    <asp:Parameter Name="Type" Type="String" />
                    <asp:Parameter Name="Price" Type="Double" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="BookID" Type="Int32" />
                    <asp:Parameter Name="SequenceNumber" Type="Int32" />
                    <asp:Parameter Name="Type" Type="String" />
                    <asp:Parameter Name="Price" Type="Double" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <hr />


    <%--//borrow list--%>
    <div>
        <asp:GridView ID="gridBorrowList" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="ID" DataSourceID="BorrowDataSource" ForeColor="Black" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="BorrowerID" HeaderText="BorrowerID" SortExpression="BorrowerID" />
                <asp:BoundField DataField="CopyID" HeaderText="CopyID" SortExpression="CopyID" />
                <asp:BoundField DataField="BorrowedDate" HeaderText="BorrowedDate" SortExpression="BorrowedDate" />
                <asp:BoundField DataField="DueDate" HeaderText="DueDate" SortExpression="DueDate" />
                <asp:BoundField DataField="ReturnedDate" HeaderText="ReturnedDate" SortExpression="ReturnedDate" />
                <asp:BoundField DataField="FineAmount" HeaderText="FineAmount" SortExpression="FineAmount" />
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
        <asp:SqlDataSource ID="BorrowDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryCSharpConnectionString %>" DeleteCommand="DELETE FROM [Borrow] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Borrow] ([BorrowerID], [CopyID], [BorrowedDate], [DueDate], [ReturnedDate], [FineAmount]) VALUES (@BorrowerID, @CopyID, @BorrowedDate, @DueDate, @ReturnedDate, @FineAmount)" SelectCommand="SELECT * FROM [Borrow]" UpdateCommand="UPDATE [Borrow] SET [BorrowerID] = @BorrowerID, [CopyID] = @CopyID, [BorrowedDate] = @BorrowedDate, [DueDate] = @DueDate, [ReturnedDate] = @ReturnedDate, [FineAmount] = @FineAmount WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="BorrowerID" Type="Int32" />
                <asp:Parameter Name="CopyID" Type="Int32" />
                <asp:Parameter DbType="Date" Name="BorrowedDate" />
                <asp:Parameter DbType="Date" Name="DueDate" />
                <asp:Parameter DbType="Date" Name="ReturnedDate" />
                <asp:Parameter Name="FineAmount" Type="Double" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="BorrowerID" Type="Int32" />
                <asp:Parameter Name="CopyID" Type="Int32" />
                <asp:Parameter DbType="Date" Name="BorrowedDate" />
                <asp:Parameter DbType="Date" Name="DueDate" />
                <asp:Parameter DbType="Date" Name="ReturnedDate" />
                <asp:Parameter Name="FineAmount" Type="Double" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>
