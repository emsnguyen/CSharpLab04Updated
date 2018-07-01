<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmMember.aspx.cs" Inherits="Lab04_Updated.frmMember" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="display: grid; grid-template-columns: 1fr 2fr">
        <div class="left">
            <asp:Table ID="Table1" runat="server" Width="543px">
                <asp:TableRow>
                    <asp:TableCell>
                ID
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtID" runat="server" Enabled="false" />
                    </asp:TableCell><asp:TableCell></asp:TableCell></asp:TableRow
                    ><asp:TableRow>
                    <asp:TableCell>
                Name
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="txtName" runat="server" />
                    </asp:TableCell><asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="txtName"
                            ErrorMessage="Oops! Data cannot be empty"></asp:RequiredFieldValidator>
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                Sex
                    </asp:TableCell><asp:TableCell>
                        <asp:DropDownList ID="SexList" runat="server">
                            <asp:ListItem Text="Female" Value="False"></asp:ListItem>
                            <asp:ListItem Text="Male" Value="True" Selected="True"></asp:ListItem>
                        </asp:DropDownList>   
                    </asp:TableCell><asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ControlToValidate="txtName"
                            ErrorMessage="Oops! Data cannot be empty"></asp:RequiredFieldValidator>
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                Address
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="txtAddress" runat="server" />
                    </asp:TableCell><asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="txtAddress"
                            ErrorMessage="Oops! Data cannot be empty">
                        </asp:RequiredFieldValidator>
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                Email
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="txtEmail" runat="server" />
                    </asp:TableCell><asp:TableCell>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                            ControlToValidate="txtEmail"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ErrorMessage="Email must be in standard format">
                        </asp:RegularExpressionValidator>
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                Phone
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="txtPhone" runat="server" />
                    </asp:TableCell><asp:TableCell>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                            ControlToValidate="txtPhone"
                            ValidationExpression="\(?\d{3}\)?-? *\d{3}-? *-?\d{4}"
                            ErrorMessage="Phone number must be in standard format">
                        </asp:RegularExpressionValidator>
                    </asp:TableCell></asp:TableRow></asp:Table><asp:Button ID="btnAddMember" runat="server" Text="Add Member" OnClick="btnAddMember_Click" /><div class="right">
                <asp:GridView ID="gridMemberList" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="DataSourceBorrower" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Sex" HeaderText="Sex" SortExpression="Sex" />
                        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DataSourceBorrower" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryCSharpConnectionString %>" DeleteCommand="DELETE FROM [Borrower] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Borrower] ([Name], [Sex], [Address], [Email], [Phone]) VALUES (@Name, @Sex, @Address, @Email, @Phone)" SelectCommand="SELECT * FROM [Borrower]" UpdateCommand="UPDATE [Borrower] SET [Name] = @Name, [Sex] = @Sex, [Address] = @Address, [Email] = @Email, [Phone] = @Phone WHERE [ID] = @ID">
                    <DeleteParameters>
                        <asp:Parameter Name="ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Sex" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Sex" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="ID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
