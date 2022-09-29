# language: es
@SanityCheck
@AllScenarios
@RS
Característica: Registro Sanitario Uso Domestico
  Automatizacion  para validar el correcto funcionamento del tramite.

  Antecedentes:
    Dados los datos del ambiente y usuarios del sistema

  @RSNuevoPlaguicidasUsoDomestico
  @RegistroSanitario2
  Escenario: Realiza un registro sanitario nuevo en plaguicidas de uso domestico.
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    Y Necesito registrar un tramite nuevo de "Cosméticos, Aseo, Plaguicidas y Productos de Higiene Doméstica"
    Cuando Selecciono la categoria "Registro Sanitario" y el grupo "Plaguicidas de Uso Doméstico"
    Y Selecciono el tipo de tramite "Registro Sanitario Nuevo"
    Y Valido que se muestren las modalidades y selecciono "Fabricar y Vender"
    |Fabricar y Vender|
    |Fabricar y Exportar|
    |Importar y Vender|
    |Importar, Envasar y Vender|
    |Importar, Semielaborar y Vender|
    |Semielaborar y Exportar|
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
    |Acondicionador|
    Entonces Se visualiza el rol en la tabla de informacion de roles

    Dado Necesito agregar un certificado tipo "Certificado" a un rol
    Cuando Agrego el certificado
    Entonces Puedo visualizar el documento cargado

    Dado Necesito agregar un medio de notificacion
    Cuando Selecciono el tipo de notificacion por correo
    Entonces Puedo continuar a la pantalla tecnica

    Dado Necesito registrar la informacion general del producto
    Cuando Ingreso toda la informacion de la pantalla tecnica Plaguicidas de uso domestico
    Entonces Puedo ingresar la documentacion requerida

    Dado Necesito ingresar toda la documentacion requerida
    Cuando Valido que se muestren los documentos obligatorios y los agrego
      |dotos y modo de empleo|
      |Concepto toxico|
      |envase y/o acondicionamiento|
      |Datos pruebas subagudas|
      |Datos sobre la toxicidad|
      |El proyecto de ficha|
      |Especificaciones de calidad del producto|
      |Estudios de estabilidad|
      |Etiqueta|
      |estructural de los ingredientes activos|
      |ticas en muestras bio|
      |Proceso de fabricaci|
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
    Cuando Tengo el tramite asignado con estado "gesti"
    Entonces Puedo generar el documento del tramite tipo "Resoluci"

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "Pendiente de complementaci"
    Entonces Puedo complementar el documento del tramite

    Dado Inicio sesion en "NPTUrl" como "Coordinador"
    Cuando Tengo el tramite asignado con estado "Pendiente visto bueno"
    Entonces Puedo dar el visto bueno al tramite

    ## AQUI DEBERÁ IR LA AUTOMATIZACIÓN DE NOTIFICACION.


  @CVLCosmeticosRSUsoDomesticoAsociadoAlExpediente
  @CertificadosVentaLibreRS
  @tmsLink=InvNP-215
  Escenario:  CVL RS Plaguicidas de Uso Domestico Asociado al expediente
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    Y Necesito registrar un tramite asociado a un expediente
    Y Selecciono el tipo de tramite "CVL Auto"
    Entonces Se muestra la pantalla para asociar una empresa al tramite
    Y Se muestran las tarifas correspondientes al tramite
      |4002-4|

    Entonces Puedo continuar a la pantalla tecnica
    Cuando Ingreso toda la informacion de la pantalla tecnica CVL Automatico uso domestico
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

    #Y realizo el pago del tramite y radico el tramite
    #Entonces El sistema genera el numero de radicado y numero de expediente

    #Validar que llegue el correo con el documento adjunto y el numero de solicitud.
    #Queda pendiente mirar el click en el boton visualizar documento en la pantalla tecnica

  @AutorizacionConRsPUD
  Escenario: Autorizacion con Registro sanitario Plaguicidas de Uso domestico
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    Cuando Necesito registrar un tramite asociado a un expediente
    Y Selecciono el tipo de tramite "Autorizaci"
    Entonces Se muestra la pantalla para asociar una empresa al tramite
    Y Se muestran las tarifas correspondientes al tramite
      |4002-5|
    Entonces Puedo continuar a la pantalla tecnica

    Dado Necesito registrar la informacion general del producto
    Cuando Ingreso toda la informacion de la pantalla tecnica Autorizacion con RS Plaguicidas
    Entonces Puedo ingresar la documentacion requerida

    Dado Necesito ingresar toda la documentacion requerida
    Cuando Valido que se muestren los documentos obligatorios y los agrego
    |Etiqueta complementaria|
    |Documento|
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



  @CertificacionConRSPUD
  Escenario: Certificacion con Registro Sanitario Plaguicidas Uso Domestico
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    # * Tengo la variable "Expediente" con el valor "R000003607"
    Cuando Necesito registrar un tramite asociado a un expediente
    Y Selecciono el tipo de tramite "con Registro Sanitario"
    Y Valido que se muestren las modalidades y selecciono "Fabricar y Vender"
      |Fabricar y Vender|
      |Fabricar y Exportar|
      |Importar y Vender|
      |Importar, Envasar y Vender|
      |Importar, Semielaborar y Vender|
      |Semielaborar y Exportar|
    Entonces Se muestra la pantalla para asociar una empresa al tramite
    Y Se muestran las tarifas correspondientes al tramite
      |4002-2|
    Entonces Puedo continuar a la pantalla tecnica

    Cuando Ingreso toda la informacion de la pantalla tecnica Certificacion con RS Plaguicidas
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

    Dado Inicio sesion en "NPTUrl" como "Representante"
    Cuando Tengo la solicitud asignada con estado "Pendiente de pago"
    Y realizo el pago del tramite y radico el tramite
    Entonces El sistema genera el numero de radicado y numero de expediente
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



  @ModificacionDelRSUsoDomestico
  Escenario: Modificacion del registro sanitario plaguicidas de uso domestico
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
   #* Tengo la variable "Expediente" con el valor "R000002871"
    Y Necesito registrar un tramite asociado a un expediente
    Cuando Selecciono el tipo de tramite "Modificaci"
    Y Valido que se muestren las modalidades y selecciono "Fabricar y Vender"
      |Fabricar y Vender|
      |Fabricar y Exportar|
      |Importar y Vender|
      |Importar, Envasar y Vender|
      |Importar, Semielaborar y Vender|
      |Semielaborar y Exportar|
    Entonces Se muestra la pantalla para asociar una empresa al tramite
    Y Se muestran las tarifas correspondientes al tramite
      |4001|
    Y Ingreso toda la informacion de la pantalla Informacion de la modificacion RS

    Dado Asocio una empresa con Cedula "1024589913"
    Cuando Selecciono una sucursal
    #Entonces Se muestra la informacion de la empresa y el representante legal

    Dado Necesito modificar el rol
    Cuando Selecciono el rol y lo modifico con cedula "1024589913"
    Entonces Se visualiza el rol en la tabla de informacion de roles

    #7294
    #Dado Necesito agregar un certificado tipo "Licencia sanitaria" a un rol
    #Cuando Agrego el certificado
    #Entonces Puedo visualizar el documento cargado
    Y Puedo continuar a la pantalla tecnica

    Dado Necesito registrar la informacion general del producto
    Cuando Ingreso la informacion modificada de la pantalla tecnica Modificacion del RS PUD
    Entonces Puedo ingresar la documentacion requerida

    Dado Necesito ingresar toda la documentacion requerida
    Cuando Valido que se muestren los documentos obligatorios y los agrego
      |Concepto|
      |Etiquetas|
      |que respalde|
      |soporte que justifica|
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
    Y Puedo ver todos los 5 documentos del tramite y la tarifa

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


  @AutorizacionDePublicidadUsoDomestico
  @AutorizacionPublicidad
  @tmsLink=InvNP-146
  Escenario: Autorizacion de publicidad grupo Uso domestico
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    Y Necesito registrar un tramite nuevo de "Cosméticos, Aseo, Plaguicidas y Productos de Higiene Doméstica"
    Cuando Selecciono la categoria "Publicidad" y el grupo "Uso Dom"
    Y Selecciono el tipo de tramite "Publicidad"
    Entonces Se muestra la pantalla para asociar una empresa al tramite
    Y Se muestran las tarifas correspondientes al tramite
      |4004-1|
      |4004-2|
      |4004-3|

    Dado Asocio una empresa nacional
    Cuando Selecciono una sucursal
    Entonces Se muestra la informacion de la empresa y el representante legal

    Dado Necesito agregar un medio de notificacion
    Cuando Selecciono el tipo de notificacion por correo
    Entonces Puedo continuar a la pantalla tecnica
    Y Ingreso toda la informacion de la pantalla tecnica Autorizacion de Publicidad
    Entonces Puedo ingresar la documentacion requerida

    Dado Necesito ingresar toda la documentacion requerida
    Cuando Valido que se muestren los documentos obligatorios y los agrego
    |Original a color|
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
    Entonces El sistema genera el numero de radicado y numero de expediente no asociado

    Dado Tengo el tramite pendiente de asignar
    Cuando Inicio sesion en "NPTUrl" como "Coordinador"
    Entonces Puedo asignar el tramite a un funcionario legal y un funcionario tecnico

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "Pendiente de gesti"
    Entonces Puedo dar concepto "Aprobar" al tramite
    Y Puedo ver todos los 3 documentos del tramite y la tarifa

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "En gesti"
    Entonces Puedo dar concepto "Aprobar" al tramite
    Y Finalizo la gestion

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "Asignado para gesti"
    Entonces Puedo generar el documento del tramite tipo "publicidad plaguicidas"

  @VoBoExclusionIVAUsoDomestico
  @VoBoExclusionIVA
  Escenario: Realiza un VoBo Exclusion IVA en plaguicidas de uso en salud publica.
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    Y Necesito registrar un tramite nuevo de "Cosméticos, Aseo, Plaguicidas y Productos de Higiene Doméstica"
    Cuando Selecciono la categoria "Vo.Bo. Exclu" y el grupo "Plaguicidas de Uso Doméstico"
    Y Selecciono el tipo de tramite "Vo.Bo. Exclu"
    Entonces Se muestra un PopUp de confirmacion que contiene el texto "IVA"
    Y Se muestra la pantalla para asociar una empresa al tramite
    Y Se muestran las tarifas correspondientes al tramite
      |4045|

    Dado Asocio una empresa nacional
    Cuando Selecciono una sucursal
    Entonces Se muestra la informacion de la empresa y el representante legal
    Y Puedo ver la seccion de apoderado
    Y No debo ver la seccion de director tecnico

    Dado Necesito agregar un medio de notificacion
    Cuando Selecciono el tipo de notificacion por correo
    Entonces Puedo continuar a la pantalla tecnica

    Dado Necesito registrar la informacion general del producto
    Cuando Ingreso toda la informacion de la pantalla tecnica VoBo Exclusion IVA
    Entonces Puedo firmar la lista de materias primas con revisor fiscar o contador

    Dado Inicio sesion en "NPTUrl" como "RevisorFiscal"
    Cuando Tengo la solicitud asignada con estado "Pendiente Firma Revisor fiscal o contador"
    Cuando Solicito firmar la lista de materias primas
    Entonces El funcionario recibe al correo electronico un codigo de confirmacion

    Dado Tengo un codigo de confirmacion para firmar el documento
    Cuando Ingreso el codigo de confirmacion y firmo el documento

    Dado Inicio sesion en "NPTUrl" como "Representante"
    Cuando Tengo la solicitud asignada con estado "Pendiente Firma"
    Entonces Puedo visualizar la informacion general de la tarifa

    Dado Necesito visualizar la informacion del tramite
    Cuando Guardo la informacion
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
    Entonces El sistema genera el numero de radicado y numero de expediente no asociado

    ## CONTROL POSTERIOR

    Dado Tengo el tramite pendiente de asignar
    Cuando Inicio sesion en "NPTUrl" como "Coordinador"
    Entonces Puedo asignar el tramite a un funcionario legal y un funcionario tecnico

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "Pendiente de gesti"
    Entonces Puedo dar concepto "Aprobar" al tramite
    Y Puedo ver todos los 4 documentos del tramite y la tarifa

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "En gesti"
    Entonces Puedo dar concepto "Aprobar" al tramite
    Y Finalizo la gestion

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "gesti"
    Entonces Puedo generar el documento del tramite tipo "IVA"

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "Pendiente de complementaci"
    Entonces Puedo complementar el documento del tramite

    Dado Inicio sesion en "NPTUrl" como "Coordinador"
    Cuando Tengo el tramite asignado con estado "Pendiente visto bueno"
    Entonces Puedo dar el visto bueno al tramite

      ## NOTIFICACIÓN.

    Dado Inicio sesion en "NPTUrl" como "Notificador"
    Cuando Tengo el tramite en notificacion "Pendiente de firma"
    Entonces Puedo firmar el documento para la notificacion

  @RenovacionDelSanitarioNuevoPUD
  Escenario: Renovacion del registro sanitario plaguicidas de uso domestico
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    #* Tengo la variable "Expediente" con el valor "R000003629"
    Y Necesito registrar un tramite asociado a un expediente
    Cuando Selecciono el tipo de tramite "Renovaci"
    Y Valido que se muestren las modalidades y selecciono "Fabricar y Vender"
      |Fabricar y Vender|
      |Fabricar y Exportar|
      |Importar y Vender|
      |Importar, Envasar y Vender|
      |Importar, Semielaborar y Vender|
      |Semielaborar y Exportar|
    Entonces Se muestra la pantalla para asociar una empresa al tramite
    Y Se muestran las tarifas correspondientes al tramite
     |3006|
     |90093|
    Dado Puedo continuar a la pantalla tecnica
    Cuando Ingreso toda la informacion de la pantalla tecnica Renovación del Registro Sanitario
    Entonces Puedo ingresar la documentacion requerida

    Dado Necesito ingresar toda la documentacion requerida
    Cuando Valido que se muestren los documentos obligatorios y los agrego
      |Etiqueta|
      |Características de la intoxicación, medidas, antídotos y modo de empleo|
      |Concepto toxicológico|
      |Contrato de fabricación, envase y/o acondicionamiento|
      |Datos pruebas subagudas y cornicas y efectos|
      |Datos sobre la toxicidad aguda|
      |El proyecto de ficha de información toxicológica|
      |Especificaciones de calidad del producto|
      |Estudios de estabilidad|
      |Formula estructural de los ingredientes activos|
      |Los métodos y técnicas analíticas en muestras biológicas|
      |Proceso de fabricación|
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
    Entonces Puedo generar el documento del tramite tipo "Resoluci"

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "Pendiente de complementaci"
    Entonces Puedo complementar el documento del tramite

    Dado Inicio sesion en "NPTUrl" como "Coordinador"
    Cuando Tengo el tramite asignado con estado "Pendiente visto bueno"
    Entonces Puedo dar el visto bueno al tramite

    #NOTIFICACION

    Dado Inicio sesion en "NPTUrl" como "Notificador"
    Cuando Tengo el tramite en notificacion "Pendiente de firma"
    Entonces Puedo firmar el documento para la notificacion