<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HireEmployee.aspx.cs" Inherits="dBQueryWebApp.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/IndexStyle.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/HireEmployeeStyle.css" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css" />
</head>
<body>
    <nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
        <span class="icon-bar"></span>                  
      <a class="navbar-brand" href="Index.aspx"><span class="glyphicon glyphicon-fire logo-small"></span> HR Management</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="Index.aspx">HOMEPAGE</a></li>
        <li><a href="HireEmployee.aspx">HIRE EMPLOYEE</a></li>
        <li><a href="CreateJob.aspx">CREATE JOB</a></li>
        <li><a href="EditJobDescription.aspx">EDIT JOB</a></li>
        <li><a href="Jobs.aspx">SEARCH JOB</a></li>
      </ul>
    </div>
  </div>
</nav>        

    <div class="jumbotron text-center">
  <h1>Human Resources</h1> 
  <p>Subarna - Phong - Ayhan </p> 
</div>
    <div id="mainDiv">
    <div id="hireAnEmployee">
    <div id="employeeMainmenu">
        <!---->
        <form id="employeeEntryForm" runat="server">
    <div class="form-group container-fluid">
        <h2>Hire New Employee</h2>
        <br />
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

            <div class="col-md-6">
                <asp:Label ID="Label3" runat="server" Text="Email" for="tb_email"></asp:Label>
                <asp:TextBox ID="tb_email" runat="server" class="form-control" placeholder="Enter Email"></asp:TextBox><br />
            </div>

            <div class="col-md-6">
                <asp:Label ID="Label4" runat="server" Text="Contact Number" for="tb_phone"></asp:Label>
                <asp:TextBox ID="tb_phone" runat="server" class="form-control" placeholder="Enter Phone"></asp:TextBox><br />
            </div>

        </div>

        <div class="row pull-left">
            <div class="col-md-3">
                <asp:Label ID="Label5" runat="server" Text="Hire Date" for="cal_hire_date"></asp:Label>
                <asp:Calendar ID="cal_hire_date" runat="server" placeholder="" 
                    BorderStyle="None"
                    BorderWidth="0"
                    SelectionMode="Day">
                    <TitleStyle BorderStyle="Solid" BorderWidth="10px" BorderColor="#f4511e"
                        Height="3px"
                        BackColor="#f4511e" ForeColor="white" />
                    <NextPrevStyle BorderStyle="none" BorderWidth="0" ForeColor="white" Font-Size="Large"/>
                    <SelectedDayStyle BackColor="#f4511e" ForeColor="white"/>
                    <DayHeaderStyle Font-Size="14px" Font-Names="Montserrat,sans serif"/>
                </asp:Calendar>
            </div>
        </div>

        <div class="pull-right">

        <div class="row">
            <div class="col-md-12">
                <asp:Label ID="Label6" runat="server" Text="Salary" for="tb_salary"></asp:Label>
                <asp:TextBox ID="tb_salary" runat="server" class="form-control" placeholder="Enter Salary"></asp:TextBox><br />
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <asp:Label ID="Label7" runat="server" Text="Job ID" for="ddl_job_id"></asp:Label>
                <asp:DropDownList ID="ddl_job_id" runat="server" class="form-control" OnSelectedIndexChanged="ddl_job_id_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList><br />

            </div>

            <div class="col-md-6">
                <asp:Label ID="Label10" runat="server" Text="Job Title" for="ddl_job_title"></asp:Label><br />
                <asp:TextBox ID="lbl_job_title" runat="server" class="form-control" Text="" readonly></asp:TextBox>
                <!--<asp:DropDownList ID="ddl_job_title" runat="server" class="form-control"></asp:DropDownList>-->
                <br />
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <asp:Label ID="Label8" runat="server" Text="Manager Information" for="ddl_manager_id"></asp:Label>
                <asp:DropDownList ID="ddl_manager_id" runat="server" class="form-control"></asp:DropDownList><br />
            </div>
            <div class="col-md-6">
                <asp:Label ID="Label9" runat="server" Text="Department Information" for="ddl_department_id"></asp:Label>
                <asp:DropDownList ID="ddl_department_id" runat="server" class="form-control"></asp:DropDownList><br />
            </div>

        </div>
        <asp:Button ID="btnSubmit" runat="server"
            Style="background-color: #f4511e;color: #fff;margin-top:35px"
            CssClass="btn btn-lg btn-block"
            Text="Submit Data" OnClick="btnShowProc_Click" class="btn btn-success" type="button" />

    

        &nbsp;
            
            <asp:Label ID="lblName" runat="server" Text=""></asp:Label><br />
            <asp:Label ID="lblConnectStatus" runat="server" Text=""></asp:Label>
            <asp:Label ID="lblColumn" runat="server" Text=""></asp:Label>

        
            </div>
    </div>
</form>
        <!---->
        </div>
    </div>

 

    
    </div>
    </body>
</html>
