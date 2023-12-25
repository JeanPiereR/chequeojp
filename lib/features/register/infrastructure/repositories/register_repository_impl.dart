import 'package:chequeo_f_h/features/register/domain/datasources/register_datasource.dart';
import 'package:chequeo_f_h/features/register/domain/entities/register_entities.dart';
import 'package:chequeo_f_h/features/register/domain/repositories/register_repository.dart';

class RegisterRepositoyImpl extends RegisterRepository {

  final RegisterDatasource datasource;

  RegisterRepositoyImpl(this.datasource);

  @override
  Future<Register> createUpdateRegister(Map<String, dynamic> registerLike) {
    return datasource.createUpdateRegister(registerLike);
  }

  @override
  Future<Register> getRegisterById(String id) {
    return datasource.getRegisterById(id);
  }

  @override
  Future<List<Register>> getRegisterByPage() {
    return datasource.getRegisterByPage();
  }

  @override
  Future<Register> searchrRegisterByTerm(String term) {
    return datasource.searchrRegisterByTerm(term);
  }

}