package Tasks;

import Functions.SeleniumFunctions;

public class LoginNPT {
    SeleniumFunctions functions = new SeleniumFunctions();


    public void login(String ambiente, String actor) throws Exception {


        try {
            // si la sesion esta iniciada cerrarla primero.
            int i = functions.countElement("//a[@class='card-menu-profile']");
            if(i!=0){ logout(); }
            System.out.println("Se cierra sesión");
        } catch (Exception e) {

        }




        functions.readMain(ambiente);


        if (ambiente.equals("NPTUrl")){
            functions.iLoadTheDOMInformation("Tramites.json");

            functions.iClicInElement("Usuario");
            functions.iSetElementWithKeyValue("Usuario", actor);
            if (actor.equals("Representante")||actor.equals("GestorTramites")||actor.equals("RevisorFiscal")||actor.equals("Apoderado")||actor.equals("DirectorTecnico")||actor.equals("Contador")){
                functions.iSetElementWithKeyValue("Password", "CiudadanoPassword");
            }else{
                functions.iSetElementWithKeyValue("Password", "FuncionarioPassword");
            }
        }else if(ambiente.equals("SivicosUrl")){
            functions.iLoadTheDOMInformation("Sivicos.json");
            functions.iSetElementWithKeyValue("Usuario", actor);
            if(actor.equals("Programacion")|actor.equals("Ejecucion")|actor.equals("Planeacion")|actor.equals("Validar")){
                functions.iSetElementWithKeyValue("Password", "SivicosGenericPassword");
            }else{
                functions.iSetElementWithKeyValue("Password", "SivicosGenericPass");
            }
        }

        functions.waitForElementNotPresent("Spinner");
        functions.attachScreenShot();
        functions.iClicInElement("Boton Entrar Nuevo");
        functions.iWaitTime(2);
        functions.waitForElementNotPresent("Spinner");
        functions.attachScreenShot();

    }

    public void logout() throws Exception {
        functions.iLoadTheDOMInformation("Tramites.json");
        functions.scrollPage("top");
        functions.iClicInElement("//a[@class='card-menu-profile']");
        functions.iClicInElement("//li//span[contains(.,'Logout')]");
        functions.iWaitTime(2);
    }


}
