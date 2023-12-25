import 'package:chequeo_f_h/config/const/environment.dart';
import 'package:chequeo_f_h/features/register/domain/datasources/register_datasource.dart';
import 'package:chequeo_f_h/features/register/domain/entities/register_entities.dart';
import 'package:chequeo_f_h/features/register/infrastructure/mappers/register_mapper.dart';
import 'package:dio/dio.dart';

class  RegisterDatasourceImpl extends RegisterDatasource {

  ///Implementacion de DIO
  late final Dio dio;
  final String acessToken;

  RegisterDatasourceImpl({
    required this.acessToken
  }) : dio = Dio (
    BaseOptions(
      baseUrl: Environmet.apiUrl,
      headers: {
        'Authorization' : 'Bearer $acessToken'
      }
    )
  );

  @override
  Future<Register> createUpdateRegister(Map<String, dynamic> registerLike) {
    // TODO: implement createUpdateRegister
    throw UnimplementedError();
  }

  @override
  Future<Register> getRegisterById(String id) {
    // TODO: implement getRegisterById
    throw UnimplementedError();
  }

  @override
  Future<List<Register>> getRegisterByPage({int limit=10, int offset=0}) async {
    final response = await dio.get<List>('/auth/users'); ///Ver clase Impleentacion- getproductsbypage
    final List<Register> registers = [];
    for ( final register in response.data ?? [] ) {
      registers.add ( RegisterMapper.jsonToEntity( register ) );
    }

    return registers;
  }

  @override
  Future<Register> searchrRegisterByTerm(String term) {
    // TODO: implement searchrRegisterByTerm
    throw UnimplementedError();
  }

}