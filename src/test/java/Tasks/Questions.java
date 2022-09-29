package Tasks;

import Functions.SeleniumFunctions;
public class Questions {

    SeleniumFunctions functions = new SeleniumFunctions();

    public void tituloConsultas() throws Exception {
        functions.checkIfElementIsPresent("Titulo Consultas");
        functions.attachScreenShot();
    }

    public void alertaMensaje(String mensaje) throws Exception {
        functions.scrollPage("top");
        functions.checkPartialTextElementPresent("Alerta", mensaje);

    }

    public void consultarMiSolicitud(String estado) throws Exception {
        functions.iClicInElement("Menu Mis Tramites Y Solicitudes");
        functions.waitForElementNotPresent("Spinner");
        //functions.iClicInElement("Menu Mis Tramites Y Solicitudes");
        //functions.waitForElementNotPresent("Spinner");
        functions.iClicInElement("Mis Solicitudes");
        functions.iSetElementWithKeyValue("Ingresar Numero de Solicitud","Numero de Solicitud");
        functions.iClicInElement("(//button//*[normalize-space(text())='Consultar'])[2]");  // Boton Consultar [2]
        functions.waitForElementNotPresent("Spinner");
        functions.scrollPage("end");
        functions.checkIfElementIsPresent("//td[contains(.,'"+estado+"')]");
        functions.iClicInElement("Boton Flecha Siguiente");
        functions.waitForElementNotPresent("Spinner");
    }


    public void consultarMiTramite(String estado) throws Exception {
        //functions.iClicInElement("Menu Mis Tramites");
        functions.iClicInElement("Menu Mis Tramites Y Solicitudes");
        functions.waitForElementNotPresent("Spinner");
        functions.iSetElementWithKeyValue("Filtro Numero de Radicado", "Radicado");
        functions.iClicInElement("Boton Consultar Radicado");
        functions.checkIfElementIsPresent("//td[contains(.,'"+estado+"')]");
        functions.iClicInElement("Boton Flecha Siguiente");

    }

    public void consultarMiTrabajoAsignado(String estado) throws Exception {

        for (int retries = 0; retries <3 ; retries++) {
            try {
                functions.iClicInElement("Menu Estudio del Tramite");
                functions.iClicInElement("Menu Trabajo Asignado");
                functions.waitForElementNotPresent("Spinner");
                functions.iClicInElement("Filtro Numero de Radicado");
                functions.iSetElementWithKeyValue("Filtro Numero de Radicado","Radicado");
                functions.iWaitTime(2);
                functions.iSetElementWithKeyValue("Filtro Global","Radicado");
                functions.iWaitTime(2);
                functions.iClicInElement("Radio Primer Resultado");
                functions.checkIfElementIsPresent("//td[11][contains(.,'"+estado+"')]");
                functions.scrollToElement("Boton Gestionar");
                functions.iClicInElement("Boton Gestionar");
                functions.waitForElementNotPresent("Spinner");
                functions.waitForElementNotPresent("Boton Gestionar",2);
                retries = 3;
            } catch (Exception e) {
                functions.attachScreenShot();
                functions.iSaveTextInScenario("ErrorTA","El servicio no esta mostrando resultado en Trabajo Asignado se refresca");
                if(retries < 3){
                functions.refreshPage();
                }
                functions.waitForElementNotPresent("Spinner");
            }

        }
        functions.waitForElementNotPresent("Boton Gestionar",2);

    }


    public void opcionLista(String texto) throws Exception {
        functions.checkIfElementIsPresent("//p-dropdownitem/li[contains(.,'"+texto+"')]");
    }
}
