<%@ Page Language="C#" MasterPageFile="~/Site.Master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="AdminUser.aspx.cs" Inherits="Kindred.MIT.AdminUser" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" >
   <!DOCTYPE html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
   
<style>
html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}
#MainT {
    display: block;
    margin: 0 0 10px;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
#MainT {
    -webkit-user-modify: read-write;
    overflow-wrap: break-word;
    -webkit-line-break: after-white-space;
}
</style>
    
     <script src="Themes/js/sweetalert.min.js"></script>
    <script type="text/javascript">
         function notempty() {
            swal({
                title: 'Alert!',
                text: 'The journal cannot be left empty!!',
                type: 'success'
            });
        }
         function success() {
             swal({
                 title: 'Success!',
                 text: 'Data saved successfully!!',
                 type: 'success'
             }).then(function () {
                 window.location="AdminUser.aspx";
             });
        }
        function comment() {
             swal({
                 title: 'Success!',
                 text: 'Comment posted successfully!!',
                 type: 'success'
             }).then(function () {
                 window.location="AdminUser.aspx";
             });
        }
        function redalert() {
             swal({
                 title: 'ALERT!',
                 text: 'We have detected concerning words in your post, if you need any help please refer to emergency helpline numbers which are provided at the top as well as bottom of the page!!',
                 type: 'success'
             }).then(function () {
                 window.location="AdminUser.aspx";
             });
        }
        
       
    </script>
    <script src="Themes/js/tinymce/tinymce.min.js"></script>
    <script src="Themes/js/tinymce/plugins/smileys/plugin.min.js"></script>
    <script>
    tinymce.init({
      selector:"textarea",
        plugins: "link lists smileys template paste textcolor",
      toolbar: "styleselect fontselect fontsizeselect | smileys forecolor backcolor",
    });
</script>
<!-- Page Container -->
<div >    
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m3">
      <!-- Profile -->
      <div class="w3-card w3-round w3-white" style="background-color:#1FA67A">
        <div class="w3-container">
         <h4 class="w3-center" runat="server" id="UName"></h4>
         <p class="w3-center"><img runat="server" id="usrimage" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
         <hr>
         <p runat="server" class="w3-center" id="Email"><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> </p>
         
        </div>
      </div>
      <br>
      
      
      <%= journal %>
     
    <!-- End Left Column -->
    </div>
    
    <!-- Middle Column -->
    <div class="w3-col m7">
    
      <div class="w3-row-padding">
        <div class="w3-col m12">
           
          <div class="w3-card w3-round w3-white">
            <div class="w3-container w3-padding">
              <h6 class="w3-opacity">Put your thoughts below</h6>
                <asp:DropDownList ID="drop1" DataTextField="CategoryName" AutoPostBack="false" DataValueField="Id" runat="server" style="margin-bottom:10px;">
                </asp:DropDownList>
            <asp:DropDownList ID="drop2" AutoPostBack="false" runat="server" style="margin-bottom:10px;">
                <asp:ListItem Text="PUBLIC" Value="PUBLIC" Selected="True"></asp:ListItem>
                <asp:ListItem Text="PRIVATE" Value="PRIVATE"></asp:ListItem>
                </asp:DropDownList>
                <textarea runat="server" id="myTextarea"></textarea>
<asp:Button id="Postbutton" runat="server" class="w3-button w3-theme fa fa-pencil" style="margin-top:10px" OnClientClick="myFunction1()" OnClick="Postbutton_Click"  Text="POST" />
            </div>
          </div>
        </div>
      </div>
      <%= htm%>
       
        <%--<asp:Button Style="display: none;" ID="btn2" runat="server" class="w3-button w3-theme fa fa-pencil" OnClientClick="myFunction3()" OnClick="frndaccpt_Click" Text="POST" />
        <asp:Button Style="display: none;" ID="btn3" runat="server" class="w3-button w3-theme fa fa-pencil" OnClientClick="myFunction4()" OnClick="frndreject_Click" Text="POST" />
        <asp:Button Style="display: none;" ID="btn6" runat="server" class="w3-button w3-theme fa fa-pencil" OnClientClick="myFunction6()" OnClick="unfrind_Click" Text="POST" />
        <asp:Button Style="display: none;" ID="btn" runat="server" class="w3-button w3-theme fa fa-pencil" OnClientClick="myFunction2()" OnClick="frndreq_Click" Text="POST" />--%>
        <asp:Button Style="display: none;" ID="btn4" runat="server" class="w3-button w3-theme fa fa-pencil" OnClick="Commentbutton_Click" Text="POST"/>
        <input type="text" id="frndrequestto" runat="server" style="display: none" />
        <input type="text" id="friendaccept" runat="server" style="display:none"/>
        <input type="text" id="frnaccinput" runat="server" style="display: none" />
        <input type="text" id="unfriend" runat="server" style="display: none" />
        <input type="text" id="usid" runat="server" style="display: none"/>
        <input type="text" id="date" runat="server" style="display: none"/>
        <input type="text" id="cmmnt" runat="server" style="display:none" />
    <!-- End Middle Column -->
    </div>
    
    <!-- Right Column -->
    <div class="w3-col m2">
      <%--<div class="w3-card w3-round w3-white w3-center">
        <div class="w3-container">
          <p>Upcoming Events:</p>
          <img src="/w3images/forest.jpg" alt="Forest" style="width:100%;">
          <p><strong>Holiday</strong></p>
          <p>Friday 15:00</p>
          <p><button class="w3-button w3-block w3-theme-l4">Info</button></p>
        </div>
      </div>
      <br>--%>
      
      <div runat="server" class="w3-card w3-round w3-white w3-center" style="background-color:#1FA67A">
        <div class="w3-container" >
            
          <p>Total Journals</p>
            
           <%=frndaccept %>
            
         <%-- <span>Jane Doe</span>
          <div class="w3-row w3-opacity">
            <div class="w3-half">
                
                <button class="w3-button w3-block w3-green w3-section" title="Accept"><i class="fa fa-check"></i></button>
            </div>
            <div class="w3-half">
              <button class="w3-button w3-block w3-red w3-section" title="Decline"><i class="fa fa-remove"></i></button>
            </div>
          </div>--%>
        </div>
      </div>
      <br>
      
      <div class="w3-card w3-round w3-white w3-padding-16 w3-center" style="background-color:#1FA67A">
        <p>Total Members</p>
     <%=totjournal %>
          </div>
      <br>
      
      <div class="w3-card w3-round w3-white w3-padding-32 w3-center">
        <p><i class="fa fa-bug w3-xxlarge"></i></p>
      </div>
      
    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->
</div>
<br>

<!-- Footer -->

 
<script>
// Accordion
function myFunction(id) {
  var x = document.getElementById(id);
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
    x.previousElementSibling.className += " w3-theme-d1";
  } else { 
    x.className = x.className.replace("w3-show", "");
    x.previousElementSibling.className = 
    x.previousElementSibling.className.replace(" w3-theme-d1", "");
  }
    }
   function myFunction1(pid) {
        var x = document.getElementById("comment" + pid).innerText;
        var y = document.getElementById("comment" + pid).parentNode.id;
        document.getElementById("<%= usid.ClientID %>").value = y;
        document.getElementById("<%= date.ClientID%>").value = pid;
        document.getElementById("<%= cmmnt.ClientID%>").value = x;
        document.getElementById("<%= btn4.ClientID%>").click();
    }
    <%--function myFunction2(username) {
        var x= document.getElementById("frndreq"+username).parentNode.id;
        document.getElementById("<%= frndrequestto.ClientID %>").value = x;
        document.getElementById("<%= btn.ClientID %>").click();
    }
    function myFunction3(frndname) {
        var y = document.getElementById("frndaccpt"+frndname).parentNode.id;
        document.getElementById("<%= friendaccept.ClientID %>").value = y.substring(1);
        document.getElementById("<%= btn2.ClientID %>").click();
    }
    function myFunction6(pid) {
        var z = document.getElementById("unfrnd"+pid).parentNode.id;
        document.getElementById("<%= unfriend.ClientID %>").value = z;
        document.getElementById("<%= btn6.ClientID %>").click();
    }--%>
   <%-- function myFunction4(frndname) {
        var z = document.getElementById("frndreject"+frndname).parentNode.id;
        document.getElementById("<%= frnaccinput.ClientID %>").value = z.substring(1);
        document.getElementById("<%= btn3.ClientID %>").click();
    }--%>
     
// Used to toggle the menu on smaller screens when clicking on the menu button
function openNav() {
  var x = document.getElementById("navDemo");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }
}
</script>

</asp:Content>



