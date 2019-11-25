<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Jobs.aspx.cs" Inherits="dBQueryWebApp.Jobs" %>

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
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="Index.aspx">Home&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
            <a href="HireEmployee.aspx">Hire Employee&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
            <a href="CreateJob.aspx">Create a New Job&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
            <a href="EditJobDescription.aspx">Edit Job&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
            <a href="Jobs.aspx">Search Job Title</a>
    </nav>
    <div id="mainDiv">
        
        <form runat="server" class="form-group container-fluid">
          
                <div class="d-flex flex-row justify-content-around">
                    
                    <asp:DropDownList ID="ddl_job_title_Search" runat="server" 
                        OnSelectedIndexChanged="ddl_job_title_Search_SelectedIndexChanged" 
                    AutoPostBack="true" class="btn btn-info btn-lg"></asp:DropDownList>
                    <asp:Label ID="lbl_value" runat="server" Text="" class="btn-info btn-lg"><h1></h1></asp:Label>
                </div>

                
       
        </form>
            
    </div>
   <footer>
        <h1>footer section</h1>
    </footer>
    <p>

            <asp:Label ID="lbl_test" runat="server" Text="Label"></asp:Label>
            </p>
    </body>
</html>
