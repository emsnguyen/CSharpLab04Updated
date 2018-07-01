<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmBook.aspx.cs" Inherits="Lab04_Updated.frmBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--//book list--%>
    <div style="display: grid; grid-template-columns: 1fr 2fr">
        <div class="left">
            <asp:Table ID="Table1" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                    Book ID
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtBookID" runat="server" Enabled="false" />
                    </asp:TableCell>
                    <asp:TableCell>

                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                Title
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="txtTitle" runat="server" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtTitle"
                            ErrorMessage="Oops! Data cannot be empty"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                Author
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="txtAuthor" runat="server" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtAuthor"
                            ErrorMessage="Oops! Data cannot be empty"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                Publisher
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="txtPublisher" runat="server" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="txtPublisher"
                            ErrorMessage="Oops! Data cannot be empty"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Button ID="btnAddBook" runat="server" Text="Add Book" OnClick="btnAddBook_Click" />
        </div>
        <div class="right">
            <asp:GridView ID="gridBookList" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="ID" DataSourceID="BookDataSource" OnSelectedIndexChanged="gridBookList_SelectedIndexChanged" OnPageIndexChanging="gridBookList_PageIndexChanging">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
                    <asp:BoundField DataField="Publisher" HeaderText="Publisher" SortExpression="Publisher" />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>
            <asp:SqlDataSource ID="BookDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryCSharpConnectionString %>" DeleteCommand="DELETE FROM [Book] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Book] ([Title], [Author], [Publisher]) VALUES (@Title, @Author, @Publisher)" SelectCommand="SELECT * FROM [Book]" UpdateCommand="UPDATE [Book] SET [Title] = @Title, [Author] = @Author, [Publisher] = @Publisher WHERE [ID] = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="Author" Type="String" />
                    <asp:Parameter Name="Publisher" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="Author" Type="String" />
                    <asp:Parameter Name="Publisher" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <hr />


    <%--//copy list--%><div style="display: grid; grid-template-columns: 1fr 2fr">
        <div class="left">
            <asp:Table ID="Table2" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                Book ID
                    </asp:TableCell><asp:TableCell>
                        <asp:DropDownList ID="BookIDList" runat="server"></asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                Copy ID
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="txtCopyID" runat="server" Enabled="false"/>
                    </asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                Sequence Number
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="txtSequenceNumber" runat="server" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ErrorMessage="Should be a valid integer"
                            ValidationExpression="^(0|[1-9][0-9]*)$"
                            ControlToValidate="txtSequenceNumber"></asp:RegularExpressionValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                Type
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="txtType" runat="server" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ErrorMessage="Should be a valid integer"
                            ValidationExpression="^(0|[1-9][0-9]*)$"
                            ControlToValidate="txtType"></asp:RegularExpressionValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                Price
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="txtPrice" runat="server" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                            ErrorMessage="Should be a valid integer"
                            ValidationExpression="^[0-9]*(?:\.[0-9]*)?$"
                            ControlToValidate="txtPrice"></asp:RegularExpressionValidator>
                    </asp:TableCell>
                </asp:TableRow>

            </asp:Table>
            <asp:Button ID="btnAddCopy" runat="server" Text="Add Copy" OnClick="btnAddCopy_Click" />
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

</asp:Content>
