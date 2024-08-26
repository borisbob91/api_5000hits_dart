// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mp3_cover.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMp3CoverCollection on Isar {
  IsarCollection<Mp3Cover> get mp3Covers => this.collection();
}

const Mp3CoverSchema = CollectionSchema(
  name: r'Mp3Cover',
  id: 6349794740299346208,
  properties: {
    r'max': PropertySchema(
      id: 0,
      name: r'max',
      type: IsarType.string,
    ),
    r'min': PropertySchema(
      id: 1,
      name: r'min',
      type: IsarType.string,
    )
  },
  estimateSize: _mp3CoverEstimateSize,
  serialize: _mp3CoverSerialize,
  deserialize: _mp3CoverDeserialize,
  deserializeProp: _mp3CoverDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _mp3CoverGetId,
  getLinks: _mp3CoverGetLinks,
  attach: _mp3CoverAttach,
  version: '3.1.0+1',
);

int _mp3CoverEstimateSize(
  Mp3Cover object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.max;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.min;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _mp3CoverSerialize(
  Mp3Cover object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.max);
  writer.writeString(offsets[1], object.min);
}

Mp3Cover _mp3CoverDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Mp3Cover(
    id: id,
    max: reader.readStringOrNull(offsets[0]),
    min: reader.readStringOrNull(offsets[1]),
  );
  return object;
}

P _mp3CoverDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _mp3CoverGetId(Mp3Cover object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _mp3CoverGetLinks(Mp3Cover object) {
  return [];
}

void _mp3CoverAttach(IsarCollection<dynamic> col, Id id, Mp3Cover object) {
  object.id = id;
}

extension Mp3CoverQueryWhereSort on QueryBuilder<Mp3Cover, Mp3Cover, QWhere> {
  QueryBuilder<Mp3Cover, Mp3Cover, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension Mp3CoverQueryWhere on QueryBuilder<Mp3Cover, Mp3Cover, QWhereClause> {
  QueryBuilder<Mp3Cover, Mp3Cover, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterWhereClause> idBetween(
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

extension Mp3CoverQueryFilter
    on QueryBuilder<Mp3Cover, Mp3Cover, QFilterCondition> {
  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> maxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'max',
      ));
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> maxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'max',
      ));
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> maxEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'max',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> maxGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'max',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> maxLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'max',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> maxBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'max',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> maxStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'max',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> maxEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'max',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> maxContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'max',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> maxMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'max',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> maxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'max',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> maxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'max',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> minIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'min',
      ));
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> minIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'min',
      ));
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> minEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'min',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> minGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'min',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> minLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'min',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> minBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'min',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> minStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'min',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> minEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'min',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> minContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'min',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> minMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'min',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> minIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'min',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterFilterCondition> minIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'min',
        value: '',
      ));
    });
  }
}

extension Mp3CoverQueryObject
    on QueryBuilder<Mp3Cover, Mp3Cover, QFilterCondition> {}

extension Mp3CoverQueryLinks
    on QueryBuilder<Mp3Cover, Mp3Cover, QFilterCondition> {}

extension Mp3CoverQuerySortBy on QueryBuilder<Mp3Cover, Mp3Cover, QSortBy> {
  QueryBuilder<Mp3Cover, Mp3Cover, QAfterSortBy> sortByMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'max', Sort.asc);
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterSortBy> sortByMaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'max', Sort.desc);
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterSortBy> sortByMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'min', Sort.asc);
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterSortBy> sortByMinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'min', Sort.desc);
    });
  }
}

extension Mp3CoverQuerySortThenBy
    on QueryBuilder<Mp3Cover, Mp3Cover, QSortThenBy> {
  QueryBuilder<Mp3Cover, Mp3Cover, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterSortBy> thenByMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'max', Sort.asc);
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterSortBy> thenByMaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'max', Sort.desc);
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterSortBy> thenByMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'min', Sort.asc);
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QAfterSortBy> thenByMinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'min', Sort.desc);
    });
  }
}

extension Mp3CoverQueryWhereDistinct
    on QueryBuilder<Mp3Cover, Mp3Cover, QDistinct> {
  QueryBuilder<Mp3Cover, Mp3Cover, QDistinct> distinctByMax(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'max', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mp3Cover, Mp3Cover, QDistinct> distinctByMin(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'min', caseSensitive: caseSensitive);
    });
  }
}

extension Mp3CoverQueryProperty
    on QueryBuilder<Mp3Cover, Mp3Cover, QQueryProperty> {
  QueryBuilder<Mp3Cover, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Mp3Cover, String?, QQueryOperations> maxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'max');
    });
  }

  QueryBuilder<Mp3Cover, String?, QQueryOperations> minProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'min');
    });
  }
}
