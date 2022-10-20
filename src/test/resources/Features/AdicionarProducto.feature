# language: es

  @AllScenarios
  Característica: Agregar varios productos al carrito
    Como usuario deseo agregar varios productos al carrito

  Antecedentes:
    Dados los datos del ambiente y usuarios del sistema

    @AgregarNuevoProductCarritoCompras
    Escenario: Adicionar productos al carrito y realizo Checkoy de los productos
      Dado inicio sesion en el aplicativo
      Cuando ingreso las credenciales correcta usuario "standard_user"
      Y ingreso correctamente la contraseña "secret_sauce"
      Entonces puedo ingresar el dashboard del aplicativo

      Dado Que tengo productos para agregar
      Cuando Agrego un producto en el carrito de compras
      Y Selecciono el carrito de compras
      Entonces Puedo ver el productos seleccionados en el carrito

      Dado Los productos para realizar el Checkout
      Cuando Realizado el Checkout
      Y ingreso primer nombre "Andres" y apellido "jimenez"
      Y como codigo postal "4722000"
      Entonces Puedo entonces ver la vision general del Checkout

      Dado Que puedo ver la descripcion del producto a comprar
      Cuando Finaliza la compra
      Y puedo ver la confirmacion de la compra
      Entonces Retorno al Home page del portal