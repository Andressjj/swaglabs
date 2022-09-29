# language: es
@RegistrarVisitasAlimentos
Característica: Registrar visitar de alimentos
  Automatizacion  para validar el correcto funcionamento del registro de la visitas en SIVICOS

  Antecedentes:
    Dados los datos del ambiente y usuarios del sistema

  @RegistrarVisitasEmpresaNOInscritaAlimentos
  Escenario: Registrar Visitas de Alimentos con una Empresa No Inscrita
    Dado Inicio sesion en "SivicosUrl" como "Planeacion"
    Cuando Selecciono la opcion Sivicos en la barra lateral

    Dado Puedo registrar una visita de una empresa no inscrita de tipo producto "Alimentos" con tipo de documento "NIT" y numero "123444"
    Cuando Puedo agregar la informacion del registro de la visita con la razon "Toma de muestras" y clasificacion "Plan de visita"
    Y Puedo agregar la informacion del registro de la visita con el grupo "Bebidas alcoh" y el subgrupo "Generales"
    Y Puedo agregar la informacion del responsable de hacer la visita "Registros" en la misional Alimentos
    Y El sistema genera un numero de visita
    Cuando Puedo agregar la informacion de antecedentes de tipo "PQRSD"
    Y Puedo agregar los documentos asociados del grupo "Leche"
    Y Puedo buscar los productos que reportan registro sanitario del grupo "Leche" y subgrupo "Huevo"
    Y Puedo agregar la informacion sobre la toma de muestras
    Y Puedo finalizar el registro de la visita

    Dado Tengo pendiente por revisar la visita
    Cuando Puedo seleccionar el Grupo de trabajo "Grupo de Riesgos" que revisa la visita
    Y Puedo seleccionar la visita para direccionarla

    Dado Puedo consolidar la visita del tipo de producto "Alimentos"
    Cuando Puedo observar el listado de visitas planeadas
    Y Puedo mover las visitas planeadas al listado visitas en espera
    Y Puedo direccionar la visita a programacion de visitas

  @RegistrarVisitasAlimentosCrearEmpresaNoInscritaAlimentos
  Escenario: Registrar Visitas de Alimentos CreYo una Empresa No Inscrita
    Dado Inicio sesion en "SivicosUrl" como "Alimentos"
    Cuando Selecciono la opcion Sivicos en la barra lateral

    Dado Puedo crear una empresa no inscrita con "ciudadan" de numero "100232115" de la misional "Alimentos"
    Cuando Puedo agregar la informacion del registro de la visita con la razon "Toma de muestras" y clasificacion "Plan de visita"
    Y Puedo agregar la informacion del registro de la visita con el grupo "Bebidas alcoh" y el subgrupo "Generales"
    Y El sistema genera un numero de visita
    Cuando Puedo agregar la informacion de antecedentes de tipo "PQRSD"
    Y Puedo agregar los documentos asociados del grupo "Leche"
    Y Puedo buscar los productos que reportan registro sanitario del grupo "Leche" y subgrupo "Huevo"
    Y Puedo agregar la informacion sobre la toma de muestras
    Y Puedo finalizar el registro de la visita

  @RegistrarVisitasAlimentosEmpresaInscritaAlimentos
  Escenario: Registrar Visitas de Alimentos con una Empresaa Inscrita
    Dado Inicio sesion en "SivicosUrl" como "Alimentos"
    Cuando Selecciono la opcion Sivicos en la barra lateral

    Dado Puedo registrar una visita de una empresa inscrita con "dula de ciudadan" y numero "1114821159"
    Cuando Puedo agregar la informacion del registro de la visita con la razon "Toma de muestras" y clasificacion "Plan de visita"
    Y Puedo agregar la informacion del registro de la visita con el grupo "Bebidas alcoh" y el subgrupo "Generales"
    Y El sistema genera un numero de visita
    Cuando Puedo agregar la informacion de antecedentes de tipo "PQRSD"
    Y Puedo agregar los documentos asociados del grupo "Leche"
    Y Puedo buscar los productos que reportan registro sanitario del grupo "Leche" y subgrupo "Huevo"
    Y Puedo agregar la informacion sobre la toma de muestras
    Y Puedo finalizar el registro de la visita

  @RevisarVisitasAlimentos
  Escenario: Revisar visitar prueba
    Dado Inicio sesion en "SivicosUrl" como "Alimentos"

    Dado Tengo pendiente por revisar la visita
    Cuando Puedo seleccionar el Grupo de trabajo "Grupo de Riesgos" que revisa la visita
    Y Puedo seleccionar la visita para direccionarla

  @DireccionDeOperacionesSanitariasAlimentos
  Escenario: Registrar Visitas de Alimentos con una Empresa No Inscrita
    Dado Inicio sesion en "SivicosUrl" como "Alimentos"
    Cuando Selecciono la opcion Sivicos en la barra lateral

    Dado Puedo registrar una visita de una empresa no inscrita con NIT y numero 123444
    Cuando Puedo agregar la informacion del registro de la visita con la razon "Toma de muestras" y clasificacion "Plan Visita"
    Y Puedo agregar la informacion del registro de la visita con el grupo "Bebidas alcoh" y el subgrupo "Generales"
    Y Puedo agregar la informacion del responsable de hacer la visita "Operaciones" en la misional Alimentos
    Y El sistema genera un numero de visita
    Cuando Puedo agregar la informacion de antecedentes de tipo "PQRSD"
    #Y Puedo agregar los documentos asociados del grupo "Leche"
    Y Puedo buscar los productos que reportan registro sanitario del grupo "Leche" y subgrupo "Huevo"
    Y Puedo agregar la informacion sobre la toma de muestras
    Y Puedo finalizar el registro de la visita
