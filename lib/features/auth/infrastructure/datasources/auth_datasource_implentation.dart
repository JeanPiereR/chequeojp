import 'package:chequeo_f_h/config/const/environment.dart';
import 'package:chequeo_f_h/features/auth/domain/datasources/auth_datasource.dart';
import 'package:chequeo_f_h/features/auth/domain/entities/user.dart';
import 'package:chequeo_f_h/features/auth/infrastructure/errors/auth_erros.dart';
import 'package:chequeo_f_h/features/auth/infrastructure/mappers/user_mapper.dart';
import 'package:dio/dio.dart';

///La clase a implementar extiende de nuestra logica creada en DOMAIN
///y luego DART crea los 3 estados de chequeo CTR+PUNTO
class AuthDataSourceImple extends AuthDataSource {
  ///Configuramos el paquete de DIO para que llegue a nuestra constante
  ///de entorno apiUrl
  final dio = Dio(BaseOptions(
    baseUrl: Environmet.apiUrl,
  ));

  @override
  Future<User> checkAuthStatus(String token) {
    // TODO: implement checkAuthStatus
    throw UnimplementedError();
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      ///Hacemos un llamado al backen don DIO con una peticion POST donde el
      ///path es la continucacion de lo escrito en el .ENV y para despues
      ///especificarle la data para el login
      final response = await dio
          .post("/auth/login", data: {"email": email, "password": password});

      final user = UserMapper.userJsonToEntity(response.data);
      return user;

    } catch (e) {

      throw WrongCredential();
      
    }
  }

  @override
  Future<User> register(String email, String password, String fullName) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
