# language: es
@RegistrarVisitasCosmeticosCrearEmpresaNoInscrita
@AllRegistrarVisitasCosmeticos
Característica: Registrar visitas de cosmeticos creando una empresa no inscrita
  Automatizacion  para validar el correcto funcionamento del registro de la visitas en SIVICOS

  Antecedentes:
    Dados los datos del ambiente y usuarios del sistema

  @RegistrarVisitasCrearEmpresaNoInscritaCosmeticos
  Escenario: Registrar Visitas de Cosmeticos Creando una Empresa No Inscrita - Plan visita - Revisa - Consolida - Programa
    Dado Inicio sesion en "SivicosUrl" como "Planeacion"
    Cuando Selecciono la opcion Sivicos en la barra lateral
    Dado Puedo crear una empresa no inscrita con "ciudadan" de numero "1002321155" de la misional "Cosm"
