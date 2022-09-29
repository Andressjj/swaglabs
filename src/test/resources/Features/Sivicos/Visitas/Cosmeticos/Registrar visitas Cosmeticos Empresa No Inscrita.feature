# language: es
@RegistrarVisitasCosmeticosEmpresaNoInscrita
@AllRegistrarVisitasCosmeticos
Característica: Registrar visitas de cosmeticos con una empresa no inscrita
  Automatizacion  para validar el correcto funcionamento del registro de la visitas en SIVICOS

  Antecedentes:
    Dados los datos del ambiente y usuarios del sistema

  @VisitaEmpresaNOInscritaCosmeticosRegistrarRevisarConsolidarProgramarEjecutar
  Escenario: Registrar Visita de Cosmeticos con una Empresa No Inscrita - Plan visita - Revisa - Consolida - Programa - Ejecuta
    Dado Inicio sesion en "SivicosUrl" como "Planeacion"

  ## REGISTRAR VISITA

    Dado necesito registrar una visita del producto "Cosméticos"
    Cuando busco una empresa no inscrita ya creada con "NIT" numero "1015463397"
    Entonces se visualiza la informacion de la empresa

    Dado necesito ingresar la informacion de la visita
    Cuando selecciono la razon "Toma de muestras" y clasificacion "Plan de visita"
    Y Selecciono el grupo "Cosméticos" y el subgrupo "Cosméticos Capilares"
    Y agrego como responsable de hacer la visita a "Dirección Cosméticos grupo registro"
    Entonces El sistema genera un numero de visita
   # Y el sistema genera una alerta que contiene el texto "Se ha creado satisfactoriamente"

    Dado tengo registrada una visita
    Entonces Puedo agregar la informacion de antecedentes de tipo "PQRSD"
    Y Puedo agregar los documentos asociados del grupo "Cosm"
    Y Puedo agregar la informacion sobre la toma de muestras del grupo "Cosméticos"
    Y Puedo finalizar el registro de la visita

    ## REVISAR VISITA DIRECCIONAR.

    Dado Tengo pendiente por revisar la visita
    Cuando selecciono el Grupo de trabajo "Grupo de Registros Sanitarios Cosmeticos"
    Entonces Puedo seleccionar la visita para direccionarla

    ## CONSOLIDAR VISITA

    Dado necesito consolidar una visita planeada del producto "Cosméticos"
    Cuando envio la visita a programacion de visitas
    Entonces el sistema genera una alerta que contiene el texto "Direccionado correctamente"

    # PROGRAMAR VISITA

    Dado Inicio sesion en "SivicosUrl" como "Programacion"
    Y necesito programar una visita del producto "Cosméticos"
    Cuando programo la visita al usuario "Veinte Tres"
    Entonces el sistema genera una alerta que contiene el texto "Se creo una nueva programación"

    #Dado necesito gestionar la comision de transporte
    #Cuando ingreso toda la informacion de comision nacional
    #Y ingreso toda la informacion de transporte terrestre
    #Entonces el sistema genera una alerta que contiene el texto "Guardado"

    Dado necesito generar el oficio comisorio
    Cuando genero el oficio comisorio
    Entonces el sistema genera una alerta que contiene el texto "Se Guardo el oficio comisorio"

    # EJECUTAR VISITA

    Dado Inicio sesion en "SivicosUrl" como "Ejecucion"
    Cuando Ejecuto la visita
    Y Puedo diligenciar actas del grupo "Cosm" del subgrupo "Capilares" y tipo de acta "FM033"
    Y Puedo agregar los documentos asociados del grupo "Cosm"
    Entonces Puedo realizar el cierre de la visita


  @VisitaEmpresaNOInscritaCosmeticosRegistrarRevisarConsolidarValidarProgramarEjecutar
  Escenario: Registrar Visita de Cosmeticos con una Empresa No Inscrita - Plan visita - Revisa - Consolida - Valida - Programa - Ejecuta
    Dado Inicio sesion en "SivicosUrl" como "Planeacion"

  ## REGISTRAR VISITA

    Dado necesito registrar una visita del producto "Cosméticos"
    Cuando busco una empresa no inscrita ya creada con "NIT" numero "1015463397"
    Entonces se visualiza la informacion de la empresa

    Dado necesito ingresar la informacion de la visita
    Cuando selecciono la razon "Toma de muestras" y clasificacion "Plan de visita"
    Y Selecciono el grupo "Cosméticos" y el subgrupo "Cosméticos Capilares"
    Y agrego como responsable de hacer la visita a "Dirección de Operaciones sanitarias"
    Entonces El sistema genera un numero de visita
    #Y el sistema genera una alerta que contiene el texto "Se ha creado satisfactoriamente"

    Dado tengo registrada una visita
    Entonces Puedo agregar la informacion de antecedentes de tipo "PQRSD"
    Y Puedo agregar los documentos asociados del grupo "Cosm"
    Y Puedo agregar la informacion sobre la toma de muestras del grupo "Cosm"
    Y Puedo finalizar el registro de la visita

    ## REVISAR VISITA DIRECCIONAR.

    Dado Tengo pendiente por revisar la visita
    Cuando selecciono el Grupo de trabajo "Grupo de Registros Sanitarios Cosmeticos"
    Entonces Puedo seleccionar la visita para direccionarla

    ## CONSOLIDAR VISITA

    Dado necesito consolidar una visita planeada del producto "Dirección Cosméticos"
    Cuando envio la visita a programacion de visitas
    Entonces el sistema genera una alerta que contiene el texto "Direccionado correctamente"

    ## VALIDAR VISITA

    Dado Inicio sesion en "SivicosUrl" como "Validar"
    Y necesito validar una visita del producto "Dirección Cosméticos"
    Cuando ejecuto la accion programar visita
    Entonces puedo agregar las observaciones y enviar a programar visitas.

    # PROGRAMAR VISITA

    Dado Inicio sesion en "SivicosUrl" como "Programacion"
    Y necesito programar una visita del producto "Cosméticos"
    Cuando programo la visita al usuario "Veinte Tres"
    Entonces el sistema genera una alerta que contiene el texto "Se creo una nueva programación"

    #Dado necesito gestionar la comision de transporte
    #Cuando ingreso toda la informacion de comision nacional
    #Y ingreso toda la informacion de transporte terrestre
    #Entonces el sistema genera una alerta que contiene el texto "Guardado"

    Dado necesito generar el oficio comisorio
    Cuando genero el oficio comisorio
    Entonces el sistema genera una alerta que contiene el texto "Se Guardo el oficio comisorio"

    # EJECUTAR VISITA

    Dado Inicio sesion en "SivicosUrl" como "Ejecucion"
    Cuando Ejecuto la visita
    Y Puedo diligenciar actas del grupo "Cosm" del subgrupo "Capilares" y tipo de acta "FM033"
    Y Puedo agregar los documentos asociados del grupo "Cosm"
    Entonces Puedo realizar el cierre de la visita



  @VisitaExtraordinariaEmpresaNOInscritaCosmeticosRegistrarRevisarProgramarEjecutar
  Escenario: Registrar Visita Extraordinaria de Cosmeticos con una Empresa No Inscrita - Revisa - Programa - Ejecuta
    Dado Inicio sesion en "SivicosUrl" como "Planeacion"

  ## REGISTRAR VISITA

    Dado necesito registrar una visita del producto "Cosméticos"
    Cuando busco una empresa no inscrita ya creada con "NIT" numero "1015463397"
    Entonces se visualiza la informacion de la empresa

    Dado necesito ingresar la informacion de la visita
    Cuando selecciono la razon "Toma de muestras" y clasificacion "Extraordinaria"
    Y Selecciono el grupo "Cosméticos" y el subgrupo "Cosméticos Capilares"
    Y agrego como responsable de hacer la visita a "Dirección Cosméticos grupo registro"
    Entonces El sistema genera un numero de visita
   # Y el sistema genera una alerta que contiene el texto "Se ha creado satisfactoriamente"

    Dado tengo registrada una visita
    Entonces Puedo agregar la informacion de antecedentes de tipo "PQRSD"
    Y Puedo agregar los documentos asociados del grupo "Cosm"
    Y Puedo agregar la informacion sobre la toma de muestras del grupo "Cosm"
    Y Puedo finalizar el registro de la visita

    ## REVISAR VISITA DIRECCIONAR.

    Dado Tengo pendiente por revisar la visita
    Cuando selecciono el Grupo de trabajo "Grupo de Registros Sanitarios Cosmeticos"
    Entonces Puedo seleccionar la visita para direccionarla


    # PROGRAMAR VISITA

    Dado Inicio sesion en "SivicosUrl" como "Programacion"
    Y necesito programar una visita del producto "Cosméticos"
    Cuando programo la visita al usuario "Veinte Tres"
    Entonces el sistema genera una alerta que contiene el texto "Se creo una nueva programación"

    #Dado necesito gestionar la comision de transporte
    #Cuando ingreso toda la informacion de comision nacional
    #Y ingreso toda la informacion de transporte terrestre
    #Entonces el sistema genera una alerta que contiene el texto "Guardado"

    Dado necesito generar el oficio comisorio
    Cuando genero el oficio comisorio
    Entonces el sistema genera una alerta que contiene el texto "Se Guardo el oficio comisorio"

    # EJECUTAR VISITA

    Dado Inicio sesion en "SivicosUrl" como "Ejecucion"
    Cuando Ejecuto la visita
    Y Puedo diligenciar actas del grupo "Cosm" del subgrupo "Capilares" y tipo de acta "FM033"
    Y Puedo agregar los documentos asociados del grupo "Cosm"
    Entonces Puedo realizar el cierre de la visita


  @VisitaExtraordinariaEmpresaNOInscritaCosmeticosRegistrarRevisarValidarProgramarEjecutar
  Escenario: Registrar Visita Extraordinaria de Cosmeticos con una Empresa No Inscrita - Revisa -Valida - Programa - Ejecuta
    Dado Inicio sesion en "SivicosUrl" como "Planeacion"

  ## REGISTRAR VISITA

    Dado necesito registrar una visita del producto "Cosméticos"
    Cuando busco una empresa no inscrita ya creada con "NIT" numero "1015463397"
    Entonces se visualiza la informacion de la empresa

    Dado necesito ingresar la informacion de la visita
    Cuando selecciono la razon "Toma de muestras" y clasificacion "Extraordinaria"
    Y Selecciono el grupo "Cosméticos" y el subgrupo "Cosméticos Capilares"
    Y agrego como responsable de hacer la visita a "Dirección de Operaciones sanitarias"
    Entonces El sistema genera un numero de visita
    #Y el sistema genera una alerta que contiene el texto "Se ha creado satisfactoriamente"

    Dado tengo registrada una visita
    Entonces Puedo agregar la informacion de antecedentes de tipo "PQRSD"
    Y Puedo agregar los documentos asociados del grupo "Cosm"
    Y Puedo agregar la informacion sobre la toma de muestras del grupo "Cosm"
    Y Puedo finalizar el registro de la visita

    ## REVISAR VISITA DIRECCIONAR.

    Dado Tengo pendiente por revisar la visita
    Cuando selecciono el Grupo de trabajo "Grupo de Registros Sanitarios Cosmeticos"
    Entonces Puedo seleccionar la visita para direccionarla

      ## VALIDAR VISITA

    Dado Inicio sesion en "SivicosUrl" como "Validar"
    Y necesito validar una visita del producto "Dirección Cosméticos"
    Cuando ejecuto la accion programar visita
    Entonces puedo agregar las observaciones y enviar a programar visitas.

    # PROGRAMAR VISITA

    Dado Inicio sesion en "SivicosUrl" como "Programacion"
    Y necesito programar una visita del producto "Cosméticos"
    Cuando programo la visita al usuario "Veinte Tres"
    Entonces el sistema genera una alerta que contiene el texto "Se creo una nueva programación"

    #Dado necesito gestionar la comision de transporte
    #Cuando ingreso toda la informacion de comision nacional
    #Y ingreso toda la informacion de transporte terrestre
    #Entonces el sistema genera una alerta que contiene el texto "Guardado"

    Dado necesito generar el oficio comisorio
    Cuando genero el oficio comisorio
    Entonces el sistema genera una alerta que contiene el texto "Se Guardo el oficio comisorio"

    # EJECUTAR VISITA

    Dado Inicio sesion en "SivicosUrl" como "Ejecucion"
    Cuando Ejecuto la visita
    Y Puedo diligenciar actas del grupo "Cosm" del subgrupo "Capilares" y tipo de acta "FM033"
    Y Puedo agregar los documentos asociados del grupo "Cosm"
    Entonces Puedo realizar el cierre de la visita
