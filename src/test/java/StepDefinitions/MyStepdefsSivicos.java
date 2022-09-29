package StepDefinitions;

import Functions.SeleniumFunctions;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.And;

public class MyStepdefsSivicos {

    SeleniumFunctions functions = new SeleniumFunctions();

    @And("Selecciono una visita pendiente")
    public void seleccionoUnaVisitaPendiente() {
    }

    @When("Selecciono la opcion Sivicos en la barra lateral")
    public void seleccionoLaOpcionSivicosEnLaBarraLateral() throws Exception {
        functions.iLoadTheDOMInformation("Sivicos.json");
        functions.iWaitTime(2);
        functions.iClicInElement("Barra Lateral Sivicos");
        functions.iClicInElement("Barra Lateral Planeacion");
        functions.iClicInElement("Barra Lateral Registrar Visitas");
    }

    @And("Puedo registrar una visita de una empresa no inscrita de tipo producto {string} con tipo de documento {string} y numero {string}")
    public void puedoRegistrarUnaVisitaDeUnaEmpresaNoInscritaDeTipoConTipoDeDocumentoYNumero(String tipoProducto, String documento, String numero) throws Exception {
        functions.iClicInElement("Tipo de Producto");
        functions.iSelectContains(tipoProducto);
        functions.iClicInElement("Tipo de Documento");

        if (documento.equals("NIT")){
            functions.iSelectContains(documento);
        }else{
            functions.iSelectContains("dula de ciudadan");
        }
        functions.iSetElementWithText("Numero de Documento",numero);
        functions.iClicInElement("Boton Buscar");
        functions.attachScreenShot();
        functions.scrollToElement("Boton Correlacionar Visitas");
        functions.scrollToHorizontal("Boton Historico de Empresa");
        functions.scrollToElement("Boton Historico de Empresa");
        functions.iClicInElement("Boton Registrar Visita");
    }

    @And("Puedo agregar la informacion del registro de la visita con la razon {string} y clasificacion {string}")
    public void puedoAgregarLaInformacionDelRegistroDeLaVisitaConLaRazon(String razon, String clasificacion) throws Exception {
        functions.iClicInElement("Seleccionar Razon de la Visita");
        if (razon.equals("Toma de muestras")){
            functions.iSelectContains(razon);
        }else{
            functions.iSelectContains(razon);
        }
        functions.iClicInElement("Seleccionar Modalidad de la Visita");
        functions.iSelectContains("Virtual");
        functions.iClicInElement("Seleccionar Clasificacion de la Visita");
        if(clasificacion.equals("Plan de visita")){
            functions.iSelectContains("Plan de visita");
        }else{
            functions.iSelectContains("Extraordinarias");
        }
        functions.iClicInElement("Seleccionar Fuente de la Informacion de la Visita");
        functions.iSelectContains("Certificaciones");
        functions.iClicInElement("Seleccionar Prioridad de la Visita");
        functions.iSelectContains("Medio");
        functions.iWaitTime(2);
        functions.iClicInElement("Seleccionar Posible Alteracion Fraudulencia Ilegalidad");
        functions.iSelectContains("No aplica");
    }

    @When("Puedo agregar la informacion del registro de la visita con el grupo {string} y el subgrupo {string}")
    public void puedoAgregarLaInformacionDelRegistroDeLaVisitaConElGrupoYElSubgrupo(String grupo, String subgrupo) throws Exception {
        functions.iClicInElement("Seleccionar Grupo Registrar Visita");
        //functions.scrollToElement("//li//span[contains(.,'Alimentos compuestos')]");
        functions.iSelectContains(grupo);
        functions.iClicInElement("Seleccionar SubGrupo Registrar Visita");
        functions.iSelectContains(subgrupo);
    }

    @And("Puedo agregar la informacion del responsable de hacer la visita {string} en la misional Alimentos")
    public void puedoAgregarLaInformacionDelResponsableDeHacerLaVisita(String responsable) throws Exception {
        functions.iClicInElement("Seleccionar Responsable de Hacer la Visita");
        functions.iSelectContains(responsable);
        functions.iClicInElement("Seleccionar Grupo de Trabajo que Registra la Visita");
        functions.iSelectContains("Grupo de Riesgos");
        functions.iClickCheckboxContains("Requiere acompa");
        functions.attachScreenShot();
        functions.scrollToElement("Seleccionar Responsable de Hacer la Visita");
        functions.iWaitTime(2);
        functions.iClicInElement("Seleccionar Responsable del Acompanamiento");
        functions.iClicInElement("//p-header[contains(.,'Responsable')]/../p-multiselect/div//span[contains(.,'Alimentos')]"); //Alimentos
        functions.iSendKeyEscapeToPerform();
        functions.iClickCheckboxContains("Solicitud"); //Alimentos
        functions.iClickCheckboxContains("Denuncia"); //Alimentos
        functions.iClickCheckboxContains("Toma"); //Alimentos
        functions.scrollToElement("Boton Crear Visita");
        functions.iWaitTime(2);

    }

    @And("Puedo buscar los productos que reportan registro sanitario del grupo {string} y subgrupo {string}")
    public void puedoBuscarLosProductosQueReportanRegistroSanitario(String grupo, String subgrupo) throws Exception {
        functions.iClickCheckboxContains("Reporta nso");
        functions.iClicInElement("Seleccionar Grupo Informacion Toma de Muestras");
        functions.iSelectContains(grupo);
        functions.iClicInElement("Seleccionar Grupo Buscar Producto que Reporta RS");
        functions.iSelectContains(grupo);
        functions.iSetElementWithText("Nombre de Producto Registrado","Producto prueba");
        functions.iSetElementWithText("Nso/rs/rsa/psa/nsa","NSO");
        functions.iSetElementWithText("Expediente","R00012345");
        functions.attachScreenShot();
        functions.iClicInElement("Boton Buscar");
    }

    @And("Puedo agregar la informacion sobre la toma de muestras")
    public void puedoAgregarLaInformacionSobreLaTomaDeMuestras() throws Exception {
        functions.iSetElementWithText("Numero de Lote","22");
        functions.iSetElementWithText("Cantidad de Muestras a Tomar","5");
        functions.iSetElementWithText("Nombre Producto Generico","Producto Prueba");
        functions.iSetElementWithText("Referencia","LAC00");
        functions.iClickCheckboxContains("Microbiol");
        int identificacionMuestras = functions.countElement("Identificacion de Muestras");
        int parametrosEvaluar = functions.countElement("Parametros a Evaluar");
        int planMuestreo = functions.countElement("Plan de Muestreo");
        if (identificacionMuestras>0){
            functions.iSetElementWithText("Identificacion de Muestras","5");
        }else if(parametrosEvaluar>0){
            functions.iSetElementWithText("Parametros a Evaluar","Calidad de producto");
        }else if(planMuestreo>0){
            functions.iClicInElement("Plan de Muestreo");
            functions.iClicInElement("//p-header[contains(.,'Plan')]/../p-multiselect/div//span[contains(.,'pescado crudo')]");
            functions.iClicInElement("//p-multiselect//a[@tabindex='0']//span");
        }
        functions.iClicInElement("Boton Agregar Informacion Toma de Muestras");
        functions.scrollToElement("Boton Agregar Informacion Toma de Muestras");
        functions.iWaitTime(2);
        functions.checkIfElementIsPresent("//th[contains(.,'Grupo')]/../../../tbody//tr");
        functions.attachScreenShot();
    }

    @Given("Puedo registrar una visita de una empresa inscrita con {string} y numero {string}")
    public void puedoRegistrarUnaVisitaDeUnaEmpresaInscritaConYNumero(String documento,String numero) throws Exception {
        functions.iClicInElement("Tipo de Documento");

        if (documento.equals("NIT")){
            functions.iSelectContains(documento);
        }else{
            functions.iSelectContains("dula de ciudadan");
        }
        functions.iSetElementWithText("Numero de Documento",numero);
        functions.iClicInElement("Boton Buscar");
        functions.attachScreenShot();
        functions.scrollToElement("Boton Correlacionar Visitas");
        functions.scrollToHorizontal("Boton Historico de Empresa");
        functions.scrollToElement("Boton Historico de Empresa");
        functions.iClicInElement("Boton Informacion de la Empresa");
        functions.scrollPage("end");
        functions.iClicInElement("Boton Cerrar");
        functions.iClicInElement("Boton Registrar Visita");
    }

    @Given("Puedo crear una empresa no inscrita con {string} de numero {string} de la misional {string}")
    public void puedoCrearUnaEmpresaNoInscritaDe(String tipoDocumento, String nDocumento, String tipoProducto) throws Exception {
        functions.iLoadTheDOMInformation("Sivicos.json");
        functions.scrollPage("end");
        functions.iClicInElement("Boton Crear Empresa No Inscrita");
        functions.scrollToElement("//p-header[contains(.,'empresa no inscrita')]");
        functions.iClickCheckboxContains("Requiere realizar");
        functions.iClicInElement("Tipo de Documento");
        functions.iSelectContains(tipoDocumento);
        long numero = System.currentTimeMillis();
        String number = "1" + numero;
        functions.iSetElementWithText("Numero de Documento",number);
        functions.iSetElementWithText("Digito de Verificacion","2");
        functions.iSetElementWithText("Razon Social o Nombre","La playita");
        functions.iSetElementWithText("Nombre Comercial o Sigla","LPY");
        functions.iSetElementWithText("Pagina Web","laplayita.com");
        functions.iClicInElement("Seleccione Pais");
        functions.iSelectContains("Alemania");
        functions.iClicInElement("Seleccione Departamento");
        functions.iSelectContains("Berliini");
        functions.iClicInElement("Seleccione Ciudad");
        functions.iSelectContains("Berlin");
        functions.iSetElementWithText("Correo Electronico","correoprueba@yopmail.com");
        functions.scrollPage("end");
        functions.attachScreenShot();
        functions.iClicInElement("Direccion");
        functions.iClicInElement("Tipo de Direccion");
        functions.iSelectContains("Urbana");
        functions.iClicInElement("Direccion PopUp");
        functions.iSelectContains("Administra");
        functions.iSetElementWithText("//input[@formcontrolname='campo1']","16");
        functions.iSetElementWithText("//input[@formcontrolname='campo2']","14");
        functions.iSetElementWithText("//input[@formcontrolname='campo3']","10");
        functions.iSetElementWithText("Barrio","7 de Agosto");
        functions.iClicInElement("Tipo de Inmueble");
        functions.iSelectContains("Apartamento");
        functions.iSetElementWithText("//input[@formcontrolname='tipoInmuebletext']","401");
        functions.iClicInElement("Complemento");
        functions.iSelectContains("Lote");
        functions.iSetElementWithText("//input[@formcontrolname='complementoText']","7");
        functions.iSetElementWithText("//textarea[@formcontrolname='detalleD']","Cerca a mercacentro");
        functions.attachScreenShot();
        functions.iClicInElement("Boton Guardar");
        functions.iSetElementWithText("Telefono","2625573");
        functions.iSetElementWithText("Celular","3222148016");
        functions.iWaitTime(2);
        functions.iClickCheckboxContains(tipoProducto);
        functions.iClicInElement("Boton Guardar");


    }


    @When("Puedo seleccionar el Grupo de trabajo {string} que revisa la visita")
    public void puedoSeleccionarElGrupoDeTrabajoQueRevisaLaVisita(String grupo) throws Exception {
        functions.iClicInElement("Seleccionar Grupo de Trabajo que Registra la Visita");
        functions.iClicInElement("//span[contains(.,'"+grupo+"')]");
        functions.iClicInElement("Boton Buscar");
    }

    /*
    @And("Puedo seleccionar la visita para direccionarla")
    public void puedoSeleccionarLaVisitaParaDireccionarla() throws Exception {
        functions.scrollToElement("Boton Acciones");
        functions.iClicInElement("//span[contains(.,'digo de la visita')]");
        String numVisita = functions.ScenaryData.get("Numero Visita");
        //functions.checkIfElementIsPresent("//tr//td[contains(.,'"+numVisita+"')]");
        functions.iClicInElement("//td[contains(.,'"+numVisita+"')]/../td//p-tablecheckbox");
        functions.scrollToElement("//td[contains(.,'"+numVisita+"')]/../td//form-button[contains(@title, 'Ver info')]");
        functions.iClicInElement("//td[contains(.,'"+numVisita+"')]/../td//form-button[contains(@title, 'Ver info')]");
        functions.iClicInElement("Boton Cerrar");
        functions.iClicInElement("//td[contains(.,'"+numVisita+"')]/../td//form-button[contains(@title, 'Editar')]");
        functions.iClicInElement("//button[contains(@ptooltip,'ver')]");
        functions.iWaitTime(2);
        functions.iClicInElement("Boton Cerrar");
        functions.scrollPage("top");
        functions.iClicInElement("Boton Acciones");
        functions.iClicInElement("Direccionar Visita");
        functions.iClicInElement("Boton Yes");
    }

     */


    @Given("Puedo consolidar la visita del tipo de producto {string}")
    public void consolidarLaVisitaDelTipoDeProductoAlimentos(String tipoProducto) throws Exception {
        functions.iClicInElement("Barra Lateral Consolidar Visitas");
        functions.iClicInElement("Tipo de Producto");
        functions.iSelectContains(tipoProducto);
        functions.iClicInElement("Boton Buscar");
    }

    @When("Puedo observar el listado de visitas planeadas")
    public void puedoObservarElListadoDeVisitasPlaneadas() throws Exception {
        functions.scrollToElement("(//form-input-combo)[1]");
        String numVisita = functions.ScenaryData.get("Numero Visita");
        functions.scrollPage("end");
        functions.checkIfElementIsPresent("//tr//td[contains(.,'"+numVisita+"')]");
        functions.iClicInElement("//td[contains(.,'"+numVisita+"')]/../td//p-tablecheckbox");
        functions.iClicInElement("//td[contains(.,'"+numVisita+"')]/../td//form-button[contains(@title, 'Observaci')]");
        functions.iSetElementWithText("Observacion","Observacion grupo de trabajo visitas planeadas");
        functions.iClicInElement("Boton Agregar");
        functions.iClicInElement("Boton Aceptar");
        functions.iClicInElement("//td[contains(.,'"+numVisita+"')]/../td//form-button[contains(@title, 'Ver info')]");
        functions.iClicInElement("Boton Cerrar");
        functions.iClicInElement("//td[contains(.,'"+numVisita+"')]/../td//form-button[contains(@title, 'Editar')]");
        functions.iClicInElement("//button[contains(@ptooltip,'ver')]");
        functions.iWaitTime(2);
        functions.iClicInElement("Boton Cerrar");

    }

    @And("Puedo mover las visitas planeadas al listado visitas en espera")
    public void puedoMoverLasVisitasPlaneadasAlListadoVisitasEnEspera() throws Exception {
        functions.iClicInElement("Boton Acciones");
        functions.iClicInElement("Mover Visita");
        String numVisita = functions.ScenaryData.get("Numero Visita");
        functions.checkIfElementIsPresent("//tr//td[contains(.,'"+numVisita+"')]");
        functions.scrollToElement("//td[contains(.,'"+numVisita+"')]/../td//p-tablecheckbox");
        functions.iClicInElement("//td[contains(.,'"+numVisita+"')]/../td//p-tablecheckbox");
        functions.iClicInElement("//td[contains(.,'"+numVisita+"')]/../td//form-button[contains(@title, 'Observaci')]");
        functions.iSetElementWithText("Observacion","Visitas en espera");
        functions.iClicInElement("Boton Agregar");
        functions.iClicInElement("Boton Aceptar");
        functions.iClicInElement("//td[contains(.,'"+numVisita+"')]/../td//form-button[contains(@title, 'Ver info')]");
        functions.iClicInElement("Boton Cerrar");
        functions.iClicInElement("//td[contains(.,'"+numVisita+"')]/../td//form-button[contains(@title, 'Editar')]");
        functions.iClicInElement("//button[contains(@ptooltip,'ver')]");
        functions.iWaitTime(2);
        functions.iClicInElement("Boton Cerrar");
        functions.scrollPage("top");
        functions.iClicInElement("Boton Acciones");
        functions.iClicInElement("Mover Visita");
    }

    @And("Puedo direccionar la visita a programacion de visitas")
    public void puedoDireccionarLaVisitaAProgramacionDeVisitas() throws Exception {
        functions.iWaitTime(3);
        String numVisita = functions.ScenaryData.get("Numero Visita");
        functions.checkIfElementIsPresent("//tr//td[contains(.,'"+numVisita+"')]");
        functions.iClicInElement("//td[contains(.,'"+numVisita+"')]/../td//p-tablecheckbox");
        functions.iClicInElement("Boton Enviar");
        functions.iClicInElement("Boton Yes");
    }

    @And("Tengo una visita pendiente de programar en {string}")
    public void tengoUnaVisitaPendienteDeProgramarEn(String tipoProducto) throws Exception {
        functions.iLoadTheDOMInformation("Sivicos.json");
        functions.iWaitTime(2);
        functions.iClicInElement("Barra Lateral Programar Visita");
        functions.iClicInElement("//label[contains(.,'Pa')][contains(.,'s')]/..//i");
        functions.iClicInElement("Tipo de Producto");
        functions.iSelectContains(tipoProducto);
        functions.iClicInElement("Boton Buscar");
        functions.iWaitTime(3);
        functions.scrollToElement("Boton Buscar");
        functions.doubleClick("//th[contains(.,'digo de la visita')]");
        functions.scrollToHorizontal("//th[6]");
        String radicado = functions.ScenaryData.get("Radicado");
        functions.scrollToHorizontal("//th[1]");
        functions.iSaveTextOfElementInScenario("Codigo Visita","//td[contains(.,'"+radicado+"')]/../td[3]");
        functions.iExtractRightOfKey("Codigo Visita",17);
        functions.iClicInElement("//td[contains(.,'"+radicado+"')]/../td//p-tablecheckbox");
        functions.scrollToHorizontal("//th[29]");
        functions.iClicInElement("Calendario Desde");
        functions.iClicInElement("Dia Actual");
        functions.iClicInElement("Calendario Hasta");
        functions.iClicInElement("Dia Actual");
        functions.scrollToElement("Boton Buscar");
    }

    @And("Programo la visita")
    public void puedoProgramarLaVisita() throws Exception {
        functions.iClicInElement("Boton Acciones");
        functions.iClicInElement("Menu Programar Visita");
        functions.iClicInElement("Seleccionar Modalidad de la Visita");
        functions.iSelectContains("Presencial");
        functions.iSetElementWithText("Nombres y Apellidos","veinti tres");
        functions.iClicInElement("Boton Buscar Funcionario");
        functions.iClicInElement("//p-header[contains(.,'Resultado')]/../..//p-tablecheckbox");
        functions.iClicInElement("Boton Agregar");
        functions.iClicInElement("Seleccionar Tiempo de la Actividad");
        functions.iClicInElement("//p-dropdownitem");
        functions.scrollToElement("//th[contains(.,'Usuar')]");
        functions.iClicInElement("Boton Finalizar");
    }

    @And("Puedo generar el oficio comisorio")
    public void puedoGenerarElOficioComisorio() throws Exception {
        String radicado = functions.ScenaryData.get("Radicado");
        String numVisita = functions.ScenaryData.get("Numero Visita");
        functions.scrollToHorizontal("//th[1]");
        //if (radicado.equals(null)){
            functions.iClicInElement("//td[contains(.,'"+numVisita+"')]/../td//p-tablecheckbox");
        //}else{
        //    functions.iClicInElement("//td[contains(.,'"+radicado+"')]/../td//p-tablecheckbox");
        //}

        functions.scrollToElement("Boton Acciones");
        functions.iClicInElement("Boton Acciones");
        functions.iClicInElement("Menu Generar Oficio Comisorio");
        functions.scrollPage("end");
        functions.iClicInElement("Boton Oficio Comisorio");
        functions.iClicInElement("Seleccionar Tipo Documental");
        functions.iSelectContains("Oficio");
        functions.iClicInElement("Boton Generar Documento");
        //Agregar lo de la firma
        functions.iClicInElement("Boton Finalizar");
    }

    @And("Ejecuto la visita")
    public void puedoEjecutarLaVisita() throws Exception {
        String idActividad = functions.ScenaryData.get("Codigo Visita");
        functions.iClicInElement("//th//span[contains(.,'ID Actividad')]");
        functions.iClicInElement("//td[contains(.,'"+idActividad+"')]/../td//form-button");
        functions.iWaitTime(2);
        functions.iClicInElement("//a[contains(.,'Informaci')]");
        functions.attachScreenShot();
        int existHistoricoVisitas = functions.countElement("//a[contains(.,'Hist')][contains(.,'visitas')]");
        if (existHistoricoVisitas<1){
            functions.iClicInElement("//a[contains(.,'Hist')][contains(.,'visitas')]");
            functions.attachScreenShot();
        }
        functions.iClicInElement("//a[contains(.,'Hist')][contains(.,'mss')]");
        functions.attachScreenShot();
        functions.iClicInElement("//a[contains(.,'Gestionar')][contains(.,'mss')]");
        functions.iClicInElement("RB NO Medidas Sanitarias de Seguridad");
        functions.iClicInElement("RB SI Representante Legal Atiende Visita");
        functions.scrollToElement("Seleccionar Estado MSS Producto Definicion");
        functions.iClicInElement("Seleccionar Estado MSS Producto Definicion");
        functions.iWaitTime(1);
        functions.attachScreenShot();
        functions.iClicInElement("Seleccionar Estado MSS Establecimiento Gestion");
        functions.iWaitTime(1);
        functions.attachScreenShot();
        functions.iClicInElement("Seleccionar Estado MSS Producto Suspension");
        functions.iWaitTime(1);
        functions.attachScreenShot();
        functions.scrollPage("top");

    }

    @And("Puedo diligenciar actas del grupo {string} del subgrupo {string} y tipo de acta {string}")
    public void puedoDiligenciarActas(String grupo, String subgrupo, String tipoActa) throws Exception {
        functions.iClicInElement("//a[contains(.,'Diligenciar')]");
        functions.iClicInElement("Seleccionar Grupo");
        functions.iSelectContains(grupo);
        functions.iClicInElement("Seleccionar Subgrupo");
        functions.iSelectContains(subgrupo);
        functions.iClicInElement("Seleccionar Tipo de Acta");
        functions.iSelectContains(tipoActa);
        functions.iClicInElement("Boton Diligenciar");
        functions.iWaitTime(3);
        functions.iClicInElement("Boton Anadir Datos");
        functions.iWaitTime(2);
        functions.checkIfElementIsPresent("//div[@role='dialog']");
        //String radicado = functions.ScenaryData.get("Radicado");
        //if (radicado.equals(null)){
            functions.iSetElementWithText("Radicado","100100");
        //}else{
        //    functions.iSetElementWithText("Radicado",radicado);
        //}
        functions.iSetElementWithText("Producto","Cosmetico");
        functions.iSetElementWithText("Numero de Lote","123ABC");
        functions.iSetElementWithText("Fecha de Vencimiento","12 de Noviembre 2023");
        functions.iSetElementWithText("Presentacion","Polvo");
        functions.iSetElementWithText("Registro Sanitario o NSO","RS");
        functions.iSetElementWithText("Fabricante","Cosmeticos SAS");
        functions.iSetElementWithText("Distribuidor","Distribuidores SAS");
        functions.iSetElementWithText("Cantidad","3");
        functions.iSetElementWithText("Observaciones","No hay observacion");
        functions.iClicInElement("Boton Guardar Datos");
        functions.checkIfElementIsPresent("//thead//th[contains(.,'RADICADO')]/../../../tbody//tr");
        functions.scrollPage("top");
    }

    @And("Puedo realizar el cierre de la visita")
    public void puedoRealizarElCierreDeLaVisita() throws Exception {
        functions.scrollPage("top");
        functions.iClicInElement("//a[contains(.,'Notificaci')]");
        functions.attachScreenShot();
        functions.iClicInElement("//a[contains(.,'Cierre')]");
        functions.iClicInElement("Seleccionar Resultado de la Visita");
        functions.iSelectContains("Ejecutada");
        functions.iClicInElement("Seleccionar Estado de la Empresa");
        functions.iSelectContains("Cerrado");
        functions.iClicInElement("Accion a Seguir");
        functions.iSelectContains("Cerrar visita");
        int concepto = functions.countElement("Concepto");
        if (concepto>0){
            functions.iClicInElement("Concepto");
            functions.iSelectContains("Mantiene y cumple");
        }

        functions.iSetElementWithText("Descripcion del Concepto","Se ha ejecutado la visita");
        functions.iSetElementWithText("Observaciones","No hay nada pendiente");
        functions.iClicInElement("(//button[contains(.,'Guardar')])[3]");
        functions.scrollPage("end");
        functions.iClicInElement("Boton Finalizar");
        functions.attachScreenShot();
    }

    @And("Puedo agregar la informacion del responsable de hacer la visita {string} en la misional Cosmeticos")
    public void puedoAgregarLaInformacionDelResponsableDeHacerLaVisitaEnLaMisionalCosmeticos(String responsable) throws Exception {
        functions.iClicInElement("Seleccionar Responsable de Hacer la Visita");
        functions.iSelectContains(responsable);
        functions.iClicInElement("Seleccionar Grupo de Trabajo que Registra la Visita");
        functions.iSelectContains("Grupo de Registros");
        functions.iClickCheckboxContains("Requiere acompa");
        functions.attachScreenShot();
        functions.scrollToElement("Seleccionar Responsable de Hacer la Visita");
        functions.iWaitTime(2);
        functions.iClicInElement("Seleccionar Responsable del Acompanamiento");
        functions.iClicInElement("//p-header[contains(.,'Responsable')]/../p-multiselect/div//span[contains(.,'cosm')]"); //Alimentos
        functions.iSendKeyEscapeToPerform();
        //Objetivo y Descripcion se llenan solos
        functions.scrollToElement("Boton Crear Visita");
        functions.iWaitTime(2);
        functions.iClicInElement("Boton Crear Visita");
        functions.iClicInElement("Boton Yes");
        functions.attachScreenShot();
    }

    @And("Tengo visita pendiente de programar en {string} con Codigo de Visita")
    public void tengoUnaVisitaPendienteDeProgramarEnConCodigoDeVisita(String tipoProducto) throws Exception {
        functions.iLoadTheDOMInformation("Sivicos.json");
        functions.iWaitTime(2);
        functions.iClicInElement("Barra Lateral Programar Visita");
        functions.iClicInElement("//label[contains(.,'Pa')][contains(.,'s')]/..//i");
        functions.iClicInElement("Tipo de Producto");
        functions.iSelectContains(tipoProducto);
        functions.iClicInElement("Boton Buscar");
        functions.iWaitTime(3);
        functions.scrollToElement("Boton Buscar");
        functions.doubleClick("//th[contains(.,'digo de la visita')]");
        functions.scrollToHorizontal("//th[6]");
        String numeroVisita = functions.ScenaryData.get("Numero Visita");
        functions.scrollToHorizontal("//th[1]");
        functions.iSaveTextOfElementInScenario("Codigo Visita","//td[contains(.,'"+numeroVisita+"')]/../td[3]");
        functions.iExtractRightOfKey("Codigo Visita",17);
        functions.iClicInElement("//td[contains(.,'"+numeroVisita+"')]/../td//p-tablecheckbox");
        functions.scrollToHorizontal("//th[29]");
        functions.iClicInElement("Calendario Desde");
        functions.iClicInElement("Dia Actual");
        functions.iClicInElement("Calendario Hasta");
        functions.iClicInElement("Dia Actual");
        functions.scrollToElement("Boton Buscar");
    }

    @Then("necesito validar una visita del producto {string}")
    public void puedoValidarLaVisita(String tipoProducto) throws Exception {
        functions.iClicInElement("Barra Lateral Sivicos");
        functions.iClicInElement("Barra Lateral Programacion de Visitas");
        functions.iClicInElement("Barra Lateral Validar Visita");
        functions.iClicInElement("Tipo de Producto");
        functions.iSelectContains(tipoProducto);
        functions.iClicInElement("Boton Consultar");
        functions.iWaitTime(2);


    }
}
