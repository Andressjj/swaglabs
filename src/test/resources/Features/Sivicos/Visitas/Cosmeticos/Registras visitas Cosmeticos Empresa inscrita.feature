# language: es
@RegistrarVisitasCosmeticosEmpresaInscrita
@AllRegistrarVisitasCosmeticos
Característica: Registrar visitas de cosmeticos con una empresa inscrita
  Automatizacion  para validar el correcto funcionamento del registro de la visitas en SIVICOS

  Antecedentes:
    Dados los datos del ambiente y usuarios del sistema

  @RegistrarVisitasEmpresaInscritaCosmeticosFlujo1
  Escenario: Registrar Visitas de Cosmeticos con una Empresa Inscrita - Plan visita - Revisa - Consolida - Programa
    Dado Inicio sesion en "SivicosUrl" como "Planeacion"
    Cuando Selecciono la opcion Sivicos en la barra lateral

    Dado Puedo registrar una visita de una empresa inscrita con "NIT" y numero "900871479"
    Cuando Puedo agregar la informacion del registro de la visita con la razon "Toma de muestras" y clasificacion "Plan de visita"
    Y Puedo agregar la informacion del registro de la visita con el grupo "Cosm" y el subgrupo "Capilares"
    Y Puedo agregar la informacion del responsable de hacer la visita "registro" en la misional Cosmeticos
    Y El sistema genera un numero de visita
    Cuando Puedo agregar la informacion de antecedentes de tipo "PQRSD"
    Y Puedo agregar los documentos asociados del grupo "Cosm"
    Y Puedo buscar los productos que reportan registro sanitario del grupo "Cosm" y subgrupo "Capilares"
    Y Puedo agregar la informacion sobre la toma de muestras
    Y Puedo finalizar el registro de la visita

    Dado Tengo pendiente por revisar la visita
    Cuando Puedo seleccionar el Grupo de trabajo "Registros Sanitario" que revisa la visita
    Y Puedo seleccionar la visita para direccionarla

    Dado Puedo consolidar la visita del tipo de producto "Cosm"
    Cuando Puedo observar el listado de visitas planeadas
    Y Puedo mover las visitas planeadas al listado visitas en espera
    Y Puedo direccionar la visita a programacion de visitas

    Dado Inicio sesion en "SivicosUrl" como "Programacion"
    #Paso nuevo
    Y Tengo visita pendiente de programar en "Cosm" con Codigo de Visita
    Cuando Programo la visita
    #Entonces Puedo gestionar comision o transporte
    #falta validar la firma
    Y Puedo generar el oficio comisorio

    Dado Inicio sesion en "SivicosUrl" como "Ejecucion"
    Cuando Ejecuto la visita
    Y Puedo diligenciar actas del grupo "Cosm" del subgrupo "Capilares" y tipo de acta "FM033"
    Y Puedo agregar los documentos asociados del grupo "Cosm"
    Entonces Puedo realizar el cierre de la visita

  @RegistrarVisitasEmpresaInscritaCosmeticosFlujo2
  Escenario: Registrar Visitas de Cosmeticos con una Empresa Inscrita - Plan visita - Revisa - Consolida - Valida - Programa
    Dado Inicio sesion en "SivicosUrl" como "Planeacion"
    Cuando Selecciono la opcion Sivicos en la barra lateral

    Dado Puedo registrar una visita de una empresa inscrita con "NIT" y numero "900871479"
    Cuando Puedo agregar la informacion del registro de la visita con la razon "Toma de muestras" y clasificacion "Plan de visita"
    Y Puedo agregar la informacion del registro de la visita con el grupo "Cosm" y el subgrupo "Capilares"
    Y Puedo agregar la informacion del responsable de hacer la visita "Operaciones" en la misional Cosmeticos
    Y El sistema genera un numero de visita
    Cuando Puedo agregar la informacion de antecedentes de tipo "PQRSD"
    Y Puedo agregar los documentos asociados del grupo "Cosm"
    Y Puedo buscar los productos que reportan registro sanitario del grupo "Cosm" y subgrupo "Capilares"
    Y Puedo agregar la informacion sobre la toma de muestras
    Y Puedo finalizar el registro de la visita

    Dado Tengo pendiente por revisar la visita
    Cuando Puedo seleccionar el Grupo de trabajo "Registros Sanitario" que revisa la visita
    Y Puedo seleccionar la visita para direccionarla

    Dado Puedo consolidar la visita del tipo de producto "Cosm"
    Cuando Puedo observar el listado de visitas planeadas
    Y Puedo mover las visitas planeadas al listado visitas en espera
    Y Puedo direccionar la visita a programacion de visitas

    Dado Inicio sesion en "SivicosUrl" como "Validar"
    Cuando Selecciono la opcion Validar en la barra lateral
    Entonces Puedo validar la visita

    Dado Inicio sesion en "SivicosUrl" como "Programacion"
    #Paso nuevo
    Y Tengo visita pendiente de programar en "Cosm" con Codigo de Visita
    Cuando Programo la visita
    #Entonces Puedo gestionar comision o transporte
    #falta validar la firma
    Y Puedo generar el oficio comisorio

    Dado Inicio sesion en "SivicosUrl" como "Ejecucion"
    Cuando Ejecuto la visita
    Y Puedo diligenciar actas del grupo "Cosm" del subgrupo "Capilares" y tipo de acta "FM033"
    Y Puedo agregar los documentos asociados del grupo "Cosm"
    Entonces Puedo realizar el cierre de la visita

  @RegistrarVisitasEmpresaInscritaCosmeticosFlujo3
  Escenario: Registrar Visitas de Cosmeticos con una Empresa Inscrita - Extraordinaria - Revisa - Valida - Programa
    Dado Inicio sesion en "SivicosUrl" como "Planeacion"
    Cuando Selecciono la opcion Sivicos en la barra lateral

    Dado Puedo registrar una visita de una empresa inscrita con "NIT" y numero "900871479"
    Cuando Puedo agregar la informacion del registro de la visita con la razon "Toma de muestras" y clasificacion "Extrao"
    Y Puedo agregar la informacion del registro de la visita con el grupo "Cosm" y el subgrupo "Capilares"
    Y Puedo agregar la informacion del responsable de hacer la visita "Operaciones" en la misional Cosmeticos
    Y El sistema genera un numero de visita
    Cuando Puedo agregar la informacion de antecedentes de tipo "PQRSD"
    Y Puedo agregar los documentos asociados del grupo "Cosm"
    Y Puedo buscar los productos que reportan registro sanitario del grupo "Cosm" y subgrupo "Capilares"
    Y Puedo agregar la informacion sobre la toma de muestras
    Y Puedo finalizar el registro de la visita

    Dado Tengo pendiente por revisar la visita
    Cuando Puedo seleccionar el Grupo de trabajo "Registros Sanitario" que revisa la visita
    Y Puedo seleccionar la visita para direccionarla

    Dado Inicio sesion en "SivicosUrl" como "Validar"
    Cuando Selecciono la opcion Validar en la barra lateral
    Entonces Puedo validar la visita

    Dado Inicio sesion en "SivicosUrl" como "Programacion"
    #Paso nuevo
    Y Tengo visita pendiente de programar en "Cosm" con Codigo de Visita
    Cuando Programo la visita
    #Entonces Puedo gestionar comision o transporte
    #falta validar la firma
    Y Puedo generar el oficio comisorio

    Dado Inicio sesion en "SivicosUrl" como "Ejecucion"
    Cuando Ejecuto la visita
    Y Puedo diligenciar actas del grupo "Cosm" del subgrupo "Capilares" y tipo de acta "FM033"
    Y Puedo agregar los documentos asociados del grupo "Cosm"
    Entonces Puedo realizar el cierre de la visita

  @RegistrarVisitasEmpresaInscritaCosmeticosFlujo4
  Escenario: Registrar Visitas de Cosmeticos con una Empresa Inscrita - Extraordinaria - Revisa - Programa
    Dado Inicio sesion en "SivicosUrl" como "Planeacion"
    Cuando Selecciono la opcion Sivicos en la barra lateral

    Dado Puedo registrar una visita de una empresa inscrita con "NIT" y numero "900871479"
    Cuando Puedo agregar la informacion del registro de la visita con la razon "Toma de muestras" y clasificacion "Extrao"
    Y Puedo agregar la informacion del registro de la visita con el grupo "Cosm" y el subgrupo "Capilares"
    Y Puedo agregar la informacion del responsable de hacer la visita "registro" en la misional Cosmeticos
    Y El sistema genera un numero de visita
    Cuando Puedo agregar la informacion de antecedentes de tipo "PQRSD"
    Y Puedo agregar los documentos asociados del grupo "Cosm"
    Y Puedo buscar los productos que reportan registro sanitario del grupo "Cosm" y subgrupo "Capilares"
    Y Puedo agregar la informacion sobre la toma de muestras
    Y Puedo finalizar el registro de la visita

    Dado Tengo pendiente por revisar la visita
    Cuando Puedo seleccionar el Grupo de trabajo "Registros Sanitario" que revisa la visita
    Y Puedo seleccionar la visita para direccionarla

    #Dado Puedo consolidar la visita del tipo de producto "Cosm"
    #Cuando Puedo observar el listado de visitas planeadas
    #Y Puedo mover las visitas planeadas al listado visitas en espera
    #Y Puedo direccionar la visita a programacion de visitas

    Dado Inicio sesion en "SivicosUrl" como "Programacion"
    #Paso nuevo
    Y Tengo visita pendiente de programar en "Cosm" con Codigo de Visita
    Cuando Programo la visita
    #Entonces Puedo gestionar comision o transporte
    #falta validar la firma
    Y Puedo generar el oficio comisorio

    Dado Inicio sesion en "SivicosUrl" como "Ejecucion"
    Cuando Ejecuto la visita
    Y Puedo diligenciar actas del grupo "Cosm" del subgrupo "Capilares" y tipo de acta "FM033"
    Y Puedo agregar los documentos asociados del grupo "Cosm"
    Entonces Puedo realizar el cierre de la visita
