package Tasks;

import Functions.SeleniumFunctions;
import org.junit.Assert;

public class Yopmail {
    SeleniumFunctions functions = new SeleniumFunctions();


    public void obtenerCorreoYopmail(String key) throws Exception {
        functions.switchToNewTab("https://yopmail.com/es/email-generator","Yopmail");
        functions.iLoadTheDOMInformation("Yopmail.json");
        functions.scrollToElement("Boton Nuevo");
        functions.iClicInElement("Boton Nuevo");
        functions.iWaitTime(3);
        functions.iSaveTextOfElementInScenario(key, "Correo Generado");
        functions.closeCurrenteTab();
        functions.switchToTab("Principal");
    }

    public void obtenerLinkRegistroPersona(String rol) throws Exception {
        functions.navigateTo("https://yopmail.com/es/");
        functions.iLoadTheDOMInformation("Yopmail.json");
        functions.iSendClearToElement("Ingresar a un Correo");
        functions.iSetElementWithKeyValue("Ingresar a un Correo", rol);
        //   functions.iSetElementWithText("Ingresar a un Correo", "siffazazoitto-1395@yopmail.com");
        functions.iSendKeyEnterToElement("Ingresar a un Correo");
        functions.iWaitTime(2);
//
        for (int i = 0; i < 4; i++) {
            try {
                functions.switchToFrame("Iframe Inbox");
                functions.iClicInElement("Correo Link Registro");
                i = 4;
            } catch (Exception e) {
                functions.switchToParentFrame();
                functions.iClicInElement("Boton Refrescar");
            }
        }

        functions.switchToParentFrame();
        functions.switchToFrame("Iframe Contenido");
        functions.iSaveTextOfElementInScenario("Contenido Correo", "Contenido Correo");
        functions.attachScreenShot();
        String link = extraerLink("Contenido Correo");
        functions.navigateTo(link);
    }

    public void obtenerCodigoFirma(String correoRepresentante) throws Exception {
        functions.switchToNewTab("https://yopmail.com/es/","Yopmail");
        functions.iLoadTheDOMInformation("Yopmail.json");
        functions.iSendClearToElement("Ingresar a un Correo");
       // functions.iSetElementWithKeyValue("Ingresar a un Correo", correoRepresentante);
        functions.iSetElementWithText("Ingresar a un Correo", "representantelegal24@yopmail.com");
        functions.iWaitTime(5);
        functions.iSendKeyEnterToElement("Ingresar a un Correo");

        for (int i = 0; i < 4; i++) {
            try {
                functions.switchToFrame("Iframe Inbox");
                functions.iClicInElement("Correo Codigo Verificacion");
                i = 4;
            } catch (Exception e) {
                functions.switchToParentFrame();
                functions.iWaitTime(3);
                functions.iClicInElement("Boton Refrescar");
            }
        }

        functions.switchToParentFrame();
        functions.switchToFrame("Iframe Contenido");
        functions.iSaveTextOfElementInScenario("Contenido Correo", "Contenido Correo");
        functions.attachScreenShot();
        extraerCodigo("Contenido Correo");
        functions.closeCurrenteTab();
        functions.switchToTab("Principal");
    }

    public void obtenerCodigoFirmaOutlook() throws Exception {
        functions.switchToNewTab("https://outlook.live.com/owa/?nlp=1","Yopmail");
        functions.iLoadTheDOMInformation("Outlook.json");
        try {
        functions.iClicInElement("Correo");
        functions.iSetElementWithText("Correo","representantelegal24@hotmail.com");
        functions.iSendKeyEnterToElement("Correo");
        functions.iWaitTime(3);
        functions.iSetElementWithKeyValue("Password", "FuncionarioPassword");
        functions.iWaitTime(3);
        functions.waitForElementPresent("Iniciar Sesion");
        functions.iClicInElement("Iniciar Sesion");
        functions.iSendKeyEnterToElement("Submit");
        } catch (Exception e)
        {
            System.out.println("No se pudo o no fue necesario iniciar sesion en outlook");
        }
        functions.iWaitTime(5);
        functions.waitForElementPresent("//div[contains(.,'digo de verifica')]");
        String solicitud = functions.ScenaryData.get("Numero de Solicitud");
        int contador = functions.countElement("//div[@role='option'][contains(.,'digo de verifica')][contains(.,'Invima "+solicitud+"')]");
        if (contador == 0) {
            System.out.println("No se encontró el correo de respuesta, se interará buscar por segunda vez.");
            functions.iWaitTime(3);
            functions.navigateTo("https://outlook.live.com/owa/?nlp=1");
            functions.page_has_loaded();
        }
  functions.iClicInElement("//div[@role='option'][contains(.,'digo de verifica')][contains(.,'Invima "+solicitud+"')]");
       try {
           functions.waitForElementPresent("Contenido Correo");
       } catch (Exception e)
       {
           functions.iClicInElement("(//div[contains(.,'Estimado')])[last()]");
           functions.iWaitTime(1);
       }
        functions.iSaveTextOfElementInScenario("Contenido Correo", "Contenido Correo");
        functions.attachScreenShot();
        extraerCodigo("Contenido Correo");
        functions.iClicInElement("Boton Eliminar");
        functions.iWaitTime(5);
        functions.closeCurrenteTab();
        functions.switchToTab("Principal");
    }

    public void inicioSesionOutlook() throws Exception {
        functions.iLoadTheDOMInformation("Outlook.json");
        functions.page_has_loaded();

        try{
        functions.waitForElementPresent("Correo");
        functions.iWaitTime(3);
        functions.iClicInElement("Correo");
        functions.iSetElementWithText("Correo","soainte1@invima.gov.co");
        functions.iSendKeyEnterToElement("Correo");
        functions.iWaitTime(3);
        functions.iSetElementWithText("Password", "Bogota2021*");
        functions.iWaitTime(3);
        functions.waitForElementPresent("Iniciar Sesion");
        functions.iClicInElement("Iniciar Sesion");
        functions.iSendKeyEnterToElement("Submit");
        functions.iWaitTime(5);
        }
        catch (Exception e){
            System.out.println("No se requirió inicio sesión en Hotmail");
            functions.attachScreenShot();
        }

    }


    public void confirmarRegistroUsuario(String correoYopmail) throws Exception {
        functions.switchToNewTab("https://yopmail.com/es/","Yopmail");
        functions.iLoadTheDOMInformation("Yopmail.json");
        functions.iSendClearToElement("Ingresar a un Correo");
        functions.iSetElementWithKeyValue("Ingresar a un Correo", correoYopmail);
        // functions.iSetElementWithText("Ingresar a un Correo", "froxanneikauce-9446@yopmail.com");
        functions.iSendKeyEnterToElement("Ingresar a un Correo");

        for (int i = 0; i < 4; i++) {
            try {
                functions.switchToFrame("Iframe Inbox");
                functions.iClicInElement("Correo Confirmacion Registro");
                i = 4;
            } catch (Exception e) {
                functions.switchToParentFrame();
                functions.iClicInElement("Boton Refrescar");
            }
        }

        functions.checkIfElementIsPresent("Correo Confirmacion Registro");
        functions.closeCurrenteTab();
        functions.switchToTab("Principal");
    }

    public void confirmarRegistroEmpresa(String rol) throws Exception {
        functions.switchToNewTab("https://yopmail.com/es/","Yopmail");
        functions.iLoadTheDOMInformation("Yopmail.json");
        functions.iSendClearToElement("Ingresar a un Correo");
        functions.iSetElementWithKeyValue("Ingresar a un Correo", rol);
        functions.iSendKeyEnterToElement("Ingresar a un Correo");
        for (int i = 0; i < 4; i++) {
            try {
                functions.switchToFrame("Iframe Inbox");
                functions.iClicInElement("Correo Registro Empresa");
                i = 4;
            } catch (Exception e) {
                functions.switchToParentFrame();
                functions.iClicInElement("Boton Refrescar");
            }
        }

        functions.checkIfElementIsPresent("Correo Registro Empresa");
        functions.switchToParentFrame();
        vaciarBuzon();
        functions.closeCurrenteTab();
        functions.switchToTab("Principal");
    }

    public void vaciarBuzon() throws Exception {
        functions.iClicInElement("Boton Opciones");
        functions.iClicInElement("Opcion Vaciar Buzon");
        functions.iWaitTime(1);
        functions.AcceptAlert();
    }


    public String extraerLink(String key) {
        boolean exist = functions.ScenaryData.containsKey(key);
        if (exist) {

            String text1 = functions.ScenaryData.get(key);

            int inicio = text1.indexOf("registro:\n\n") + 11;
            int fin = text1.indexOf("\n\nPor favor");
            String text = text1.substring(inicio, fin);

            System.out.println("Key " + key + " modified, new value is: " + text);
            functions.ScenaryData.replace(key, text);

        } else {
            Assert.assertTrue(String.format("The given key %s do not exist in Context", key), functions.ScenaryData.containsKey(key));
        }
        return functions.ScenaryData.get(key);
    }



    public String extraerCodigo(String key) {
        boolean exist = functions.ScenaryData.containsKey(key);
        if (exist) {

            String text1 = functions.ScenaryData.get(key);

            int fin = text1.indexOf("\n\nPor favor");

            String text = text1.substring(0, fin);
            int inicio = text.length()-6;
            text = text1.substring(inicio,inicio+6);

            System.out.println("Key " + key + " modified, new value is: " + text);
            functions.ScenaryData.replace(key, text);

        } else {
            Assert.assertTrue(String.format("The given key %s do not exist in Context", key), functions.ScenaryData.containsKey(key));
        }
        return functions.ScenaryData.get(key);
    }

}
