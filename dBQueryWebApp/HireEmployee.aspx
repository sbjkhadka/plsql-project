<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HireEmployee.aspx.cs" Inherits="dBQueryWebApp.WebForm1" %>

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
    <div id="hireAnEmployee">
    
    <div id="employeeMainmenu">
        <!---->
        <form id="employeeEntryForm" runat="server">
    <br />
    <div class="form-group container-fluid">
        <div class="row">
            <div class="col-sm-6 col-md-6 col-lg-6">
                <asp:Label ID="Label1" runat="server" Text="First Name" for="tb_first_name"></asp:Label><br />
                <asp:TextBox ID="tb_first_name" runat="server" class="form-control" placeholder="Enter First Name">
                </asp:TextBox>
            </div>

            <div class="col-sm-6 col-md-6 col-lg-6">
                <asp:Label ID="Label2" runat="server" Text="Last Name" for="tb_last_name"></asp:Label><br />
                <asp:TextBox ID="tb_last_name" runat="server" class="form-control" placeholder="Enter Last Name"></asp:TextBox>
            </div>





        </div><br />
        <div class="row">

            <div class="col-sm-6 col-md-6 col-lg-6">
                <asp:Label ID="Label3" runat="server" Text="Email" for="tb_email"></asp:Label>
                <asp:TextBox ID="tb_email" runat="server" class="form-control" placeholder="Enter Email"></asp:TextBox><br />
            </div>

            <div class="col-sm-6 col-md-6 col-lg-6">
                <asp:Label ID="Label4" runat="server" Text="Contact Number" for="tb_phone"></asp:Label>
                <asp:TextBox ID="tb_phone" runat="server" class="form-control" placeholder="Enter Phone"></asp:TextBox><br />
            </div>

        </div>

        <div class="row">
            <div class="col-sm-3 col-md-3 col-lg-3">
                <asp:Label ID="Label5" runat="server" Text="Hire Date" for="cal_hire_date"></asp:Label>
                <asp:Calendar ID="cal_hire_date" runat="server" placeholder=""></asp:Calendar><br />
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6 col-md-6 col-lg-6">
                <asp:Label ID="Label6" runat="server" Text="Salary" for="tb_salary"></asp:Label>
                <asp:TextBox ID="tb_salary" runat="server" class="form-control" placeholder="Enter Salary"></asp:TextBox><br />
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6 col-md-6 col-lg-6">
                <asp:Label ID="Label7" runat="server" Text="Job ID" for="ddl_job_id"></asp:Label>
                <asp:DropDownList ID="ddl_job_id" runat="server" class="form-control" OnSelectedIndexChanged="ddl_job_id_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList><br />

            </div>

            <div class="col-sm-6 col-md-6 col-lg-6">
                <asp:Label ID="Label10" runat="server" Text="Job Title" for="ddl_job_title"></asp:Label><br />
                <asp:Label ID="lbl_job_title" runat="server" Text="Job Title"></asp:Label>
                <!--<asp:DropDownList ID="ddl_job_title" runat="server" class="form-control"></asp:DropDownList>-->
                <br />
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6 col-md-6 col-lg-6">
                <asp:Label ID="Label8" runat="server" Text="Manager Information" for="ddl_manager_id"></asp:Label>
                <asp:DropDownList ID="ddl_manager_id" runat="server" class="form-control"></asp:DropDownList><br />
            </div>
            <div class="col-sm-6 col-md-6 col-lg-6">
                <asp:Label ID="Label9" runat="server" Text="Department Information" for="ddl_department_id"></asp:Label>
                <asp:DropDownList ID="ddl_department_id" runat="server" class="form-control"></asp:DropDownList><br />
            </div>

        </div>
        <asp:Button ID="btnSubmit" runat="server" Text="Submit Data" OnClick="btnShowProc_Click" class="btn btn-success" type="button" />



        &nbsp;<p>
            
            <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label><br />
            <asp:Label ID="lblConnectStatus" runat="server" Text="Label"></asp:Label>
            <asp:Label ID="lblColumn" runat="server" Text="Label"></asp:Label>
        </p>
    </div>
</form>
        <!---->
        </div>
    </div>

 

    
    </div>
    
    <footer>
        <h1>footer section</h1>
    </footer>
    </body>
</html>
