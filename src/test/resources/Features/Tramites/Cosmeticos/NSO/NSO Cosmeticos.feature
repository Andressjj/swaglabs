# language: es

@NSOCosmeticos
@AllScenarios
@NSO
Característica: Notificacion Sanitaria Obligatoria Cosmeticos
  Automatizacion  para validar el correcto funcionamento del tramite.

  Antecedentes:
    Dados los datos del ambiente y usuarios del sistema
  @NSOCosmeticosNueva
    @NSONueva
  @tmsLink=InvNP-196
  Escenario: Notificacion Sanitaria Obligatoria Nueva en cosmeticos.
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
      |Copia de la Tarjeta profesional del director|
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
    Entonces realizo el pago del tramite y radico el tramite
    Y El sistema genera el numero de radicado y numero de expediente
    ##

    ## AQUI DEBERÁ IR LA AUTOMATIZACIÓN DE NOTIFICACION.
    Y Simulo la Notificacion del RPA

    ## CONTROL POSTERIOR

    Dado Tengo el tramite pendiente de asignar
    Cuando Inicio sesion en "NPTUrl" como "Coordinador"
    Entonces Puedo asignar el tramite a un funcionario legal y un funcionario tecnico

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "Pendiente de gesti"
    Entonces Puedo dar concepto "Aprobar" al tramite
    Y Puedo ver todos los 8 documentos del tramite y la tarifa

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "En gesti"
    Entonces Puedo dar concepto "Aprobar" al tramite
    Y Finalizo la gestion

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "Asignado para gesti"
    Entonces Puedo generar el documento del tramite tipo "control Posterior"

    ## AQUI DEBERÁ IR LA AUTOMATIZACIÓN DE NOTIFICACION.
    Y Simulo la Notificacion del RPA

  @NSOCosmeticosRenovacion
  Escenario:  NSO Cosmeticos Asociado al Expediente Renovacion
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    Y Necesito registrar un tramite asociado a un expediente
    Y Selecciono el tipo de tramite "Renova"
    Entonces Se muestra la pantalla para asociar una empresa al tramite

    Y Se muestran las tarifas correspondientes al tramite
      |1027|
    Dado Puedo continuar a la pantalla tecnica
    Cuando Ingreso toda la informacion de la pantalla tecnica Renovacion NSO Cosmeticos
    Entonces Puedo ingresar la documentacion requerida

    Dado Necesito ingresar toda la documentacion requerida
    Cuando Valido que se muestren los documentos obligatorios y los agrego
    |Documento que acredite|
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
    Entonces realizo el pago del tramite y radico el tramite
    Y El sistema genera el numero de radicado y numero de expediente
    ##

    ## AQUI DEBERÁ IR LA AUTOMATIZACIÓN DE NOTIFICACION.
    Y Simulo la Notificacion del RPA


    ## CONTROL POSTERIOR

    Dado Tengo el tramite pendiente de asignar
    Cuando Inicio sesion en "NPTUrl" como "Coordinador"
    Entonces Puedo asignar el tramite a un funcionario legal y un funcionario tecnico

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "Pendiente de gesti"
    Entonces Puedo dar concepto "Aprobar con etiqueta" al tramite
    Y Puedo ver todos los 8 documentos del tramite y la tarifa

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "En gesti"
    Entonces Puedo dar concepto "Aprobar con etiqueta" al tramite
    Y Finalizo la gestion

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "documental"
    Entonces Puedo generar el documento del tramite tipo "control Posterior"

    ## AQUI DEBERÁ IR LA AUTOMATIZACIÓN DE NOTIFICACION.
    Y Simulo la Notificacion del RPA


  @NSOCosmeticosSolicitudAcogerseCodigoNSO
  Escenario:  NSO Cosmeticos Asociado al Expediente Solicitud Acogerse a un codigo de NSO Existente
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    * Tengo la variable "Expediente" con el valor "R000002874"
    Y Necesito registrar un tramite asociado a un expediente
    Y Selecciono el tipo de tramite "Solicitud para Acogerse"
    Entonces Se muestra la pantalla para asociar una empresa al tramite
    Dado Puedo continuar a la pantalla tecnica
    Y Se muestran las tarifas correspondientes al tramite
      |0|
    Y Valido que se muestren las roles en pantalla tecnica y selecciono "Importador paralelo"
    |Importador paralelo|
    |Acondicionador Paralelo|
    Cuando Ingreso toda la informacion de la pantalla tecnica Acogerse a Codigo NSO Cosmeticos
    Entonces Puedo ingresar la documentacion requerida

    Dado Necesito ingresar toda la documentacion requerida
    Cuando Valido que se muestren los documentos obligatorios y los agrego
    |Documento que acredite|
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
    Entonces realizo el pago del tramite y radico el tramite
    Y El sistema genera el numero de radicado y numero de expediente
    ##
    ## AQUI DEBERÁ IR LA AUTOMATIZACIÓN DE NOTIFICACION.

    ## CONTROL POSTERIOR

    Dado Tengo el tramite pendiente de asignar
    Cuando Inicio sesion en "NPTUrl" como "Coordinador"
    Entonces Puedo asignar el tramite a un funcionario legal y un funcionario tecnico

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "Pendiente de gesti"
    Entonces Puedo dar concepto "Aprobar" al tramite
    Y Puedo ver todos los 8 documentos del tramite y la tarifa

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "En gesti"
    Entonces Puedo dar concepto "Aprobar" al tramite
    Y Finalizo la gestion

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "documental"
    Entonces Puedo generar el documento del tramite tipo "paralelo"


  @CVLCosmeticosNSOCosmeticosAsociadoAlExpediente
  @CertificadosVentaLibreNSO
  @tmsLink=InvNP-152
  Escenario:  CVL NSO Cosmeticos Asociado al Expediente
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    Y Necesito registrar un tramite asociado a un expediente
    Y Selecciono el tipo de tramite "CVL Auto"
    Entonces Se muestra la pantalla para asociar una empresa al tramite
    Y Se muestran las tarifas correspondientes al tramite
      |4002-4|


    Dado Puedo continuar a la pantalla tecnica
    #mantis - 6966

    Dado Necesito registrar la informacion general del producto
    Cuando Ingreso toda la informacion de la pantalla tecnica CVL Automatico NSO Cosmeticos
    Y Puedo previsualizar el certificado
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

    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    Cuando Tengo la solicitud asignada con estado "Pendiente de pago"
    Y realizo el pago del tramite y radico el tramite

    Entonces El sistema genera el numero de radicado y numero de expediente

    ## AQUI DEBERÁ IR LA AUTOMATIZACIÓN DE NOTIFICACION.
    Y Simulo la Notificacion del RPA


    #Validar que llegue el correo con el documento adjunto y el numero de solicitud.
    #Queda pendiente mirar el click en el boton visualizar documento en la pantalla tecnica


  @CertificacionConNSOCosmeticos
  Escenario: Certificacion con Notificacion Sanitaria Obligatoria Cosmeticos
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    # * Tengo la variable "Expediente" con el valor "R000001350"
    Cuando Necesito registrar un tramite asociado a un expediente
    Y Selecciono el tipo de tramite "con NSO"
    Entonces Se muestra la pantalla para asociar una empresa al tramite
    Y Se muestran las tarifas correspondientes al tramite
      |4002-2|
    Entonces Puedo continuar a la pantalla tecnica

    Cuando Ingreso toda la informacion de la pantalla tecnica Certificacion con NSO Cosmeticos
    Y Puedo previsualizar el certificado
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

    ## AQUI DEBERÁ IR LA AUTOMATIZACIÓN DE NOTIFICACION.
    Y Simulo la Notificacion del RPA

    #Control posterior
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
    Entonces Puedo generar el documento del tramite tipo "Certificaci"

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "Pendiente de complementaci"
    Entonces Puedo complementar el documento del tramite

    Dado Inicio sesion en "NPTUrl" como "Coordinador"
    Cuando Tengo el tramite asignado con estado "Pendiente visto bueno"
    Entonces Puedo dar el visto bueno al tramite

    ## AQUI DEBERÁ IR LA AUTOMATIZACIÓN DE NOTIFICACION.
    Y Simulo la Notificacion del RPA

  @ModificacionDeLaInformacionDeLaNSOCosmeticos
  Escenario: Modificacion de la Informacion de la NSO Cosmeticos
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    # * Tengo la variable "Expediente" con el valor "R000001893"
    Y Necesito registrar un tramite asociado a un expediente
    Cuando Selecciono el tipo de tramite "n de la NSO"
    Y Selecciono el subtipo de tramite "nico-Legal"
    Entonces Se muestra la pantalla para asociar una empresa al tramite
    Y Se muestran las tarifas correspondientes al tramite
      |4001-23|
    Y Ingreso toda la informacion de la pantalla Informacion de la modificacion NSO Cosmeticos

    Dado Asocio una empresa con Cedula "1005691965"
    Cuando Selecciono una sucursal
    Entonces Se muestra la informacion de la empresa y selecciono el nuevo representante legal

    Dado Necesito modificar el rol
    Cuando Selecciono el rol y lo modifico con cedula "1005691965"
    Entonces Se visualiza el rol en la tabla de informacion de roles

    #Dado Necesito agregar un certificado tipo "Licencia sanitaria" a un rol
    #Cuando Agrego el certificado
    #Entonces Puedo visualizar el documento cargado
    Y Puedo continuar a la pantalla tecnica

    Dado Necesito registrar la informacion general del producto
    Cuando Ingreso la informacion modificada de la pantalla tecnica Modificacion de la informacion de la NSO Cosmeticos
    Entonces Puedo ingresar la documentacion requerida

    # Mantis 7314
    Dado Necesito ingresar toda la documentacion requerida
    Cuando Valido que se muestren los documentos obligatorios y los agrego
      |Etiqueta|
      |Justificaci|
      |fisicoquimicas|
      |microbiolo|
      |Proyecto|
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
    Cuando Tengo el tramite asignado con estado "Pendiente de gesti"
    Y Acepto los cambios de la informacion legal
    Y Acepto los cambios de la informacion tecnica
    Y Acepto los cambios de la documentacion
    Entonces Puedo dar concepto "Aprobar" al tramite
    Y Puedo ver todos los 6 documentos del tramite y la tarifa

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "En gesti"
    Entonces Puedo dar concepto "Aprobar" al tramite
    Y Finalizo la gestion

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "Asignado para gesti"
    Entonces Puedo generar el documento del tramite tipo "Resoluci"

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "Pendiente de complementaci"
    Entonces Puedo complementar el documento del tramite

    Dado Inicio sesion en "NPTUrl" como "Coordinador"
    Cuando Tengo el tramite asignado con estado "Pendiente visto bueno"
    Entonces Puedo dar el visto bueno al tramite

    Dado Inicio sesion en "NPTUrl" como "Notificador"
    Cuando Tengo el tramite en notificacion "Pendiente de firma"
    Entonces Puedo firmar el documento para la notificacion

  @NSOCosmeticosNotificacionAgotamiento
  Escenario:  NSO Cosmeticos Asociado al Expediente Agotamiento
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    Y Necesito registrar un tramite asociado a un expediente
    Y Selecciono el tipo de tramite "Agotamiento"
    Entonces Se muestra la pantalla para asociar una empresa al tramite
    Y Se muestran las tarifas correspondientes al tramite
      |0|

    Dado Puedo continuar a la pantalla tecnica
    Cuando Ingreso toda la informacion de la pantalla tecnica agotamiento NSO
    Entonces Puedo ingresar la documentacion requerida

    Dado Necesito ingresar toda la documentacion requerida
    Cuando Valido que se muestren los documentos obligatorios y los agrego
    |Etiquetas|
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
    Entonces realizo el pago del tramite y radico el tramite
    Y El sistema genera el numero de radicado y numero de expediente
    ##

    ## AQUI DEBERÁ IR LA AUTOMATIZACIÓN DE NOTIFICACION.


    ## CONTROL POSTERIOR

    Dado Tengo el tramite pendiente de asignar
    Cuando Inicio sesion en "NPTUrl" como "Coordinador"
    Entonces Puedo asignar el tramite a un funcionario legal y un funcionario tecnico

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "Pendiente de gesti"
    Entonces Puedo dar concepto "Aprobar agotamiento" al tramite
    Y Puedo ver todos los 8 documentos del tramite y la tarifa

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "En gesti"
    Entonces Puedo dar concepto "Aprobar agotamiento" al tramite
    Y Finalizo la gestion

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "documental"
    Entonces Puedo generar el documento del tramite tipo "agotamiento"

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "Pendiente de complementaci"
    Entonces Puedo complementar el documento del tramite

    Dado Inicio sesion en "NPTUrl" como "Coordinador"
    Cuando Tengo el tramite asignado con estado "Pendiente visto bueno"
    Entonces Puedo dar el visto bueno al tramite