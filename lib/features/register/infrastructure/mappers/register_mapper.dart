import 'package:chequeo_f_h/features/register/domain/entities/register_entities.dart';


class RegisterMapper {

  static jsonToEntity( Map<String, dynamic> json ) => Register(

  email: json ['email'], 
  fullName: json ['fullName'], 
  id: json ['id'], 
  roles: List<String>.from( json['roles'].map( (roles) => roles )  ), //TODO ¿MAPA?
  ///password: json ['password'],
  
  );

}