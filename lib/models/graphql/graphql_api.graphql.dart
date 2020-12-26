// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'graphql_api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class TestServer$Query with EquatableMixin {
  TestServer$Query();

  factory TestServer$Query.fromJson(Map<String, dynamic> json) =>
      _$TestServer$QueryFromJson(json);

  String test;

  @override
  List<Object> get props => [test];
  Map<String, dynamic> toJson() => _$TestServer$QueryToJson(this);
}

class TestServerQuery extends GraphQLQuery<TestServer$Query, JsonSerializable> {
  TestServerQuery();

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'TestServer'),
        variableDefinitions: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'test'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null)
        ]))
  ]);

  @override
  final String operationName = 'TestServer';

  @override
  List<Object> get props => [document, operationName];
  @override
  TestServer$Query parse(Map<String, dynamic> json) =>
      TestServer$Query.fromJson(json);
}
