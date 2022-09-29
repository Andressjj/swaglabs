# language: es

Característica: Tramite de notificacion sanitaria nueva en cosmeticos y sus tramites asociados al expediente.
  Se realiza la radicacion de los trámites, pago, estudio y demás validaciones con escenarios positivos.

  Antecedentes:
    Dados los datos del ambiente y usuarios del sistema

    @RegistroSanitarioBeta
  Escenario: Registro sanitario nuevo en plaguicidas de uso en salud publica.
    Dado Inicio sesion en "NPTUrl" como "GestorTramites"
    Y Necesito registrar un tramite nuevo de "Cosméticos, Aseo, Plaguicidas y Productos de Higiene Doméstica"
    Cuando Selecciono la categoria "Registro Sanitario" y el grupo "Plaguicidas de Uso en Salud Pública"
    Y Selecciono el tipo de tramite "Registro Sanitario Nuevo"
    Entonces Se muestra la pantalla para asociar una empresa al tramite
    Y Se muestran las tarifas correspondientes al tramite
      | 3006  |
      | 90093 |