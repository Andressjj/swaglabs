# language: es

  @AllScenarios
  Característica: Agregar varios productos al carrito
    Como usuario deseo agregar varios productos al carrito

  Antecedentes:
    Dados los datos del ambiente y usuarios del sistema

    @InicioSesionInformationCorrect
    Escenario: Iniciar sesion con credenciales correctas
      Dado inicio sesion en el aplicativo
      Cuando ingreso las credenciales correcta usuario "standard_user"
      Cuando ingreso correctamente la contraseña "secret_sauce"
      Entonces puedo ingresar el dashboard del aplicativo

    @AgregarNuevoProductCarritoCompras
    Escenario: Adicionar productos al carrito
      Dado inicio sesion en el aplicativo
      Cuando ingreso las credenciales correcta usuario "standard_user"
      Y ingreso correctamente la contraseña "secret_sauce"
      Entonces puedo ingresar el dashboard del aplicativo

      Dado Que tengo productos para agregar
      Cuando Agrego un producto en el carrito de compras
      Y Selecciono el carrito de compras
      Entonces Puedo ver el productos seleccionados en el carrito
