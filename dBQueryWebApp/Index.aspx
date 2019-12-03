<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="dBQueryWebApp.Index" %>--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href  ="assets/css/IndexStyle.css" />
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
          <li><a href="EditEmp.aspx">EDIT EMPLOYEE INFORMATION</a></li>
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

    <!-- Container (About Section) -->
<div id="about" class="container-fluid">
  <div class="row">
    <div class="col-sm-8">
      <h2>About Our Project</h2><br />
      <h4>Our Human Resources webpage aims to help HR departments with their jobs.</h4><br />
      <p>
          Our group consists of 3 members: Subarna, Phong & Ayhan.<br />
          This is our demo for the Final Project of course COMP214 at Centennial College.
          The pages we created are connected to our Human Resources database. Dependending on 
          the user's choice, they can easily create a New Job, Hire an Employee, 
          Edit a Job's details, or Search for a Job's title. All changes are automatically 
          synced up to the database! 
      </p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-fire logo"></span>
    </div>
  </div>
</div>


</body>
</html>