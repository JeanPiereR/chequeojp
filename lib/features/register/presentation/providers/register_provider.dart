import 'package:chequeo_f_h/features/register/domain/entities/register_entities.dart';
import 'package:chequeo_f_h/features/register/domain/repositories/register_repository.dart';
import 'package:chequeo_f_h/features/register/presentation/providers/register_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///STATE(3)
final registerProvider = StateNotifierProvider < RegisterNotifier, RegisterState >((ref) {

  final registerRepository = ref.watch( registerRepositoryProvider);

  return RegisterNotifier (
    registerRepository: registerRepository
  );

});



///NOTIFIER(2)
class RegisterNotifier extends StateNotifier <RegisterState> {
  
  final RegisterRepository registerRepository;
  
  RegisterNotifier({
    required this.registerRepository
  }): super ( RegisterState() ) {
    loadNextPage();
  }

  Future loadNextPage() async {

    if( state.isLoading || state.isLastPage) return;

    state = state.copyWhith(
      isLoading: true
    );

    final register = await registerRepository.getRegisterByPage( );
    if (register.isNotEmpty) {
      state = state.copyWhith(
        isLoading: false,
        isLastPage: true,
      );
      return;
    } 
    state = state.copyWhith(
      isLastPage: false,
      isLoading: false,
      offset: state.offset + 10, //todo ver
      register: [...state.register, ...register]
    );
  }



}





///STATE (1)
class RegisterState {

  final bool isLastPage;
  final int limit;
  final int offset;
  final bool isLoading;
  final List<Register> register;

  RegisterState({
  this.isLastPage = false, 
  this.limit = 10, //todo ver 
  this.offset = 0,
  this.isLoading = false, 
  this.register = const [],
  });



  RegisterState copyWhith({

  bool? isLastPage,
  int? limit,
  int? offset,
  bool? isLoading,
  List<Register>? register,

  }) => RegisterState(

  isLastPage: isLastPage ?? this.isLastPage,
  limit: limit ?? this.limit,
  offset: offset ?? this.offset,
  isLoading: isLoading ?? this.isLoading,
  register: register ?? this. register,

  ); 

}
