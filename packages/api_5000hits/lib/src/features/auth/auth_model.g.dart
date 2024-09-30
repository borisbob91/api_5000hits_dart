// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTokenCollection on Isar {
  IsarCollection<Token> get tokens => this.collection();
}

const TokenSchema = CollectionSchema(
  name: r'Token',
  id: 1141055021699684464,
  properties: {
    r'access': PropertySchema(
      id: 0,
      name: r'access',
      type: IsarType.string,
    ),
    r'expire': PropertySchema(
      id: 1,
      name: r'expire',
      type: IsarType.string,
    ),
    r'refresh': PropertySchema(
      id: 2,
      name: r'refresh',
      type: IsarType.string,
    )
  },
  estimateSize: _tokenEstimateSize,
  serialize: _tokenSerialize,
  deserialize: _tokenDeserialize,
  deserializeProp: _tokenDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _tokenGetId,
  getLinks: _tokenGetLinks,
  attach: _tokenAttach,
  version: '3.1.0+1',
);

int _tokenEstimateSize(
  Token object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.access;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.expire;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.refresh;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _tokenSerialize(
  Token object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.access);
  writer.writeString(offsets[1], object.expire);
  writer.writeString(offsets[2], object.refresh);
}

Token _tokenDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Token(
    access: reader.readStringOrNull(offsets[0]),
    expire: reader.readStringOrNull(offsets[1]),
    refresh: reader.readStringOrNull(offsets[2]),
  );
  object.id = id;
  return object;
}

P _tokenDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _tokenGetId(Token object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _tokenGetLinks(Token object) {
  return [];
}

void _tokenAttach(IsarCollection<dynamic> col, Id id, Token object) {
  object.id = id;
}

extension TokenQueryWhereSort on QueryBuilder<Token, Token, QWhere> {
  QueryBuilder<Token, Token, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TokenQueryWhere on QueryBuilder<Token, Token, QWhereClause> {
  QueryBuilder<Token, Token, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Token, Token, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Token, Token, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Token, Token, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TokenQueryFilter on QueryBuilder<Token, Token, QFilterCondition> {
  QueryBuilder<Token, Token, QAfterFilterCondition> accessIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'access',
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> accessIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'access',
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> accessEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'access',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> accessGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'access',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> accessLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'access',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> accessBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'access',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> accessStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'access',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> accessEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'access',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> accessContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'access',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> accessMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'access',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> accessIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'access',
        value: '',
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> accessIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'access',
        value: '',
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> expireIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expire',
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> expireIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expire',
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> expireEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expire',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> expireGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expire',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> expireLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expire',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> expireBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expire',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> expireStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'expire',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> expireEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'expire',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> expireContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'expire',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> expireMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'expire',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> expireIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expire',
        value: '',
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> expireIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'expire',
        value: '',
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> refreshIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'refresh',
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> refreshIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'refresh',
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> refreshEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'refresh',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> refreshGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'refresh',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> refreshLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'refresh',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> refreshBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'refresh',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> refreshStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'refresh',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> refreshEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'refresh',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> refreshContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'refresh',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> refreshMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'refresh',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> refreshIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'refresh',
        value: '',
      ));
    });
  }

  QueryBuilder<Token, Token, QAfterFilterCondition> refreshIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'refresh',
        value: '',
      ));
    });
  }
}

extension TokenQueryObject on QueryBuilder<Token, Token, QFilterCondition> {}

extension TokenQueryLinks on QueryBuilder<Token, Token, QFilterCondition> {}

extension TokenQuerySortBy on QueryBuilder<Token, Token, QSortBy> {
  QueryBuilder<Token, Token, QAfterSortBy> sortByAccess() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'access', Sort.asc);
    });
  }

  QueryBuilder<Token, Token, QAfterSortBy> sortByAccessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'access', Sort.desc);
    });
  }

  QueryBuilder<Token, Token, QAfterSortBy> sortByExpire() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expire', Sort.asc);
    });
  }

  QueryBuilder<Token, Token, QAfterSortBy> sortByExpireDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expire', Sort.desc);
    });
  }

  QueryBuilder<Token, Token, QAfterSortBy> sortByRefresh() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refresh', Sort.asc);
    });
  }

  QueryBuilder<Token, Token, QAfterSortBy> sortByRefreshDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refresh', Sort.desc);
    });
  }
}

extension TokenQuerySortThenBy on QueryBuilder<Token, Token, QSortThenBy> {
  QueryBuilder<Token, Token, QAfterSortBy> thenByAccess() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'access', Sort.asc);
    });
  }

  QueryBuilder<Token, Token, QAfterSortBy> thenByAccessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'access', Sort.desc);
    });
  }

  QueryBuilder<Token, Token, QAfterSortBy> thenByExpire() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expire', Sort.asc);
    });
  }

  QueryBuilder<Token, Token, QAfterSortBy> thenByExpireDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expire', Sort.desc);
    });
  }

  QueryBuilder<Token, Token, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Token, Token, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Token, Token, QAfterSortBy> thenByRefresh() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refresh', Sort.asc);
    });
  }

  QueryBuilder<Token, Token, QAfterSortBy> thenByRefreshDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refresh', Sort.desc);
    });
  }
}

extension TokenQueryWhereDistinct on QueryBuilder<Token, Token, QDistinct> {
  QueryBuilder<Token, Token, QDistinct> distinctByAccess(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'access', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Token, Token, QDistinct> distinctByExpire(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expire', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Token, Token, QDistinct> distinctByRefresh(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'refresh', caseSensitive: caseSensitive);
    });
  }
}

extension TokenQueryProperty on QueryBuilder<Token, Token, QQueryProperty> {
  QueryBuilder<Token, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Token, String?, QQueryOperations> accessProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'access');
    });
  }

  QueryBuilder<Token, String?, QQueryOperations> expireProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expire');
    });
  }

  QueryBuilder<Token, String?, QQueryOperations> refreshProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'refresh');
    });
  }
}
