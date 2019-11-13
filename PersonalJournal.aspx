<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="PersonalJournal.aspx.cs" Inherits="Kindred.MIT.PersonalJournal" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" >
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
        <div >    
  <!-- The Grid -->
            <div class="w3-row">
                <div class="w3-col m3">
                    <div runat='server' class='w3-container w3-display-container w3-round w3-theme-l4 w3-theme-border w3-margin-bottom w3-hide-small'></div>
                    </div>
                <div class="w3-col m7">

                    <div class="w3-row-padding">
                        <div class="w3-col m12">

                                    <%=journal %>
                               
                        </div>
                    </div>
                </div>
            </div>
        </div>
</html>
    </asp:Content>
