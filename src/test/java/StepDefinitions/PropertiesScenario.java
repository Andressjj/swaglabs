package StepDefinitions;

import Functions.SeleniumFunctions;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.And;
import io.cucumber.java.es.Entonces;


public class PropertiesScenario {

    SeleniumFunctions functions = new SeleniumFunctions();

    @Given("los datos del ambiente y usuarios del sistema")
    public void losDatosAmbienteYusuariosDelSistema() throws Exception {
        functions.RetriveTestDatas();
    }

    @And("Tengo la variable {string} con el valor {string}")
     public void asignoUnaVariable(String key, String text) throws Exception {
       functions.iSaveTextInScenario(key,text);
     }

    @And("Limpiar la variable {string}")
    public void limpioUnaVariable(String key) throws Exception {
        functions.removeKey(key);
    }

    @Entonces("el sistema genera una alerta que contiene el texto {string}")
    public void elSistemaGeneraUnaAlertaQueContieneElTexto(String texto) throws Exception {
        functions.scrollPage("top");
        functions.checkPartialTextElementPresent("Alerta", texto);
    }
}
