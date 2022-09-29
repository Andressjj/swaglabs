# language: es
@AccionesFlujo2
@AccionesRsUsoEnSaludPublica
Característica: Acciones del flujo 2
  Aqui se realizan las acciones determinadas para el flujo 2

  Antecedentes:
    Dados los datos del ambiente y usuarios del sistema

  @RSNuevoPlaguicidasUsoSaludPublicaFlujo2
  Escenario: Realiza un RS nuevo de plaguicidas de uso en salud publica con diferentes acciones
  Alcance al radicado, desistimiento y recurso de reposicion
    * Limpiar la variable "Radicado"
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

          # CONTROL POSTERIOR

    Dado Inicio sesion en "NPTUrl" como "Coordinador"
    Cuando Tengo el tramite pendiente de asignar
    Entonces Puedo asignar el tramite a un funcionario legal y un funcionario tecnico

  #Accion del ciudadano - Alcance de radicado
    Dado Inicio sesion en "NPTUrl" como "Representante"
    Cuando Tengo el tramite con estado "Pendiente de gesti"
    Entonces Puedo realizar una accion sobre el tramite
    Entonces Valido que se muestren las acciones y selecciono "Alcance al radicado"
      |Alcance al radicado|
      |Desistimiento|
    Cuando Adjunto el documento requerido "Anexos"
    Entonces Puedo radicar el tramite

    #Control Posterior

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "gesti"
    Y Selecciono el radicado para revisar

    #Accion del ciudadano - Desistimiento
    Dado Inicio sesion en "NPTUrl" como "Representante"
    Cuando Tengo el tramite con estado "En gesti"
    Entonces Puedo realizar una accion sobre el tramite
    Entonces Valido que se muestren las acciones y selecciono "Desistimiento"
      |Desistimiento|
      |Alcance al radicado|
    Cuando Adjunto el documento requerido "Anexos"
    Entonces Puedo radicar el tramite

    #Control Posterior

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "gesti"
    Y Selecciono el radicado para revisar
    Entonces Puedo dar concepto "Aprobar desistimiento" al tramite
    Y Finalizo la gestion

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "generaci"
    Entonces Puedo generar el documento del tramite tipo "Resolución aprobación Desistimiento"

    Dado Inicio sesion en "NPTUrl" como "Coordinador"
    Cuando Tengo el tramite asignado con estado "Pendiente visto bueno"
    Entonces Puedo dar el visto bueno al tramite

  ##Notificacion

    Y Simulo la Notificacion del RPA

    #Accion del ciudadano - Recurso reposicion sobre desistimiento
    Dado Inicio sesion en "NPTUrl" como "Representante"
    Cuando Tengo el tramite con estado "Desistimiento"
    Entonces Puedo realizar una accion sobre el tramite
    Entonces Valido que se muestren las acciones y selecciono "Recurso de Reposici"
      |Recurso de Reposici|
      |Solicitud de correcci|

    Cuando Adjunto el documento requerido "Anexos"
    Entonces Puedo radicar el tramite

        #Control Posterior

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "gesti"
    Y Selecciono el radicado para revisar
    Entonces Puedo dar concepto "Aprobar recurso y auto requerimiento" al tramite
    Y Finalizo la gestion

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "gesti"
    Y Selecciono el radicado para revisar
    Entonces Puedo dar concepto "Aprobar recurso y auto requerimiento" al tramite
    Y Finalizo la gestion

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "gesti"
    Entonces Puedo generar el documento del tramite tipo "Resoluci"

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "En generaci"
    Entonces Puedo generar el documento del tramite tipo "Auto"

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "Pendiente de complementaci"
    Entonces Puedo complementar el documento del tramite

    Dado Inicio sesion en "NPTUrl" como "Coordinador"
    Cuando Tengo el tramite asignado con estado "Pendiente visto bueno"
    Entonces Puedo dar el visto bueno al tramite
    ##Notificacion

    Y Simulo la Notificacion del RPA

    #Accion del ciudadano - Validar que quede en el estado correcto
    Dado Inicio sesion en "NPTUrl" como "Representante"
    Cuando Tengo el tramite con estado "En requerimiento"
