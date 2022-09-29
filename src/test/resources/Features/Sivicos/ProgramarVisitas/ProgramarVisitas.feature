# language: es
@ProgramarVisitasPrueba
Característica: Programar visitas prueba
  Automatizacion  para validar el correcto funcionamento de programar visitas en SIVICOS

  Antecedentes:
    Dados los datos del ambiente y usuarios del sistema

  @ProgramarVisitasCosmeticos
  Escenario: Programar visitas Cosmeticos
    * Tengo la variable "Radicado" con el valor "1111120222654"
    Dado Inicio sesion en "SivicosUrl" como "Programacion"
    Y Tengo una visita pendiente de programar en "Cosm"
    Cuando Programo la visita
    #Entonces Puedo gestionar comision o transporte
    #falta validar la firma
    Y Puedo generar el oficio comisorio

    Dado Inicio sesion en "SivicosUrl" como "Ejecucion"
    Cuando Ejecuto la visita
    Y Puedo diligenciar actas del grupo "Cosm" del subgrupo "Capilares" y tipo de acta "FM033"
    Y Puedo agregar los documentos asociados del grupo "Cosm"
    Entonces Puedo realizar el cierre de la visita

  @EjecutarVisitasCosmeticos
  Escenario: Ejecucion visitas
    Dado Inicio sesion en "SivicosUrl" como "Ejecucion"
    * Tengo la variable "Codigo Visita" con el valor "DCAPPHD2022000131"
    Cuando Ejecuto la visita
    Y Puedo diligenciar actas del grupo "Cosm" del subgrupo "Capilares" y tipo de acta "FM033"
    Y Puedo agregar los documentos asociados del grupo "Cosm"
    Y Puedo realizar el cierre de la visita

