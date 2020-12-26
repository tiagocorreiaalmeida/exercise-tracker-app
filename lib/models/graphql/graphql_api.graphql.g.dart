// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login$Mutation$Login$User _$Login$Mutation$Login$UserFromJson(
    Map<String, dynamic> json) {
  return Login$Mutation$Login$User()
    ..id = json['id'] as String
    ..username = json['username'] as String
    ..email = json['email'] as String;
}

Map<String, dynamic> _$Login$Mutation$Login$UserToJson(
        Login$Mutation$Login$User instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
    };

Login$Mutation$Login _$Login$Mutation$LoginFromJson(Map<String, dynamic> json) {
  return Login$Mutation$Login()
    ..user = json['user'] == null
        ? null
        : Login$Mutation$Login$User.fromJson(
            json['user'] as Map<String, dynamic>)
    ..accessToken = json['accessToken'] as String
    ..refreshToken = json['refreshToken'] as String;
}

Map<String, dynamic> _$Login$Mutation$LoginToJson(
        Login$Mutation$Login instance) =>
    <String, dynamic>{
      'user': instance.user?.toJson(),
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

Login$Mutation _$Login$MutationFromJson(Map<String, dynamic> json) {
  return Login$Mutation()
    ..login = json['login'] == null
        ? null
        : Login$Mutation$Login.fromJson(json['login'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Login$MutationToJson(Login$Mutation instance) =>
    <String, dynamic>{
      'login': instance.login?.toJson(),
    };

LoginInput _$LoginInputFromJson(Map<String, dynamic> json) {
  return LoginInput(
    email: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$LoginInputToJson(LoginInput instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

Register$Mutation$Register _$Register$Mutation$RegisterFromJson(
    Map<String, dynamic> json) {
  return Register$Mutation$Register()
    ..id = json['id'] as String
    ..username = json['username'] as String
    ..email = json['email'] as String;
}

Map<String, dynamic> _$Register$Mutation$RegisterToJson(
        Register$Mutation$Register instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
    };

Register$Mutation _$Register$MutationFromJson(Map<String, dynamic> json) {
  return Register$Mutation()
    ..register = json['register'] == null
        ? null
        : Register$Mutation$Register.fromJson(
            json['register'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Register$MutationToJson(Register$Mutation instance) =>
    <String, dynamic>{
      'register': instance.register?.toJson(),
    };

RegisterInput _$RegisterInputFromJson(Map<String, dynamic> json) {
  return RegisterInput(
    email: json['email'] as String,
    password: json['password'] as String,
    username: json['username'] as String,
  );
}

Map<String, dynamic> _$RegisterInputToJson(RegisterInput instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'username': instance.username,
    };

LoginArguments _$LoginArgumentsFromJson(Map<String, dynamic> json) {
  return LoginArguments(
    data: json['data'] == null
        ? null
        : LoginInput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoginArgumentsToJson(LoginArguments instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

RegisterArguments _$RegisterArgumentsFromJson(Map<String, dynamic> json) {
  return RegisterArguments(
    data: json['data'] == null
        ? null
        : RegisterInput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RegisterArgumentsToJson(RegisterArguments instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };
