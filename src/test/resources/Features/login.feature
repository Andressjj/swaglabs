# language: es

  @E2E

  Característica: Inicio de sesión
   Como un usuario de la entidad cuando ingrese credenciales entonces ingreso al aplicativo.

    Antecedentes:
      Dados los datos del ambiente y usuarios del sistema

    @InicioSesionInformationCorrect
    Escenario: Iniciar sesion con credenciales correctas
      Dado inicio sesion en el aplicativo
      Cuando ingreso las credenciales correcta usuario "standard_user"
      Cuando ingreso correctamente la contraseña "secret_sauce"
      Entonces puedo ingresar el dashboard del aplicativo
