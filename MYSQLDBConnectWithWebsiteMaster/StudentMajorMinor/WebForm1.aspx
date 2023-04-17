<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="MYSQLDBConnectWithWebsiteMaster.StudentMajorMinor.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
         <form>
             <h1>
                 Login !!
             </h1>
              <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Email address</label>
                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" runat="server" required>
              </div>
              <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Password</label>
                <input type="password" class="form-control" id="exampleInputPassword1" runat="server" required>
              </div>
             <asp:Button class="btn btn-primary" ID="loginbtn" OnClick="validateCredentialsLogin" runat="server" Text="Login" />
             <asp:Label ID="Validationlbl" runat="server" ForeColor="Red"></asp:Label>
        </form>
    </div>
       
</asp:Content>
