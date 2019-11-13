<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Kindred.MIT._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <link rel="stylesheet" href="Content/Login.css"/>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Themes/js/sweetalert.min.js"></script>
    <script type="text/javascript">
        function successalert() {
            swal({
                title: 'Alert!',
                text: 'PLease check the password!',
                type: 'success'
            });
        }
        function soemthingwrong() {
            swal({
                title: 'Alert!',
                text: 'Something went wrong! Please try again later.',
                type: 'success'
            });
        }
        function checkusername() {
            swal({
                title: 'Alert!',
                text: 'PLease check the username entered',
                type: 'success'
            });
        }
    </script>
     <style>
         body {
    background-color: #997A8D;
}
        .navbar-inverse {
    background-color: #f4decb;
    border-color: #f4decb;
}
        .navbar-inverse .navbar-brand {
    color: #94618E;
}
        .navbar-inverse .navbar-nav>li>a {
    color: #94618E;
}
        .btn-block {
    display: block;
    width: 32%;
}
        .btn-primary {
    color: #fff;
    background-color: #1FA67A;
    border-color: #1FA67A;
}
    </style>
    
  <div class="container" style="padding-top:30px">
    <div class="row">
      <div class="col-lg-12 col-xl-9 mx-auto">
        <div class="card card-signin flex-row my-5">
          <div class="card-img-left d-none d-md-flex">
              <img src="Images/Kindred_logo (2).png" style="width:100%"/>
             <!-- Background image for card -->
          </div>
          <div class="card-body" style="background-color:#3a4b53 !important">
            <h5 class="card-title text-center" style="font-weight:bold;color:white">SIGN IN</h5>
            <div class="form-signin" style="text-align:-webkit-center">
              <div class="form-label-group" style="">
                <input type="text" runat="server" id="inputUserame" class="form-control" placeholder="Username" required autofocus>
              </div>
                <hr style="visibility:hidden"/>
              <div class="form-label-group">
                <input type="password" runat="server" id="inputPassword" class="form-control" placeholder="Password" required>
              </div>
             <hr style="visibility:hidden"/>
              <asp:Button runat="server" style="font-weight:bold" ID="loginbtn" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" Text="LOGIN" OnClick="loginbtn_Click"/>
              <Label style="color:white" class="d-block text-center mt-2 small">Not registered yet?</Label>&nbsp<a id="signup" style="color:#1FA67A;font-weight:bold" class="d-block text-center mt-2 small" href="Registration.aspx">SIGN UP!</a>
             <hr style="visibility:hidden"/>
    
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</asp:Content>
