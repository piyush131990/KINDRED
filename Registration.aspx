<%@ Page Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Kindred.MIT.Registration" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <link rel="stylesheet" href="Content/Login.css"/>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
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
         .btn-primary:hover {
    color: #fff;
    background-color: #286090;
    border-color: #204d74;
}
    
    </style>
    <script>
        function validate() {
            var username = $('#inputUsername').val();
            var alertmessage = $('#alerttext').val();
            $('#regbutton').click(function () {
                if (username == "") {
                    alertmessage = "Please enter username!"
                    $('#myModal').modal('show');
       
                }
            });
        }
    </script>
  <div class="container" style="padding-top:30px">
    <div class="row">
      <div class="col-lg-12 col-xl-9 mx-auto">
        <div class="card card-signin flex-row my-5">
          <div class="card-img-left d-none d-md-flex">
              <img src="Images/Kindred_logo (2).png" style="width:100%"/>
             <!-- Background image for card -->
          </div>
          <div class="card-body" style="background-color:#3a4b53 !important">
            <h5 class="card-title text-center" style="font-weight:bold;color:white">SIGN UP</h5>
            <div class="form-signin" style="text-align:-webkit-center">
              <div class="form-label-group" style="">
                <input type="text" id="inputUsername" class="form-control"  runat="server" placeholder="USERNAME">
                
              </div>
                <hr style="visibility:hidden"/>
                 <div class="form-label-group">
                <input type="email" id="inputEmail" class="form-control"  runat="server" placeholder="EMAIL">
                
              </div>
                
                <hr style="visibility:hidden"/>
              <div class="form-label-group">
                <input type="password" id="inputPassword" class="form-control"  runat="server" placeholder="PASSWORD">
                
              </div>
                <hr style="visibility:hidden"/>
                <div class="form-label-group">
                <input type="password" id="inputConfirmPassword" class="form-control"  runat="server" placeholder="CONFIRM PASSWORD">
                
              </div>
                <hr style="visibility:hidden"/>
                <div class="form-label-group">
                 <asp:FileUpload runat="server" style="background: white;color:#1FA67A;" ID="ImageUpload" />
                </div>

              <asp:Button id="Regbutton" runat="server" class="btn btn-lg btn-primary btn-block text-uppercase" OnClientClick="return validate()" OnClick="Regbutton_Click" Text="REGISTER" />
              <a id="signin" style="color:#1FA67A;font-weight:bold" class="d-block text-center mt-2 small" href="Default.aspx">SIGN IN!</a>
              <hr style="visibility:hidden"/>
              <!--model popup start -->
     <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">ALERT!</h4>
        </div>
        <div class="modal-body">
          <p id="alerttext">This is a small modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
                <!--model popup end -->
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</asp:Content>

