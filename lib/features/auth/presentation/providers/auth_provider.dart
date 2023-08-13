import 'package:chequeo_f_h/features/auth/domain/entities/user.dart';
import 'package:chequeo_f_h/features/auth/domain/repositories/auth_repository.dart';
import 'package:chequeo_f_h/features/auth/infrastructure/errors/auth_erros.dart';
import 'package:chequeo_f_h/features/auth/infrastructure/repositories/auth_repository_implementation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//4.-
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {

  //5.-
  final authRepository = AuthRepositoryImpl();

  return AuthNotifier(
    authRepository: authRepository //7.-
  );
});

//3.-
class AuthNotifier extends StateNotifier<AuthState> {

  final AuthRepository authRepository; //6.-

  AuthNotifier({
    required this.authRepository
    }): super(AuthState());
  
  Future <void> loginUser (String email, String password) async {

    ///A proposito relantizamos el proceso de login
    await Future.delayed(const Duration(milliseconds: 500));

    ///Arbol de desiciones al realizar login
    try {
      final user = await authRepository.login(email, password);
      _setLoggedUser(user);
    } on WrongCredential {
      logout("Las credenciales no son correctas");
    } catch (e) {
      logout("Error no controlado");
    }

    //final user = await authRepository.login(email, password);
    //state = state.copyWith(user: user, authStatus: AuthStatus.authenticated);

  }

  void registerUser (String email, String password) async {
    
  }

    void checkAuthStatus () async {
    
  }

  void _setLoggedUser (User user) {
    //TODO: Se necesita guardar el token en dispositivo
    state = state.copyWith(
      user: user,
      authStatus:  AuthStatus.authenticated,
    );
  }

  Future <void> logout([String? errorMessage]) async {
    //TODO: Limpiar token
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
