package StepDefinitions;

import Functions.SeleniumFunctions;
import Tasks.Questions;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.And;
import io.cucumber.java.es.Cuando;
import org.junit.Assert;

import java.util.List;

public class MyStepdefsPantallasTecnicas {
    Questions questions = new Questions();
    SeleniumFunctions functions = new SeleniumFunctions();

    @When("Ingreso toda la informacion de la pantalla tecnica Plaguicidas de uso domestico")
    public void ingresoTodaLaInformacionDeLaPantallaTecnicaRSNPlaguicidasDeUsoDomestico() throws Exception {
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.scrollPage("end");
        functions.iWaitTime(5);
        functions.scrollToElement("Nombre del Producto");
        functions.iSetElementWithText("Nombre del Producto", "Stickers Repelente");
        functions.iSetElementWithText("Marca", "Palmolive");
        functions.scrollToElement("Origen de la Fabricacion del Producto");
        functions.iClicInElement("Origen de la Fabricacion del Producto");
        functions.iSelectContains("Fabricante nacional");
        functions.iClicInElement("Tipo de Plaguicida");
        functions.iSelectContains("Insecticida");
        functions.iSetElementWithText("Plagas Objetivo", "Repelente");
        functions.scrollToElement("Forma de Presentacion");
        functions.iClicInElement("Forma de Presentacion");
        functions.iSelectContains("Barra");
        functions.iSetElementWithText("Modo Adecuado de Empleo", "Extraer un stickert de la barra y colocar sobre la ropa.");
        functions.iClicInElement("Categoria Toxicologica");
        functions.iSelectContains("Ligeramente");
        functions.iSetElementWithText("Concepto Toxicologico", "Aceptado");
        functions.iSetElementWithText("Vida Util", "Permanente");
        functions.iSetElementWithText("Antidotos", "No requiere");
        functions.scrollToElement("Boton Adicionar");
        functions.iClicInElement("Boton Adicionar");
        functions.iSetElementWithText("Tipo de Envase", "Caja");
        functions.iSetElementWithText("Presentacion Comercial", "Barra");
        functions.iSetElementWithText("Material de Envase Primario", "Carton");
        functions.iSetElementWithText("Material de Envase Secundario", "Bolsa");
        functions.iClicInElement("Boton Adicionar Material");
        functions.scrollToElement("Si Realizar Cargue Manual");
        functions.iClicInElement("Si Realizar Cargue Manual");
        functions.iClicInElement("Boton Agregar");
        functions.iSetElementWithText("Identificador Unico", "E50000F25");
        functions.iSetElementWithText("Nombre Generico del Ingrediente", "Insecticida");
        functions.iSetElementWithText("Nombre Quimico del Ingrediente", "C14H9Cl5");
        functions.iSetElementWithText("Concentracion", "100%");
        functions.iSetElementWithText("Tipo de Ingrediente", "Alcohol");
        functions.iSetElementWithText("Pais Origen del Activo", "Colombia");
        functions.iClicInElement("Boton Adicionar");

        functions.iClicInElement("Boton Agregar");
        functions.iSetElementWithText("Identificador Unico", "E50000F26");
        functions.iSetElementWithText("Nombre Generico del Ingrediente", "Leche");
        functions.iSetElementWithText("Nombre Quimico del Ingrediente", "C14H9Cl5L");
        functions.iSetElementWithText("Concentracion", "100%");
        functions.iSetElementWithText("Tipo de Ingrediente", "Leche Pura");
        functions.iSetElementWithText("Pais Origen del Activo", "Colombia");
        functions.iClicInElement("Boton Adicionar");

        functions.iClicInElement("Boton Agregar");
        functions.iSetElementWithText("Identificador Unico", "E50000F25");
        functions.iSetElementWithText("Nombre Generico del Ingrediente", "Insecticida");
        functions.iSetElementWithText("Nombre Quimico del Ingrediente", "C14H9Cl5");
        functions.iSetElementWithText("Concentracion", "100%");
        functions.iSetElementWithText("Tipo de Ingrediente", "Alcohol");
        functions.iSetElementWithText("Pais Origen del Activo", "Colombia");
        functions.iClicInElement("Boton Adicionar");

        functions.iClicInElement("Boton Agregar");
        functions.iSetElementWithText("Identificador Unico", "E50000F27");
        functions.iSetElementWithText("Nombre Generico del Ingrediente", "Agua");
        functions.iSetElementWithText("Nombre Quimico del Ingrediente", "C14H9Cl5h2");
        functions.iSetElementWithText("Concentracion", "100%");
        functions.iSetElementWithText("Tipo de Ingrediente", "Agua Liquida");
        functions.iSetElementWithText("Pais Origen del Activo", "Colombia");
        functions.iClicInElement("Boton Adicionar");
    }

    @When("Ingreso toda la informacion de la pantalla tecnica Plaguicidas de uso en salud publica")
    public void ingresoTodaLaInformacionDeLaPantallaTecnicaRSNPlaguicidasDeUsoEnSaludPublica() throws Exception {
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.scrollPage("end");
        functions.iWaitTime(5);
        functions.scrollToElement("Nombre del Producto");
        functions.iSetElementWithText("Nombre del Producto", "Stickers Repelente");
        functions.iSetElementWithText("Marca", "Palmolive");
        functions.scrollToElement("Origen de la Fabricacion del Producto");
        functions.iClicInElement("Origen de la Fabricacion del Producto");
        functions.iSelectContains("nacional");
        functions.iClicInElement("Tipo de Plaguicida");
        functions.iSelectContains("Insecticida");
        functions.iClicInElement("Area de Aplicacion");
        functions.iClickCheckboxContains("Edificaciones");
        functions.iSendKeyEscapeToPerform();
        functions.iSetElementWithText("Descripcion del Area de Aplicacion","Timon");
        functions.scrollToElement("Forma de Presentacion");
        functions.iClicInElement("Forma de Presentacion");
        functions.iSelectContains("Barra");
        functions.iClicInElement("Categoria Toxicologica");
        functions.iSelectContains("Ligeramente");
        functions.iSetElementWithText("Concepto Toxicologico", "Aceptado");
        functions.iSetElementWithText("Vida Util", "Permanente");
        functions.scrollToElement("Boton Adicionar");
        functions.iClicInElement("Boton Adicionar");
        functions.iSetElementWithText("Tipo de Envase", "Caja");
        functions.iSetElementWithText("Presentacion Comercial", "Barra");
        functions.iSetElementWithText("Material de Envase Primario", "Carton");
        functions.iSetElementWithText("Material de Envase Secundario", "Bolsa");
        functions.iClicInElement("Boton Adicionar Material");
        functions.scrollToElement("Si Realizar Cargue Manual");
        functions.iClicInElement("Si Realizar Cargue Manual");
        functions.iClicInElement("Boton Agregar");
        functions.iSetElementWithText("Identificador Unico", "E50000F25");
        functions.iSetElementWithText("Nombre Generico del Ingrediente", "Insecticida");
        functions.iSetElementWithText("Nombre Quimico del Ingrediente", "C14H9Cl5");
        functions.iSetElementWithText("Concentracion", "100%");
        functions.iSetElementWithText("Tipo de Ingrediente", "Alcohol");
        functions.iClicInElement("Boton Adicionar");

        functions.iClicInElement("Boton Agregar");
        functions.iSetElementWithText("Identificador Unico", "E50000F26");
        functions.iSetElementWithText("Nombre Generico del Ingrediente", "Leche");
        functions.iSetElementWithText("Nombre Quimico del Ingrediente", "C14H9Cl5L");
        functions.iSetElementWithText("Concentracion", "100%");
        functions.iSetElementWithText("Tipo de Ingrediente", "Leche Pura");
        functions.iClicInElement("Boton Adicionar");

        functions.iClicInElement("Boton Agregar");
        functions.iSetElementWithText("Identificador Unico", "E50000F25");
        functions.iSetElementWithText("Nombre Generico del Ingrediente", "Insecticida");
        functions.iSetElementWithText("Nombre Quimico del Ingrediente", "C14H9Cl5");
        functions.iSetElementWithText("Concentracion", "100%");
        functions.iSetElementWithText("Tipo de Ingrediente", "Alcohol");
        functions.iClicInElement("Boton Adicionar");

        functions.iClicInElement("Boton Agregar");
        functions.iSetElementWithText("Identificador Unico", "E50000F27");
        functions.iSetElementWithText("Nombre Generico del Ingrediente", "Agua");
        functions.iSetElementWithText("Nombre Quimico del Ingrediente", "C14H9Cl5h2");
        functions.iSetElementWithText("Concentracion", "100%");
        functions.iSetElementWithText("Tipo de Ingrediente", "Agua Liquida");
        functions.iClicInElement("Boton Adicionar");
    }

    @When("Ingreso toda la informacion de la pantalla tecnica NSO Cosmeticos")
    public void ingresoTodaLaInformacionDeLaPantallaTecnicaNSONuevaCosmeticos() throws Exception {
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.scrollPage("end");
        functions.iWaitTime(5);
        functions.scrollToElement("Nombre del Producto");
        functions.iSetElementWithText("Nombre del Producto", "Stickers Repelente");
        functions.iClicInElement("Forma Cosmetica");
        functions.iSelectContains("Aceite");
        functions.iSetElementWithText("Denominacion Generica", "Palmolive");
        functions.iSetElementWithText("Grupo Cosmetico", "Facial");
        functions.iSetElementWithText("Marca", "Avon");
        functions.iClicInElement("Seleccionar Codigo Ira Impreso");
        functions.iSelectContains("Si");
        functions.scrollToElement("Boton Adicionar");
        functions.iClicInElement("Boton Adicionar");
        functions.iSetElementWithText("Tipo de Envase", "Caja");
        functions.iSetElementWithText("Presentacion Comercial", "Barra");
        functions.iSetElementWithText("Material de Envase Primario", "Carton");
        functions.iSetElementWithText("Material de Envase Secundario", "Bolsa");
        functions.iClicInElement("CheckBox Tipo de Presentacion");
        functions.iClicInElement("Boton Adicionar Material");
        functions.scrollToElement("Si Realizar Cargue Manual");
        functions.iClicInElement("Si Realizar Cargue Manual");
        functions.iClicInElement("Boton Agregar");
        functions.iSetElementWithText("Identificador Unico", "E50000F25");
        functions.iSetElementWithText("Nombre del Ingrediente", "Arroz");
        functions.iSetElementWithText("Concentracion", "80%");
        functions.iSetElementWithText("Funcion", "Belleza");
        functions.iSetElementWithText("Tipo de Ingrediente", "Natural");
        functions.iClicInElement("Boton Adicionar");
    }

    @When("Ingreso toda la informacion de la pantalla tecnica Reconocimiento NSO Cosmeticos")
    public void ingresoTodaLaInformacionDeLaPantallaTecnicaNSOReconocimientoCosmeticos() throws Exception {
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.iWaitTime(5);
        functions.scrollToElement("Seleccione Pais");
        functions.iClicInElement("Seleccione Pais");
        functions.iSelectContains("Colombia");
        functions.iSetElementWithText("Codigo de Identificacion de la NSO","123-AVB");
        functions.iSetElementWithText("Vigencia del Codigo de Identificacion de la NSO","10/09/2024");
        functions.scrollToElement("Nombre del Producto");
        functions.iSetElementWithText("Nombre del Producto", "Stickers Repelente");
        functions.iClicInElement("Forma Cosmetica");
        functions.iSelectContains("Aceite");
        functions.iSetElementWithText("Denominacion Generica", "Palmolive");
        functions.iSetElementWithText("Grupo Cosmetico", "Facial");
        functions.iSetElementWithText("Marca", "Avon");
        functions.iClicInElement("Seleccionar Codigo Ira Impreso");
        functions.iSelectContains("Si");
        functions.scrollToElement("Boton Adicionar");
        functions.iClicInElement("Boton Adicionar");
        functions.iSetElementWithText("Tipo de Envase", "Caja");
        functions.iSetElementWithText("Presentacion Comercial", "Barra");
        functions.iSetElementWithText("Material de Envase Primario", "Carton");
        functions.iSetElementWithText("Material de Envase Secundario", "Bolsa");
        functions.iClicInElement("CheckBox Tipo de Presentacion");
        functions.iClicInElement("Boton Adicionar Material");
        functions.scrollToElement("Si Realizar Cargue Manual");
        functions.iClicInElement("Si Realizar Cargue Manual");
        functions.iClicInElement("Boton Agregar");
        functions.iSetElementWithText("Identificador Unico", "E50000F25");
        functions.iSetElementWithText("Nombre del Ingrediente", "Arroz");
        functions.iSetElementWithText("Concentracion", "80%");
        functions.iSetElementWithText("Funcion", "Belleza");
        functions.iSetElementWithText("Tipo de Ingrediente", "Natural");
        functions.iClicInElement("Boton Adicionar");
    }

    @When("Ingreso toda la informacion de la pantalla tecnica VoBo Exclusion IVA")
    public void ingresoTodaLaInformacionDeLaPantallaTecnicaVoBoExclusionIva() throws Exception {
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.iClicInElement("Radio Expediente");
        functions.iSetElementWithKeyValue("Ingresar Numero de Expediente","Expediente");
        functions.iClicInElement("Boton Consultar");
        functions.waitForElementNotPresent("Spinner");

        // validar que la tabla de materiales tenga almenos un valor
        functions.checkIfElementIsPresent("(//table/tbody)[1]/tr");
        functions.scrollToElement("CheckBox Seleccionar Todo");
        functions.iClicInElement("CheckBox Seleccionar Todo");
        functions.iClicInElement("Boton Agregar");
        // validar que la tabla de materiales agregados tenga almenos un valor
        functions.checkIfElementIsPresent("(//table/tbody)[2]/tr");
        functions.iSaveTextOfElementInScenario("Materias","//label[contains(.,'Total de materias')]");
        functions.iExtractRightOfKey("Materias",1);

    }
    @When("Ingreso toda la informacion de la pantalla tecnica NSO Aseo")
    public void ingresoTodaLaInformacionDeLaPantallaTecnicaNSOAseo() throws Exception {
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.scrollPage("end");
        functions.iWaitTime(5);
        functions.scrollToElement("Nombre del Producto");
        functions.iSetElementWithText("Nombre del Producto", "Stickers Repelente");
        functions.iSetElementWithText("Variedad", "Natural");
        functions.iSetElementWithText("Forma de Presentacion", "Liquida");
        functions.iSetElementWithText("Marca", "Esika");
        functions.iSetElementWithText("Vida Util","Permanente");

        functions.scrollToElement("Boton Adicionar");
        functions.iClicInElement("Boton Adicionar");
        functions.iSetElementWithText("Tipo de Envase", "Caja");
        functions.iSetElementWithText("Presentacion Comercial", "Barra");
        functions.iSetElementWithText("Material de Envase Primario", "Carton");
        functions.iSetElementWithText("Material de Envase Secundario", "Bolsa");
        functions.iClicInElement("CheckBox Tipo de Presentacion");
        functions.iClicInElement("Boton Adicionar Material");
        functions.scrollToElement("Si Realizar Cargue Manual");
        functions.iClicInElement("Si Realizar Cargue Manual");
        functions.iClicInElement("Boton Agregar");
        functions.iSetElementWithText("Identificador Unico", "E50000F25");
        functions.iSetElementWithText("Nombre Generico del Ingrediente", "Arroz");
        functions.iSetElementWithText("Nombre Quimico del Ingrediente", "Grano");
        functions.iSetElementWithText("Concentracion", "80%");
        functions.iSetElementWithText("Funcion", "Belleza");
        functions.iSetElementWithText("Tipo de Ingrediente", "Natural");
        functions.iClicInElement("Boton Adicionar");
    }


    @When("Ingreso toda la informacion de la pantalla tecnica Reconocimiento NSO Aseo")
    public void ingresoTodaLaInformacionDeLaPantallaTecnicaReconocimientoNSOAseo() throws Exception {
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.scrollPage("end");
        functions.iWaitTime(5);
        functions.scrollToElement("Seleccione Pais");
        functions.iClicInElement("Seleccione Pais");
        functions.iSelectContains("Colombia");
        functions.iSetElementWithText("Codigo de Identificacion de la NSO","123-AVB");
        functions.iSetElementWithText("Vigencia del Codigo de Identificacion de la NSO","10/09/2024");
        functions.scrollToElement("Nombre del Producto");
        functions.iSetElementWithText("Nombre del Producto", "Stickers Repelente");
        functions.iSetElementWithText("Variedad", "Natural");
        functions.iSetElementWithText("Forma de Presentacion", "Liquida");
        functions.iSetElementWithText("Marca", "Esika");
        functions.iSetElementWithText("Vida Util","Permanente");

        functions.scrollToElement("Boton Adicionar");
        functions.iClicInElement("Boton Adicionar");
        functions.iSetElementWithText("Tipo de Envase", "Caja");
        functions.iSetElementWithText("Presentacion Comercial", "Barra");
        functions.iSetElementWithText("Material de Envase Primario", "Carton");
        functions.iSetElementWithText("Material de Envase Secundario", "Bolsa");
        functions.iClicInElement("CheckBox Tipo de Presentacion");
        functions.iClicInElement("Boton Adicionar Material");
        functions.scrollToElement("Si Realizar Cargue Manual");
        functions.iClicInElement("Si Realizar Cargue Manual");
        functions.iClicInElement("Boton Agregar");
        functions.iSetElementWithText("Identificador Unico", "E50000F25");
        functions.iSetElementWithText("Nombre Generico del Ingrediente", "Arroz");
        functions.iSetElementWithText("Nombre Quimico del Ingrediente", "Grano");
        functions.iSetElementWithText("Concentracion", "80%");
        functions.iSetElementWithText("Funcion", "Belleza");
        functions.iSetElementWithText("Tipo de Ingrediente", "Natural");
        functions.iClicInElement("Boton Adicionar");
    }
    @When("Ingreso toda la informacion de la pantalla tecnica CVL Automatico uso domestico")
    public void ingresoTodaLaInformacionDeLaPantallaTecnicaCVLAutomaticoUsoDomestico() throws Exception {
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.scrollPage("end");
        functions.iClickCheckboxContains("Titular");
        functions.iClickCheckboxContains("Rol");
        functions.iClickCheckboxContains("Categoria");
        functions.iClickCheckboxContains("Presentaciones");
        functions.iClickCheckboxContains("Ingrediente");
        functions.iClickCheckboxContains("Vida");
        functions.iClickCheckboxContains("Cualitativa");
        functions.iClickCheckboxContains("cuali-cuantitativa");
        functions.iClickCheckboxContains("Marca");
        functions.scrollPage("end");
        functions.iClicInElement("Seleccione Pais");
        functions.iSelectContains("Colombia");
        functions.iClicInElement("Seleccione Departamento");
        functions.iSelectContains("Tolima");
        functions.iClicInElement("Seleccione Ciudad");
        functions.iSelectContains("Ibagué");
        functions.attachScreenShot();
    }

    @When("Ingreso toda la informacion de la pantalla tecnica CVL Automatico NSO Cosmeticos")
    public void ingresoTodaLaInformacionDeLaPantallaTecnicaCVLAutomaticoNSOCosmeticos() throws Exception {
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.scrollPage("end");
        functions.iClickCheckboxContains("Titular");
        functions.iClickCheckboxContains("Rol");
        functions.iClickCheckboxContains("cualitativa");
        functions.iClickCheckboxContains("cuali-cuantitativa");
        functions.iClickCheckboxContains("Presentaciones");
        functions.iClickCheckboxContains("Grupo");
        functions.iClickCheckboxContains("Vida");
        functions.iClickCheckboxContains("Marca");
        functions.scrollPage("end");
        functions.iClicInElement("Seleccione Pais");
        functions.iSelectContains("Colombia");
        functions.iClicInElement("Seleccione Departamento");
        functions.iSelectContains("Tolima");
        functions.iClicInElement("Seleccione Ciudad");
        functions.iSelectContains("Ibagué");
        functions.attachScreenShot();
    }
    @When("Ingreso toda la informacion de la pantalla tecnica Renovacion NSO Cosmeticos")
    public void ingresoTodaLaInformacionDeLaPantallaTecnicaRenovacionNSOCosmeticos() throws Exception {
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.checkIfElementIsPresent("Seleccione Pais Deshabilitado");
        functions.checkIfElementIsDisable("Nombre del Producto");
        functions.checkIfElementIsPresent("Forma Cosmetica Deshabilitado");
        functions.checkIfElementIsDisable("Denominacion Generica");
        functions.checkIfElementIsDisable("Grupo Cosmetico");
        functions.checkIfElementIsDisable("Marca");
        functions.checkIfElementIsPresent("Seleccionar Codigo Ira Impreso Deshabilitado");
    }

    @When("Ingreso toda la informacion de la pantalla tecnica Renovacion NSO Aseo")
    public void ingresoTodaLaInformacionDeLaPantallaTecnicaRenovacionNSOAseo() throws Exception {
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.checkIfElementIsPresent("Seleccione Pais Deshabilitado");
        functions.checkIfElementIsDisable("Nombre del Producto");
        functions.checkIfElementIsPresent("Variedad");
        functions.checkIfElementIsDisable("Forma de Presentacion");
        functions.checkIfElementIsDisable("Marca");
        functions.checkIfElementIsDisable("Vida Util");
    }

    @When("Ingreso toda la informacion de la pantalla tecnica CVL Automatico NSO Higiene")
    public void ingresoTodaLaInformacionDeLaPantallaTecnicaCVLAutomaticoNSOHigiene() throws Exception {
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.scrollPage("end");
        functions.iClickCheckboxContains("Titular");
        functions.iClickCheckboxContains("Rol");
        functions.iClickCheckboxContains("cualitativa");
        functions.iClickCheckboxContains("cuali-cuantitativa");
        functions.iClickCheckboxContains("Presentaciones");
        functions.iClickCheckboxContains("Vida");
        functions.iClickCheckboxContains("Variedades");
        functions.iClickCheckboxContains("Marca");
        functions.scrollPage("end");
        functions.iClicInElement("Seleccione Pais");
        functions.iSelectContains("Colombia");
        functions.iClicInElement("Seleccione Departamento");
        functions.iSelectContains("Tolima");
        functions.iClicInElement("Seleccione Ciudad");
        functions.iSelectContains("Ibagué");
        functions.attachScreenShot();

    }

    @And("Ingreso toda la informacion de la pantalla tecnica Autorizacion de Publicidad")
    public void ingresoTodaLaInformacionDeLaPantallaTecnicaAutorizacionDePublcidadConElExpediente() throws Exception {
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.iClicInElement("Radio Expediente");
        functions.iSetElementWithKeyValue("Ingresar Numero de Expediente","Expediente");
        functions.iClicInElement("Boton Buscar y Adicionar");
        functions.waitForElementNotPresent("Spinner");
        functions.scrollToElement("Nombre de la Publicidad");
        functions.iSetElementWithText("Nombre de la Publicidad","Publicidad productos plaguicidad domestico");
        functions.iClickCheckboxContains("Radio");
        functions.iClicInElement("Boton Adjuntar Archivo");
        functions.waitForElementNotPresent("Spinner");
        functions.SaveInScenarioFile("Principal", "pdf");
        functions.iSetElementWithKeyValue("Boton Buscar", "Principal");
        functions.waitForElementNotPresent("Spinner");
        functions.iSetElementWithText("Cantidad de Folios", "4");
        functions.iClicInElement("Boton Aceptar");
        functions.iClicInElement("Boton Si");
        functions.waitForElementNotPresent("Spinner");
        functions.iClicInElement("Boton Cerrar");
        functions.iClicInElement("Boton Si");
        functions.iSetElementWithText("Ingresar Tiempo al Aire","5 minutos");
        functions.scrollPage("end");

    }

    @And("Ingreso toda la informacion de la pantalla tecnica Certificacion sin RS")
    public void ingresoTodaLaInformacionDeLaPantallaTecnicaCertificacionSinRS() throws Exception {
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.iWaitTime(2);
        functions.iSetElementWithText("Nombre del Producto", "Cosmeticos");
        functions.iSetElementWithText("Usos", "Diario");
        functions.iSetElementWithText("Metodos de Aplicacion", "Spay");
        functions.iSetElementWithText("Mercado al que va Dirigido", "Adultos");
        functions.iWaitTime(2);
        functions.iSetElementWithText("Marca", "Channel");
        functions.scrollPage("end");
    }
    @When("Ingreso toda la informacion de la pantalla tecnica Autorizacion de muestras nacionales")
    public void ingresoTodaLaInformacionDeLaPantallaTecnicaAutorizacionDeMuestrasNacionales() throws Exception {
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.iSetElementWithText("Nombre del Producto","Toalla Absorbente");
        functions.iSetElementWithText("Forma de Presentacion","Paquete");
        functions.iClickRadiobuttonContains("Manual");
        functions.iSetElementWithText("Nombre Generico del Ingrediente","Algodon");
        functions.iSetElementWithText("Concentracion","80");
        functions.iClicInElement("Boton Adicionar");

        functions.iSetElementWithText("Contenido","125");
        functions.iClicInElement("Seleccione Unidad de Medida");
        functions.iSelectContains("Gramos");
        functions.iSetElementWithText("Numero de Unidades a Autorizar","5");
        functions.iSetElementWithText("Numero de Lote","1001");

        functions.iClickCheckboxContains("desarrollo de producto");
        functions.iClickCheckboxContains("Estudio de mercado");

        functions.iSetElementWithText("Objeto del Estudio","Comercializacion");
        functions.iSetElementWithText("Metodologia","Uso Corporal");
        functions.iSetElementWithText("Lugar Donde se va a Realizar el Estudio","Campo");
        functions.iSetElementWithText("Fecha Inicio del Estudio","02/06/2022");
        functions.iSetElementWithText("Fecha Fin del Estudio","05/06/2022");

    }

    @And("Ingreso toda la informacion de la pantalla tecnica Certificado De Exclusiva Exportación")
    public void ingresoTodaLaInformacionDeLaPantallaTecnicaCertificadoDeExclusivaExportación() throws Exception {
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.iWaitTime(2);
        functions.iSetElementWithText("Nombre del Producto", "Labial");
        functions.iSetElementWithText("Usos", "Diario");
        functions.iSetElementWithText("Metodos de Aplicacion", "Spray");
        functions.scrollToElement("Metodos de Aplicacion");
        functions.iWaitTime(2);
        functions.iSetElementWithText("Marca", "Hilmin");
        functions.iSetElementWithText("Nombre del Fabricante", "Daniel");
        functions.iSetElementWithText("Direccion del Fabricante", "Hilmin");
        functions.scrollPage("end");
        functions.iClicInElement("Seleccione Pais");
        functions.iSelectContains("Alema");
        functions.iClicInElement("Boton Agregar");
        functions.scrollPage("end");
    }

    @When("Ingreso toda la informacion de la pantalla tecnica capacidad de produccion nueva")
    public void ingresoTodaLaInformacionDeLaPantallaTecnicaCapacidadDeProduccionNueva() throws Exception {
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.iWaitTime(2);
        functions.iClicInElement("Seleccione Lugar Actividad");
        functions.iSelectContains("Sede propia");
        functions.iClicInElement("Seleccione Rol");
        functions.iSelectContains("Acondicionador");
        functions.iClicInElement("Radio Primer Resultado");
        // ESTE DE ABAJO NO DEBERÁ IR.
    // functions.iSetElementWithText("Alcance de la Certificacion","Estado del lugar de fabricacion del producto");
    }

    @And("Ingreso toda la informacion de la pantalla Informacion de la modificacion RS")
    public void ingresoTodaLaInformacionDeLaPantallaInformacionDeLaModificacion() throws Exception {
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.iClicInElement("//label[contains(.,'Cambio Titular')]//span");
        functions.iClicInElement("Seleccionar Producto Sobre el que se Hace el Cambio");
        functions.iClicInElement("//p-dropdownitem");
        functions.iClicInElement("//label[contains(.,'Cambio de Fabricante')]//span");
        functions.iClicInElement("Boton Agregar Modificacion");
        functions.iClicInElement("//label[contains(.,'Categoria')]//span");
        functions.iClicInElement("//label[contains(.,'envase primario')]//span");
        functions.iClicInElement("//label[contains(.,'Otras modificaciones')]//span");
        functions.iSetElementWithText("Descripcion de la Modificacion","Modificacion del RS");
        functions.iClicInElement("Boton Aceptar");
        functions.iSendKeyEscapeToPerform();
        functions.scrollToElement("Boton Agregar");
        functions.iClicInElement("Boton Agregar");
        functions.scrollToElement("Boton Agregar");
        functions.iClicInElement("Boton Continuar");
    }

    @And("Ingreso toda la informacion de la pantalla Informacion de la modificacion NSO Cosmeticos")
    public void ingresoTodaLaInformacionDeLaPantallaInformacionDeLaModificacionNSOCosmeticos() throws Exception {
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.iClicInElement("//label[contains(.,'Cambio Titular')]//span");
        functions.iClicInElement("Seleccionar Producto Sobre el que se Hace el Cambio");
        functions.iClicInElement("//p-dropdownitem");
        functions.iClicInElement("//label[contains(.,'Cambio de Fabricante')]//span");
        functions.iClicInElement("//label[contains(.,'Forma cosm')]//span");
        functions.iClicInElement("//label[contains(.,'Grupo cosm')]//span");
        functions.iClicInElement("//label[contains(.,'envase primario')]//span");
        functions.attachScreenShot();
        functions.scrollToElement("Boton Agregar Modificacion");
        functions.iClicInElement("Boton Agregar Modificacion");
        functions.iClicInElement("Boton Agregar");
        functions.scrollPage("end");
        functions.iClicInElement("Boton Continuar");
    }

    @When("Ingreso la informacion modificada de la pantalla tecnica Modificacion del RS PUSP")
    public void ingresoLaInformacionModificadaDeLaPantallaTecnicaModificacionDelRSPUSP() throws Exception {
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.scrollToElement("Categoria Toxicologica");
        functions.iClicInElement("Categoria Toxicologica");
        functions.iSelectContains("Altamente");
        functions.iClicInElement("Boton Editar Material de Envase y Presentacion Comercial");
        functions.iSendClearToElement("Material de Envase Primario");
        functions.iSetElementWithText("Material de Envase Primario","Plastico");
        functions.iClicInElement("Boton Actualizar");
    }

    @When("Ingreso la informacion modificada de la pantalla tecnica Modificacion del RS PUD")
    public void ingresoLaInformacionModificadaDeLaPantallaTecnicaModificacionDelRSPUD() throws Exception {
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.scrollToElement("Categoria Toxicologica");
        functions.iClicInElement("Categoria Toxicologica");
        functions.iSelectContains("Altamente");
        functions.iClicInElement("Boton Editar Material de Envase y Presentacion Comercial");
        functions.iSendClearToElement("Material de Envase Primario");
        functions.iSetElementWithText("Material de Envase Primario","Plastico");
        functions.iClicInElement("Boton Actualizar");
    }

    @And("Valido que se muestren las roles en pantalla tecnica y selecciono {string}")
    public void seleccionoUnTipoDeRolYLoAgregoEnPantallaTecnica(String rol, List<String> roles) throws Exception {

        int cant = roles.size();
        boolean cantidad;

        functions.waitForElementPresent("Panel Informacion del Producto");
        functions.checkIfElementIsPresent("Panel Informacion de Roles");
        functions.iClicInElement("Seleccionar Tipo de Rol");
        int countList = functions.countElement("//li/span");
        for (String currentData : roles) {
            questions.opcionLista(currentData);
        }

        functions.iSelectContains(rol);
        functions.iClicInElement("Boton Adicionar Rol");

        if (cant == countList) {
            cantidad = true;
        } else {
            cantidad = false;
        }
        Assert.assertTrue("No coincide la cantidad de modalidades esperados, se esperaban "+cant+" se muestran "+countList,cantidad);
    }

    @When("Ingreso toda la informacion de la pantalla tecnica Acogerse a Codigo NSO Cosmeticos")
    public void ingresoTodaLaInformacionDeLaPantallaTecnicaAcogerseACodigoNSOCosmeticos() throws Exception {

        functions.iClicInElement("Seleccionar Origen de la Empresa");
        functions.iSelectContains("Nacional");
        functions.iWaitTime(2);
        functions.iClicInElement("Seleccionar Tipo de Documento");
        String tipoDoc = functions.ScenaryData.get("TipoDocEmpresa");
        functions.iSelectContains(tipoDoc);
        functions.iSetElementWithKeyValue("Numero de Documento", "NumeroDocEmpresa");
        functions.iClicInElement("Boton Consultar Popup");

        functions.iClicInElement("Radio Primer Resultado");
        functions.iClicInElement("Boton Agregar");
        functions.waitForElementNotPresent("Spinner");

    }

    @When("Ingreso la informacion modificada de la pantalla tecnica Modificacion de la informacion de la NSO Cosmeticos")
    public void ingresoLaInformacionModificadaDeLaPantallaTecnicaModificacionDeLaInformacionDeLaNSOCosmeticos() throws Exception {
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.iClicInElement("Forma Cosmetica");
        functions.iSelectContains("Barra");
        functions.iSendClearToElement("Grupo Cosmetico");
        functions.iSetElementWithText("Grupo Cosmetico","Grupo cosmetico 3");
        functions.attachScreenShot();
        functions.scrollToElement("Marca");
        functions.iClicInElement("Boton Editar Material de Envase y Presentacion Comercial");
        functions.iSendClearToElement("Material de Envase Primario");
        functions.iSetElementWithText("Material de Envase Primario","Plastico");
        functions.iSendClearToElement("Material de Envase Secundario");
        functions.iSetElementWithText("Material de Envase Secundario","Plastico");
        functions.attachScreenShot();
        functions.iClicInElement("Boton Actualizar");

    }

    @And("Ingreso toda la informacion de la pantalla tecnica Certificacion con RS Plaguicidas")
    public void ingresoTodaLaInformacionDeLaPantallaTecnicaCertificacionConRSPlaguicidas() throws Exception {
        functions.iWaitTime(2);
        functions.iClickCheckboxContains("Titular");
        functions.iClickCheckboxContains("Rol");
        functions.iClickCheckboxContains("Categoria toxico");
        functions.iClickCheckboxContains("Presentaciones");
        functions.iClickCheckboxContains("activo");
        functions.iClickCheckboxContains("Vida");
        functions.iClickCheckboxContains("Cualitativa");
        functions.iClickCheckboxContains("cuali-cuantitativa");
        functions.iClickCheckboxContains("Marca");
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.iClicInElement("Seleccione Pais");
        functions.iSelectContains("Alemania");
        functions.iClicInElement("Seleccione Departamento");
        functions.iSelectContains("Berliini");
        functions.iClicInElement("Seleccione Ciudad");
        functions.iSelectContains("Berlin");
        functions.iClickCheckboxContains("El producto se");
        functions.iSetElementWithText("Nombre del Producto","Amulet");
        functions.iSetElementWithText("Observaciones","No hay observaciones");

    }

    @When("Ingreso toda la informacion de la pantalla tecnica Certificacion con NSO Cosmeticos")
    public void ingresoTodaLaInformacionDeLaPantallaTecnicaCertificacionConNSOCosmeticos() throws Exception {
        functions.iWaitTime(2);
        functions.iClickCheckboxContains("Titular");
        functions.iClickCheckboxContains("Rol");
        functions.iClickCheckboxContains("cualitativa");
        functions.iClickCheckboxContains("cuali-cuantitativa");
        functions.iClickCheckboxContains("Presentaciones");
        functions.iClickCheckboxContains("Grupo");
        //functions.iClickCheckboxContains("Vida");
        functions.iClickCheckboxContains("Marca");
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.iClicInElement("Seleccione Pais");
        functions.iSelectContains("Alemania");
        functions.iClicInElement("Seleccione Departamento");
        functions.iSelectContains("Berliini");
        functions.iClicInElement("Seleccione Ciudad");
        functions.iSelectContains("Berlin");
        functions.iClickCheckboxContains("El producto se");
        functions.iSetElementWithText("Nombre del Producto","Amulet");
        functions.iSetElementWithText("Observaciones","No hay observaciones");
    }

    @And("Ingreso toda la informacion de la pantalla Informacion de la modificacion NSO Aseo")
    public void ingresoTodaLaInformacionDeLaPantallaInformacionDeLaModificacionNSOAseo() throws Exception {
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.iClicInElement("//label[contains(.,'Cambio Titular')]//span");
        functions.iClicInElement("Seleccionar Producto Sobre el que se Hace el Cambio");
        functions.iClicInElement("//p-dropdownitem");
        functions.iClicInElement("//label[contains(.,'Cambio de Fabricante')]//span");
        functions.iClicInElement("Boton Agregar Modificacion");
        functions.iClicInElement("//label[contains(.,'Forma de presentaci')]//span");
        functions.iClicInElement("//label[contains(.,'Marca')]//span");
        functions.iClicInElement("//label[contains(.,'vida')]//span");
        functions.iClicInElement("//label[contains(.,'tipo de envase')]//span");
        functions.attachScreenShot();
        functions.iClicInElement("Boton Agregar");
        functions.scrollToElement("Boton Agregar");
        functions.iClicInElement("Boton Continuar");
    }

    @When("Ingreso la informacion modificada de la pantalla tecnica Modificacion de la informacion de la NSO Aseo")
    public void ingresoLaInformacionModificadaDeLaPantallaTecnicaModificacionDeLaInformacionDeLaNSOAseo() throws Exception {
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.iSendClearToElement("Forma de Presentacion");
        functions.iSetElementWithText("Forma de Presentacion","Spray");
        functions.attachScreenShot();
        functions.scrollToElement("Marca");
        functions.iSendClearToElement("Marca");
        functions.iSetElementWithText("Marca","AVON");
        functions.iSendClearToElement("Vida Util");
        functions.iSetElementWithText("Vida Util","2 meses");
        functions.iClicInElement("Boton Editar Material de Envase y Presentacion Comercial");
        functions.iSendClearToElement("Tipo de Envase");
        functions.iSetElementWithText("Tipo de Envase","Botella");
        functions.iClickCheckboxContains("Comercial");
        functions.attachScreenShot();
        functions.iClicInElement("Boton Actualizar");
    }

    @When("Ingreso toda la informacion de la pantalla tecnica Autorizacion con RS Plaguicidas")
    public void ingresoTodaLaInformacionDeLaPantallaTecnicaAutorizacionConRSPlaguicidas() throws Exception {
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.iClicInElement("Tipo de Autorizacion");
        functions.attachScreenShot();
        functions.iSelectContains("agotamiento");
        functions.iSetElementWithText("Numero de Lote","123");
        functions.iSetElementWithText("Cantidad","3");
        functions.iClicInElement("Fecha Vencimiento");
        functions.iClicInElement("//td//a[contains(@class,'ui-state-highlight')]");
        functions.iClicInElement("Boton Agregar");
        functions.scrollToElement("Boton Agregar");
        functions.checkIfElementIsPresent("Primer Registro Tabla");
        functions.iSetElementWithText("Descripcion de la Ubicacion de la Etiqueta Complementaria Stiker","Ubicada en el centro");
        functions.iSetElementWithText("Justificacion","Autorizado");
    }

    @When("Ingreso toda la informacion de la pantalla tecnica agotamiento NSO")
    public void ingresoTodaLaInformacionDeLaPantallaTecnicaAgotamientoNSOCosmeticos() throws Exception {
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.checkIfElementIsPresent("Tipo de Autorizacion");
        functions.iSetElementWithText("Numero de Lote","H543");
        functions.iSetElementWithText("Cantidad","1J129");
        functions.iClicInElement("Boton Agregar");
        functions.checkIfElementIsPresent("Primer Registro Tabla");
        functions.iSetElementWithText("Descripcion de la Ubicacion de la Etiqueta Complementaria Stiker","Ubicacion de la etiqueta parte superior");
        functions.iSetElementWithText("Justificacion","se justifica el agotamiento del producto");



    }

    @Cuando("Ingreso toda la informacion de la pantalla tecnica Renovación del Registro Sanitario")
    public void ingresoTodaLaInformacionDeLaPantallaTecnicaRenovaciónDelRegistroSanitario() throws Exception {
        functions.iLoadTheDOMInformation("PantallasTecnicas.json");
        functions.checkIfElementIsPresent("Nombre del Producto Deshabilitado");
        functions.checkIfElementIsPresent("Marca Deshabilitado");
        functions.checkIfElementIsPresent("Tipo de Plaguicida Deshabilitado");
        functions.scrollToElement("Origen de la Fabricacion del Producto");
        functions.iClicInElement("Origen de la Fabricacion del Producto");
        functions.iSelectContains("Fabricante nacional");
        functions.checkIfElementIsPresent("Tipo de Plaguicida");
        functions.iSetElementWithText("Plagas Objetivo", "Repelente");
        functions.scrollToElement("Forma de Presentacion");
        functions.iClicInElement("Forma de Presentacion");
        functions.iSelectContains("Barra");
        functions.iSetElementWithText("Modo Adecuado de Empleo", "Extraer un stickert de la barra y colocar sobre la ropa.");
        functions.iClicInElement("Categoria Toxicologica");
        functions.iSelectContains("Ligeramente");
        functions.iSetElementWithText("Concepto Toxicologico", "Aceptado");
        functions.iSetElementWithText("Vida Util", "Permanente");
        functions.iSetElementWithText("Antidotos", "No requiere");
        functions.iClicInElement("Boton Adicionar");
        functions.iSetElementWithText("Tipo de Envase", "Caja");
        functions.iSetElementWithText("Presentacion Comercial", "Barra");
        functions.iSetElementWithText("Material de Envase Primario", "Carton");
        functions.iSetElementWithText("Material de Envase Secundario", "Bolsa");
        functions.iClicInElement("Boton Adicionar Material");
    }
}
