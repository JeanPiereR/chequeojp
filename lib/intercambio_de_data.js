// Para el intercambio de data se debe crear la regla del negocio que siempre seran 2 carpeta por cada tabla de datos
// que sera Domain y Infrastructure, en Domian se crean 3 sub carpeta (Datasourse, Entities y Repositories)
//  y en Infrastructure 2 sub carpetas (Datasource y repositories)

                  ///DOMAIN
// 1.- La primera carpeta en trabajar es Domain, donde creamos nuestro JSON con la estructura de la data en 
//     Entities (Usar postman y Paste Json to code ) + required

// 2.- en el datasource creamos NOMBRE_ENTITIES.DART donde se trabajaran los EndPoint que definieran 
//     las reglas de como se trabajaran los datos

// 3.- En la carpeta repositorios creamos NOMBRE_REPOSITORY.DART donde para simplificar copiaremos todo de NOMBRE_ENTITIES.DART
//     y solo cambiaremos el nombre de la clase de nombreDatasource --> nombreRepository

              ///INFRAESTRUCTURA
// 1.- En DataSoruce se crea el archivo NOMBRE_DATASOURCE_IMPL.DART donde se crea la clase NombreDatasourceImple
//     la cual va extender de la clase creada en DOMAIN-->DATASOURCE, despues en nuestra clase implementamos los
//     4 Missin con CTR+PUNTO

// 2.- en Repository creamos NOMBRE_REPOSITORY_IMPL.DART donde se crea la clase NombreRepositoryImple
//     la cual va extender de la clase creada en DOMAIN-->REPOSITORY, despues en nuestra clase implementamos los
//     4 Missin con CTR+PUNTO, ademas debemos incluir un Datasource que viene desde NOMBREDATASORUCE y solicitamos 
//     el constructo con CTR+PUNTO, se trabajan todos lo Missing con la estructura creada en NOMBRE_DATASORUCE

// 3.- luego en NOMBRE_DATASOURCE_IMPL se realiza el trabajo mas pesado de manejo de la data, esto se realiza 
//     trabajando don DIO, donde se puede o no solicitar el tokken de acceso (S28, CLASE 6 DevTalles)


/// MAPPERS= Tambien se debe mapear los datos, por lo cual se crea en infrastructura-->mappers

/// Se inicia el trabajo con RIVERPOD que permitira que toda la APP trabaje con los repositorios creados anteriormente, donde 
/// Iniciamos la creacion con la ayuda el snipped, llamamos el NombreRepository, donde se crearan los siguientes archivos:
/// 1.- NOMBRE_REPOSITORY_PROVIDER.DART
/// 2.- NOMBRE_PROVIDER.DART, donde crearemos un constructor con las porpiedades que queramos trabajar, iniciando por el STATE
///     luego por el NOTIFIER
