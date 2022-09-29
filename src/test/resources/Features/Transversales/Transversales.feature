# language: es
@Transversales
Característica: Transversales
  Estos escenarios automatizados realiza un recorrido por las principales funcionalidades para garantizar el funcionamiento del registro en Nueva plataforma de tramites.

  Antecedentes:
    Dados los datos del ambiente y usuarios del sistema


  @RSNuevoPUESPPagoPorGiroInternacional
  Escenario: Se realiza un Registro sanitario nuevo hasta radicar, con pago por giro internacional.
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
    Entonces Puedo visualizar la informacion general de la tarifa

    Dado Necesito visualizar la informacion del tramite
    Cuando Guardo la informacion
    #Entonces Puedo ver la informacion del tramite en un PopUp

    #-----------Inicio pago por giro internacional-----------
    Dado Necesito realizar el pago por giro internacional
    Cuando Ingreso los datos del pago y comprobante
    Cuando Valido que se muestren los documentos obligatorios y los agrego
      |Documento|
    Entonces Se guarda la información del pago

    Dado Necesito visualizar la informacion del tramite
    Cuando Guardo la informacion
    #Entonces Puedo ver la informacion del tramite en un PopUp

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
    Cuando Tengo la solicitud asignada con estado "Pago aprobado"
    Y Se muestra la infromacion del pago realizado por giro internacional
    Entonces El sistema genera el numero de radicado y numero de expediente

    #-----------Fin del pago internacional-------------
  @NSOCosmeticosPagoPorGiroInternacional
  Escenario: Se realiza un Registro sanitario nuevo hasta radicar, con pago por giro internacional.
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    Y Necesito registrar un tramite nuevo de "Cosméticos, Aseo, Plaguicidas y Productos de Higiene Doméstica"
    Cuando Selecciono la categoria "Sanitaria Obligatoria" y el grupo "Cosméticos"
    Y Selecciono el subgrupo "Capilares"
    Y Selecciono el tipo de tramite "Sanitaria Obligatoria"
    Entonces Se muestra la pantalla para asociar una empresa al tramite
    Y Se muestran las tarifas correspondientes al tramite
      |1027|

    Dado Asocio una empresa nacional
    Cuando Selecciono una sucursal
    Entonces Se muestra la informacion de la empresa y el representante legal
    Y Puedo ver la seccion de apoderado
    Y Puedo ver y seleccionar un director tecnico

    Dado Necesito ingresar los roles
    Cuando Valido que se muestren los roles y selecciono el rol "Fabricante"
      |Fabricante|
      |Maquilador|
      |Envasador|
      |Acondicionador|
    Entonces Se visualiza el rol en la tabla de informacion de roles

    Dado Necesito agregar un certificado tipo "Certificado" a un rol
    Cuando Agrego el certificado
    Entonces Puedo visualizar el documento cargado

    Dado Necesito agregar un medio de notificacion
    Cuando Selecciono el tipo de notificacion por correo
    Entonces Puedo continuar a la pantalla tecnica

    Dado Necesito registrar la informacion general del producto
    Cuando Ingreso toda la informacion de la pantalla tecnica NSO Cosmeticos
    Entonces Puedo ingresar la documentacion requerida

    Dado Necesito ingresar toda la documentacion requerida
    Cuando Valido que se muestren los documentos obligatorios y los agrego
      |Especificaciones microb|
      |Especificaciones organol|
      |Etiqueta|
      #Pendiente revision del documento adjuntado - mantis 6903
      |Proyecto de etiqueta|
      |Sistema de loteado|
    Entonces Puedo visualizar la informacion general de la tarifa

    Dado Necesito visualizar la informacion del tramite
    Cuando Guardo la informacion
    #Entonces Puedo ver la informacion del tramite en un PopUp

        #-----------Inicio pago por giro internacional-----------
    Dado Necesito realizar el pago por giro internacional
    Cuando Ingreso los datos del pago y comprobante
    Cuando Valido que se muestren los documentos obligatorios y los agrego
      |Documento|
    Entonces Se guarda la información del pago

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
    Cuando Tengo la solicitud asignada con estado "Pago aprobado"
    Y Se muestra la infromacion del pago realizado por giro internacional
    Entonces El sistema genera el numero de radicado y numero de expediente

    #-----------Fin del pago internacional-------------




  ##  Validar que se pueda devolver correctamente.
  @RSCosmeticosNuevoPlaguicidasUsoSaludPublicaDevolucion
  Escenario: Realiza un registro sanitario nuevo en plaguicidas de uso en salud publica Flujos Alternos CP
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

    ##  Aprobar - Requerir

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "Pendiente de gesti"
    Entonces Puedo dar concepto "Aprobar" al tramite
    Y Puedo ver todos los 4 documentos del tramite y la tarifa

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "En gesti"
    Entonces Puedo dar concepto "Requerir" al tramite
    Y Finalizo la gestion

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "documental"
    Entonces Puedo generar el documento del tramite tipo "legal"
    Dado Inicio sesion en "NPTUrl" como "Coordinador"
    Cuando Tengo el tramite asignado con estado "Pendiente visto bueno"
    Entonces Puedo devolver el tramite por "Concepto"

    ##  Requerir - Aprobar
    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "En gesti"
    Entonces Puedo dar concepto "Requerir" al tramite

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "En gesti"
    Entonces Puedo dar concepto "Aprobar" al tramite
    Y Finalizo la gestion

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "documental"
    Entonces Puedo generar el documento del tramite tipo "legal"

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "Pendiente de complementaci"
    Entonces Puedo complementar el documento del tramite

    Dado Inicio sesion en "NPTUrl" como "Coordinador"
    Cuando Tengo el tramite asignado con estado "Pendiente visto bueno"
    Entonces Puedo devolver el tramite por "Concepto"


    ##  Requerir - Requerir

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "En gesti"
    Entonces Puedo dar concepto "Requerir" al tramite

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "En gesti"
    Entonces Puedo dar concepto "Requerir" al tramite
    Y Finalizo la gestion

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "documental"
    Entonces Puedo generar el documento del tramite tipo "legal"

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "Pendiente de complementaci"
    Entonces Puedo complementar el documento del tramite

    Dado Inicio sesion en "NPTUrl" como "Coordinador"
    Cuando Tengo el tramite asignado con estado "Pendiente visto bueno"
    Entonces Puedo dar el visto bueno al tramite

    ## Notificacion.

    Dado Inicio sesion en "NPTUrl" como "Notificador"
    Cuando Tengo el tramite en notificacion "Pendiente de firma"
    Entonces Puedo firmar el documento para la notificacion