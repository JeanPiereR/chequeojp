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
  Future<User> checkAuthStatus(String token) async {
    try {
      final response = await dio.get(
        "/auth/check-status",
        options: Options(
          headers: {
            "Authorization": "Bearer $token"
          }
        )
      );

      final user = UserMapper.userJsonToEntity(response.data);
      return user;

    } on DioException catch (e) { //en F.H. es DioError pero se descontinuo

      if(e.response?.statusCode == 401) throw WrongCredential();
      if (e.type == DioExceptionType.connectionTimeout) throw ConnectionTimeout();
      throw CustomError("Ocurrio un error", 1);

    } catch (e) {

        throw CustomError("Ocurrio un error", 1);

    }
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

    } on DioException catch (e) { //en F.H. es DioError pero se descontinuo

      if(e.response?.statusCode == 401) throw WrongCredential();
      if (e.type == DioExceptionType.connectionTimeout) throw ConnectionTimeout();
      throw CustomError("Ocurrio un error", 1);

    } catch (e) {

        throw CustomError("Ocurrio un error", 1);

    }

  }

  @override
  Future<User> register(String email, String password, String fullName) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
