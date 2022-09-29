# language: es
@Instancias
Característica: Crear Instancias para reautilizar.
  Estos escenarios automatizados realiza un recorrido por las principales funcionalidades para garantizar el funcionamiento de Nueva plataforma de tramites.


  Antecedentes:
    Dados los datos del ambiente y usuarios del sistema


  @InstanciaRSNuevoPlaguicidasUsoDomesticoAOC
  Escenario: Realiza un registro sanitario nuevo en plaguicidas de uso domestico Hasta Firmar pendiente OAC
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    Y Necesito registrar un tramite nuevo de "Cosméticos, Aseo, Plaguicidas y Productos de Higiene Doméstica"
    Cuando Selecciono la categoria "Registro Sanitario" y el grupo "Plaguicidas de Uso en Salud Pública"
    Y Selecciono el tipo de tramite "Registro Sanitario Nuevo"
    Entonces Se muestra la pantalla para asociar una empresa al tramite
    Y Se muestran las tarifas correspondientes al tramite
    |3006|
    |90093|

  @PagoPorGiroInternacional
  Escenario: Realiza el pago por giro internacional
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


  @InstanciaRSNuevoPlaguicidasUsoDomesticoPendientePago
  Escenario: Realiza un registro sanitario nuevo en plaguicidas de uso domestico Pendiente de pago
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    Y Necesito registrar un tramite nuevo de "Cosméticos, Aseo, Plaguicidas y Productos de Higiene Doméstica"
    Cuando Selecciono la categoria "Registro Sanitario" y el grupo "Plaguicidas de Uso Doméstico"
    Y Selecciono el tipo de tramite "Registro Sanitario Nuevo"
    Y Selecciono la modalidad "Fabricar y Vender"
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



  @InstanciaRSNuevoPlaguicidasUsoDomesticoControlPosteriorAsignar
  Escenario: Realiza un registro sanitario nuevo en plaguicidas de uso domestico Hasta Radicar Pendiente CP
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    Y Necesito registrar un tramite nuevo de "Cosméticos, Aseo, Plaguicidas y Productos de Higiene Doméstica"
    Cuando Selecciono la categoria "Registro Sanitario" y el grupo "Plaguicidas de Uso Doméstico"
    Y Selecciono el tipo de tramite "Registro Sanitario Nuevo"
    Y Selecciono la modalidad "Fabricar y Vender"
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

  @InstanciaRSNuevoPlaguicidasUsoDomesticoConceptosCP
  Escenario: Realiza un registro sanitario nuevo en plaguicidas de uso domestico.
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    Y Necesito registrar un tramite nuevo de "Cosméticos, Aseo, Plaguicidas y Productos de Higiene Doméstica"
    Cuando Selecciono la categoria "Registro Sanitario" y el grupo "Plaguicidas de Uso Doméstico"
    Y Selecciono el tipo de tramite "Registro Sanitario Nuevo"
    Y Selecciono la modalidad "Fabricar y Vender"
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

    Cuando Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Dado Tengo el tramite asignado con estado "En gesti"
    Entonces Puedo dar concepto "Requerir" al tramite
    Y Finalizo la gestion

  @NSOCosmeticosNuevaRequerir
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

    Cuando Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Dado Tengo el tramite asignado con estado "En gesti"
    Entonces Puedo dar concepto "Requerir" al tramite
    Y Finalizo la gestion

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "Asignado para gesti"
    Entonces Puedo generar el documento del tramite tipo "requerimiento"


  @NSOCosmeticosNuevaHastaCP
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
      |Especificaciones microbiologicas|
      |Especificaciones organol|
      |Etiqueta|
      #Pendiente revision del documento adjuntado - mantis 6903
      |Proyecto de etiqueta|
      |Sistema de loteado|
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


  @RSNuevoPlaguicidasUsoSaludPublicaHastaConceptosCP
  Escenario: Realiza un registro sanitario nuevo en plaguicidas de uso en salud publica.
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

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "Pendiente de gesti"
    Entonces Puedo dar concepto "Aprobar" al tramite
    Y Puedo ver todos los 4 documentos del tramite y la tarifa

    Cuando Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Dado Tengo el tramite asignado con estado "En gesti"
    Entonces Puedo dar concepto "Aprobar" al tramite
    Y Finalizo la gestion




  @Pruebadaci
  @tmsLink=InvNP-174
  Escenario: Realiza un registro sanitario nuevo en plaguicidas de uso en salud publica.
    * Tengo la variable "Radicado" con el valor "20222007918"

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "En genera"
    Entonces Puedo generar el documento del tramite tipo "Comunica"


  @RSNuevoPlaguicidasUsoSaludPublicaHastaPendienteDePagoSinRadicar
  Esquema del escenario: Outline: Realiza un registro sanitario nuevo en plaguicidas de uso en salud publica hasta antes de radicar
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
    Ejemplos: :
      | n |
      | 1 |



  @RSNuevoPlaguicidasUsoSaludPublicaDesdeControlPosterior
  Escenario: Realiza un registro sanitario nuevo en plaguicidas de uso en salud publica hasta antes de radicar
    * Tengo la variable "Radicado" con el valor "20222005801"

    Dado Inicio sesion en "NPTUrl" como "ProfesionalTecnico"
    Cuando Tengo el tramite asignado con estado "Pendiente de gesti"
    Entonces Puedo dar concepto "Aprobar" al tramite
    Y Puedo ver todos los 4 documentos del tramite y la tarifa

    Cuando Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Dado Tengo el tramite asignado con estado "En gesti"
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


  @CertificacionSinRsHastaAsignar
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


  @NSOProductosDeHigieneDomesticaNuevaHastaAsignarEnCP
  Escenario: Notificacion Sanitaria Obligatoria Nueva en productos de higiene domestica.
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    Y Necesito registrar un tramite nuevo de "Cosméticos, Aseo, Plaguicidas y Productos de Higiene Doméstica"
    Cuando Selecciono la categoria "Sanitaria Obligatoria" y el grupo "Productos de Higiene Doméstica"
    Y Selecciono el subgrupo "Ambientadores"
    Y Selecciono el tipo de tramite "Sanitaria Obligatoria"
    Entonces Se muestra la pantalla para asociar una empresa al tramite
    Y Se muestran las tarifas correspondientes al tramite
      |3010|

    Dado Asocio una empresa nacional
    Cuando Selecciono una sucursal
    Entonces Se muestra la informacion de la empresa y el representante legal

    Dado Necesito ingresar los roles
       Cuando Valido que se muestren los roles y selecciono el rol "Fabricante"
    |Fabricante|
    |Maquilador|
    |Envasador|
    |Empacador|
    |Acondicionador|
    |Importador|
    |Responsable de la comercialización|
    Entonces Se visualiza el rol en la tabla de informacion de roles

    Dado Necesito agregar un certificado tipo "Certificado" a un rol
    Cuando Agrego el certificado
    Entonces Puedo visualizar el documento cargado

    Dado Necesito agregar un medio de notificacion
    Cuando Selecciono el tipo de notificacion por correo
    Entonces Puedo continuar a la pantalla tecnica

    Dado Necesito registrar la informacion general del producto
    Cuando Ingreso toda la informacion de la pantalla tecnica NSO Aseo
    Entonces Puedo ingresar la documentacion requerida

    Dado Necesito ingresar toda la documentacion requerida
    Cuando Valido que se muestren los documentos obligatorios y los agrego
    |Especificaciones organol|
    |Sistema de loteado|
    |Etiqueta|
    #Pendiente revision del documento adjuntado - mantis 6903
    |Proyecto de etiqueta|
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
    ##

    ## AQUI DEBERÁ IR LA AUTOMATIZACIÓN DE NOTIFICACION.


    ## CONTROL POSTERIOR

    Dado Tengo el tramite pendiente de asignar
    Cuando Inicio sesion en "NPTUrl" como "Coordinador"
    Entonces Puedo asignar el tramite a un funcionario legal y un funcionario tecnico



  @NSOCosmeticosNuevaPendienteDePago
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


  @AutorizacionPublicidadPendiente
  @tmsLink=InvNP-146
  Escenario: Autorizacion de publicidad grupo Uso domestico
  #  * Tengo la variable "Expediente" con el valor "R000001210
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

  @AutorizacionPublicidadPendiente
  Escenario: Autorizacion de publicidad grupo Uso en salud publica
  #  * Tengo la variable "Expediente" con el valor "R000002452
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    Y Necesito registrar un tramite nuevo de "Cosméticos, Aseo, Plaguicidas y Productos de Higiene Doméstica"
    Cuando Selecciono la categoria "Publicidad" y el grupo "Uso en Salud"
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
  @Pruebita
  Escenario: Prueba de cualquier cosa
    * Tengo la variable "Radicado" con el valor "20222007829"
     #Accion del ciudadano - Solicitud de prorroga
    Dado Inicio sesion en "NPTUrl" como "Representante"
    Cuando Tengo el tramite con estado "En requerimiento"
    Entonces Puedo realizar una accion sobre el tramite
    Entonces Valido que se muestren las acciones y selecciono "Solicitud de Prórroga requerimiento"
      |Solicitud de Pr|
      |Responder requeri|


  @ObteneridTramite
  Escenario: Consultar el id de cualquier tramite con el numero de radicado.
    Cuando Necesito el id tramite del radicado "20222007261"


  @NSOCosmeticosNuevaScroll
  Escenario: Certificado de Exclusiva Exportacion Cosmeticos
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    Y Necesito registrar un tramite nuevo de "Cosméticos, Aseo, Plaguicidas y Productos de Higiene Doméstica"
    Cuando Selecciono la categoria "Sanitaria Obligatoria" y el grupo "Cosméticos"
    Y Selecciono el tipo de tramite "Certificado de Exclusiva"
    Entonces Se muestra la pantalla para asociar una empresa al tramite
    Y Se muestran las tarifas correspondientes al tramite
      |4002-3|

    Dado Asocio una empresa nacional
    Cuando Selecciono una sucursal
    Entonces Se muestra la informacion de la empresa y el representante legal

    Dado Necesito agregar un medio de notificacion
    Cuando Selecciono el tipo de notificacion por correo
    Entonces Puedo continuar a la pantalla tecnica
    Y Ingreso toda la informacion de la pantalla tecnica Certificado De Exclusiva Exportación

  @RSNuevoPlaguicidasUsoDomesticoHastaAsignar
  Esquema del escenario: Outline: Realiza un registro sanitario nuevo en plaguicidas de uso domestico.
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    Y Necesito registrar un tramite nuevo de "Cosméticos, Aseo, Plaguicidas y Productos de Higiene Doméstica"
    Cuando Selecciono la categoria "Registro Sanitario" y el grupo "Plaguicidas de Uso Doméstico"
    Y Selecciono el tipo de tramite "Registro Sanitario Nuevo"
    Y Selecciono la modalidad "Fabricar y Vender"
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

    Ejemplos:
    |n|
    |1|

  @InicioDeSecion
  Esquema del escenario: Iniciar secion con todos los usuarios
    Dado Inicio sesion en "NPTUrl" como "<Usuario>"

    Ejemplos:
    |Usuario|
    |GestorTramites|
    |RepresentanteLegal|



    @FastNSOAutomatico
    Esquema del escenario: Notificacion Sanitaria Obligatoria Nueva en cosmeticos.
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
      Entonces Puedo ver la informacion del tramite en un PopUp

      Dado Inicio sesion en "NPTUrl" como "Representante"
      Cuando Tengo la solicitud asignada con estado "Pendiente de firma"
      Entonces Puedo ver la informacion del tramite en un PopUp
      Cuando Solicito firmar el documento
      Entonces Obtengo el codigo de confirmacion OTP

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

      Ejemplos:
      |n|
      |1|
      |1|

@GenerarRadicadosRSNuevoSaludPublica
Escenario: Genera radicados de RS Nuevo de Salud publica
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

@NSOCosmeticosHastaAsignar
Escenario: Notificacion Sanitaria Obligatoria Nueva en cosmeticos Hasta radicar.
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
  Entonces realizo el pago del tramite y radico el tramite
  Y El sistema genera el numero de radicado y numero de expediente

  @RSNuevoPlaguicidasUsoDomesticoHastaGenerarDoc

  Escenario: Realiza un registro sanitario nuevo en plaguicidas de uso domestico hasta radicar.
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


  @RenovacionDelSanitarioNuevoPUDAccionDesistimiento
  Escenario: Renovacion del registro sanitario plaguicidas de uso domestico
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    * Tengo la variable "Expediente" con el valor "R000003732"
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
    #Y Simulo la Notificacion del RPA
#Accion del ciudadano - Desistimiento
    Dado Inicio sesion en "NPTUrl" como "Representante"
    Cuando Tengo el tramite con estado "Asignado para reparto"
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

    #Dado Inicio sesion en "NPTUrl" como "Coordinador"
    #Cuando Tengo el tramite asignado con estado "Pendiente visto bueno"
    #Entonces Puedo dar el visto bueno al tramite

  @EnviarFirma
  Escenario: Se envia a firma
    * Tengo la variable "Radicado" con el valor "20222007942"
        ##Notificacion

    Y Simulo la Notificacion del RPA


  @ModificacionDelRSUsoDomesticoSolicitudRevocatoria
  Escenario: Modificacion del registro sanitario plaguicidas de uso domestico
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    * Tengo la variable "Expediente" con el valor "R000003597"
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
    Entonces Puedo dar concepto "Requerir" al tramite
    Y Puedo ver todos los 5 documentos del tramite y la tarifa

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "En gesti"
    Entonces Puedo dar concepto "Requerir" al tramite
    Y Finalizo la gestion

    Dado Inicio sesion en "NPTUrl" como "ProfesionalLegal"
    Cuando Tengo el tramite asignado con estado "Asignado para gesti"
    Entonces Puedo generar el documento del tramite tipo "Auto"

    Dado Inicio sesion en "NPTUrl" como "Coordinador"
    Cuando Tengo el tramite asignado con estado "Pendiente visto bueno"
    Entonces Puedo dar el visto bueno al tramite

    Dado Inicio sesion en "NPTUrl" como "Notificador"
    Cuando Tengo el tramite en notificacion "Pendiente de firma"
    Entonces Puedo firmar el documento para la notificacion
