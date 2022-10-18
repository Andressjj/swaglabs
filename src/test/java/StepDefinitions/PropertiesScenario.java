package StepDefinitions;

import Functions.SeleniumFunctions;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.And;
import io.cucumber.java.es.Cuando;
import io.cucumber.java.es.Dado;
import io.cucumber.java.es.Entonces;
import io.cucumber.java.es.Y;

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
    public void InicioSesionInformacionCorrecta(String usuario) throws Exception {
        functions.iLoadTheDOMInformation("Principal.json");
        //functions.iClicInElement("");
        functions.iSetElementWithText("user", "standard_user");
        functions.attachScreenShot();
    }

    @Cuando("ingreso correctamente la contraseña {string}")
    public void ingresoCorrectamenteLaContraseña(String arg0) throws Exception {
        functions.iLoadTheDOMInformation("Principal.json");
        functions.iSetElementWithText("pass", "secret_sauce");
        functions.attachScreenShot();
    }

    @Entonces("puedo ingresar el dashboard del aplicativo")
    public void puedoIngresarElDashboardDelAplicativo() throws Exception {
        functions.iLoadTheDOMInformation("Principal.json");
        functions.iClicInElement("login");

    }

    @Dado("Que tengo productos para filtrar")
    public void queTengoProductosParaFiltrar() {
    }

    @Y("Agrego nuevo producto al carito")
    public void agregoNuevoProductoAlCarito() {
    }

    @Entonces("Puedo ver el producto en el carrito de compras")
    public void puedoVerElProductoEnElCarritoDeCompras() {
    }

    @Cuando("Agrego productos en el carrito de compras")
    public void agregoProductosEnElCarritoDeCompras() {


    }

    @Dado("Que tengo productos para agregar")
    public void queTengoProductosParaAgregar() {
    }

    @Cuando("Agrego un producto en el carrito de compras")
    public void agregoUnProductoEnElCarritoDeCompras() throws Exception {
        functions.iLoadTheDOMInformation("Principal.json");
        functions.iClicInElement("Product");
        functions.attachScreenShot();
    }

    @Y("Selecciono el carrito de compras")
    public void seleccionoElCarritoDeCompras() throws Exception {
        functions.iLoadTheDOMInformation("Principal.json");
        functions.iClicInElement("Carrito");
        functions.attachScreenShot();


    }

    @Entonces("Puedo ver el productos seleccionados en el carrito")
    public void puedoVerElProductosSeleccionadosEnElCarrito() throws Exception {
        functions.checkPartialTextElementPresent("//div[@class=\"cart_quantity\"]", "1");
    }
}
