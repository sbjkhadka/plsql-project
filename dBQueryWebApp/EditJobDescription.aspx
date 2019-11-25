<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditJobDescription.aspx.cs" Inherits="dBQueryWebApp.EditJobDescription" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="assets/js/script.js"></script>
</head>
<body>
    <header>
            <h1>some HR portal</h1>
    </header>
    <nav>
            <a href="Index.aspx">Home&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
            <a href="HireEmployee.aspx">Hire Employee&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
            <a href="CreateJob.aspx">Create a New Job&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
            <a href="EditJobDescription.aspx">Edit Job&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
            <a href="Jobs.aspx">Search Job Title</a>
    </nav>
    <div id="mainDiv">
        <div id="allContainer"  runat="server" class="d-flex justify-content-around">
            <div id="JobsTable" runat="server"><% LoadTable(); %></div>
            <div style="border:1px dotted black" runat="server">
                <form id="form1" runat="server">
                    <div class="form-group container-fluid">
                        <div>
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <asp:Label ID="Label5" runat="server" Text="Edit Job"></asp:Label>
                            </div>
                            <br />
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <asp:Label ID="Label4" runat="server" Text="Job ID" for="ddl_job_id"></asp:Label>
                                <asp:DropDownList ID="ddl_job_id" runat="server" class="form-control"
                                    OnSelectedIndexChanged="ddl_job_id_SelectedIndexChanged" AutoPostBack="true">
                                </asp:DropDownList>
                            </div>
                            <br />
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <asp:Label ID="Label1" runat="server" Text="Job Title" for="tb_job_title"></asp:Label>
                                <asp:TextBox ID="tb_job_title" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <br />
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <asp:Label ID="Label2" runat="server" Text="Maximum Salary" for="tb_max_salary"></asp:Label>
                                <asp:TextBox ID="tb_max_salary" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <br />
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <asp:Label ID="Label3" runat="server" Text="Minimum Salary" for="tb_min_salary"></asp:Label>
                                <asp:TextBox ID="tb_min_salary" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <br />
                            <div class="col-sm-12 col-md-12 col-lg-12">
                            
                                <asp:Button ID="Button1" runat="server" Text="Change" class="btn btn-info" OnClick="btn_edit_job"/>
                            </div>
                        </div>
                     </div>
                </form>
           </div>
           
       </div>
    </div>
    <footer>
        <h1>footer section</h1>
    </footer>
    <asp:Label ID="lbl_stats" runat="server" Text="Label"></asp:Label>
</body>
</html>
