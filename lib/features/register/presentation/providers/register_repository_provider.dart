import 'package:chequeo_f_h/features/auth/presentation/providers/auth_provider.dart';
import 'package:chequeo_f_h/features/register/domain/repositories/register_repository.dart';
import 'package:chequeo_f_h/features/register/infrastructure/datasource/register_datasource_impl.dart';
import 'package:chequeo_f_h/features/register/infrastructure/repositories/register_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final registersRepositoryProvider = Provider<RegistersRepository>((ref) {
  
  final acessToken = ref.watch( authProvider ).user?.token ?? '';

  final registersRepository = RegistersRepositoyImpl(
      RegistersDatasourceImpl( acessToken: acessToken )
    ); 

  return registersRepository;
});
