import 'package:chequeo_f_h/features/auth/domain/datasources/auth_datasource.dart';
import 'package:chequeo_f_h/features/auth/domain/entities/user.dart';
import 'package:chequeo_f_h/features/auth/domain/repositories/auth_repository.dart';
import 'package:chequeo_f_h/features/auth/infrastructure/datasources/auth_datasource_implentation.dart';

///La clase a implementar extiende de nuestra logica creada en DOMAIN
///y luego DART crea los 3 estados de chequeo CTR+PUNTO
class AuthRepositoryImpl extends AuthRepository {
  ///Traemos la data de Auth
  final AuthDataSource dataSource;

  ///Creamos un sistema en donde ocupa el DataSource pero si no lo encuentra
  ///que lo cree
  AuthRepositoryImpl(AuthDataSource? dataSource)
      : dataSource = dataSource ?? AuthDataSourceImple();

  @override
  Future<User> checkAuthStatus(String token) {
    return dataSource.checkAuthStatus(token);
  }

  @override
  Future<User> login(String email, String password) {
    return dataSource.login(email, password);
  }

  @override
  Future<User> register(String email, String password, String fullName) {
    return dataSource.register(email, password, fullName);
  }
}
