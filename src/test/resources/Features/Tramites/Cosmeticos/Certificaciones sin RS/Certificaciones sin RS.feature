# language: es
@CertificacionesSinRS
@AllScenarios
@RS
Característica: Certificaciones sin RS
  Automatizacion  para validar el correcto funcionamento del tramite.

  Antecedentes:
    Dados los datos del ambiente y usuarios del sistema

  @CertificacionSinRs
  @tmsLink=InvNP-229
  Escenario: Certificaciones sin registro sanitario
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    Y Necesito registrar un tramite nuevo de "Cosméticos, Aseo, Plaguicidas y Productos de Higiene Doméstica"
    Cuando Selecciono solo la categoria "Certificaciones Sin RS"
    Y Selecciono el tipo de tramite "sin Registro Sanitario"
    Entonces Se muestra la pantalla para asociar una empresa al tramite
    Y Se muestran las tarifas correspondientes al tramite
      |4002-3|

    Dado Asocio una empresa nacional
    Cuando Selecciono una sucursal
    Y Asocio un interesado nacional
    Cuando Selecciono una sucursal
    Entonces Se muestra la informacion de la empresa y el representante legal

    Dado Necesito agregar un medio de notificacion
    Cuando Selecciono el tipo de notificacion por correo
    Entonces Puedo continuar a la pantalla tecnica
    Y Ingreso toda la informacion de la pantalla tecnica Certificacion sin RS
    Entonces Puedo ingresar la documentacion requerida

    Dado Necesito ingresar toda la documentacion requerida
    Cuando Valido que se muestren los documentos obligatorios y los agrego
    |Etiqueta|
    |Ficha|
    Entonces Puedo visualizar la informacion general de la tarifa

    Dado Necesito visualizar la informacion del tramite
    Cuando Guardo la informacion
    Entonces Puedo ver la informacion del tramite en un PopUp

    Dado Inicio sesion en "NPTUrl" como "Representante"
    Cuando Tengo la solicitud asignada con estado "Pendiente de firma"
    Entonces Puedo ver la informacion del tramite en un PopUp
    Cuando Solicito firmar el documento
    Entonces El funcionario recibe al correo electronico un codigo de confirmacion

    Dado Tengo un codigo de confirmacion para firmar el documento
    Cuando Ingreso el codigo de confirmacion y firmo el documento

    Entonces El sistema me permite radicar la solicitud y me genera un numero de tramite.

    #Ingresa a OAC
    Dado Necesito aprobar la radicacion de un tramite como funcionario legal
    Cuando Inicio sesion en "NPTUrl" como "RevisorLegal"
    Entonces Puedo aprobar la solicitud

    Dado Necesito aprobar la radicacion de un tramite como funcionario tecnico
    Cuando Inicio sesion en "NPTUrl" como "RevisorTecnico"
    Entonces Puedo aprobar la solicitud

    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    Cuando Tengo la solicitud asignada con estado "Pendiente de pago"
    Y realizo el pago del tramite y radico el tramite
    Entonces El sistema genera el numero de radicado y numero de expediente

    ## CONTROL POSTERIOR

    Dado Tengo el tramite pendiente de asignar
    Cuando Inicio sesion en "NPTUrl" como "Coordinador"
    Entonces Puedo asignar el tramite a un funcionario legal y un funcionario tecnico

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "Pendiente de gesti"
    Entonces Puedo dar concepto "Aprobar" al tramite
    Y Puedo ver todos los 13 documentos del tramite y la tarifa

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "En gesti"
    Entonces Puedo dar concepto "Aprobar" al tramite
    Y Finalizo la gestion

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "documental"
    Entonces Puedo generar el documento del tramite tipo "Certifica"

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "Pendiente de complementaci"
    Entonces Puedo complementar el documento del tramite

    Dado Inicio sesion en "NPTUrl" como "Coordinador"
    Cuando Tengo el tramite asignado con estado "Pendiente visto bueno"
    Entonces Puedo dar el visto bueno al tramite