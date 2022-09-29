# language: es
@RegistrarVisitasMedicamentos
Característica: Registrar visitar de medicamentos
  Automatizacion  para validar el correcto funcionamento del registro de la visitas en SIVICOS

  Antecedentes:
    Dados los datos del ambiente y usuarios del sistema

  @RegistrarVisitasEmpresaNOInscritaMedicamentos
  Escenario: Registrar Visitas de Medicamentos con una Empresa No Inscrita
    Dado Inicio sesion en "SivicosUrl" como "Planeacion"
    Cuando Selecciono la opcion Sivicos en la barra lateral

    Dado Puedo registrar una visita de una empresa no inscrita de tipo producto "Medicamentos" con tipo de documento "NIT" y numero "123456123"
    Cuando Puedo agregar la informacion del registro de la visita con la razon "Toma de muestras" y clasificacion "Plan de visita"
    Y Puedo agregar la informacion del registro de la visita con el grupo "Biol" y el subgrupo "Anticuerpos"
    Y Puedo agregar la informacion del responsable de hacer la visita medicamentos
    Y El sistema genera un numero de visita
    Cuando Puedo agregar la informacion de antecedentes de tipo "PQRSD"
    #Y Puedo agregar los documentos asociados del grupo *
    Y Puedo buscar los productos que reportan registro sanitario del grupo "Cosm" y subgrupo "Capilares"
    Y Puedo agregar la informacion sobre la toma de muestras
    Y Puedo finalizar el registro de la visita

    Dado Tengo pendiente por revisar la visita
    Cuando Puedo seleccionar el Grupo de trabajo "Grupo de Riesgos" que revisa la visita
    Y Puedo seleccionar la visita para direccionarla

    Dado Puedo consolidar la visita del tipo de producto "Alimentos"
    Cuando Puedo observar el listado de visitas planeadas
    Y Puedo mover las visitas planeadas al listado visitas en espera
    Y Puedo direccionar la visita a programacion de visitas