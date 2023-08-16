import 'package:chequeo_f_h/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final goRouteInformationProvider = Provider((ref)  {
  final authNotifier = ref.read(authProvider.notifier);
  return GoRouterNotifier(authNotifier);
});



///Instancia que permite a GoRouter estar atento a la autentifiacion
///de usuarios con el fin de proteccion de rutas
class GoRouterNotifier extends ChangeNotifier {

  final AuthNotifier _authNotifier;

  AuthStatus _authStatus = AuthStatus.checkin;

  GoRouterNotifier(this._authNotifier) {
    _authNotifier.addListener((state) {
      authStatus = state.authStatus;
    });
  }

  AuthStatus get authStatus => _authStatus;

  set authStatus (AuthStatus value) {
    _authStatus = value;
    notifyListeners();
  }

}
