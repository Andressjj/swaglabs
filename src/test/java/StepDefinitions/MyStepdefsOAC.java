package StepDefinitions;

import Functions.SeleniumFunctions;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.And;

public class MyStepdefsOAC {
    SeleniumFunctions functions = new SeleniumFunctions();

    @Given("Necesito aprobar la radicacion de un tramite como funcionario legal")
    public void necesitoAprobarLaRadicacionDeUnTramiteComoFuncionarioLegal() {

    }

    @Then("Puedo aprobar la solicitud")
    public void puedoAprobarLaSolicitud() throws Exception {

        for (int retry = 0; retry < 3; retry++) {
            try {

                functions.iClicInElement("Menu Trabajo Asignado");
                functions.iClicInElement("Sub Menu Solicitudes");
                functions.iSetElementWithKeyValue("Filtro Numero de Solicitud", "Numero de Solicitud");
                functions.iSendKeyEnterToElement("Filtro Numero de Solicitud");
                functions.iWaitTime(2);
                functions.iClicInElement("Radio Primer Resultado");
                functions.iClicInElement("Boton Gestionar");
                functions.waitForElementNotPresent("Spinner");
                functions.waitForElementNotPresent("Boton Gestionar",2);
                retry = 3;
            } catch (Exception e) {
                functions.attachScreenShot();
                functions.iSaveTextInScenario("ErrorTA", "El servicio no esta mostrando resultado en Trabajo Asignado se refresca");
                functions.refreshPage();
                functions.waitForElementNotPresent("Spinner");
            }
        }
        functions.waitForElementNotPresent("Boton Gestionar",2);

        for (int retries = 0; retries < 2; retries++) {
            try {

                functions.scrollPage("end");
                functions.scrollToElement("Seleccionar Concepto");
                functions.iClicInElement("Seleccionar Concepto");
                functions.iSelectContains("Aprueba pago");
                retries = 2;
            } catch (Exception e) {
                functions.attachScreenShot();
                functions.iSaveTextInScenario("ErrorOAC", "El servicio no esta mostrando conceptos OAC");
                functions.refreshPage();
                functions.waitForElementNotPresent("Spinner");
            }
        }

        functions.iClicInElement("Boton Agregar");
        functions.iWaitTime(2);
        int concepto = functions.countElement("//app-procedure-concept-oac//table/tbody/tr");
        if (concepto == 0) {
            functions.iClicInElement("Boton Agregar");
        }
        functions.checkIfElementIsPresent("//app-procedure-concept-oac//table/tbody/tr");
        functions.iClicInElement("Boton Finalizar");
        functions.waitForElementNotPresent("Spinner");
        functions.attachScreenShot();

    }

    @Given("Necesito aprobar la radicacion de un tramite como funcionario tecnico")
    public void necesitoAprobarLaRadicacionDeUnTramiteComoFuncionarioTecnico() throws Exception {
    }
}
