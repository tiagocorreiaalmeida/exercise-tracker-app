// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestServer$Query _$TestServer$QueryFromJson(Map<String, dynamic> json) {
  return TestServer$Query()..test = json['test'] as String;
}

Map<String, dynamic> _$TestServer$QueryToJson(TestServer$Query instance) =>
    <String, dynamic>{
      'test': instance.test,
    };
