# language: es

Característica: Inicio de sesión
  Como un usuario de la entidad cuando ingrese credenciales entonces ingreso al aplicativo.

  Antecedentes:
    Dados los datos del ambiente y usuarios del sistema

    @InicioSesionCredencialesCorrectas
  Escenario: Iniciar sesion con credenciales correctas
    Dado inicio sesion en el aplicativo
      Cuando ingreso las credenciales correctas
      Entonces puedo ver el dashboard del aplicativo


  @InicioSesionCredencialesIncorrectas
  Escenario: Iniciar sesion con credenciales correctas
    Dado inicio sesion en el aplicativo
    Cuando ingreso las credenciales incorrectas
    Entonces el sistema genera una alerta que contiene el texto "No es posible ingresar"
      
      