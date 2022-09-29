# language: es

@BDDSanityCheck
Característica: Envio a sala por parte de funcionarios GASECR Invima Comision Revisora
  Estos escenarios automatizados realiza un recorrido por las principales funcionalidades para garantizar el funcionamiento de la gestión de tramites desde la bandeja del funcionario GASECR hasta la ejecución de salas.


  Antecedentes:
    Dados los datos del ambiente y usuarios del sistema

  @ANX013ConsultaTramiteRelacionado
  @tmsLink=Invima-882
  Escenario: Enviar una consulta con un tramite relacionado a salas.
    Dado  Inicio sesion como profesional CASECR
    Cuando Selecciono el tramite y lo envio como consulta
    Entonces Se muestra la pantalla de consultas para enviar el tramite

    Dado Tengo el tramite con radicado relacionado pendiente por enviar
    Cuando Diligencio todos los datos obligatorios
    Y Selecciono el nombre de la sala
    Entonces Se habilita el boton enviar

    Dado Necesito adjuntar un documento al tramite
    Cuando adjunto el documento
    Entonces Se muestra el documento en la tabla de documentos
    Y El sistema genera una alerta que contiene el texto Adjuntado

    Dado Tengo toda la informacion correcta
    Cuando Envio la solicitud a salas a traves del boton Enviar
    Entonces El sistema muestra una ventana emergente confirmando el envio a salas
    Y El funcionario recibe al correo electronico una notificacion con el numero de radicado


  @ANX010ConsultaSinTramiteRelacionado
  @tmsLink=Invima-882
  Escenario: Funcionario GASECR Envia una consulta sin tramite relacionado a salas.
    Dado  Inicio sesion como profesional CASECR
    Cuando Envio una consulta sin tramite relacionado
    Entonces Se muestra la pantalla de consultas para enviar el tramite

    Dado Tengo el tramite pendiente por enviar
    Cuando Diligencio todos los datos obligatorios
    Y Selecciono el nombre de la sala
    Entonces Se habilita el boton enviar

    Dado Necesito adjuntar un documento al tramite
    Cuando adjunto el documento
    Entonces Se muestra el documento en la tabla de documentos
    Y El sistema genera una alerta que contiene el texto Adjuntado

    Dado Tengo toda la informacion correcta
    Cuando Envio la solicitud a salas a traves del boton Enviar
    Entonces El sistema muestra una ventana emergente confirmando el envio a salas

    ##INICIO DE PANTALLAS ANY
    Dado Tengo un numero de radicado del envio a salas
    Y Ingreso a la consulta de trabajo agendado
    Cuando Realizo la busqueda del tramite
    Entonces Se muestra el tramite en estado En agendamiento

    Dado Tengo un tramite seleccionado
    Cuando Hago clic en el boton editar
    Entonces Se muestra un pop-up para editar el tramite

    Dado Selecciono una agenda Ordinaria lugar y comisionado
    Cuando Guardo la informacion con el boton Guardar
    Entonces El tramite se actualiza con la informacion ingresada

    Dado El tramite ya tiene mes agenda y comisionado
    Cuando Genero la agenda desde el menu de acciones
    Entonces El sistema descarga la agenda en formato Word
    Y Actualiza el estado del tramite a agendado

    Dado Necesito adjuntar la agenda modificada
    Cuando Hago clic en el boton de acciones adjuntar
  Entonces Se muestra un pop-up para adjuntar la agenda

  Dado Selecciono adjuntar agenda y adjunto un documento
  Cuando Guardo la informacion con el boton Enviar
  Entonces El sistema genera una alerta que contiene el texto Las notificaciones han sido enviadas correctamente.

  Dado Necesito exportar la agenda generada
  Cuando Hago clic en el boton de acciones Exportar
  Entonces Se muestra un pop-up para exportar los datos de la agenda

  Dado Selecciono la sala y mes de agendamiento
  Cuando Hago clic en el boton Exportar
  Entonces El sistema muestra en pantalla los datos y descarga el documento en formato PDF

    ## Inicio pantallas ANZ

  Dado Tengo un numero de radicado del envio a salas
    Y Ingreso a la ejeuccion de sala
    Cuando Realizo la busqueda del tramite
    Entonces Se muestra el tramite en estado Agendado

    Dado Selecciono el tramite
    Cuando Hago clic en el boton de accion Actualizar Estado
    Entonces Se muestra un pop-up para actualizar el concepto

    Dado Selecciono los datos obligatorios e ingreso una observacion
    Cuando Guardo la informacion a traves del boton Guardar
    Entonces Se actualiza el estado del tramite





