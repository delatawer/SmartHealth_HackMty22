<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="SmartHealth._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 
    <div class="container text-center">
        <div class="row align-items-start">
            <div class="col" style="height:300px">
                <div class="card" style="width: 30rem;">
                    <img src="Imagenes//hospital.JPEG" class="card-img-top" alt="...">
                    <div class="card-body">
                        <p class="card-text">Hospitales.</p>
                        <button type="button" class="btn btn-primary" data-bs-toggle="collapse" data-bs-target="#botonHospitales" aria-expanded="false" aria-controls="botonHospitales">Iniciar Sesion</button>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card" style="width: 30rem;">
                    <img src="Imagenes//ImageConsultaMedicos.JPEG" class="card-img-top" alt="...">
                    <div class="card-body">
                        <p class="card-text">Doctores.</p>
                        <button type="button" class="btn btn-primary" data-bs-toggle="collapse" data-bs-target="#botonDoctores" aria-expanded="false" aria-controls="botonDoctores">Iniciar Sesion</button>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card" style="width: 30rem;">
                    <img src="Imagenes//paciente.JPEG" class="card-img-top" alt="...">
                    <div class="card-body">
                        <p class="card-text">Pacientes.</p>
                        <button type="button" class="btn btn-primary" data-bs-toggle="collapse" data-bs-target="#botonPacientes" aria-expanded="false" aria-controls="botonPacientes">Iniciar Sesion</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <%--Boton hospitales--%>
    <div class="container text-center">
        <div class="row align-items-start">
            <div class="col">
                <div style="min-height: 120px;">
                    <div class="collapse collapse-horizontal" id="botonHospitales">
                        <div class="card card-body" style="width: 300px;">
                           <h1> Hospitales</h1>
                            <input id="inputUser" runat="server" type="text" class="form-control" placeholder="Username" aria-label="Recipient's username" aria-describedby="basic-addon2" value="">
                            <input id="inputPass" runat="server" type="Password" class="form-control" placeholder="Password" aria-label="Recipient's username" aria-describedby="basic-addon2" value="">
                            <asp:Button Text="Submit" runat="server" onClick="SubmitHospital_Click" type="button" class="btn btn-primary" />
                            <%--<button id="submitHospital" onClick="SubmitHospital" runat="server" type="button" class="btn btn-primary">Submit</button>--%>
                        </div>
                    </div>
                </div>
            </div>
        <%--Boton doctores--%>
            <div class="col">
                <div style="min-height: 120px;">
                    <div class="collapse collapse-horizontal" id="botonDoctores">
                        <div class="card card-body" style="width: 300px;">
                            <h1> Doctores</h1>
                            <input id="inputUserDoctores" runat="server" type="text" class="form-control" placeholder="Username" aria-label="Recipient's username" aria-describedby="basic-addon2" value="">
                            <input id="inputPassDoctores" runat="server" type="Password" class="form-control" placeholder="Password" aria-label="Recipient's username" aria-describedby="basic-addon2" value="">
                            <asp:Button Text="Submit" runat="server" OnClick="SubmitDoctores_Click" type="button" class="btn btn-primary" />
                        </div>
                    </div>
                </div>
            </div>
            <%--boton Pacientes--%>
            <div class="col">
                <div style="min-height: 120px;">
                    <div class="collapse collapse-horizontal" id="botonPacientes">
                        <div class="card card-body" style="width: 300px;">
                            <h1> Pacientes</h1>
                            <input id="inputUserPaciente" runat="server" type="text" class="form-control" placeholder="Username" aria-label="Recipient's username" aria-describedby="basic-addon2" value="">
                            <input id="inputPassPaciente" runat="server" type="Password" class="form-control" placeholder="Password" aria-label="Recipient's username" aria-describedby="basic-addon2" value="">
                            <asp:Button Text="Submit" runat="server" OnClick="SubmitPacientes_Click" type="button" class="btn btn-primary" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>




</asp:Content>
