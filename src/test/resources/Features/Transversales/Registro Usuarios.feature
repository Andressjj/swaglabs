# language: es
@Registro
Característica: Registros
  Estos escenarios automatizados realiza un recorrido por las principales funcionalidades para garantizar el funcionamiento del registro en Nueva plataforma de tramites.

  Antecedentes:
    Dados los datos del ambiente y usuarios del sistema

  @RegistroUsuarioNacional
  Escenario: Registro de usuario nacional
    Dado Necesito registrarme en la nueva plataforma de tramites como "GestorTramites"
    Cuando Ingreso todos los datos necesarios como usuario nacional
    Entonces El sistema me envia un correo con un link para confirmar el registro

    Dado Tengo un link de confirmacion de registro del "GestorTramites"
    Cuando Ingreso al link e ingreso una clave valida
    Entonces Quedo registrado correctamente en el sistema
    Y El sistema envia una notificacion al correo del "GestorTramites" confirmando el registro


  @RegistroEmpresaNacional
  Escenario: Registrar una empresa nacional
    Dado Inicio sesion en "NPTUrl" como "Representante"
    Y Necesito registrar una empresa nacional con Cedula numero "1193558070"
    Cuando Ingreso todos los datos de la inscripcion general
    Y Agrego los roles de la empresa
    Entonces La empresa queda registrada exitosamente
    Y El ciudadano recibe confirmacion de la creacion de la empresa
    Dado El sistema me envia un correo con un link para confirmar el registro
    Y Tengo un link de confirmacion de registro del "Representante"
    Cuando Ingreso al link e ingreso una clave valida
    Entonces Quedo registrado correctamente en el sistema
    Y Inicio sesion en "NPTUrl" como "Representante"
    Y El sistema envia una notificacion al correo del "Representante" confirmando el registro
    Dado El sistema me envia un correo con un link para confirmar el registro
    Y Tengo un link de confirmacion de registro del "GestorTramites"
    Cuando Ingreso al link e ingreso una clave valida
    Entonces Quedo registrado correctamente en el sistema
    Y Inicio sesion en "NPTUrl" como "Representante"
    Y El sistema envia una notificacion al correo del "GestorTramites" confirmando el registro


  @RegistroEmpresaExtranjera
  Escenario: Registrar una empresa extranjera
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    Y Necesito registrar una empresa extranjera
    Y Agrego el rol "Representante" a la empresa
    Y Actualizo los datos de los roles de la empresa extranjera
    Entonces La empresa queda registrada exitosamente
    Y El ciudadano recibe confirmacion de la creacion de la empresa
    Dado El sistema me envia un correo con un link para confirmar el registro
    Y Tengo un link de confirmacion de registro del "Representante"
    Cuando Ingreso al link e ingreso una clave valida
    Entonces Quedo registrado correctamente en el sistema
    Y Inicio sesion en "NPTUrl" como "Representante"
    Y El sistema envia una notificacion al correo del "Representante" confirmando el registro
    Dado El sistema me envia un correo con un link para confirmar el registro
    Y Tengo un link de confirmacion de registro del "GestorTramites"
    Cuando Ingreso al link e ingreso una clave valida
    Entonces Quedo registrado correctamente en el sistema
    Y Inicio sesion en "NPTUrl" como "Representante"
    Y El sistema envia una notificacion al correo del "GestorTramites" confirmando el registro


  @SanityCheckRegistros
  Escenario: Registro de usuario nacional
    Dado Necesito registrarme en la nueva plataforma de tramites como "GestorTramites"
    Cuando Ingreso todos los datos necesarios como usuario nacional
    Entonces El sistema me envia un correo con un link para confirmar el registro

    Dado Tengo un link de confirmacion de registro del "GestorTramites"
    Cuando Ingreso al link e ingreso una clave valida
    Entonces Quedo registrado correctamente en el sistema
    Y El sistema envia una notificacion al correo del "GestorTramites" confirmando el registro

    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    Y Necesito registrar una empresa nacional con NIT numero "900096732"
    Cuando Ingreso todos los datos de la inscripcion general
    Y Agrego los roles de la empresa
    Entonces La empresa queda registrada exitosamente
    Y El ciudadano recibe confirmacion de la creacion de la empresa
    Dado El sistema me envia un correo con un link para confirmar el registro
    Y Tengo un link de confirmacion de registro del "Representante"
    Cuando Ingreso al link e ingreso una clave valida
    Entonces Quedo registrado correctamente en el sistema
    Y Inicio sesion en "NPTUrl" como "Representante"
    Y El sistema envia una notificacion al correo del "Representante" confirmando el registro
    Dado El sistema me envia un correo con un link para confirmar el registro
    Y Tengo un link de confirmacion de registro del "GestorTramites"
    Cuando Ingreso al link e ingreso una clave valida
    Entonces Quedo registrado correctamente en el sistema
    Y Inicio sesion en "NPTUrl" como "Representante"
    Y El sistema envia una notificacion al correo del "GestorTramites" confirmando el registro
