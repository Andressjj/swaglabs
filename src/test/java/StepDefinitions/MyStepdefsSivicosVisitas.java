package StepDefinitions;

import Functions.SeleniumFunctions;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.cucumber.java.es.Cuando;
import io.cucumber.java.es.Dado;
import io.cucumber.java.es.Entonces;
import io.cucumber.java.es.Y;

public class MyStepdefsSivicosVisitas {

    SeleniumFunctions functions = new SeleniumFunctions();

    @Dado("necesito registrar una visita del producto {string}")
    public void necesitoRegistrarUnaVisitaDelProductoCosmeticos(String tipoProducto) throws Exception {
        functions.iLoadTheDOMInformation("Sivicos.json");
        functions.iWaitTime(2);
        functions.iClicInElement("Barra Lateral Sivicos");
        functions.iClicInElement("Barra Lateral Planeacion");
        functions.iClicInElement("Barra Lateral Registrar Visitas");
        functions.iClicInElement("Tipo de Producto");
        functions.iSelectContains(tipoProducto);

    }

    @Cuando("busco una empresa no inscrita ya creada con {string} numero {string}")
    public void buscoUnaEmpresaNoInscritaYaCreadaConNITNumero(String documento, String numero) throws Exception {


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

    @Entonces("se visualiza la informacion de la empresa")
    public void seVisualizaLaInformacionDeLaEmpresa() throws Exception {
        functions.scrollToElement("Boton Correlacionar Visitas");
        functions.scrollToHorizontal("Boton Historico de Empresa");
        functions.scrollToElement("Boton Historico de Empresa");
        functions.iClicInElement("Boton Registrar Visita");
    }

    @Dado("necesito ingresar la informacion de la visita")
    public void necesitoIngresarLaInformacionDeLaVisita() {
    }

    @Cuando("selecciono la razon {string} y clasificacion {string}")
    public void seleccionoLaRazonYClasificacion(String razon, String clasificacion) throws Exception {
        functions.iClicInElement("Seleccionar Razon de la Visita");
        functions.iSelectContains(razon);
        functions.iClicInElement("Seleccionar Modalidad de la Visita");
        functions.iSelectContains("Virtual");
        functions.iClicInElement("Seleccionar Clasificacion de la Visita");
        functions.iSelectContains(clasificacion);
        functions.iClicInElement("Seleccionar Fuente de la Informacion de la Visita");
        functions.iSelectContains("Certificaciones");
        functions.iClicInElement("Seleccionar Prioridad de la Visita");
        functions.iSelectContains("Medio");
        functions.iWaitTime(2);
        functions.iClicInElement("Seleccionar Posible Alteracion Fraudulencia Ilegalidad");
        functions.iSelectContains("No aplica");
    }

    @Y("Selecciono el grupo {string} y el subgrupo {string}")
    public void seleccionoElGrupoYElSubgrupo(String grupo, String subgrupo) throws Exception {
        functions.iClicInElement("Seleccionar Grupo Registrar Visita");
        //functions.scrollToElement("//li//span[contains(.,'Alimentos compuestos')]");
        functions.iSelectContains(grupo);
        functions.iClicInElement("Seleccionar SubGrupo Registrar Visita");
        functions.iSelectContains(subgrupo);
    }

    @Y("agrego como responsable de hacer la visita a {string}")
    public void agregoLaInformacionDelResponsableDeHacerLaVisita(String responsable) throws Exception {
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

    @When("El sistema genera un numero de visita")
    public void elSistemaGeneraUnNumeroDeVisita() throws Exception {
        functions.attachScreenShot();
        functions.iSaveTextOfElementInScenario("Numero Visita","(//p-toast//div//div[contains(.,'Se ha guardado correctamente la visita')])[last()]");
        functions.iExtractRightOfKey("Numero Visita",17);
    }

    @Dado("tengo registrada una visita")
    public void tengoRegistradaUnaVisita() {
    }
    @And("Puedo agregar la informacion de antecedentes de tipo {string}")
    public void puedoAgregarLaInformacionDeAntecedentes(String tipoAntecedente) throws Exception {
        functions.iClickCheckboxContains("Antecedentes");
        functions.iClicInElement("Seleccionar Tipo Antecedente");
        functions.scrollPage("end");
        functions.iSelectContains(tipoAntecedente);
        functions.iSetElementWithText("Referencia del Antecedente","QWERTY123");
        functions.iSetElementWithText("Numero del Asociado","103");
        functions.iClicInElement("Boton Agregar Antecedentes");
        functions.scrollToElement("Boton Agregar Antecedentes");
        functions.checkIfElementIsPresent("//p-header[contains(.,'antecedentes')]/../../../../p-panel//tbody//tr");
    }

    @And("Puedo agregar los documentos asociados del grupo {string}")
    public void puedoAgregarLosDocumentosAsociadosDelGrupo(String grupo) throws Exception {
        int documentosAsociado = functions.countElement("//a[contains(.,'Documentos')]");
        if(documentosAsociado!=0){
            functions.iClicInElement("//a[contains(.,'Documentos')]");
        }
        functions.scrollToElement("Seleccionar Grupo Documentos Asociados");
        functions.iClicInElement("Seleccionar Grupo Documentos Asociados");
        functions.iSelectContains(grupo);
        functions.iClicInElement("Nombre del Documento");
        functions.iSelectContains("Anexos");
        functions.iSetElementWithText("Cantidad de Folios", "3");
        functions.scrollToElement("Cantidad de Folios");
        functions.SaveInScenarioFile("Principal", "pdf");
        functions.iSetElementWithKeyValue("Boton Seleccionar Archivo","Principal");
        functions.iClicInElement("Boton Subir");
        functions.scrollToElement("Boton Guardar Documentos Asociados");
        functions.iClicInElement("Boton Guardar Documentos Asociados");
        functions.iWaitTime(4);
        int ejecucionVisitas = functions.countElement("//p-header[contains(.,'Documentos')]/../../../../p-panel//tbody//tr//td[contains(.,'usuariosivico')]");
        if (ejecucionVisitas==1){
            System.out.println("Se agrego con exito");
            functions.attachScreenShot();
        }else{
            functions.scrollToElement("Boton Guardar Documentos Asociados");
            functions.waitForElementNotPresent("Spinner");
            functions.checkIfElementIsPresent("//p-header[contains(.,'Documentos')]/../../../../p-panel//tbody//tr");
            functions.attachScreenShot();
        }

    }

    @And("Puedo agregar la informacion sobre la toma de muestras del grupo {string}")
    public void puedoAgregarLaInformacionSobreLaTomaDeMuestras(String grupo) throws Exception {
        functions.iClicInElement("Seleccionar Grupo Informacion Toma de Muestras");
        functions.iSelectContains(grupo);
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
    @And("Puedo finalizar el registro de la visita")
    public void puedoFinalizarElRegistroDeLaVisita() throws Exception {
        functions.attachScreenShot();
        functions.iClicInElement("Boton Finalizar");
    }
    @Given("Tengo pendiente por revisar la visita")
    public void tengoPendientePorRevisarLaVisita() throws Exception {
        functions.iLoadTheDOMInformation("Sivicos.json");
        functions.iWaitTime(2);
        //functions.iClicInElement("Barra Lateral Sivicos");
        //functions.iClicInElement("Barra Lateral Planeacion");
        functions.iClicInElement("Barra Lateral Revisar Visitas");

    }
    @When("selecciono el Grupo de trabajo {string}")
    public void seleccionoElGrupoDeTrabajoQueRevisaLaVisita(String grupo) throws Exception {
        functions.iClicInElement("Seleccionar Grupo de Trabajo que Registra la Visita");
        functions.iClicInElement("//span[contains(.,'"+grupo+"')]");
        functions.iClicInElement("Boton Buscar");
    }


    @And("Puedo seleccionar la visita para direccionarla")
    public void puedoSeleccionarLaVisitaParaDireccionarla() throws Exception {


        functions.waitForElementPresent("//span[contains(.,'digo de la visita')]",10);
        functions.iClicInElement("//span[contains(.,'digo de la visita')]");
        String numVisita = (functions.ScenaryData.get("Numero Visita")).replaceAll(" ","");

        //   functions.iClicInElement("//td[contains(.,'"+numVisita+"')]/../td//form-button[contains(@title, 'Ver info')]");
        //  functions.attachScreenShot();
        //  functions.iClicInElement("Boton Cerrar");
        //  functions.iClicInElement("//td[contains(.,'"+numVisita+"')]/../td//form-button[contains(@title, 'Editar')]");
        //  functions.iClicInElement("Boton Ver");
        //  functions.waitForElementNotPresent("Spinner");
        //   functions.attachScreenShot();
        //   functions.iClicInElement("Boton Cerrar");

        // Hago clic en el check box para seleccionar el registro y que se habilite las acciones.
        functions.waitForElementPresent("//td[contains(.,'"+numVisita+"')]/../td//p-tablecheckbox//div[@role='checkbox']",10);
        functions.scrollToElement("//td[contains(.,'"+numVisita+"')]/../td//p-tablecheckbox//div[@role='checkbox']");
        functions.iClicInElement("//td[contains(.,'"+numVisita+"')]/../td//p-tablecheckbox//div[@role='checkbox']");
        functions.attachScreenShot();
        functions.scrollToElement("Boton Acciones");
        functions.iClicInElement("Boton Acciones");
        functions.iClicInElement("Direccionar Visita");
        functions.iClicInElement("Boton Yes");
        functions.attachScreenShot();
    }
    @Given("necesito consolidar una visita planeada del producto {string}")
    public void necesitoConsolidarLaVisitaDelTipoDeProductoAlimentos(String tipoProducto) throws Exception {
        functions.iClicInElement("Barra Lateral Consolidar Visitas");
        functions.iClicInElement("Tipo de Producto");
        functions.iSelectContains(tipoProducto);
        functions.iClicInElement("Boton Buscar");
    }


    @Cuando("envio la visita a programacion de visitas")
    public void envioLaVisitaAProgramacionDeVisitas() throws Exception {
        functions.iWaitTime(3);
        String numVisita = (functions.ScenaryData.get("Numero Visita")).replaceAll(" ","");
        functions.scrollToElement("//tr//td[contains(.,'"+numVisita+"')]");
        functions.checkIfElementIsPresent("//tr//td[contains(.,'"+numVisita+"')]");
        functions.iClicInElement("Boton Enviar");
        functions.iClicInElement("Boton Yes");
    }
    @Given("necesito programar una visita del producto {string}")
    public void tengoUnaVisitaPendienteDeProgramar(String tipoProducto) throws Exception {
        functions.iLoadTheDOMInformation("Sivicos.json");
        functions.iWaitTime(2);
        functions.iClicInElement("Barra Lateral Sivicos");
        functions.iClicInElement("Barra Lateral Programacion de Visitas");
        functions.iClicInElement("Barra Lateral Programar Visita");
        functions.iClicInElement("Tipo de Producto");
        functions.iSelectContains(tipoProducto);
        functions.iClicInElement("Boton Buscar");
        functions.iWaitTime(3);
        functions.scrollToElement("Boton Buscar");
        functions.doubleClick("//th[contains(.,'digo de la visita')]");
        functions.scrollToHorizontal("//th[6]");
        String numeroVisita = (functions.ScenaryData.get("Numero Visita")).replaceAll(" ","");
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
    @And("programo la visita al usuario {string}")
    public void ProgramarLaVisitaAlUsuario(String usuario) throws Exception {
        functions.iClicInElement("Boton Acciones");
        functions.iClicInElement("Menu Programar Visita");
        functions.iClicInElement("Seleccionar Modalidad de la Visita");
        functions.iSelectContains("Presencial");
        functions.iSetElementWithText("Nombres y Apellidos",usuario);
        functions.iClicInElement("Boton Buscar Funcionario");
        functions.iClicInElement("//p-header[contains(.,'Resultado')]/../..//p-tablecheckbox");
        functions.iClicInElement("Boton Agregar");
        functions.iClicInElement("Seleccionar Tiempo de la Actividad");
        functions.iClicInElement("//p-dropdownitem");
        functions.scrollToElement("//th[contains(.,'Usuar')]");

        //Se agrega esto temporalmente para diligenciar informacion del acompañante.
functions.iSetElementWithText("Entidad","Vigilancia y Control");
functions.iSetElementWithText("Dependencia","Seguimientos y Apoyo");
functions.iSetElementWithText("Nombres y Apellidos Acompanante","Manuel Pedraza");
functions.iSetElementWithText("Correo Acompanante","ManuelpeInvima@gmail.com");
functions.iClicInElement("Tipo de Documento Acompanante");
functions.iSelectContains("Cédula de ciudadanía");
functions.iSetElementWithText("Numero de Identificacion Acompanante","1110552028");
functions.iSetElementWithText("Numero de Telefono Acompanante","2767854");
functions.iSetElementWithText("Numero de Celular Acompanante","3213566878");
functions.iClicInElement("Boton Agregar");
        // Fin pasos temporales.

        functions.iClicInElement("Boton Finalizar");
    }
    @And("genero el oficio comisorio")
    public void generoElOficioComisorio() throws Exception {
        String numVisita = functions.ScenaryData.get("Numero Visita");
        functions.scrollToHorizontal("//th[1]");
        functions.iClicInElement("//td[contains(.,'"+numVisita+"')]/../td//p-tablecheckbox");

        functions.scrollToElement("Boton Acciones");
        functions.iClicInElement("Boton Acciones");
        functions.iClicInElement("Menu Generar Oficio Comisorio");
        functions.scrollPage("end");
        functions.iClicInElement("Boton Oficio Comisorio");
        functions.iClicInElement("Seleccionar Tipo Documental");
        functions.iSelectContains("Oficio comisorio");
        functions.iClicInElement("Boton Generar Documento");
        //Agregar lo de la firma
        functions.iClicInElement("Boton Finalizar");
    }


    @Dado("necesito generar el oficio comisorio")
    public void necesitoGenerarElOficioComisorio() {
    }

    @Cuando("ejecuto la accion programar visita")
    public void ejecutoLaAccionDe() throws Exception {
        String numeroVisita = (functions.ScenaryData.get("Numero Visita")).replaceAll(" ","");
        functions.doubleClick("//th[contains(.,'digo de la visita')]");
        functions.iClicInElement("//td[contains(.,'"+numeroVisita+"')]/../td//p-tablecheckbox");
        functions.iClicInElement("Boton Acciones");
        functions.iClicInElement("Menu Programar Visita");

    }

    @Entonces("puedo agregar las observaciones y enviar a programar visitas.")
    public void puedoAgregarLasObservacionesYEnviarAVisitas() throws Exception {
        functions.iSetElementWithText("Observaciones","Validacion exitosa");
        functions.iClicInElement("Boton Agregar");
        functions.iClicInElement("Boton Finalizar");
    }
}