<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="HistorialPaciente.aspx.vb" Inherits="SmartHealth.HistorialPaciente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

    <title></title>
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
        </nav>
        <div class="text-center">
            <button type="button" class="btn btn-primary" data-bs-toggle="collapse" data-bs-target="#botonPacientes" aria-expanded="false" aria-controls="botonPacientes">Crear Historial</button>
            <br />
            <br />
            <div class="collapse collapse-vertical text-center" id="botonPacientes">

                <div class="card card-body text-center">
                    <h1>Pacientes</h1>
                    <input id="inputMotivoPaciente" runat="server" type="text" class="form-control" placeholder="Motivo de Visita" aria-describedby="basic-addon2">
                    <input id="inputDiagnosticoPaciente" runat="server" type="text" class="form-control" placeholder="Diagnostico del Paciente" aria-describedby="basic-addon2">
                    <input id="inputTratamientoPaciente" runat="server" type="text" class="form-control" placeholder="Tratamiento del Paciente" aria-describedby="basic-addon2">
                    <asp:Button Text="Historial" runat="server" OnClick="HistorialSubmit_Click" type="button" class="btn btn-primary" />

                </div>
            </div>
        </div>
        <asp:GridView ID="GridView1" runat="server" class="table" ShowHeaderWhenEmpty="true"  AutoGenerateColumns="False">
            <Columns>

                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
                <asp:BoundField DataField="Nacimiento" HeaderText="Fecha de Nacimiento" SortExpression="Nacimiento" />
                <asp:BoundField DataField="Peso" HeaderText="Peso" SortExpression="Peso" />
                <asp:BoundField DataField="Estatura" HeaderText="Estatura" SortExpression="Estatura" />
                <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
                <asp:BoundField DataField="Motivo" HeaderText="Motivo" SortExpression="Motivo" />
                <asp:BoundField DataField="Diagnostico" HeaderText="Diagnostico" SortExpression="Diagnostico" />
                <asp:BoundField DataField="Tratamiento" HeaderText="Tratamiento" SortExpression="Tratamiento" />

            </Columns>
        </asp:GridView>
    </form>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>

</body>
</html>
