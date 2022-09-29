# language: es
@FlujosAcciones
Característica: Acciones de diferentes flujos

  Antecedentes:
    Dados los datos del ambiente y usuarios del sistema

  @RsPUESPAccionesFlujo2
    Escenario: Realiza un RS en plaguicidas de uso en salud publica - Acciones flujo 2 validar. CONTROL POSTERIOR.
      # CONTROL POSTERIOR
    * Tengo la variable "Radicado" con el valor "20222007899"
    Dado Inicio sesion en "NPTUrl" como "Coordinador"
    Cuando Tengo el tramite pendiente de asignar
    Entonces Puedo asignar el tramite a un funcionario legal y un funcionario tecnico

      #Accion del ciudadano - Alcance de radicado
    Dado Inicio sesion en "NPTUrl" como "Representante"
    Cuando Tengo el tramite con estado "gesti"
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

  @RsPUESPAccionesFlujo2DesdeAsignoParaReparto
  Escenario: Realiza un RS en plaguicidas de uso en salud publica - Acciones flujo 2 validar. CONTROL POSTERIOR.
  # CONTROL POSTERIOR
    * Tengo la variable "Radicado" con el valor "20222007895"
    #Dado Inicio sesion en "NPTUrl" como "Coordinador"
    #Cuando Tengo el tramite pendiente de asignar
    #Entonces Puedo asignar el tramite a un funcionario legal y un funcionario tecnico

  #Accion del ciudadano - Alcance de radicado
    Dado Inicio sesion en "NPTUrl" como "Representante"
    Cuando Tengo el tramite con estado "Asignado"
    Entonces Puedo realizar una accion sobre el tramite
    Entonces Valido que se muestren las acciones y selecciono "Alcance al radicado"
      |Alcance al radicado|
      |Desistimiento|
    Cuando Adjunto el documento requerido "Anexos"
    Entonces Puedo radicar el tramite

    Dado Inicio sesion en "NPTUrl" como "Coordinador"
    Cuando Tengo el tramite pendiente de asignar
    Entonces Puedo asignar el tramite a un funcionario legal y un funcionario tecnico

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


  @RSNuevoPlaguicidasUsoSaludPublicaFlujo1
  Escenario: Realiza un RS nuevo de plaguicidas de uso en salud publica con diferentes acciones
  Solitud de prorroga, responder requerimiento, interponer recurso de reposicion, solicitud de correccion y solicitud
  de revocatoria desde asignar a los roles

  #* Limpiar la variable Expediente

  # Control posterior
    * Tengo la variable "Radicado" con el valor "20222007891"

    Dado Inicio sesion en "NPTUrl" como "Coordinador"
    Cuando Tengo el tramite pendiente de asignar
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
