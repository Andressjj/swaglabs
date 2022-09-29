package StepDefinitions;

import Functions.SeleniumFunctions;
import Tasks.Direcciones;
import Tasks.Questions;
import Tasks.Yopmail;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.And;

public class MyStepdefsRegistros {

    SeleniumFunctions functions = new SeleniumFunctions();
    Questions questions = new Questions();
    Yopmail yopmail = new Yopmail();
    Direcciones direcciones = new Direcciones();

    @Given("Necesito registrarme en la nueva plataforma de tramites como {string}")
    public void necesitoRegistrarmeEnLaNuevaPlataformaDeTramites(String rol) throws Exception {
        functions.readMain("NPTUrl");
        yopmail.obtenerCorreoYopmail(rol);
        functions.iLoadTheDOMInformation("Tramites.json");
        functions.iClicInElement("Registrarse");
    }

    @When("Ingreso todos los datos necesarios como usuario nacional")
    public void ingresoTodosLosDatosNecesariosComoUsuarioNacional() throws Exception {
        functions.iClicInElement("Tipo de Documento");
        functions.iWaitTime(5);
        functions.iSelectContains("de ciudada");
        functions.iSetElementWithText("Numero de Documento", String.valueOf(Math.round(Math.floor(Math.random() * 1108999) + 1108999)));
        functions.iSetElementWithText("Primer Nombre", "Jhonattan");
        functions.iSetElementWithText("Primer Apellido", "Villamil");
        functions.iSetElementWithText("Segundo Apellido", "Zamora");
        functions.iSetElementWithKeyValue("Correo Electronico", "Administrador");
        functions.iClicInElement("Terminos de Uso");
        functions.iClicInElement("Boton Registrarse");
        functions.waitForElementPresent("Alerta");
    }

    @Given("El sistema me envia un correo con un link para confirmar el registro")
    public void elSistemaMeEnviaUnCorreoConUnLinkParaConfirmarElRegistro() throws Exception {

    }

    @Given("Tengo un link de confirmacion de registro del {string}")
    public void tengoUnLinkDeConfirmacionDeRegistro(String rol) throws Exception {
        yopmail.obtenerLinkRegistroPersona(rol);
    }

    @When("Ingreso al link e ingreso una clave valida")
    public void ingresoAlLinkEIngresoUnaClaveValida() throws Exception {
        functions.iLoadTheDOMInformation("Tramites.json");
        functions.iSetElementWithKeyValue("Password", "FuncionarioPassword");
        functions.iSetElementWithKeyValue("Password Confirmacion", "FuncionarioPassword");
        functions.attachScreenShot();
        functions.iClicInElement("Boton Confirmar");

    }

    @Then("Quedo registrado correctamente en el sistema")
    public void quedoRegistradoCorrectamenteEnElSistema() throws Exception {
        questions.alertaMensaje("Guardado exitoso");


    }

    @And("El sistema envia una notificacion al correo del {string} confirmando el registro")
    public void elSistemaEnviaUnaNotificacionAlCorreoConfirmandoElRegistro(String rol) throws Exception {
        yopmail.confirmarRegistroUsuario(rol);
    }

    @Given("Necesito registrar una empresa nacional con NIT numero {string}")
    public void necesitoRegistrarUnaEmpresaNacionalConNIT(String numero) throws Exception {
        functions.iClicInElement("Tipo de Registro");
        functions.iSelectContains("Nacional");
        functions.iClicInElement("Tipo de Documento");
        functions.iSelectContains("NIT");
        functions.iSetElementWithText("Numero de Documento", numero);
        functions.iClicInElement("Boton Consultar");
        functions.attachScreenShot();
        functions.waitForElementNotPresent("Spinner");
        functions.scrollPage("end");

        int iniciado = functions.countElement("//p[contains(.,'para Finalizar el registro')]");
        if (iniciado > 0) {
            functions.iClicInElement("Boton Si");
            functions.waitForElementNotPresent("Spinner");
        }

    }

    @Given("Necesito registrar una empresa nacional con Cedula numero {string}")
    public void necesitoRegistrarUnaEmpresaNacionalConNCedula(String numero) throws Exception {
        functions.iClicInElement("Tipo de Registro");
        functions.iSelectContains("Nacional");
        functions.iClicInElement("Tipo de Documento");
        functions.iSelectContains("de ciudadan");
        functions.iSetElementWithText("Numero de Documento", numero);
        functions.iClicInElement("Boton Consultar");
        functions.attachScreenShot();
        functions.waitForElementNotPresent("Spinner");
        functions.scrollPage("end");

        int iniciado = functions.countElement("//p[contains(.,'para Finalizar el registro')]");
        if (iniciado > 0) {
            functions.iClicInElement("Boton Si");
            functions.waitForElementNotPresent("Spinner");
        }

    }

    @Given("Necesito registrar una empresa extranjera")
    public void necesitoRegistrarUnaEmpresaExtranjera() throws Exception {
        functions.iClicInElement("Tipo de Registro");
        functions.iSelectContains("Extranjera");
        functions.waitForElementNotPresent("Spinner");
        functions.iClicInElement("Multiseleccion Tipo de Empresa");
        functions.iClickCheckboxContains("Fabricante");
        functions.iClicInElement("Pais de Nacionalidad");
        functions.iSelectContains("Alemania");
        functions.waitForElementNotPresent("Spinner");
        functions.iClicInElement("Departamento");
        functions.iSelectContains("Berliini");
        functions.iClicInElement("Ciudad");
        functions.iSelectContains("Berlin");
        functions.SaveInScenarioFile("Empresa","pdf");
        functions.iSetElementWithKeyValue("Nombre de la Empresa","Empresa.name");
        functions.iSetElementWithText("Direccion", "Villas de San Jose Sombrero 22");
        functions.iSetElementWithKeyValue("Correo Electronico", "GestorTramites");
        functions.iSetElementWithText("Celular Empresa","3213566870");
        try {
            functions.iClicInElement("Seleccionar Tamano Empresa");
            functions.iSelectContains("Mediana");
        } catch (Exception e) {
            System.out.println("No fue posible seleccionar el tamaño");

        }
functions.iClicInElement("Seleccionar Tipo de producto");
        functions.iSelectContains("Aseo, Plaguicidas");
functions.iClicInElement("Seleccionar Grupo");
functions.iSelectContains("Cosm");
functions.iClicInElement("Seleccionar Subgrupo");
functions.iSelectContains("Capilares");
functions.iClicInElement("Boton Adicionar Grupo");

        functions.attachScreenShot();
        functions.waitForElementNotPresent("Spinner");
        functions.scrollPage("end");
        functions.scrollToElement("Boton Continuar");
        functions.iClicInElement("Boton Continuar");
        functions.attachScreenShot();

    }

    @When("Ingreso todos los datos de la inscripcion general")
    public void ingresoTodosLosDatosJuridica() throws Exception {
        functions.page_has_loaded();
        functions.iWaitTime(5);
        functions.scrollPage("top");

        int juridico = functions.countElement("Multiseleccion Tipo de Empresa");
        if (juridico == 1) {
            functions.iClicInElement("Multiseleccion Tipo de Empresa");
            functions.clickCheckboxListContains("Fabricante");
            functions.iSendKeyEscapeToPerform();
        }
        functions.iSetElementWithText("Celular Empresa", "3213566711");

        try {
            functions.iClicInElement("Seleccionar Tamano Empresa");
            functions.iSelectContains("Mediana");
        } catch (Exception e) {
            System.out.println("No fue posible seleccionar el tamaño");

        }
        try {
            functions.scrollToElement("Seleccionar Informacion Poblacional");
            functions.iClicInElement("Seleccionar Informacion Poblacional");
            functions.iSelectContains("Negras");

        } catch (Exception e) {
            System.out.println("No fue posible seleccionar la informacion poblacional");

        }
        int genero = functions.countElement("Seleccionar Genero");
        if (genero == 1) {
            functions.iClicInElement("Seleccionar Genero");
            functions.iSelectContains("Masculino");
        }
        functions.iSendClearToElement("Email Notificacion");
        functions.iSetElementWithKeyValue("Email Notificacion", "Administrador");
        functions.iClicInElement("Multiseleccion Tipo de producto");
        functions.clickCheckboxListContains("Plaguicidas");
        functions.iSendKeyEscapeToPerform();
        functions.scrollPage("end");

        // Código para asignar tipo de sucursal y datos a todas las sucursales.
        int sucursales = functions.countElement("//tbody/tr");

        String botonEditar;
        if (sucursales == 0) {
            functions.iClicInElement("Boton Agregar Sucursal");
            functions.waitForElementNotPresent("Spinner");
            functions.iSetElementWithText("Nombre de la Sucursal", "Sucursal Principal");
            direcciones.seleccionarPaisDepartamentoCiudad();
            direcciones.agregarDireccionUrbana();
            functions.iSetElementWithText("Matricula", "ABC123");
            sucursales = 1;
        }

        for (int i = 1; i <= sucursales; i++) {
            String n = String.valueOf(i);
            botonEditar = "//tbody//tr[" + n + "]//button[@icon='ui-icon-pencil']";
            int popUp = functions.countElement("Boton Guardar Sucursal");
            if (popUp != 1) {
                functions.iClicInElement(botonEditar);
                functions.waitForElementNotPresent("Spinner");
            }

            functions.iSetElementWithText("Celular Sucursal", "3213566711");
            functions.iSendClearToElement("Correo");
            functions.iSetElementWithKeyValue("Correo", "Administrador");
            functions.iSetElementWithText("Codigo CIIU", "2021");
            functions.iClicInElement("Seleccionar Tipo Sucursal");
            functions.iSelectContains("Administrativa");
            functions.iClicInElement("Seleccionar Actividad Economica");
            functions.iSelectContains("plaguicidas");
            functions.iClicInElement("Boton Guardar Sucursal");
            functions.scrollPage("end");
            System.out.println("Ciclo identifico el TR " + botonEditar);
        }
        functions.scrollToElement("Boton Continuar");
        functions.iClicInElement("Boton Continuar");
        functions.attachScreenShot();


    }


    @When("Ingreso todos los datos como persona natural")
    public void ingresoTodosLosDatosNatural() throws Exception {

        functions.scrollToElement("Seleccionar Informacion Poblacional");
        functions.iClicInElement("Seleccionar Informacion Poblacional");
        functions.iSelectContains("Ninguna");

        functions.scrollPage("top");
        functions.iSendKeyEscapeToPerform();
        functions.iSetElementWithText("Celular Empresa", "3213566711");
        functions.iSendClearToElement("Email Notificacion");
        functions.iSetElementWithKeyValue("Email Notificacion", "Administrador");
        functions.iClicInElement("Multiseleccion Tipo de producto");
        functions.clickCheckboxListContains("Plaguicidas");
        functions.iSendKeyEscapeToPerform();
        functions.scrollPage("end");

        // Código para asignar tipo de sucursal y datos a todas las sucursales.
        int sucursales = functions.countElement("//tbody/tr");
        String botonEditar;
        for (int i = 1; i <= sucursales; i++) {
            String n = String.valueOf(i);
            botonEditar = "//tbody//tr[" + n + "]//button[@icon='ui-icon-pencil']";

            functions.iClicInElement(botonEditar);
            functions.waitForElementNotPresent("Spinner");
            functions.iSetElementWithText("Celular Sucursal", "3213566711");
            functions.iSendClearToElement("Correo");
            functions.iSetElementWithKeyValue("Correo", "Administrador");
            functions.iSetElementWithText("Codigo CIIU", "2021");
            functions.iClicInElement("Seleccionar Tipo Sucursal");
            functions.iSelectContains("Administrativa");
            functions.iClicInElement("Seleccionar Actividad Economica");
            functions.iSelectContains("plaguicidas");
            functions.iClicInElement("Boton Guardar");
            functions.scrollPage("end");
            System.out.println("Ciclo identifico el TR " + botonEditar);
        }
        functions.scrollToElement("Boton Continuar");
        functions.iClicInElement("Boton Continuar");
        functions.attachScreenShot();


    }

    @And("Agrego los roles de la empresa")
    public void agregoLosRolesDeLaEmpresa() throws Exception {
        functions.waitForElementPresent("Seleccionar Tipo de Rol");
        yopmail.obtenerCorreoYopmail("GestorTramites");
        functions.iLoadTheDOMInformation("Tramites.json");

        // Crear rol gestor de tramites.
        functions.scrollPage("top");
        functions.iClicInElement("Seleccionar Tipo de Rol");
        functions.iSelectContains("Gestor De Tr");
        functions.iClicInElement("Seleccionar Tipo de Documento");
        functions.iSelectContains("de ciudadan");
        functions.iSetElementWithText("Numero de Documento", String.valueOf(Math.round(Math.floor(Math.random() * 1108999) + 1108999)));
        functions.iClicInElement("Primer Nombre Rol");
        functions.waitForElementNotPresent("Spinner");
        functions.iWaitTime(2);
        functions.iClicInElement("Primer Nombre Rol");
        functions.iSendClearToElement("Primer Nombre Rol");
        functions.iWaitTime(1);
        functions.iSetElementWithText("Primer Nombre Rol", "Fernando");
        functions.iSendClearToElement("Primer Apellido Rol");
        functions.iWaitTime(1);
        functions.iSetElementWithText("Primer Apellido Rol", "Perez");
        direcciones.seleccionarPaisDepartamentoCiudad();
        direcciones.agregarDireccionUrbana();
        functions.iSetElementWithKeyValue("Correo", "GestorTramites");
        functions.iClicInElement("CheckBox Permiso Registrar Informacion");
        functions.iClicInElement("CheckBox Permiso Consultar");
        functions.iClicInElement("Boton Agregar");
        // fin crear rol gestor de tramites
        functions.scrollPage("end");
        functions.scrollToElement("Boton Finalizar");

    }

    @And("Agrego el rol {string} a la empresa")
    public void agregoRolALaEmpresa(String rol) throws Exception {
        functions.waitForElementPresent("Seleccionar Tipo de Rol");
        yopmail.obtenerCorreoYopmail(rol);
        functions.iLoadTheDOMInformation("Tramites.json");

        // Crear rol
        functions.scrollPage("top");
        functions.iClicInElement("Seleccionar Tipo de Rol");
        functions.iSelectContains(rol);
        functions.iClicInElement("Seleccionar Tipo de Documento");
        functions.iSelectContains("de ciudadan");
        functions.iSetElementWithText("Numero de Documento", String.valueOf(Math.round(Math.floor(Math.random() * 1108999) + 1108999)));
        functions.iClicInElement("Primer Nombre Rol");
        functions.waitForElementNotPresent("Spinner");
        functions.iWaitTime(2);
        functions.iClicInElement("Primer Nombre Rol");
        functions.iSendClearToElement("Primer Nombre Rol");
        functions.iWaitTime(1);
        functions.iSetElementWithText("Primer Nombre Rol", "Fernando");
        functions.iSendClearToElement("Primer Apellido Rol");
        functions.iWaitTime(1);
        functions.iSetElementWithText("Primer Apellido Rol", "Perez");
        direcciones.seleccionarPaisDepartamentoCiudad();
        direcciones.agregarDireccionUrbana();
        functions.iSetElementWithKeyValue("Correo", rol);
        functions.iClicInElement("CheckBox Permiso Registrar Informacion");
        functions.iClicInElement("CheckBox Permiso Consultar");
        functions.iClicInElement("Boton Agregar");
        // fin crear rol gestor de tramites
        functions.scrollPage("end");
        functions.scrollToElement("Boton Finalizar");

    }

    @Then("Actualizo los datos de los roles de la empresa")
    public void actualizoDatosRolesEmpresa() throws Exception {
        yopmail.obtenerCorreoYopmail("Representante");
        functions.iLoadTheDOMInformation("Tramites.json");
        int representante = functions.countElement("Boton Editar Representante");
        String botonEditar;
        for (int i = 1; i <= representante; i++) {
            String n = String.valueOf(i);
            botonEditar = "(//tr[contains(.,'Representante')]//button[@icon='ui-icon-pencil'])[" + n + "]";
            functions.iClicInElement(botonEditar);
            functions.iWaitTime(5);
            functions.iSendClearToElement("Primer Apellido Rol");
            functions.iWaitTime(5);
            functions.iSendClearToElement("Primer Nombre Rol");
            functions.iWaitTime(3);
            functions.iSetElementWithText("Primer Nombre Rol", "Carlos " + n);
            functions.iWaitTime(3);
            functions.iClicInElement("Primer Apellido Rol");
            functions.iSetElementWithText("Primer Apellido Rol", "Zamora" + n);
            direcciones.seleccionarPaisDepartamentoCiudad();
            functions.iSendClearToElement("Correo");
            functions.iWaitTime(2);
            functions.iSetElementWithKeyValue("Correo", "Representante");
            // agregar direccion
            direcciones.agregarDireccionUrbana();
            // fin agregar direccion
            functions.iWaitTime(3);
            functions.iClicInElement("CheckBox Permiso Firmar");
            functions.iClicInElement("CheckBox Permiso Consultar");
            functions.iClicInElement("Boton Actualizar");
        }

// CREAR OTRO ROL DE GESTOR DE TRAMITE QUE SOLO PUEDA REGISTRAR Y CONSULTAR.

        functions.iClicInElement("Boton Editar Administrador");
        direcciones.seleccionarPaisDepartamentoCiudad();
        direcciones.agregarDireccionUrbana();
        functions.iWaitTime(3);
        functions.iClicInElement("CheckBox Permiso Registrar Informacion");
        functions.iClicInElement("CheckBox Permiso Firmar");
        functions.iClicInElement("CheckBox Permiso Pagar");
        functions.iClicInElement("CheckBox Permiso Consultar");
        functions.iWaitTime(2);
        functions.iClicInElement("Boton Actualizar");

         }

    @Then("Actualizo los datos de los roles de la empresa extranjera")
    public void actualizoDatosRolesEmpresaExtranjera() throws Exception {
        yopmail.obtenerCorreoYopmail("Representante");
        functions.iLoadTheDOMInformation("Tramites.json");
        int representante = functions.countElement("Boton Editar Representante");
        String botonEditar;
        for (int i = 1; i <= representante; i++) {
            String n = String.valueOf(i);
            botonEditar = "(//tr[contains(.,'Representante')]//button[@icon='ui-icon-pencil'])[" + n + "]";
            functions.iClicInElement(botonEditar);
            functions.iWaitTime(5);
            functions.iSendClearToElement("Primer Apellido Rol");
            functions.iWaitTime(5);
            functions.iSendClearToElement("Primer Nombre Rol");
            functions.iWaitTime(3);
            functions.iSetElementWithText("Primer Nombre Rol", "Carlos " + n);
            functions.iWaitTime(3);
            functions.iClicInElement("Primer Apellido Rol");
            functions.iSetElementWithText("Primer Apellido Rol", "Zamora" + n);
            direcciones.seleccionarPaisDepartamentoCiudad();
            functions.iSendClearToElement("Correo");
            functions.iWaitTime(2);
            functions.iSetElementWithKeyValue("Correo", "Representante");
            // agregar direccion
            direcciones.agregarDireccionUrbana();
            // fin agregar direccion
            functions.iWaitTime(3);
            functions.iClicInElement("Boton Actualizar");
        }

// CREAR OTRO ROL DE GESTOR DE TRAMITE QUE SOLO PUEDA REGISTRAR Y CONSULTAR.

        functions.iClicInElement("Boton Editar Administrador");
        direcciones.seleccionarPaisDepartamentoCiudad();
        direcciones.agregarDireccionUrbana();
        functions.iWaitTime(2);
        functions.iClicInElement("Boton Actualizar");

    }

    @Then("La empresa queda registrada exitosamente")
    public void laEmpresaQuedaRegistradaExitosamente() throws Exception {
        functions.iClicInElement("Boton Finalizar");
        functions.waitForElementNotPresent("Spinner");
        functions.checkIfElementIsPresent("//*[contains(.,'Su empresa se ha registrado exitosamente.')]");
    }

    @And("El ciudadano recibe confirmacion de la creacion de la empresa")
    public void elCiudadanoRecibeConfirmacionDeLaCreacionDeLaEmpresa() throws Exception {
        yopmail.confirmarRegistroEmpresa("Administrador");
    }

    @And("Metodo para probar")
    public void esteMetodoSoloParaPruebasBasicas() throws Exception {
        functions.navigateTo("http://invima-qa-qa-transversal.apps.openshiftdev.soain.lcl/#/Login");
        functions.iLoadTheDOMInformation("Tramites.json");
        functions.iSaveTextOfElementInScenario("links", "/html/body/app-root/app-login/div/div/form/div/div[5]");
        functions.iExtractOfKey("links", "Olvide", "trarse");
    }

}
