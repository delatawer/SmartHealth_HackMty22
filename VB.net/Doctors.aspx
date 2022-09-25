<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Doctors.aspx.vb" Inherits="SmartHealth.Doctors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

    <title>Doctors</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see https://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>
        <nav class="navbar align-content-center bg-light navbar-fixed-top">

            <h1>SmartHealth</h1>
            <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="Agendar.aspx">Agendar</a>
        </li>
                </ul>
        </nav>

        <div class="input-group mb-3">
            <asp:Button Text="Buscar Nombre Del Paciente" OnClick="GetPacientes_Click" runat="server"  type="button" class="btn btn-primary" />
            <input type="text" runat="server" class="form-control" id="SearchPatient" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1"/>
        </div>
        <br />
        <br />

        <asp:GridView ID="GridView1" runat="server" class="table" ShowHeaderWhenEmpty="true" onrowcommand="GridView1_RowCommand" AutoGenerateColumns="False" >
   <Columns>
     <asp:BoundField DataField="Id" HeaderText="Id"  />
     <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
     <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
     <asp:BoundField DataField="Nacimiento" HeaderText="Fecha de Nacimiento" SortExpression="Nacimiento" />
     <asp:BoundField DataField="Peso" HeaderText="Peso" SortExpression="Peso" />
     <asp:BoundField DataField="Estatura" HeaderText="Estatura" SortExpression="Estatura" />
     <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
     <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
     <asp:BoundField DataField="Contrasena" HeaderText="Contraseña" SortExpression="Contrasena" />
       <asp:TemplateField>
            <ItemTemplate>
                <asp:Button Text="Historial" runat="server" ID="LinkButton" CommandName="DataCommand" type="button" class="btn btn-primary" CommandArgument="<%# Container.DataItemIndex %>" />
            </ItemTemplate>
        </asp:TemplateField>
     
  </Columns>
</asp:GridView>

        <asp:GridView ID="GridView2" runat="server" class="table" ShowHeaderWhenEmpty="true"  AutoGenerateColumns="False" >
            <HeaderStyle 
                BackColor="Blue" 
                Font-Italic="false"
                ForeColor="snow"
                />
   <Columns>
     <asp:BoundField DataField="nombrePaciente" HeaderText="Nombre del Paciente"  />
     <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString = "{0:dd/MM/yyyy}"/>
     <asp:BoundField DataField="hora" HeaderText="Hora" />
       
     
  </Columns>
</asp:GridView>

    </form>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>

</body>
</html>
