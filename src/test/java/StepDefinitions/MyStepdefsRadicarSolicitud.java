package StepDefinitions;

import Functions.SeleniumFunctions;
import Integration.Conexion;
import Tasks.ApiRequest;
import Tasks.LoginNPT;
import Tasks.Questions;
import Tasks.Yopmail;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.checkerframework.checker.fenum.qual.FenumUnqualified;
import org.junit.Assert;

import java.util.List;

public class MyStepdefsRadicarSolicitud {
    SeleniumFunctions functions = new SeleniumFunctions();
    LoginNPT loginNPT = new LoginNPT();
    Questions questions = new Questions();
    Yopmail yopmail = new Yopmail();
    ApiRequest apiRequest = new ApiRequest();
    Conexion con = new Conexion();

    @Given("Inicio sesion en {string} como {string}")
    public void iLoginOn(String ambiente, String actor) throws Exception {

        loginNPT.login(ambiente, actor);
    }

    @Given("Necesito registrar un tramite nuevo de {string}")
    public void necesitoRegistrarUnTramiteDeCosmeticosEnUnaEmpresaNacionalRegistrada(String TipoProducto) throws Exception {
        functions.removeKey("Expediente");
        functions.iClicInElement("Menu Radicar Solicitud");
        functions.iClicInElement("Sub Menu Informacion General");
        functions.iClicInElement("Seleccionar Tipo de producto");
        functions.iSelectContains(TipoProducto);
    }

    @When("Selecciono la categoria {string} y el grupo {string}")
    public void seleccionoLaCategoriaYElGrupoPlaguicidasDeUsoDomestico(String categoria, String grupo) throws Exception {
        functions.iClicInElement("Seleccionar Categoria");
        functions.iSelectContains(categoria);
        functions.iClicInElement("Seleccionar Grupo");
        functions.iSelectContains(grupo);
    }

    @When("Selecciono el subgrupo {string}")
    public void seleccionoElSubGrupo(String subgrupo) throws Exception {
        functions.iClicInElement("Seleccionar Subgrupo");
        functions.iSelectContains(subgrupo);
    }

    @And("Selecciono el tipo de tramite {string}")
    public void seleccionoElTipoDeTramiteYLaModalidad(String Tramite) throws Exception {
        functions.scrollPage("end");
        functions.iClicInElement("Seleccionar Tipo de Tramite");
        functions.iSelectContains(Tramite);
    }

    @And("Se muestra un PopUp de confirmacion que contiene el texto {string}")
    public void seMuestraUnPopupConElMensaje(String mensaje) throws Exception {
functions.checkPartialTextElementPresent("PopUp Confirmacion","IVA");
        functions.iClicInElement("Boton Aceptar");
    }

    @And("Selecciono la modalidad {string}")
    public void seleccionoLaModalidad(String Modalidad) throws Exception {
        functions.scrollPage("end");
        functions.iClicInElement("Seleccionar Modalidad");
        functions.iSelectContains(Modalidad);
    }

    @When("Valido que se muestren las modalidades y selecciono {string}")
    public void seleccionoUnTipoDeModalidadYLoAgrego(String modalidad,List<String> modalidades) throws Exception {
        int cant = modalidades.size();
        boolean cantidad;

        functions.scrollPage("end");
        functions.iClicInElement("Seleccionar Modalidad");
        int countList = functions.countElement("//li/span");
         for (String currentData : modalidades) {
            questions.opcionLista(currentData);
        }

        functions.iSelectContains(modalidad);

        if (cant == countList) {
            cantidad = true;
        } else {
            cantidad = false;
        }
        Assert.assertTrue("No coincide la cantidad de modalidades esperados, se esperaban "+cant+" se muestran "+countList,cantidad);
    }


    @And("Selecciono el subtipo de tramite {string}")
    public void seleccionoElSubtipo(String subtipo) throws Exception {
        functions.scrollPage("end");
        functions.iClicInElement("Seleccionar Subtipo Tramite");
        functions.iSelectContains(subtipo);
    }

    @Then("Se muestra la pantalla para asociar una empresa al tramite")
    public void seMuestraLaPantallaParaAsociarUnaEmpresaAlTramite() throws Exception {
        functions.scrollToElement("Boton Continuar");
        functions.attachScreenShot();
        functions.iClicInElement("Boton Continuar");
        functions.waitForElementNotPresent("Spinner");
        functions.waitForElementPresent("Numero de Solicitud");
        functions.iSaveTextOfElementInScenario("Numero de Solicitud", "Numero de Solicitud");
        functions.waitForElementNotPresent("Spinner");
    }

    @And("Se muestra la tarifa {string} correspondiente al tramite")
    public void seMuestraLaTarifaCorrespondienteAlTramiteAlTramite(String tarifa) throws Exception {
        functions.iClicInElement("Boton Consultar Tarifa");
        functions.iWaitTime(1);
        functions.checkIfElementIsPresent("//table[contains(.,'tarifa')]//td[contains(.,'" + tarifa + "')]");
        functions.iSaveTextOfElementInScenario("Tarifa","Valor Tarifa");
        functions.iClicInElement("Boton Cerrar");
    }


    @Given("Se muestran las tarifas correspondientes al tramite")
    public void tarifasDelTramite(List<String> tarifas) throws Exception {
        boolean cantidad;

        functions.iClicInElement("Boton Consultar Tarifa");
        functions.iWaitTime(1);
        for (String currentData : tarifas) {
            functions.checkIfElementIsPresent("//table[contains(.,'tarifa')]//td[contains(.,'" + currentData + "')]");
        }
        int countList = functions.countElement("//table[contains(.,'tarifa')]//tbody/tr");
        int cant = tarifas.size();

        if (cant == countList) { cantidad = true; } else { cantidad = false; }
        Assert.assertTrue("No coincide la cantidad de tarifas esperados, se esperaban "+cant+" se muestran "+countList,cantidad);



        functions.iClicInElement("Boton Cerrar");
    }

    @Given("Asocio una empresa con Cedula {string}")
    public void asocioUnaEmpresaCedula(String cedula) throws Exception {
        functions.iLoadTheDOMInformation("Tramites.json");
        functions.waitForElementNotPresent("Spinner");
        int btnCambiarTitular = functions.countElement("Boton Cambiar Titular");
        if (btnCambiarTitular > 0) {
            functions.iClicInElement("Boton Cambiar Titular");
        } else {
            functions.iClicInElement("Boton Consultar Titular");
        }
        functions.iClicInElement("Seleccionar Origen de la Empresa");
        functions.iSelectContains("Nacional");
        functions.iWaitTime(2);
        functions.iClicInElement("Seleccionar Tipo de Documento");
        functions.iSelectContains("de ciudadan");
        functions.iSetElementWithText("Numero de Documento", cedula);
        functions.iClicInElement("Boton Consultar Popup");
        functions.iWaitTime(1);
        functions.attachScreenShot();
    }

    @Given("Asocio una empresa nacional")
    public void asocioUnaEmpresa() throws Exception {
        functions.iClicInElement("Boton Consultar Titular");
        functions.iClicInElement("Seleccionar Origen de la Empresa");
        functions.iSelectContains("Nacional");
        functions.iWaitTime(2);
        functions.iClicInElement("Seleccionar Tipo de Documento");
        String tipoDoc = functions.ScenaryData.get("TipoDocEmpresa");
        functions.iSelectContains(tipoDoc);
        functions.iSetElementWithKeyValue("Numero de Documento", "NumeroDocEmpresa");
        functions.iClicInElement("Boton Consultar Popup");
        functions.iWaitTime(1);
        functions.attachScreenShot();
    }

    @Given("Asocio una empresa extranjera")
    public void asocioUnaEmpresaExtranjera() throws Exception {
        functions.iClicInElement("Boton Consultar Titular");
        functions.iClicInElement("Seleccionar Origen de la Empresa");
        functions.iSelectContains("Extranjera");
        functions.iWaitTime(2);
        functions.iClicInElement("Seleccionar Pais");
        String pais = functions.ScenaryData.get("PaisEmpresaExtranjera");
        String codEmpresa = functions.ScenaryData.get("CodEmpresaExtranjera");
        functions.iSelectContains(pais);
        functions.iSetElementWithText("Codigo de Inscripcion", codEmpresa);
        functions.iClicInElement("Boton Consultar Popup");
        functions.iWaitTime(1);
        functions.attachScreenShot();
    }

    @Given("Asocio una empresa con NIT {string}")
    public void asocioUnaEmpresaNit(String nit) throws Exception {
        functions.iClicInElement("Boton Consultar Titular");
        functions.iClicInElement("Seleccionar Origen de la Empresa");
        functions.iSelectContains("Nacional");
        functions.iWaitTime(2);
        functions.iClicInElement("Seleccionar Tipo de Documento");
        functions.iSelectContains("NIT");
        functions.iSetElementWithText("Numero de Documento", nit);
        functions.iClicInElement("Boton Consultar Popup");
        functions.iWaitTime(1);
        functions.attachScreenShot();
    }

    @When("Selecciono una sucursal")
    public void seleccionoSucursalDeLaEmpresa() throws Exception {
        functions.iClicInElement("Radio Primer Resultado");
        functions.iClicInElement("Boton Agregar");
        functions.waitForElementNotPresent("Spinner");
    }

    @Then("Se muestra la informacion de la empresa y el representante legal")
    public void seMuestraLaInformacionDeLaEmpresaYElRepresentanteLegal() throws Exception {
        functions.iWaitTime(2);
        functions.scrollToElement("CheckBox Representante Legal");
        functions.iClicInElement("CheckBox Representante Legal");
    }

    @Then("Puedo ver la seccion de apoderado")
    public void seMuestraLaInformacionDelApoderado() throws Exception {
        functions.iWaitTime(2);
        functions.scrollToElement("CheckBox Tiene Apoderado");
        functions.iClicInElement("CheckBox Tiene Apoderado");
        functions.checkIfElementIsPresent("CheckBox Apoderado");
    }

    @Then("Puedo ver y seleccionar un director tecnico")
    public void seMuestraLaInformacionDeLDirectorTecnico() throws Exception {
        functions.iWaitTime(2);
// Valido si esta selecionado el director en la tabla
        int marcadoDirector = functions.countElement("(//p-checkbox[@name='groupTechn']//div[@role='checkbox'][@aria-checked='true'])[1]");
        if (marcadoDirector==0){
            functions.scrollToElement("CheckBox Director Tecnico");
            functions.iClicInElement("CheckBox Director Tecnico");
        }
        functions.scrollToElement("Boton Editar Director");
        functions.iClicInElement("Boton Editar Director");
        functions.waitForElementNotPresent("Spinner");
        functions.iClicInElement("Seleccionar Profesion");
        functions.iSelectContains("Sistemas");
        functions.iSetElementWithText("Numero Tarjeta Profesional","EH11998653");
        functions.SaveInScenarioFile("Tarjeta", "pdf");
        functions.iSetElementWithKeyValue("Boton Adjuntar", "Tarjeta");
        functions.scrollToElement("Boton Guardar PopUp");
        functions.iClicInElement("Boton Guardar PopUp");
        functions.attachScreenShot();
        functions.waitForElementNotPresent("Spinner");
        functions.attachScreenShot();
    }


    @Then("Desactivar director tecnico")
    public void desactivarLaInformacionDeLDirectorTecnico() throws Exception {
        functions.iWaitTime(2);
        int editarDirecto = functions.countElement("//app-legal-information-technical-director//button[@icon='ui-icon-edit']");
        if(editarDirecto!=0){
            functions.scrollToElement("CheckBox Director Tecnico");
            functions.iClicInElement("CheckBox Director Tecnico");
        }

    }

    @Then("No debo ver la seccion de director tecnico")
    public void NoseMuestraLaInformacionDeLDirectorTecnico() throws Exception {
        functions.iWaitTime(2);
        functions.checkIfElementIsNotPresent("Seccion Director Tecnico");
    }


    @Given("Necesito ingresar los roles")
    public void necesitoIngresarLosRoles() throws Exception {
        functions.scrollToElement("Seleccionar Tipo de Rol");
        functions.iClicInElement("Seleccionar Tipo de Rol");

    }


    @When("Valido que se muestren los roles y selecciono el rol {string}")
    public void seleccionoUnTipoDeRolYLoAgrego(String rol,List<String> roles) throws Exception {
        int countList = functions.countElement("//li/span");
        int cant = roles.size();
        boolean cantidad;

        for (String currentData : roles) {
            questions.opcionLista(currentData);
        }
        functions.iSelectContains(rol);
        if(rol.equals("Fabricante")){
            // Mensaje el fabricante es el mismo titular.
            functions.iClicInElement("Boton Si");
        } else {

            functions.iSetElementWithKeyValue("Numero de Documento", "NumeroDocEmpresa");
            functions.iClicInElement("Boton Consultar Popup");
            functions.iWaitTime(1);
            functions.attachScreenShot();
            seleccionoSucursalDeLaEmpresa();
            //  functions.iClicInElement("Boton Adicionar Rol");

        }

        if (cant == countList) { cantidad = true; } else { cantidad = false; }
        Assert.assertTrue("No coincide la cantidad de roles esperados, se esperaban "+cant+" se muestran "+countList,cantidad);
    }

    @Given("Necesito modificar el rol")
    public void necesitoModificarElRol() throws Exception {
        functions.iClicInElement("Boton Cambiar Rol Fabricante");
    }

    @When("Selecciono el rol y lo modifico con cedula {string}")
    public void seleccionoElRolYLoModificoConCedula(String cedula) throws Exception {
        functions.iClicInElement("Seleccionar Origen de la Empresa");
        functions.iSelectContains("Nacional");
        functions.iWaitTime(2);
        functions.iClicInElement("Seleccionar Tipo de Documento");
        functions.iSelectContains("de ciudadan");
        functions.iSetElementWithText("Numero de Documento", cedula);
        functions.iClicInElement("Boton Consultar Popup");
        functions.iClicInElement("Radio Primer Resultado");
        functions.iClicInElement("Boton Agregar");
    }

    @Then("Se visualiza el rol en la tabla de informacion de roles")
    public void seVisualizaElRolEnLaTablaDeInformacionDeRoles() {
    }

    @Given("Necesito agregar un certificado tipo {string} a un rol")
    public void necesitoAgregarUnCertificadoAUnRol(String tipo) throws Exception {

        for (int retry = 0; retry < 3; retry++) {
        try {
        functions.iClicInElement("Boton Documento");
        functions.waitForElementNotPresent("Spinner");
        functions.scrollToElement("Seleccionar Tipo Certificado");
        functions.iClicInElement("Seleccionar Tipo Certificado");
        functions.attachScreenShot();
        functions.iSelectContains(tipo);
        functions.iSetElementWithText("Numero Certificado", "255");
        functions.iClicInElement("Seleccionar Pais Certificado");
        functions.iSelectContains("Co");
        functions.iSetElementWithText("Fecha Expedicion", "03/05/2022");
            retry = 3;
        } catch (Exception e) {
            functions.iClicInElement("Cerrar Visor");
        }
        }

    }

    @When("Valido que se muestren los tipos de certificado y selecciono {string}")
    public void necesitoAgregarUnCertificadoAUnRol(String tipo,List<String> tipos) throws Exception {
        int countList = functions.countElement("//li/span");
        int cant = tipos.size();
        boolean cantidad;

        functions.iClicInElement("Boton Documento");
        functions.waitForElementNotPresent("Spinner");
        functions.scrollToElement("Seleccionar Tipo Certificado");
        functions.iClicInElement("Seleccionar Tipo Certificado");

        for (String currentData : tipos) {
            questions.opcionLista(currentData);
        }

        functions.attachScreenShot();
        functions.iSelectContains(tipo);
        functions.iSetElementWithText("Numero Certificado", "255");
        functions.iClicInElement("Seleccionar Pais Certificado");
        functions.iSelectContains("Co");
        functions.iSetElementWithText("Fecha Expedicion", "03/05/2022");

        if (cant == countList) { cantidad = true; } else { cantidad = false; }
        Assert.assertTrue("No coincide la cantidad de tipos de certificado esperados.",cantidad);
    }

    @When("Agrego el certificado")
    public void agregoElCertificado() throws Exception {
        functions.SaveInScenarioFile("Certificado", "pdf");
        functions.iSetElementWithKeyValue("Boton Adjuntar", "Certificado");
        functions.iClicInElement("Boton Agregar");
        functions.iClicInElement("Boton Guardar PopUp");
        functions.waitForElementNotPresent("Spinner");
    }

    @Then("Puedo visualizar el documento cargado")
    public void puedoVisualizarElDocumentoCargado() throws Exception {
        functions.iWaitTime(1);
        functions.scrollToElement("Boton Finalizar");
        functions.checkIfElementIsPresent("Tabla Dialog Primer Resultado");
        functions.iClicInElement("Boton Finalizar");
    }

    @Given("Necesito agregar un medio de notificacion")
    public void necesitoAgregarUnMedioDeNotificacion() throws Exception {
        functions.iClicInElement("Seleccionar Tipo de Notificacion");
        functions.attachScreenShot();

    }

    @When("Selecciono el tipo de notificacion por correo")
    public void seleccionoElTipoDeNotificacionPorCorreo() throws Exception {
        functions.iSelectContains("n Electr");
        functions.waitForElementPresent("Email para Notificacion");
        functions.iSetElementWithKeyValue("Email para Notificacion", "Representante");
        functions.iSetElementWithKeyValue("Confirmar Email para Notificacion", "Representante");
        functions.attachScreenShot();
        functions.iClicInElement("Guardar Correo Notificacion");
        functions.iWaitTime(2);
    }

    @When("Selecciono el tipo de notificacion personal")
    public void seleccionoElTipoDeNotificacionPersonal() throws Exception {
        functions.iSelectContains("Personal");
    }

    @Then("Puedo continuar a la pantalla tecnica")
    public void puedoContinuarPantallaTecnica() throws Exception {

        // Valido si se muestra la tabla de director y lo edito.
        int existeDirector = functions.countElement("Boton Editar Director");
        if (existeDirector!=0){
            seMuestraLaInformacionDeLDirectorTecnico();
        }


        functions.scrollAllPageAndTakeScreenShots();
functions.scrollPage("end");
functions.iClicInElement("Boton Guardar");
functions.waitForElementNotPresent("Spinner");
        functions.iClicInElement("Boton Continuar");
        functions.waitForElementNotPresent("Spinner");
        functions.attachScreenShot();

    }

    @Given("Necesito registrar la informacion general del producto")
    public void necesitoRegistrarLaInformacionGeneralDelProducto() throws Exception {

    }

    @Then("Puedo ingresar la documentacion requerida")
    public void puedoIngresarLaDocumentacionRequerida() throws Exception {
        functions.iLoadTheDOMInformation("Tramites.json");
        functions.scrollAllPageAndTakeScreenShots();
        functions.iClicInElement("Boton Continuar");
        functions.waitForElementNotPresent("Spinner");
        functions.attachScreenShot();
    }

    @Then("Puedo firmar la lista de materias primas con revisor fiscar o contador")
    public void puedoFirmarListaMateriasPrimas() throws Exception {
        functions.iLoadTheDOMInformation("Tramites.json");
        functions.scrollAllPageAndTakeScreenShots();
        functions.iClicInElement("Boton Continuar");
        functions.waitForElementNotPresent("Spinner");
        functions.attachScreenShot();
        functions.checkPartialTextElementPresent("PopUp Confirmacion","debe firmarse el listado");
        functions.iClicInElement("Boton Aceptar");
    }
    @Given("Necesito ingresar toda la documentacion requerida")
    public void necesitoIngresarTodaLaDocumentacionRequerida() throws Exception {
        functions.iLoadTheDOMInformation("Tramites.json");
    }

    @When("Adjunto el documento requerido {string}")
    public void adjuntoDocumentoNecesario(String nombre) throws Exception {
        functions.iClicInElement("Nombre del Documento");
        functions.iSelectContains(nombre);
        functions.iSetElementWithText("Cantidad de Folios", "2");
        functions.SaveInScenarioFile("Principal", "pdf");
        functions.iSetElementWithKeyValue("Boton Adjuntar", "Principal");
        functions.scrollToElement("Boton Adjuntar");
    }

    @When("Valido que se muestren los documentos obligatorios y los agrego")
    public void adjuntoDocumentoNecesario(List<String> nombre) throws Exception {

        for (String currentData : nombre) {
            functions.iClicInElement("Nombre del Documento");
            functions.iSelectContains(currentData);
            functions.iSetElementWithText("Cantidad de Folios", "2");
            functions.SaveInScenarioFile("Principal", "pdf");
            functions.iSetElementWithKeyValue("Boton Adjuntar", "Principal");
            functions.scrollToElement("Boton Adjuntar");
        }

    }

    @Then("Puedo visualizar la informacion general de la tarifa")
    public void puedoVisualizarLaInformacionGeneralDeLaTarifa() throws Exception {
        functions.scrollAllPageAndTakeScreenShots();
        functions.iLoadTheDOMInformation("Tramites.json");
        int i = functions.countElement("Boton Guardar");
        if (i > 0) {
            functions.waitForElementNotPresent("Spinner");
            functions.iWaitTime(2);
            functions.iClicInElement("Boton Guardar");
            functions.waitForElementNotPresent("Spinner");
        }
        functions.scrollPage("end");
        functions.iClicInElement("Boton Continuar");
        // Aqui inicia la pantalla de tarifa, lo anterior es para guardar la documentación.
functions.waitForElementNotPresent("Spinner");
        int marcado = functions.countElement("//div[@role='radio'][@aria-checked='true']");
        if (marcado == 0) {
            functions.iClicInElement("Radio Primer Resultado");
        }
        functions.iSaveTextOfElementInScenario("Tarifa","Tarifa Seleccionada");
        functions.scrollPage("end");
        functions.attachScreenShot();
    }

    @Given("Necesito visualizar la informacion del tramite")
    public void necesitoVisualizarLaInformacionDelTramite() throws Exception {

    }

    @When("Guardo la informacion")
    public void guardoLaInformacion() throws Exception {
        functions.iClicInElement("Boton Guardar");
        try {
            functions.waitForElementPresent("Alerta");
        } catch (Exception e) {
            functions.refreshPage();
            functions.iClicInElement("Boton Guardar");
        }
        questions.alertaMensaje("Guardado");
    }

    @Then("Puedo ver la informacion del tramite en un PopUp")
    public void puedoVerLaInformacionDelTramiteEnUnWord() throws Exception {
        functions.iClicInElement("Boton Visualizar Tramite");
        functions.iWaitTime(5);
        functions.checkIfElementIsPresent("PDF Visualizacion");
        functions.iClicInElement("Cerrar Visor");
    }

    @When("Solicito firmar la lista de materias primas")
    public void solicitoFirmarListaMateriasPrimas() throws Exception {
        functions.iClicInElement("Boton Firmar Listado de Materias Primas");
        functions.checkPartialTextElementPresent("PopUp Confirmacion","una vez firme el listado de materias");
        functions.iClicInElement("Boton Aceptar");
        functions.waitForElementNotPresent("Spinner");
        functions.attachScreenShot();
        functions.iClicInElement("Cerrar Visor");
        functions.waitForElementNotPresent("Spinner");
        functions.waitForElementPresent("Correo Representante");
        functions.attachScreenShot();
    }

    @When("Solicito firmar el documento")
    public void solicitoFirmarElDocumento() throws Exception {
        functions.iClicInElement("Boton Firmar");
        //functions.iSaveTextOfElementInScenario("Correo Representante", "Correo Representante");
        functions.waitForElementPresent("Correo Representante");
        functions.attachScreenShot();
    }

    @Then("El funcionario recibe al correo electronico un codigo de confirmacion")
    public void elFuncionarioRecibeAlCorreoElectronicoUnCodigoDeConfirmacion() throws Exception {
        // por ahora se deshabilita outlook porque esta fallando la pagina de ellos.
      //  yopmail.obtenerCodigoFirmaOutlook();

        String numeroSolicitud = functions.ScenaryData.get("Numero de Solicitud");
        functions.iSaveTextInScenario("Contenido Correo",con.obtenerCodigoOTP(numeroSolicitud));

        functions.iLoadTheDOMInformation("Tramites.json");
    }

    @Then("Obtengo el codigo de confirmacion OTP")
    public void obtengoCodigoDeConfirmacionOTP() throws Exception {
        String numeroSolicitud = functions.ScenaryData.get("Numero de Solicitud");
        functions.iSaveTextInScenario("Contenido Correo",con.obtenerCodigoOTP(numeroSolicitud));
        functions.iLoadTheDOMInformation("Tramites.json");
    }

    @Given("Tengo un codigo de confirmacion para firmar el documento")
    public void tengoUnCodigoDeConfirmacionParaFirmarElDocumento() throws Exception {
        functions.iClicInElement("Boton Aceptar");
    }

    @When("Ingreso el codigo de confirmacion y firmo el documento")
    public void ingresoElCodigoDeConfirmacion() throws Exception {
        functions.iSetElementWithKeyValue("Codigo de Verificacion", "Contenido Correo");
        functions.attachScreenShot();
        functions.iClicInElement("Boton Validar");
        functions.waitForElementNotPresent("Spinner");
        functions.iSignObject("Dibujo Firma");
        functions.iClicInElement("Boton Agregar Firma");
        functions.waitForElementNotPresent("Spinner");
        functions.iWaitTime(4);
        functions.waitForElementNotPresent("Spinner");

    }


    @Then("El sistema me permite radicar la solicitud y me genera un numero de tramite.")
    public void elSistemaMePermiteRadicarLaSolicitudYMeGeneraUnNumeroDeTramite() throws Exception {
        functions.checkIfElementIsEnable("Boton Continuar");
        functions.iClicInElement("Boton Continuar");
        functions.iWaitTime(1);
        functions.attachScreenShot();
    }

    @Given("Tengo la solicitud asignada con estado {string}")
    public void tengoLaSolicitudConEstado(String estado) throws Exception {
        questions.consultarMiSolicitud(estado);
    }


    @Given("Tengo el tramite con estado {string}")
    public void tengoElTramiteConEstado(String estado) throws Exception {
        questions.consultarMiTramite(estado);
    }


    @When("realizo el pago del tramite y radico el tramite")
    public void realizoElPagoDelTramiteYRadicoElTramite() throws Exception {
        functions.scrollPage("end");
        functions.attachScreenShot();
        functions.iClicInElement("Boton Codigo de Barras");
        functions.waitForElementNotPresent("Spinner");
        apiRequest.pagarFactura();
        functions.iSetElementWithKeyValue("Codigo del Pago", "Numero Recibo");
        functions.iClicInElement("Boton Buscar");
        functions.waitForElementNotPresent("Spinner");
        functions.scrollPage("end");
        functions.iClicInElement("Seleccionar Envio Factura");
        functions.iSelectContains("Representante");
        functions.iClicInElement("Boton Radicar");
        functions.attachScreenShot();
        functions.waitForElementNotPresent("Spinner");
    }

    @Then("El sistema genera el numero de radicado y numero de expediente")
    public void elSistemaGeneraElNumeroDeRadicadoYNumeroDeExpediente() throws Exception {
        functions.checkIfElementIsPresent("//div[@role='dialog']//span[contains(.,'Radicado')]");
        functions.iSaveTextOfElementInScenario("Radicado", "//div[@role='dialog']");
        functions.iSaveTextOfElementInScenario("Expediente", "//div[@role='dialog']");
        functions.iExtractOfKey("Radicado", "Radicado: ", " Exp.");
        functions.iExtractOfKey("Expediente", "Exp. ", "\n Tipo de entrega:");
       // functions.iExtractRightOfKey("Expediente", 10);
        functions.iWaitTime(4);
        functions.iClicInElement("Cerrar Visor");
        functions.waitForElementNotPresent("Spinner");
    }

    @Then("El sistema genera el numero de radicado y numero de expediente no asociado")
    public void elSistemaGeneraElNumeroDeRadicadoYNumeroDeExpedienteNoAsociado() throws Exception {
        functions.checkIfElementIsPresent("//div[@role='dialog']//span[contains(.,'Radicado')]");
        functions.iSaveTextOfElementInScenario("Radicado", "//div[@role='dialog']");
        functions.iSaveTextOfElementInScenario("Expediente2", "//div[@role='dialog']");
        functions.iExtractOfKey("Radicado", "Radicado: ", " Exp.");
        functions.iExtractOfKey("Expediente2", "Exp. ", "\n Tipo de entrega:");
        functions.iWaitTime(4);
    }

    @And("Necesito registrar un tramite asociado a un expediente")
    public void necesitoRegistrarUnNumeroDeExpediente() throws Exception {
        functions.iClicInElement("Menu Radicar Solicitud");
        functions.iClicInElement("Sub Menu Informacion General");
        functions.iClicInElement("Seleccionar Tramite Asociado Expediente");
        functions.iSetElementWithKeyValue("Ingresar Numero de Expediente", "Expediente");
        functions.iClicInElement("Boton Consultar");
        functions.attachScreenShot();
        functions.waitForElementNotPresent("Spinner");
    }

    //MEtodo de prueba, mientras arreglas cuando se consulta la solicitud y queda en pendiente de pago
    @When("realizo el pago del tramite y radico el tramite 1")
    public void realizoElPagoDelTramiteYRadicoElTramite1() throws Exception {

        functions.iClicInElement("Seleccionar Envio Factura");
        functions.iSelectContains("Representante");
        functions.iClicInElement("Boton Radicar");
        functions.attachScreenShot();
        functions.waitForElementNotPresent("Spinner");
    }

    @And("Asocio un interesado nacional")
    public void asocioUnInteresadoNacional() throws Exception {
        functions.iClicInElement("Boton Consultar Interesado");
        functions.iClicInElement("Seleccionar Origen de la Empresa");
        functions.iSelectContains("Nacional");
        functions.iWaitTime(2);
        functions.iClicInElement("Seleccionar Tipo de Documento");
        String tipoDoc = functions.ScenaryData.get("TipoDocEmpresa");
        functions.iSelectContains(tipoDoc);
        functions.iSetElementWithKeyValue("Numero de Documento", "NumeroDocEmpresa");
        functions.iClicInElement("Boton Consultar Popup");
    }

    @When("Selecciono solo la categoria {string}")
    public void seleccionoSoloLaCategoriaCertificacionesSinRS(String categoria) throws Exception {
        functions.iClicInElement("Seleccionar Categoria");
        functions.iSelectContains(categoria);
    }


    @Then("Se muestra la informacion de la empresa y selecciono el nuevo representante legal")
    public void seMuestraLaInformacionDeLaEmpresaYSeleccionoElNuevoRepresentanteLegal() throws Exception {
        functions.iWaitTime(2);
        functions.scrollToElement("CheckBox Representante Legal");
        functions.iClicInElement("CheckBox Representante Legal");
        functions.iClicInElement("CheckBox Nuevo Representante Legal");
        functions.attachScreenShot();
    }

    @And("Puedo previsualizar el certificado")
    public void puedoPrevisualizarElCertificado() throws Exception {
        functions.iClicInElement("Boton Previsualizar Certificado");
        functions.waitForElementPresent("Spinner");
        functions.iWaitTime(2);
        functions.attachScreenShot();
        functions.iClicInElement("//a[@tabindex=0]//span");
        functions.iSendKeyEscapeToPerform();
    }

    @Then("Puedo realizar una accion sobre el tramite")
    public void puedoRealizarUnaAccionSobreElTramite() throws Exception {

        functions.iClicInElement("Acciones Sobre el Tramite");
    }


    @When("Valido que se muestren las acciones y selecciono {string}")
    public void puedoRealizarUnaAccionSobreElTramite(String accion,List<String> acciones) throws Exception {
        functions.checkIfElementIsPresent("//div[contains(@role,'dialog')]");
        int countList = functions.countElement("//li/span");
        int cant = acciones.size();
        boolean cantidad;

        functions.scrollPage("end");
        functions.iClicInElement("Acciones Sobre el Tramite");
        functions.iClicInElement("Acciones Sobre el Tramite");
        functions.iWaitTime(2);
        for (String currentData : acciones) {
            questions.opcionLista(currentData);
        }

        functions.iSelectContains(accion);

        if (cant == countList) { cantidad = true; } else { cantidad = false; }
        Assert.assertTrue("No coincide la cantidad de acciones esperadas.",cantidad);
        functions.iClicInElement("Boton Aceptar");
    }


    @Then("Selecciono la accion {string}")
    public void seleccionoLaAccionSobreElTramite(String accion) throws Exception {
        functions.iSelectContains(accion);
        functions.iClicInElement("Boton Aceptar");
        functions.iWaitTime(2);
        functions.iSetElementWithText("Observaciones", "Se adjunta documento");
    }

    @Then("Puedo radicar el tramite")
    public void puedoRadicarElTramite() throws Exception {

        int checkAutorizo = functions.countElement("//label[contains(.,'Autorizo')]/..//div[contains(@role, 'checkbox')]");
        if (checkAutorizo>0){
            functions.iClicInElement("//label[contains(.,'Autorizo')]/..//div[contains(@role, 'checkbox')]");
        }

        functions.iClicInElement("Boton Radicar");
        functions.waitForElementPresent("//p-toastitem");
        functions.attachScreenShot();
        functions.waitForElementNotPresent("Spinner");
        functions.iClicInElement("Boton Aceptar");
    }

    @When("Realizo el pago de tramite con codigo de barras")
    public void realizoElPagoDeTramiteConCodigoDeBarras() throws Exception {
      //  ApiRequest apiRequest = new ApiRequest();
      //  apiRequest.simularRPA();
     //   apiRequest.pagarFactura("00000000004291",2886216,"1193558070");

        con.obtenerIdTramite("20222006970");
        functions.iLoadTheDOMInformation("Tramites.json");
        functions.navigateTo("https://es.lipsum.com/");
       // functions.checkIfElementIsPresent("tildes");
        functions.scrollAllPageAndTakeScreenShots();
    }

    @Given("Necesito el id tramite del radicado {string}")
    public void necesitoIdTramite(String radicado) throws Exception {
        String idTramite = con.obtenerIdTramite(radicado);
        System.out.println("El id del tramite es: "+idTramite);
    }

    @Given("Necesito realizar el pago por giro internacional")
    public void necesitoRealizarElPagoPorGiroInternacional() throws Exception {
        functions.iLoadTheDOMInformation("Tramites.json");
        functions.iClicInElement("Pago Internacional");
    }

    @When("Ingreso los datos del pago y comprobante")
    public void ingresoLosDatosDelPagoYComprobante() throws Exception {
        functions.waitForElementNotPresent("Spinner");
        functions.iSetElementWithText("Entidad Recaudadora","Banco nequi");
        functions.iSetElementWithText("Numero de Cuenta","432580556898");
        functions.iSetElementWithText("Numero de Transaccion","2023");
        functions.iClicInElement("Fecha de Consignacion");
        functions.iClicInElement("Fecha Actual");
        functions.iClicInElement("Seleccionar Pais");
        functions.iSelectContains("Alemania");
        functions.iClicInElement("Departamento");
        functions.iSelectContains("Berliini");
        functions.iClicInElement("Ciudad");
        functions.iSelectContains("Berlin");
        functions.iSetElementWithKeyValue("Valor","Tarifa");
    }

    @Then("Se guarda la información del pago")
    public void seGuardaLaInformaciónDelPago() throws Exception {
        functions.iClicInElement("Boton Guardar Pago Giro Internacional");
        functions.waitForElementNotPresent("Spinner");
    }

    @And("Se muestra la infromacion del pago realizado por giro internacional")
    public void seMuestraLaInfromacionDelPagoRealizadoPorGiroInternacional() throws Exception {
        functions.scrollToElement("Boton Codigo de Barras Deshabilitado");
        functions.checkIfElementIsPresent("Boton Codigo de Barras Deshabilitado");
        functions.checkIfElementIsPresent("Boton Pse Deshabilitado");
        functions.checkIfElementIsPresent("Confirmacion Pago Giro Internacional");
    }

}
