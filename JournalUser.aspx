<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" ValidateRequest="false" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JournalUser.aspx.cs" Inherits="Kindred.MIT.JournalUser" %>

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
        function redalert() {
             swal({
                 title: 'ALERT!',
                 text: 'We have detected concerning words in your post, if you need any help please refer to emergency helpline numbers which are provided at the top as well as bottom of the page!!',
                 type: 'success'
             }).then(function () {
                 window.location="JournalUser.aspx";
             });
        }
         function success() {
             swal({
                 title: 'Success!',
                 text: 'Data saved successfully!!',
                 type: 'success'
             }).then(function () {
                 window.location="JournalUser.aspx";
             });
        }
        function comment() {
             swal({
                 title: 'Success!',
                 text: 'Comment posted successfully!!',
                 type: 'success'
             }).then(function () {
                 window.location="JournalUser.aspx";
             });
        }
        function frndcomment() {
             swal({
                 title: 'Friend List',
                 text: 'Comment status updated successfully!!',
                 type: 'success'
             }).then(function () {
                 window.location="JournalUser.aspx";
             });
        }
        function friendaccpt() {
             swal({
                 title: 'Friend List',
                 text: 'Friend Request accepted !!',
                 type: 'success'
             }).then(function () {
                 window.location="JournalUser.aspx";
             });
        }
        function friendreject() {
             swal({
                 title: 'Friend List',
                 text: 'Friend Request Rejected !!',
                 type: 'success'
             }).then(function () {
                 window.location="JournalUser.aspx";
             });
        }
        function frndsuccess() {
             swal({
                 title: 'Success!',
                 text: 'Friend Request send successfully!!',
                 type: 'success'
             }).then(function () {
                 window.location="JournalUser.aspx";
             });
        }
         function unfriend() {
             swal({
                 title: 'UNFRIEND!',
                 text: 'Unfriend successfully!!',
                 type: 'success'
             }).then(function () {
                 window.location="JournalUser.aspx";
             });
        }
    </script>
    <script src="Themes/js/tinymce/tinymce.min.js"></script>
    <script src="Themes/js/tinymce/plugins/smileys/plugin.min.js"></script>
   
    <style>
.mySlides {display:none;}
</style>
    <script>
    tinymce.init({
      selector:"textarea",
        plugins: "link lists smileys template paste textcolor",
      toolbar: "styleselect fontselect fontsizeselect | smileys forecolor backcolor",
    });
</script>
    <div class="w3-content w3-section" style="max-width:1370px">
  <img class="mySlides  w3-animate-fading" src="Images/pic1.jpg" style="width:100%">
  <img class="mySlides  w3-animate-fading" src="Images/pic2.jpg" style="width:100%">
  <img class="mySlides  w3-animate-fading" src="Images/pic3.jpg" style="width:100%">
</div>
<!-- Page Container -->
<div >    
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m3">
      <!-- Profile -->
      <div class="w3-card w3-round w3-white" style="background-color:#1FA67A">
        <div class="w3-container">
         <h4 class="w3-center" style="color:white;text-transform:uppercase" runat="server" id="UName"></h4>
         <p class="w3-center"><img runat="server" id="usrimage" class="w3-circle" style="height:106px;width:106px" ></p>
         <hr>
         <p runat="server" style="color:white;text-transform:uppercase" class="w3-center" id="Email"><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> </p>
         
        </div>
      </div>
      <br>
      
      <div class="w3-card w3-round w3-white" style="background-color:#1FA67A">
          <p style="text-align: center;color:white;text-transform:uppercase">YOUR POSTS!</p>
          <div class="w3-container">
      <%= journal %>
              </div>
     </div>
    <!-- End Left Column -->
    </div>
    
    <!-- Middle Column -->
    <div class="w3-col m7">
    
      <div class="w3-row-padding">
        <div class="w3-col m12">
           
          <div class="w3-card w3-round w3-white">
            <div class="w3-container w3-padding">
              <h6 style="text-transform:uppercase;font-weight:bold;color:#1FA67A;text-align:center">Put your thoughts below</h6>
                <div class="w3-row">
                <div class="w3-left">
                    <p style="text-transform:uppercase;font-weight:bold;color:#1FA67A">Select Category</p>
                    <asp:DropDownList ID="drop1" DataTextField="CategoryName" AutoPostBack="false" DataValueField="Id" runat="server" style="margin-bottom:10px;">
                </asp:DropDownList>
                </div>
                <div class="w3-right">
                    <p style="text-transform:uppercase;font-weight:bold;color:#1FA67A">Visibility</p>
                    <asp:DropDownList ID="drop2" AutoPostBack="false" runat="server" style="margin-bottom:10px;">
                <asp:ListItem Text="PUBLIC" Value="PUBLIC" Selected="True"></asp:ListItem>
                <asp:ListItem Text="PRIVATE" Value="PRIVATE"></asp:ListItem>
                </asp:DropDownList>
                </div>
                </div>
            
                <textarea runat="server" id="myTextarea"></textarea>
<asp:Button id="Postbutton" runat="server" class="w3-button w3-theme fa fa-pencil" style="margin-top:10px" OnClientClick="myFunction1()" OnClick="Postbutton_Click"  Text="POST" />
            </div>
          </div>
        </div>
      </div>
      <%= htm%>
       
        <asp:Button Style="display: none;" ID="btn2" runat="server" class="w3-button w3-theme fa fa-pencil" OnClientClick="myFunction3()" OnClick="frndaccpt_Click" Text="POST" />
        <asp:Button Style="display: none;" ID="btn3" runat="server" class="w3-button w3-theme fa fa-pencil" OnClientClick="myFunction4()" OnClick="frndreject_Click" Text="POST" />
        <asp:Button Style="display: none;" ID="btn6" runat="server" class="w3-button w3-theme fa fa-pencil" OnClientClick="myFunction6()" OnClick="unfrind_Click" Text="POST" />
        <asp:Button Style="display: none;" ID="btn" runat="server" class="w3-button w3-theme fa fa-pencil" OnClientClick="myFunction2()" OnClick="frndreq_Click" Text="POST" />
        <asp:Button Style="display: none;" ID="btn4" runat="server" class="w3-button w3-theme fa fa-pencil" OnClick="Commentbutton_Click" Text="POST"/>
        <asp:Button Style="display: none;" ID="Button1" runat="server" class="w3-button w3-theme fa fa-pencil" OnClientClick="myFunction9()" OnClick="frndcheck_Click" Text="POST"/>
        <asp:Button Style="display: none;" ID="Button2" runat="server" class="w3-button w3-theme fa fa-pencil" OnClick="frndchecklike_Click" Text="POST"/>
        <asp:Button Style="display: none;" ID="Button3" runat="server" class="w3-button w3-theme fa fa-pencil" OnClick="frndchecksmile_Click" Text="POST"/>
        <input type="text" id="frndrequestto" runat="server" style="display: none" />
        <input type="text" id="friendaccept" runat="server" style="display:none"/>
        <input type="text" id="frnaccinput" runat="server" style="display: none" />
        <input type="text" id="unfriend" runat="server" style="display: none" />
        <input type="text" id="usid" runat="server" style="display: none"/>
        <input type="text" id="date" runat="server" style="display: none"/>
        <input type="text" id="cmmnt" runat="server" style="display:none" />
        <input type="text" id="liked" runat="server" style="display:none" />
        <input type="text" id="smile" runat="server" style="display:none" />
        <input type="text" id="love" runat="server" style="display:none" />
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
      <div class="w3-card w3-round w3-white w3-padding-16 w3-center">
        <div class="w3-container">
            <p>Friend List</p>
            <asp:CheckBoxList runat="server" ID="Firendlist" DataTextField="Username" DataValueField="Allowcomment" Style="text-align: justify;"></asp:CheckBoxList>
            <asp:Button id="frndcmmntbtn" runat="server" class="w3-button w3-theme fa fa-pencil" style="margin-top:10px" OnClick="Friendcomment_Click"  Text="ALLOW TO COMMENT" />
            </div>
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
    function myFunction2(username) {
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
    }
    function myFunction4(frndname) {
        var z = document.getElementById("frndreject"+frndname).parentNode.id;
        document.getElementById("<%= frnaccinput.ClientID %>").value = z.substring(1);
        document.getElementById("<%= btn3.ClientID %>").click();
    }
    function myFunction9(pid) {
        var mm = document.getElementById("klike"+pid).parentNode.id;
        document.getElementById("<%= liked.ClientID %>").value = mm;
        document.getElementById("<%= Button1.ClientID %>").click();
    }
    function myFunction10(pid) {
        var nn = document.getElementById("ksmile"+pid).parentNode.id;
        document.getElementById("<%= smile.ClientID %>").value = nn;
        document.getElementById("<%= Button2.ClientID %>").click();
    }
    function myFunction11(pid) {
        var oo = document.getElementById("kheart"+pid).parentNode.id;
        document.getElementById("<%= love.ClientID %>").value = oo;
        document.getElementById("<%= Button3.ClientID %>").click();
    }
      function myFunc(pid) {
  var elmnt = document.getElementById(pid);
            elmnt.scrollIntoView({
            behavior: 'auto',
            block: 'center',
            inline: 'center'
        });
}
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
     <script>
var myIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}    
  x[myIndex-1].style.display = "block";  
  setTimeout(carousel, 6000); // Change image every 2 seconds
}
</script>
   
       <%-- <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
     style="display:block"
     data-adtest="on"
     data-ad-client="ca-pub-0000000000000000"
     data-ad-slot="0000000000"
     data-ad-format="auto"
     data-full-width-responsive="true"></ins>
    <script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>--%>
</asp:Content>

