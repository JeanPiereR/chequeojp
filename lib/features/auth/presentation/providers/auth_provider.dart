import 'package:chequeo_f_h/features/auth/domain/entities/user.dart';
import 'package:chequeo_f_h/features/auth/domain/repositories/auth_repository.dart';
import 'package:chequeo_f_h/features/auth/infrastructure/errors/auth_erros.dart';
import 'package:chequeo_f_h/features/auth/infrastructure/repositories/auth_repository_implementation.dart';
import 'package:chequeo_f_h/features/auth/infrastructure/services/key_value_check_implementation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../infrastructure/services/key_value_check.dart';

//4.-
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {

  //5.-
  final authRepository = AuthRepositoryImpl();
  final keyValueCheck = KeyValueCheckImplementation();

  return AuthNotifier(
    authRepository: authRepository, //7.-
    keyValueCheck: keyValueCheck,
  );
});

//3.-
class AuthNotifier extends StateNotifier<AuthState> {

  final AuthRepository authRepository; //6.-
  final KeyValueCheck keyValueCheck;

  AuthNotifier({
    required this.authRepository,
    required this.keyValueCheck
    }): super(AuthState()) {
      checkAuthStatus();
    }
  
  Future <void> loginUser (String email, String password) async {

    ///A proposito relantizamos el proceso de login
    await Future.delayed(const Duration(milliseconds: 500));

    ///Arbol de desiciones al realizar login
    try {
      final user = await authRepository.login(email, password);
      _setLoggedUser(user);
    } on WrongCredential {
      logout("Las credenciales no son correctas");
    } on ConnectionTimeout {
      logout("Tiempo de ejecucion superado");
    } catch (e) {
      logout("Error no controlado");
    }

    //final user = await authRepository.login(email, password);
    //state = state.copyWith(user: user, authStatus: AuthStatus.authenticated);

  }

  void registerUser (String email, String password) async {
    
  }

    void checkAuthStatus () async {
    final token = await keyValueCheck.getValue<String>("token");

    if (token == null) return logout();

    try {
      final user = await authRepository.checkAuthStatus(token);
      _setLoggedUser(user);
      
    } catch (e) {
      logout();
    }

  }

  void _setLoggedUser (User user) async {

    await keyValueCheck.setKeyValue("token", user.token);

    state = state.copyWith(
      user: user,
      authStatus:  AuthStatus.authenticated,
    );
  }

  Future <void> logout([String? errorMessage]) async {
    
    await keyValueCheck.removeKey("token");

    state = state.copyWith(
      authStatus:  AuthStatus.notAuthenticated,
      user: null,
      errorMessage: errorMessage,
    );
  }
}


//2.-
enum AuthStatus { checkin, authenticated, notAuthenticated }

//1.-
class AuthState {
  final AuthStatus authStatus;
  final User? user;
  final String errorMessage;

  AuthState(
      {this.authStatus = AuthStatus.checkin,
      this.user,
      this.errorMessage = ""});

  AuthState copyWith({
    AuthStatus? authStatus,
    User? user,
    String? errorMessage,
  }) =>
      AuthState(
          authStatus: authStatus ?? this.authStatus,
          user: user ?? this.user,
          errorMessage: errorMessage ?? this.errorMessage
          );
}
