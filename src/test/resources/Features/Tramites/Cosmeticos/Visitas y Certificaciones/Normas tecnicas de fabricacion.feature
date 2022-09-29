# language: es
@VisitasyCertificaciones
@AllScenarios
Característica: Visitas de Certificacion de condiciones sanitarias
  Automatizacion  para validar el correcto funcionamento del tramite.

  Antecedentes:
    Dados los datos del ambiente y usuarios del sistema

  @VisitaNormasTecnicasDeFabricacionHigieneDomesticaNueva
  Escenario: Visita y Certificacion Nueva Normas Tecnicas de Fabricacion Higiene Dosmestica
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    Y Necesito registrar un tramite nuevo de "Cosméticos, Aseo, Plaguicidas y Productos de Higiene Doméstica"
    Cuando Selecciono la categoria "Visitas y Certificaciones" y el grupo "Productos de Higiene Dom"
    Y Selecciono el tipo de tramite "NTF"
    Y Selecciono el subtipo de tramite "Nueva"
    Entonces Se muestra la pantalla para asociar una empresa al tramite
    Y Se muestran las tarifas correspondientes al tramite
      |4024|

    Dado Asocio una empresa nacional
    Cuando Selecciono una sucursal
    Entonces Se muestra la informacion de la empresa y el representante legal

    Dado Necesito agregar un medio de notificacion
    Cuando Selecciono el tipo de notificacion por correo
    Entonces Puedo continuar a la pantalla tecnica

    Dado Necesito registrar la informacion general del producto
    Cuando Ingreso toda la informacion de la pantalla tecnica capacidad de produccion nueva
    Entonces Puedo ingresar la documentacion requerida

    Dado Necesito ingresar toda la documentacion requerida
    Cuando Valido que se muestren los documentos obligatorios y los agrego
    |Listado de equipos|
    |Plano del establecimiento|
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

    Dado Necesito aprobar la radicacion de un tramite como funcionario tecnico
    Cuando Inicio sesion en "NPTUrl" como "RevisorTecnico"
    Entonces Puedo aprobar la solicitud

    Dado Inicio sesion en "NPTUrl" como "Representante"
    Cuando Tengo la solicitud asignada con estado "Pendiente de pago"
    Y realizo el pago del tramite y radico el tramite
    Entonces El sistema genera el numero de radicado y numero de expediente

    Dado Tengo el tramite pendiente de asignar
    Cuando Inicio sesion en "NPTUrl" como "Coordinador"
    Entonces Puedo asignar el tramite a un funcionario tecnico

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "Pendiente de gesti"
    Entonces Puedo dar concepto "Aprobar" al tramite
    Y Finalizo la gestion

     #Ingresa a Sivicos
    Dado Inicio sesion en "SivicosUrl" como "Programacion"
    Y Tengo una visita pendiente de programar en "Cosm"
    Cuando Programo la visita
    #Entonces Puedo gestionar comision o transporte
    Y Puedo generar el oficio comisorio

    Dado Inicio sesion en "SivicosUrl" como "Ejecucion"
    Cuando Ejecuto la visita
    Y Puedo diligenciar actas del grupo "Cosm" del subgrupo "Capilares" y tipo de acta "FM033"
    Y Puedo agregar los documentos asociados del grupo "Cosm"
    Entonces Puedo realizar el cierre de la visita

  @VisitaNormasTecnicasDeFabricacionHigienePersonalNueva
  Escenario: Visita y Certificacion Nueva Normas Tecnicas de Fabricacion Higiene Personal
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    Y Necesito registrar un tramite nuevo de "Cosméticos, Aseo, Plaguicidas y Productos de Higiene Doméstica"
    Cuando Selecciono la categoria "Visitas y Certificaciones" y el grupo "Higiene Personal"
    Y Selecciono el tipo de tramite "NTF"
    Y Selecciono el subtipo de tramite "Nueva"
    Entonces Se muestra la pantalla para asociar una empresa al tramite
    Y Se muestran las tarifas correspondientes al tramite
      |4024|
    Y Se muestra la tarifa "4024" correspondiente al tramite

    Dado Asocio una empresa nacional
    Cuando Selecciono una sucursal
    Entonces Se muestra la informacion de la empresa y el representante legal

    Dado Necesito agregar un medio de notificacion
    Cuando Selecciono el tipo de notificacion por correo
    Entonces Puedo continuar a la pantalla tecnica

    Dado Necesito registrar la informacion general del producto
    Cuando Ingreso toda la informacion de la pantalla tecnica capacidad de produccion nueva
    Entonces Puedo ingresar la documentacion requerida

    Dado Necesito ingresar toda la documentacion requerida
    Cuando Valido que se muestren los documentos obligatorios y los agrego
    |Listado de equipos|
    |Plano del establecimiento|
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

    Dado Necesito aprobar la radicacion de un tramite como funcionario tecnico
    Cuando Inicio sesion en "NPTUrl" como "RevisorTecnico"
    Entonces Puedo aprobar la solicitud

    Dado Inicio sesion en "NPTUrl" como "Representante"
    Cuando Tengo la solicitud asignada con estado "Pendiente de pago"
    Y realizo el pago del tramite y radico el tramite
    Entonces El sistema genera el numero de radicado y numero de expediente

    Dado Tengo el tramite pendiente de asignar
    Cuando Inicio sesion en "NPTUrl" como "Coordinador"
    Entonces Puedo asignar el tramite a un funcionario tecnico

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "Pendiente de gesti"
    Entonces Puedo dar concepto "Aprobar" al tramite
    Y Finalizo la gestion


     #Ingresa a Sivicos
    Dado Inicio sesion en "SivicosUrl" como "Programacion"
    Y Tengo una visita pendiente de programar en "Cosm"
    Cuando Programo la visita
    #Entonces Puedo gestionar comision o transporte
    Y Puedo generar el oficio comisorio

    Dado Inicio sesion en "SivicosUrl" como "Ejecucion"
    Cuando Ejecuto la visita
    Y Puedo diligenciar actas del grupo "Cosm" del subgrupo "Capilares" y tipo de acta "FM033"
    Y Puedo agregar los documentos asociados del grupo "Cosm"
    Entonces Puedo realizar el cierre de la visita

  #Ingresa a generación documental.

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "documental"
    Y Puedo ver el concepto de la visita Mantiene y cumple
    Y Puedo generar el documento del tramite tipo "Certificado de Condiciones"
    Dado Inicio sesion en "NPTUrl" como "Coordinador"
    Cuando Tengo el tramite asignado con estado "Pendiente visto bueno"
    Entonces Puedo dar el visto bueno al tramite

    # Ingresa a notificacion.

    Dado Inicio sesion en "NPTUrl" como "Notificador"
    Cuando Tengo el tramite en notificacion "Pendiente de firma"
    Entonces Puedo firmar el documento para la notificacion