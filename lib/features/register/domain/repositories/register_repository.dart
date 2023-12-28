import 'package:chequeo_f_h/features/register/domain/entities/register_entities.dart';

abstract class RegistersRepository {
  Future<List<Register>> getRegisterByPage (); // Si fuera una lista de "Cosas" y esta la opcion de paginado en el back, se incluiria ({int limit = 10, int offset = 0 })

  Future<Register> getRegisterById (String id);

  Future<Register> searchrRegisterByTerm (String term);

  Future<Register> createUpdateRegister ( Map <String, dynamic> registerLike);

}