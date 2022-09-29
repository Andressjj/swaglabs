# language: es
@AccionesFlujo1
@AccionesRsUsoEnSaludPublica

Característica: Acciones del flujo 1
  Aqui se realizan las acciones determinadas para el flujo 1

  Antecedentes:
    Dados los datos del ambiente y usuarios del sistema


@RSNuevoAccionesFlujo1Completo
Escenario: Realiza un RS nuevo de plaguicidas de uso en salud publica con diferentes acciones
Solitud de prorroga, responder requerimiento, interponer recurso de reposicion, solicitud de correccion y solicitud
de revocatoria

  Dado Inicio sesion en "NPTUrl" como "GestorTramites"
  Y Necesito registrar un tramite nuevo de "Cosméticos, Aseo, Plaguicidas y Productos de Higiene Doméstica"
  Cuando Selecciono la categoria "Registro Sanitario" y el grupo "Plaguicidas de Uso en Salud Pública"
  Y Selecciono el tipo de tramite "Registro Sanitario Nuevo"
  Entonces Se muestra la pantalla para asociar una empresa al tramite
  Y Se muestran las tarifas correspondientes al tramite
    |3006|
    |90093|

  Dado Asocio una empresa nacional
  Cuando Selecciono una sucursal
  Entonces Se muestra la informacion de la empresa y el representante legal

  Dado Necesito ingresar los roles
  Cuando Valido que se muestren los roles y selecciono el rol "Fabricante"
    |Fabricante|
    |Envasador|
    |Importador|
    |Acondicionador|
  Entonces Se visualiza el rol en la tabla de informacion de roles

  Dado Necesito agregar un certificado tipo "Licencia sanitaria" a un rol
  Cuando Agrego el certificado
  Entonces Puedo visualizar el documento cargado

  Dado Necesito agregar un medio de notificacion
  Cuando Selecciono el tipo de notificacion por correo
  Entonces Puedo continuar a la pantalla tecnica

  Dado Necesito registrar la informacion general del producto
  Cuando Ingreso toda la informacion de la pantalla tecnica Plaguicidas de uso en salud publica
  Entonces Puedo ingresar la documentacion requerida

  Dado Necesito ingresar toda la documentacion requerida
  Cuando Valido que se muestren los documentos obligatorios y los agrego
    |Concepto|
    |Estudios de estabilidad|
    |Etiqueta|
    |Copia de la Tarjeta profesional|
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

  Dado Inicio sesion en "NPTUrl" como "Representante"
  Cuando Tengo la solicitud asignada con estado "Pendiente de pago"
  Y realizo el pago del tramite y radico el tramite
  Entonces El sistema genera el numero de radicado y numero de expediente

    ## CONTROL POSTERIOR

  Dado Tengo el tramite pendiente de asignar
  Cuando Inicio sesion en "NPTUrl" como "Coordinador"
  Entonces Puedo asignar el tramite a un funcionario legal y un funcionario tecnico

  Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
  Cuando Tengo el tramite asignado con estado "gesti"
  Entonces Puedo dar concepto "Aprobar" al tramite
  #Y Puedo ver todos los 4 documentos del tramite y la tarifa

  Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
  Cuando Tengo el tramite asignado con estado "En gesti"
  Entonces Puedo dar concepto "Requerir" al tramite
  Y Finalizo la gestion


  Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
  Cuando Tengo el tramite asignado con estado "generaci"
  Entonces Puedo generar el documento del tramite tipo "Auto"

  Dado Inicio sesion en "NPTUrl" como "Coordinador"
  Cuando Tengo el tramite asignado con estado "Pendiente visto bueno"
  Entonces Puedo dar el visto bueno al tramite

      ## NOTIFICACIÓN.

  Entonces Simulo la Notificacion del RPA

  #Accion del ciudadano - Solicitud de prorroga
  Dado Inicio sesion en "NPTUrl" como "Representante"
  Cuando Tengo el tramite con estado "En requerimiento"
  Entonces Puedo realizar una accion sobre el tramite
  Entonces Valido que se muestren las acciones y selecciono "Solicitud de Prórroga requerimiento"
    |Solicitud de Prórroga requerimiento|
    |Responder requeri|


  Cuando Adjunto el documento requerido "Anexos"
  Entonces Puedo radicar el tramite

  #Control posterior - Solicitud de prorroga
  Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
  Cuando Tengo el tramite asignado con estado "gesti"
  Y Selecciono el radicado para revisar
  Entonces Puedo dar concepto "Aprobar" al tramite

  Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
  Cuando Tengo el tramite asignado con estado "En gesti"
  Y Selecciono el radicado para revisar
  Entonces Puedo dar concepto "Aprobar" al tramite
  Y Finalizo la gestion

  Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
  Cuando Tengo el tramite asignado con estado "generaci"
  Entonces Puedo generar el documento del tramite tipo "Comunicación"

  Dado Inicio sesion en "NPTUrl" como "Coordinador"
  Cuando Tengo el tramite asignado con estado "Pendiente visto bueno"
  Entonces Puedo dar el visto bueno al tramite

  ##Notificacion

  Y Simulo la Notificacion del RPA

  #Accion del ciudadano - Responder requerimiento
  Dado Inicio sesion en "NPTUrl" como "Representante"
  Cuando Tengo el tramite con estado "En requerimiento"
  Entonces Puedo realizar una accion sobre el tramite
  Entonces Valido que se muestren las acciones y selecciono "Responder requerimiento"
    |Responder requerimiento|

  Cuando Adjunto el documento requerido "Anexos"
  Entonces Puedo radicar el tramite

  #Control Posterior - Responder requerimiento

  Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
  Cuando Tengo el tramite asignado con estado "gesti"
  Y Selecciono el radicado para revisar
  Entonces Puedo dar concepto "Aprobar" al tramite

  Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
  Cuando Tengo el tramite asignado con estado "En gesti"
  Y Selecciono el radicado para revisar
  Entonces Puedo dar concepto "Negar" al tramite
  Y Finalizo la gestion

  Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
  Cuando Tengo el tramite asignado con estado "generaci"
  Entonces Puedo generar el documento del tramite tipo "Resolución negación solicitud"

  Dado Inicio sesion en "NPTUrl" como "Coordinador"
  Cuando Tengo el tramite asignado con estado "Pendiente visto bueno"
  Entonces Puedo dar el visto bueno al tramite

  ##Notificacion

  Y Simulo la Notificacion del RPA

  #Accion del ciudadano - Interposicion de recurso de reposicion
  Dado Inicio sesion en "NPTUrl" como "Representante"
  Cuando Tengo el tramite con estado "Negado"
  Entonces Puedo realizar una accion sobre el tramite
  Entonces Valido que se muestren las acciones y selecciono "Interposici"
    |Solicitud revocatoria|
    |Interposici|
    |Solicitud de correcci|
  Cuando Adjunto el documento requerido "Anexos"
  Entonces Puedo radicar el tramite

  #Control Posterior - Interposicion de recurso de reposicion

  Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
  Cuando Tengo el tramite asignado con estado "gesti"
  Y Selecciono el radicado para revisar
  Entonces Puedo dar concepto "Aprobar recurso" al tramite

  Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
  Cuando Tengo el tramite asignado con estado "En gesti"
  Y Selecciono el radicado para revisar
  Entonces Puedo dar concepto "Negar recurso" al tramite
  Y Finalizo la gestion

  Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
  Cuando Tengo el tramite asignado con estado "generaci"
  Entonces Puedo generar el documento del tramite tipo "Resolución de negación del recurso"

  Dado Inicio sesion en "NPTUrl" como "Coordinador"
  Cuando Tengo el tramite asignado con estado "Pendiente visto bueno"
  Entonces Puedo dar el visto bueno al tramite

  ##Notificacion

  Y Simulo la Notificacion del RPA

  #Accion del ciudadano - Solicitud de correccion
  Dado Inicio sesion en "NPTUrl" como "Representante"
  Cuando Tengo el tramite con estado "Negado recurso"
  Entonces Puedo realizar una accion sobre el tramite
  Entonces Valido que se muestren las acciones y selecciono "Solicitud de correcci"
    |Solicitud de correcci|
    |Solicitud revocatoria|
  Cuando Adjunto el documento requerido "Anexos"
  Entonces Puedo radicar el tramite

  #Control Posterior - Solicitud de correccion

  Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
  Cuando Tengo el tramite asignado con estado "gesti"
  Y Selecciono el radicado para revisar
  Entonces Puedo dar concepto "Aprobar correcci" al tramite

  Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
  Cuando Tengo el tramite asignado con estado "En gesti"
  Y Selecciono el radicado para revisar
  Entonces Puedo dar concepto "Negar correcci" al tramite
  Y Finalizo la gestion

  Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
  Cuando Tengo el tramite asignado con estado "generaci"
  Entonces Puedo generar el documento del tramite tipo "Resolución de negación de la corrección"

  Dado Inicio sesion en "NPTUrl" como "Coordinador"
  Cuando Tengo el tramite asignado con estado "Pendiente visto bueno"
  Entonces Puedo dar el visto bueno al tramite

  ##Notificacion

  Y Simulo la Notificacion del RPA

  #Accion del ciudadano - Solicitud revocatoria directa
  Dado Inicio sesion en "NPTUrl" como "Representante"
  Cuando Tengo el tramite con estado "Corrección negada"
  Entonces Puedo realizar una accion sobre el tramite
  Entonces Valido que se muestren las acciones y selecciono "Solicitud revocatoria"
    |Solicitud revocatoria|
    |Recurso de Reposici|
    |Solicitud de correcci|

  Cuando Adjunto el documento requerido "Anexos"
  Entonces Puedo radicar el tramite

  #Control Posterior - Solicitud revocatoria directa

  Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
  Cuando Tengo el tramite asignado con estado "Pendiente solicitud"
  Y Selecciono el radicado para revisar
  Entonces Puedo dar concepto "Aprobar con revocatoria" al tramite
  Y Finalizo la gestion

  Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
  Cuando Tengo el tramite asignado con estado "generaci"
  Entonces Puedo generar el documento del tramite tipo "Resolución de aprobación de la revocatoria"

  Dado Inicio sesion en "NPTUrl" como "Coordinador"
  Cuando Tengo el tramite asignado con estado "Pendiente visto bueno"
  Entonces Puedo dar el visto bueno al tramite

  ##Notificacion

  Y Simulo la Notificacion del RPA

  #Accion del ciudadano - Observar estado despues de la accion revocatoria directa
  Dado Inicio sesion en "NPTUrl" como "Representante"
  Cuando Tengo el tramite con estado "Aprobado revocatoria"