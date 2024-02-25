// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTodoModelCollection on Isar {
  IsarCollection<TodoModel> get todoModels => this.collection();
}

const TodoModelSchema = CollectionSchema(
  name: r'TodoModel',
  id: 4924789365587537652,
  properties: {
    r'hashCode': PropertySchema(
      id: 0,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.string,
    ),
    r'stringify': PropertySchema(
      id: 2,
      name: r'stringify',
      type: IsarType.bool,
    ),
    r'todoStatus': PropertySchema(
      id: 3,
      name: r'todoStatus',
      type: IsarType.bool,
    ),
    r'todoTitle': PropertySchema(
      id: 4,
      name: r'todoTitle',
      type: IsarType.string,
    ),
    r'todoValue': PropertySchema(
      id: 5,
      name: r'todoValue',
      type: IsarType.string,
    )
  },
  estimateSize: _todoModelEstimateSize,
  serialize: _todoModelSerialize,
  deserialize: _todoModelDeserialize,
  deserializeProp: _todoModelDeserializeProp,
  idName: r'autoId',
  indexes: {
    r'id': IndexSchema(
      id: -3268401673993471357,
      name: r'id',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'id',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _todoModelGetId,
  getLinks: _todoModelGetLinks,
  attach: _todoModelAttach,
  version: '3.1.0+1',
);

int _todoModelEstimateSize(
  TodoModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.todoTitle.length * 3;
  bytesCount += 3 + object.todoValue.length * 3;
  return bytesCount;
}

void _todoModelSerialize(
  TodoModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.hashCode);
  writer.writeString(offsets[1], object.id);
  writer.writeBool(offsets[2], object.stringify);
  writer.writeBool(offsets[3], object.todoStatus);
  writer.writeString(offsets[4], object.todoTitle);
  writer.writeString(offsets[5], object.todoValue);
}

TodoModel _todoModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TodoModel(
    id: reader.readString(offsets[1]),
    todoStatus: reader.readBool(offsets[3]),
    todoTitle: reader.readString(offsets[4]),
    todoValue: reader.readString(offsets[5]),
  );
  return object;
}

P _todoModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _todoModelGetId(TodoModel object) {
  return object.autoId;
}

List<IsarLinkBase<dynamic>> _todoModelGetLinks(TodoModel object) {
  return [];
}

void _todoModelAttach(IsarCollection<dynamic> col, Id id, TodoModel object) {}

extension TodoModelByIndex on IsarCollection<TodoModel> {
  Future<TodoModel?> getById(String id) {
    return getByIndex(r'id', [id]);
  }

  TodoModel? getByIdSync(String id) {
    return getByIndexSync(r'id', [id]);
  }

  Future<bool> deleteById(String id) {
    return deleteByIndex(r'id', [id]);
  }

  bool deleteByIdSync(String id) {
    return deleteByIndexSync(r'id', [id]);
  }

  Future<List<TodoModel?>> getAllById(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return getAllByIndex(r'id', values);
  }

  List<TodoModel?> getAllByIdSync(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'id', values);
  }

  Future<int> deleteAllById(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'id', values);
  }

  int deleteAllByIdSync(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'id', values);
  }

  Future<Id> putById(TodoModel object) {
    return putByIndex(r'id', object);
  }

  Id putByIdSync(TodoModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'id', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllById(List<TodoModel> objects) {
    return putAllByIndex(r'id', objects);
  }

  List<Id> putAllByIdSync(List<TodoModel> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'id', objects, saveLinks: saveLinks);
  }
}

extension TodoModelQueryWhereSort
    on QueryBuilder<TodoModel, TodoModel, QWhere> {
  QueryBuilder<TodoModel, TodoModel, QAfterWhere> anyAutoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TodoModelQueryWhere
    on QueryBuilder<TodoModel, TodoModel, QWhereClause> {
  QueryBuilder<TodoModel, TodoModel, QAfterWhereClause> autoIdEqualTo(
      Id autoId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: autoId,
        upper: autoId,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterWhereClause> autoIdNotEqualTo(
      Id autoId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: autoId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: autoId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: autoId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: autoId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterWhereClause> autoIdGreaterThan(
      Id autoId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: autoId, includeLower: include),
      );
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterWhereClause> autoIdLessThan(
      Id autoId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: autoId, includeUpper: include),
      );
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterWhereClause> autoIdBetween(
    Id lowerAutoId,
    Id upperAutoId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerAutoId,
        includeLower: includeLower,
        upper: upperAutoId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterWhereClause> idEqualTo(String id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'id',
        value: [id],
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterWhereClause> idNotEqualTo(
      String id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [],
              upper: [id],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [id],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [id],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [],
              upper: [id],
              includeUpper: false,
            ));
      }
    });
  }
}

extension TodoModelQueryFilter
    on QueryBuilder<TodoModel, TodoModel, QFilterCondition> {
  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> autoIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'autoId',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> autoIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'autoId',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> autoIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'autoId',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> autoIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'autoId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> hashCodeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> stringifyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stringify',
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition>
      stringifyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stringify',
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> stringifyEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stringify',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> todoStatusEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'todoStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> todoTitleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'todoTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition>
      todoTitleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'todoTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> todoTitleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'todoTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> todoTitleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'todoTitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> todoTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'todoTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> todoTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'todoTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> todoTitleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'todoTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> todoTitleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'todoTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> todoTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'todoTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition>
      todoTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'todoTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> todoValueEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'todoValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition>
      todoValueGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'todoValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> todoValueLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'todoValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> todoValueBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'todoValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> todoValueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'todoValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> todoValueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'todoValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> todoValueContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'todoValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> todoValueMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'todoValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition> todoValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'todoValue',
        value: '',
      ));
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterFilterCondition>
      todoValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'todoValue',
        value: '',
      ));
    });
  }
}

extension TodoModelQueryObject
    on QueryBuilder<TodoModel, TodoModel, QFilterCondition> {}

extension TodoModelQueryLinks
    on QueryBuilder<TodoModel, TodoModel, QFilterCondition> {}

extension TodoModelQuerySortBy on QueryBuilder<TodoModel, TodoModel, QSortBy> {
  QueryBuilder<TodoModel, TodoModel, QAfterSortBy> sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterSortBy> sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterSortBy> sortByStringify() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringify', Sort.asc);
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterSortBy> sortByStringifyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringify', Sort.desc);
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterSortBy> sortByTodoStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todoStatus', Sort.asc);
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterSortBy> sortByTodoStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todoStatus', Sort.desc);
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterSortBy> sortByTodoTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todoTitle', Sort.asc);
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterSortBy> sortByTodoTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todoTitle', Sort.desc);
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterSortBy> sortByTodoValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todoValue', Sort.asc);
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterSortBy> sortByTodoValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todoValue', Sort.desc);
    });
  }
}

extension TodoModelQuerySortThenBy
    on QueryBuilder<TodoModel, TodoModel, QSortThenBy> {
  QueryBuilder<TodoModel, TodoModel, QAfterSortBy> thenByAutoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoId', Sort.asc);
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterSortBy> thenByAutoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoId', Sort.desc);
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterSortBy> thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterSortBy> thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterSortBy> thenByStringify() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringify', Sort.asc);
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterSortBy> thenByStringifyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringify', Sort.desc);
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterSortBy> thenByTodoStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todoStatus', Sort.asc);
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterSortBy> thenByTodoStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todoStatus', Sort.desc);
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterSortBy> thenByTodoTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todoTitle', Sort.asc);
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterSortBy> thenByTodoTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todoTitle', Sort.desc);
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterSortBy> thenByTodoValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todoValue', Sort.asc);
    });
  }

  QueryBuilder<TodoModel, TodoModel, QAfterSortBy> thenByTodoValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todoValue', Sort.desc);
    });
  }
}

extension TodoModelQueryWhereDistinct
    on QueryBuilder<TodoModel, TodoModel, QDistinct> {
  QueryBuilder<TodoModel, TodoModel, QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<TodoModel, TodoModel, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TodoModel, TodoModel, QDistinct> distinctByStringify() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stringify');
    });
  }

  QueryBuilder<TodoModel, TodoModel, QDistinct> distinctByTodoStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'todoStatus');
    });
  }

  QueryBuilder<TodoModel, TodoModel, QDistinct> distinctByTodoTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'todoTitle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TodoModel, TodoModel, QDistinct> distinctByTodoValue(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'todoValue', caseSensitive: caseSensitive);
    });
  }
}

extension TodoModelQueryProperty
    on QueryBuilder<TodoModel, TodoModel, QQueryProperty> {
  QueryBuilder<TodoModel, int, QQueryOperations> autoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'autoId');
    });
  }

  QueryBuilder<TodoModel, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<TodoModel, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TodoModel, bool?, QQueryOperations> stringifyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stringify');
    });
  }

  QueryBuilder<TodoModel, bool, QQueryOperations> todoStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'todoStatus');
    });
  }

  QueryBuilder<TodoModel, String, QQueryOperations> todoTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'todoTitle');
    });
  }

  QueryBuilder<TodoModel, String, QQueryOperations> todoValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'todoValue');
    });
  }
}
