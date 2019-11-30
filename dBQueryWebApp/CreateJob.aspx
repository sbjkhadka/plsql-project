<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateJob.aspx.cs" Inherits="dBQueryWebApp.RemoveJob" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/IndexStyle.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/CreateJobStyle.css" />
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
        <div runat="server">
            <div id="allContainer"  runat="server" class="d-flex justify-content-around">
                <form id="form1" runat="server">
                    <div class="form-group container-fluid pull-right">
                        <div>
                            <div class="col-sm-12"><h2>
                                <asp:Label ID="Label5" runat="server" Text="Create New Job"></asp:Label>
                            </h2></div>
                            <br />
                            <div class="col-sm-12">
                                <asp:Label ID="Label4" runat="server" Text="Job ID" for="ddl_job_id"></asp:Label>
                                <asp:TextBox ID="tb_job_id" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            
                            <div class="col-sm-12">
                                <asp:Label ID="Label1" runat="server" Text="Job Title" for="tb_job_title"></asp:Label>
                                <asp:TextBox ID="tb_job_title" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <br />
                            <div class="col-sm-6">
                                <asp:Label ID="Label2" runat="server" Text="Maximum Salary" for="tb_max_salary"></asp:Label>
                                <asp:TextBox ID="tb_max_salary" runat="server" class="form-control"></asp:TextBox>
                            </div>
                   
                            <div class="col-sm-6">
                                <asp:Label ID="Label3" runat="server" Text="Minimum Salary" for="tb_min_salary"></asp:Label>
                                <asp:TextBox ID="tb_min_salary" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <br />
                            <div class="col-sm-12 col-md-12 col-lg-12">
                            <br />
                                <asp:Button ID="Button1" Style="background-color: #f4511e;
                                color: #fff;" runat="server" Text="Create Job" CssClass="btn btn-lg btn-block" 
                                OnClick="btn_edit_job"/>
                                <br />
                                <asp:Label ID="lbl_stats" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>
                     </div>
                </form>
           </div>

            <div id="JobsTable" class="pull-left" runat="server"><% LoadTable(); %></div>            
           </div>
       </div>
</body>
</html>