package StepDefinitions;

import Functions.SeleniumFunctions;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.And;
import io.cucumber.java.es.Cuando;
import io.cucumber.java.es.Dado;
import io.cucumber.java.es.Entonces;

import java.io.IOException;

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

    @Dado("inicio sesion en el aplicativo")
    public void inicioSesionEnElAplicativo() throws IOException {
        functions.switchToNewTab("https://www.saucedemo.com/", "Navegaoor" );
        functions.attachScreenShot();
    }

    @Cuando("ingreso las credenciales correcta usuario {string}")
    public void ingresoLasCredencialesCorrectaUsuario(String usuaio) throws Exception {
        functions.iSetElementWithText("id", "standard_user" );
     //   functions.iLoadTheDOMInformation("Principal.json");
        functions.attachScreenShot();
        functions.attachText("pruebna");
    }
}
