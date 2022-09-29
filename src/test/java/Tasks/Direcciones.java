package Tasks;

import Functions.SeleniumFunctions;

public class Direcciones {

    SeleniumFunctions functions = new SeleniumFunctions();

    public void agregarDireccionUrbana()throws Exception {
        functions.iClicInElement("Direccion");
        functions.iWaitTime(5);
        functions.scrollToElement("Tipo de Direccion");
        functions.iClicInElement("Tipo de Direccion");
        functions.iSelectContains("Urbana");
        functions.iClicInElement("Seleccionar Direccion");
        functions.iSelectContains("Avenida");
        functions.iSetElementWithText("Numero Direccion", "26");
        functions.iSetElementWithText("Complemento Direccion", "156");
        functions.iSetElementWithText("Casa Direccion", "111");
        functions.iSetElementWithText("Barrio Direccion", "Kennedy ");
        functions.iClicInElement("Boton Guardar");
    }

    public void seleccionarPaisDepartamentoCiudad()throws Exception {
        functions.page_has_loaded();  // Se agrega esto para validar si esperando carga la lista de paises porque aveces no carga.
        functions.iWaitTime(2);
        functions.iClicInElement("Pais de Nacionalidad");
        functions.iSelectContains("Colombia");
        functions.iClicInElement("Departamento");
        functions.iSelectContains("Antioquia");
        functions.iWaitTime(1);
        functions.iClicInElement("Ciudad");
        functions.iSelectContains("Abejorral");
    }

}
