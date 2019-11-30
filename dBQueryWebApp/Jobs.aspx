<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Jobs.aspx.cs" Inherits="dBQueryWebApp.Jobs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/IndexStyle.css" />
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
        <form runat="server" class="form-group container-fluid">
                <div class="d-flex flex-row justify-content-around">               
                    <h2>Search Job Title</h2>
                    <br />
                    <div class="row">
                        <div class="col-lg-6">
                    <Asp:Label runat="server">Job ID</Asp:Label>
                    <asp:DropDownList ID="ddl_job_title_Search" runat="server" 
                        OnSelectedIndexChanged="ddl_job_title_Search_SelectedIndexChanged" 
                    AutoPostBack="true" class="form-control"></asp:DropDownList>
                            </div>

                    <div class="col-lg-6">
                    <Asp:Label runat="server">Job Title</Asp:Label>
                    <asp:TextBox ID="lbl_value" CssClass="form-control" runat="server" Text="" readonly></asp:TextBox>
                </div>
                </div>
                </div>
            <br />
       <asp:Label ID="lbl_test" CssClass="pull-right" runat="server" Text="Label"></asp:Label>
        </form>           
    </div>
    <p>

            </p>
    </body>
</html>
