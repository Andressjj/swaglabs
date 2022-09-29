package StepDefinitions;

import Functions.SeleniumFunctions;
import Tasks.ApiRequest;
import Tasks.Questions;
import Tasks.Yopmail;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.And;

public class MyStepdefsControlPosterior {
    SeleniumFunctions functions = new SeleniumFunctions();
    Questions questions = new Questions();
    Yopmail yopmail = new Yopmail();
    ApiRequest apiRequest = new ApiRequest();

    @Given("Tengo el tramite pendiente de asignar")
    public void tengoElTramitePendienteDeAsignar() {

    }

    @Then("Puedo asignar el tramite a un funcionario legal y un funcionario tecnico")
    public void puedoAsignarElTramiteAUnFuncionarioLegalYUnFuncionarioTecnico() throws Exception {

        for (int retries = 0; retries < 3; retries++) {
            try {
                functions.iClicInElement("Menu Estudio del Tramite");
                functions.iClicInElement("Menu Asignar Tramites");
                functions.waitForElementNotPresent("Spinner");
                functions.attachScreenShot();
                functions.iClicInElement("Filtro Numero de Radicado");
                functions.iSetElementWithKeyValue("Filtro Numero de Radicado", "Radicado");
                functions.iWaitTime(2);
                functions.iClicInElement("CheckBox Primer Resultado");

                retries = 3;
            } catch (Exception e) {
                functions.attachScreenShot();
                functions.iSaveTextInScenario("ErrorAT", "El servicio no esta mostrando resultado en Asignar Tramites se refresca");
                functions.refreshPage();
                functions.waitForElementNotPresent("Spinner");
            }
        }
        functions.checkIfElementIsPresent("CheckBox Primer Resultado");
        functions.attachScreenShot();
        functions.iClicInElement("Boton Asignar");
        functions.waitForElementNotPresent("Spinner");
        functions.iClicInElement("Seleccionar Rol del Profesional");
        functions.iSelectContains("cnico");
        functions.iClicInElement("Seleccionar Nombre del Profesional");
        functions.iSelectContains("CP");
        functions.iClicInElement("Boton Consultar");
        functions.waitForElementNotPresent("Spinner");
        functions.iClicInElement("CheckBox Seleccionar Profesional");
        functions.iClicInElement("Boton Adicionar");
// Agregar el rol legal.
        functions.iClicInElement("Seleccionar Rol del Profesional");
        functions.iSelectContains("Legal");
        functions.iClicInElement("Seleccionar Nombre del Profesional");
        functions.iSelectContains("Legal CP");
        functions.iClicInElement("Boton Consultar");
        functions.waitForElementNotPresent("Spinner");
        functions.iClicInElement("CheckBox Seleccionar Profesional");
        functions.iClicInElement("Boton Adicionar");
        functions.scrollToElement("Boton Asignar");
        functions.checkIfElementIsPresent("//table[contains(.,'Acci')]//tbody/tr[2]"); // valida que hayan dos funcionarios asignados.
        functions.iClicInElement("Boton Asignar");
        functions.attachScreenShot();
        functions.iClicInElement("Boton Aceptar");
        functions.attachScreenShot();
        functions.iWaitTime(5);
        functions.waitForElementNotPresent("Spinner");
    }

    @Then("Puedo asignar el tramite a un funcionario tecnico")
    public void puedoAsignarElTramiteAUnFuncionarioTecnico() throws Exception {

        for (int retries = 0; retries < 3; retries++) {
            try {
                functions.iClicInElement("Menu Estudio del Tramite");
                functions.iClicInElement("Menu Asignar Tramites");
                functions.waitForElementNotPresent("Spinner");
                functions.iClicInElement("Filtro Numero de Radicado");
                functions.iSetElementWithKeyValue("Filtro Numero de Radicado", "Radicado");
                functions.iWaitTime(2);
                functions.iClicInElement("CheckBox Primer Resultado");
                functions.attachScreenShot();
                functions.iClicInElement("Boton Asignar");
                functions.waitForElementNotPresent("Spinner");
                retries = 3;
            } catch (Exception e) {
                functions.attachScreenShot();
                functions.iSaveTextInScenario("ErrorAT", "El servicio no esta mostrando resultado en Asignar Tramites se refresca");
                functions.refreshPage();
                functions.waitForElementNotPresent("Spinner");
            }
        }
        functions.iClicInElement("Seleccionar Rol del Profesional");
        functions.iSelectContains("cnico");
        functions.iClicInElement("Seleccionar Nombre del Profesional");
        functions.iSelectContains("cnico");
        functions.iClicInElement("Boton Consultar");
        functions.waitForElementNotPresent("Spinner");
        functions.iClicInElement("CheckBox Seleccionar Profesional");
        functions.iClicInElement("Boton Adicionar");

        functions.scrollToElement("Boton Asignar");
        functions.checkIfElementIsPresent("//table[contains(.,'Acci')]//tbody/tr[1]"); // valida que haya algun funcionario asignado.
        functions.iClicInElement("Boton Asignar");
        functions.attachScreenShot();
        functions.iClicInElement("Boton Aceptar");
        functions.attachScreenShot();
        functions.iWaitTime(5);
        functions.waitForElementNotPresent("Spinner");
    }

    @Given("Tengo el tramite asignado con estado {string}")
    public void tengoElTramitePendienteDeAprobacion(String estado) throws Exception {
        questions.consultarMiTrabajoAsignado(estado);
    }

    @Then("Puedo dar concepto {string} al tramite")
    public void puedoAprobarElTramite(String concepto) throws Exception {
        for (int retries = 0; retries < 3; retries++) {
            try {
                functions.iClicInElement("Tab Conceptos");
                functions.iClicInElement("Boton Si");
                functions.attachScreenShot();
                functions.iWaitTime(1);
                if(functions.countElement("Boton Si")!=0){
                    functions.iClicInElement("Boton Si");
                }
                functions.scrollPage("end");
                functions.waitForElementNotPresent("Spinner");
                functions.scrollToElement("Seleccionar Concepto");
                functions.iClicInElement("Seleccionar Concepto");
                functions.attachScreenShot();
                functions.iSelectContains(concepto);
                retries = 3;
            } catch (Exception e) {
                functions.attachScreenShot();
                functions.iSaveTextInScenario("ErrorCP", "Algun servicio no esta mostrando data en Control Posterior");
                functions.refreshPage();
                functions.waitForElementNotPresent("Spinner");
            }
        }

        functions.iClicInElement("Boton Agregar");
        functions.iClicInElement("Boton Guardar Concepto");
        functions.iClicInElement("Boton Si");
        functions.attachScreenShot();
        if(functions.countElement("Boton Si")!=0){
            functions.iClicInElement("Boton Si");
        }
        //questions.alertaMensaje("Concepto guardado");
        functions.iWaitTime(2);
        functions.waitForElementNotPresent("Spinner");

    }

    @Then("Puedo dar el visto bueno al tramite")
    public void puedoDarElVistoBuenoAlTramite() throws Exception {
        functions.iClicInElement("Tab Visto Bueno Documento");
        functions.iWaitTime(3);
        functions.iClicInElement("Boton Si");
        functions.scrollPage("end");
        functions.attachScreenShot();
        functions.iClicInElement("Boton Enviar a Firma");
        functions.waitForElementNotPresent("Spinner");
    }

    @Then("Puedo devolver el tramite por {string}")
    public void puedoDevolvoerElTramitePor(String motivo) throws Exception {
        functions.iClicInElement("Tab Visto Bueno Documento");
        functions.iWaitTime(3);
        functions.iClicInElement("Boton Si");
        functions.scrollPage("end");
        functions.attachScreenShot();

        if(functions.countElement("Boton Eliminar Devolucion")!=0){
            functions.iClicInElement("Boton Eliminar Devolucion");
            functions.iClicInElement("Boton Aceptar");
        }

        functions.iClicInElement("Seleccionar Tipo de Devolucion");
        functions.iSelectContains(motivo);
        functions.iClicInElement("Boton Agregar");
        functions.waitForElementNotPresent("Spinner");
        functions.iClicInElement("Boton Devolver");
        functions.waitForElementNotPresent("Spinner");
    }

    @Given("Tengo pendiente de tramitar documento")
    public void tengoElTramitePendienteTramitarDocumento() throws Exception {
        functions.iClicInElement("Boton Finalizar");
        functions.scrollToElement("Boton Finalizar");
        functions.attachScreenShot();
        functions.waitForElementNotPresent("Spinner");
        functions.iWaitTime(3);
        functions.waitForElementNotPresent("Spinner");
    }

    @And("Finalizo la gestion")
    public void finalizoGestionTramite() throws Exception {
        functions.scrollToElement("Boton Finalizar");
        functions.iClicInElement("Boton Finalizar");
        functions.attachScreenShot();
        functions.waitForElementNotPresent("Spinner");
        functions.iWaitTime(3);
        functions.waitForElementNotPresent("Spinner");
        functions.scrollPage("top");
        functions.attachScreenShot();
    }

    @Then("Puedo ver el concepto de la visita {string}")
    public void puedoVerrElConceptoDeLaVisita(String tipo) throws Exception {
        functions.iClicInElement("Tab Concepto Visita");
        functions.iClicInElement("Boton Si");
        functions.scrollPage("end");
        functions.checkPartialTextElementPresent("Concepto Final", tipo);
        functions.checkIfElementIsPresent("//p-panel[@header='Resultado de la visita']//table/tbody/tr");
    }

    @Then("Puedo generar el documento del tramite tipo {string}")
    public void puedoGenerarElDocumentoDelTramite(String tipo) throws Exception {
        functions.iWaitTime(2);
        functions.iClicInElement("Tab Generar Documento");
        functions.iClicInElement("Boton Si");
        functions.scrollToElement("Seleccionar Tipo Documental");
        functions.iClicInElement("Seleccionar Tipo Documental");
        functions.attachScreenShot();
        functions.iSelectContains(tipo);
        functions.iWaitTime(1);
        functions.iClicInElement("Boton Ver Plantilla");
        functions.waitForElementNotPresent("Spinner");
        functions.waitForElementPresent("//app-associated-documents//div[contains(.,'Documentos Generados')]//td[1]");
        functions.attachScreenShot();
        functions.WindowsHandle("Hotmail");
        yopmail.inicioSesionOutlook();
        functions.page_has_loaded();
        functions.attachScreenShotWithData();
        functions.closeCurrenteTab();
        functions.switchToTab("Principal");
        functions.iLoadTheDOMInformation("Tramites.json");
        functions.waitForElementNotPresent("Spinner");
        functions.iWaitTime(2);
        functions.scrollToElement("Boton Finalizar");
        functions.checkIfElementIsPresent("//app-associated-documents//div[contains(.,'Documentos Generados')]//td[1]");
        functions.scrollToElement("Boton Finalizar");
        functions.iClicInElement("Boton Finalizar");
        functions.waitForElementNotPresent("Spinner");
    }

    @Then("Puedo complementar el documento del tramite")
    public void puedoCompletarElDocumentoDelTramite() throws Exception {
        functions.iClicInElement("Tab Complementar Documento");
        functions.iClicInElement("Boton Si");
        functions.waitForElementNotPresent("Spinner");
        functions.scrollToElement("Boton Agregar");
        functions.checkIfElementIsPresent("//app-associated-documents//div[contains(.,'Documentos Generados')]//td[1]");
        functions.iClicInElement("Boton Finalizar");
        functions.waitForElementNotPresent("Spinner");
    }

    @Given("Necesito firmar la solicitud del tramite")
    public void necesitoFirmarLaSolicitudDelTramite() {
    }

    @Then("Puedo ver todos los {int} documentos del tramite y la tarifa")
    public void puedoVerTodosLosDocumentosDelTramite(int cantidad) throws Exception {
        functions.scrollPage("top");
        functions.iClicInElement("Tab Documentacion");
        functions.iClicInElement("Boton Si");
        functions.waitForElementNotPresent("Spinner");
        functions.scrollPage("end");
        functions.attachScreenShot();
        // functions.checkCountElement("Cantidad Documentos Asociados",cantidad);
        functions.scrollPage("top");
        functions.iClicInElement("Tab Tarifa");
        functions.iClicInElement("Boton Si");
        functions.waitForElementNotPresent("Spinner");
        functions.checkIfElementIsPresent("//app-paymentdescription//td");
        functions.scrollPage("end");
        functions.scrollAllPageAndTakeScreenShots();
    }

    @And("Puedo ver {string} documento generado")
    public void puedoVerElDocumentoGenerado(int cantidad) throws Exception {
        functions.checkCountElement("Cantidad Documentos Generados", cantidad);
        functions.iClicInElement("Boton Guardar");
        functions.waitForElementNotPresent("Spinner");
    }

    @When("Tengo el tramite en notificacion {string}")
    public void tengoElTramitePendienteDeFirma(String estado) throws Exception {
        functions.iClicInElement("Menu Notificaciones");
        functions.iClicInElement("Sub Menu Notificacion Tramites");
        functions.waitForElementNotPresent("Spinner");
        functions.iSetElementWithKeyValue("Filtro Numero de Radicado", "Radicado");
        functions.iClicInElement("Seleccionar Estado");
        functions.iSelectContains("Pendiente de firma");
        functions.iClicInElement("Seleccionar Tipo de Notificacion");
        functions.iSelectContains("n Electr");
        functions.iClicInElement("Boton Buscar");
        functions.waitForElementNotPresent("Spinner");
        functions.checkIfElementIsPresent("//table/tbody/tr[contains(.,'"+estado+"')]");
        functions.scrollToElement("//table/tbody/tr");
        functions.attachScreenShot();

    }

    @When("Simulo la Notificacion del RPA")
    public void tengoElTramitePendienteDeFirma() throws Exception {
        apiRequest.simularRPA();

    }

    @Then("Puedo firmar el documento para la notificacion")
    public void puedoFirmarElDocumentoParaLaNotificacion() {
    }

    @And("Acepto los cambios de la informacion legal")
    public void aceptoLosCambiosDeLaInformacionLegal() throws Exception {
        functions.checkIfElementIsPresent("//p-header[contains(.,'titular')]/../..//td[contains(.,'1024589913')]");
        functions.iClicInElement("Check Creacion Cambio Titular");
        functions.iClicInElement("Check Eliminacion Cambio Titular");
        functions.iClicInElement("Check Creacion Cambio Representante");
        functions.iClicInElement("Check Eliminacion Cambio Representante");
        functions.scrollToElement("Check Eliminacion Cambio Representante");
        functions.checkIfElementIsPresent("//p-header[contains(.,'r')][contains(.,'les')]/../..//td[contains(.,'1024589913')]");
        functions.iClicInElement("Check Creacion Cambio de Roles");
        functions.iClicInElement("Check Eliminacion Cambio de Roles");
        functions.scrollPage("end");
        functions.iClicInElement("Boton Siguiente");
        functions.iClicInElement("Boton Si");
        functions.waitForElementPresent("Spinner");
    }

    @And("Acepto los cambios de la informacion tecnica")
    public void aceptoLosCambiosDeLaInformacionTecnica() throws Exception {
        functions.iWaitTime(2);
        functions.scrollToElement("Check Aprobar Cambio de Categoria Toxicologica");
        functions.iClicInElement("Check Aprobar Cambio de Categoria Toxicologica");
        functions.checkIfElementIsPresent("//legend[contains(.,'Material')]/..//td[contains(.,'Plastico')]");
        functions.iClicInElement("Check Aprobar Cambio de Informacion de Material de Envase");
        functions.scrollPage("end");
        functions.iClicInElement("Boton Guardar");
        functions.iClicInElement("Boton Siguiente");
        functions.iClicInElement("Boton Si");
        functions.waitForElementPresent("Spinner");
    }

    @And("Acepto los cambios de la documentacion")
    public void aceptoLosCambiosDeLaDocumentacion() throws Exception {
        for (int i=1; i<=5;i++){
            functions.iClicInElement("(//app-associated-documents/..//button[contains(@icon,'ui-icon-visibility')])["+i+"]");
            functions.waitForElementPresent("Spinner");
            functions.iSendKeyEscapeToPerform();
            functions.iClicInElement("(//app-associated-documents/..//label[contains(.,'Si')]/..//div[contains(@role,'radio')])["+i+"]");
            functions.iWaitTime(2);
        }
        functions.iClicInElement("Boton Siguiente");
        functions.iClicInElement("Boton Si");

    }

    @And("Selecciono el radicado para revisar")
    public void seleccionoElRadicadoParaRevisar() throws Exception {
        functions.iClicInElement("(//p-panel[contains(.,'radicado')]//td//input[contains(@type,'checkbox')])[last()]");
    }
}
