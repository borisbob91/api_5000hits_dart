// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_timestamp.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCacheTimestampCollection on Isar {
  IsarCollection<CacheTimestamp> get cacheTimestamps => this.collection();
}

const CacheTimestampSchema = CollectionSchema(
  name: r'CacheTimestamp',
  id: 2853845461546202385,
  properties: {
    r'lastUpdate': PropertySchema(
      id: 0,
      name: r'lastUpdate',
      type: IsarType.dateTime,
    ),
    r'validityDurationInHours': PropertySchema(
      id: 1,
      name: r'validityDurationInHours',
      type: IsarType.long,
    )
  },
  estimateSize: _cacheTimestampEstimateSize,
  serialize: _cacheTimestampSerialize,
  deserialize: _cacheTimestampDeserialize,
  deserializeProp: _cacheTimestampDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _cacheTimestampGetId,
  getLinks: _cacheTimestampGetLinks,
  attach: _cacheTimestampAttach,
  version: '3.1.0+1',
);

int _cacheTimestampEstimateSize(
  CacheTimestamp object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _cacheTimestampSerialize(
  CacheTimestamp object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.lastUpdate);
  writer.writeLong(offsets[1], object.validityDurationInHours);
}

CacheTimestamp _cacheTimestampDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CacheTimestamp();
  object.id = id;
  object.lastUpdate = reader.readDateTimeOrNull(offsets[0]);
  object.validityDurationInHours = reader.readLong(offsets[1]);
  return object;
}

P _cacheTimestampDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cacheTimestampGetId(CacheTimestamp object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cacheTimestampGetLinks(CacheTimestamp object) {
  return [];
}

void _cacheTimestampAttach(
    IsarCollection<dynamic> col, Id id, CacheTimestamp object) {
  object.id = id;
}

extension CacheTimestampQueryWhereSort
    on QueryBuilder<CacheTimestamp, CacheTimestamp, QWhere> {
  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CacheTimestampQueryWhere
    on QueryBuilder<CacheTimestamp, CacheTimestamp, QWhereClause> {
  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterWhereClause> idBetween(
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

extension CacheTimestampQueryFilter
    on QueryBuilder<CacheTimestamp, CacheTimestamp, QFilterCondition> {
  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
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

  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterFilterCondition>
      idLessThan(
    Id value, {
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

  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
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

  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterFilterCondition>
      lastUpdateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastUpdate',
      ));
    });
  }

  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterFilterCondition>
      lastUpdateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastUpdate',
      ));
    });
  }

  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterFilterCondition>
      lastUpdateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdate',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterFilterCondition>
      lastUpdateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUpdate',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterFilterCondition>
      lastUpdateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUpdate',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterFilterCondition>
      lastUpdateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUpdate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterFilterCondition>
      validityDurationInHoursEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'validityDurationInHours',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterFilterCondition>
      validityDurationInHoursGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'validityDurationInHours',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterFilterCondition>
      validityDurationInHoursLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'validityDurationInHours',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterFilterCondition>
      validityDurationInHoursBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'validityDurationInHours',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CacheTimestampQueryObject
    on QueryBuilder<CacheTimestamp, CacheTimestamp, QFilterCondition> {}

extension CacheTimestampQueryLinks
    on QueryBuilder<CacheTimestamp, CacheTimestamp, QFilterCondition> {}

extension CacheTimestampQuerySortBy
    on QueryBuilder<CacheTimestamp, CacheTimestamp, QSortBy> {
  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterSortBy>
      sortByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.asc);
    });
  }

  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterSortBy>
      sortByLastUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.desc);
    });
  }

  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterSortBy>
      sortByValidityDurationInHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validityDurationInHours', Sort.asc);
    });
  }

  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterSortBy>
      sortByValidityDurationInHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validityDurationInHours', Sort.desc);
    });
  }
}

extension CacheTimestampQuerySortThenBy
    on QueryBuilder<CacheTimestamp, CacheTimestamp, QSortThenBy> {
  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterSortBy>
      thenByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.asc);
    });
  }

  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterSortBy>
      thenByLastUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.desc);
    });
  }

  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterSortBy>
      thenByValidityDurationInHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validityDurationInHours', Sort.asc);
    });
  }

  QueryBuilder<CacheTimestamp, CacheTimestamp, QAfterSortBy>
      thenByValidityDurationInHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validityDurationInHours', Sort.desc);
    });
  }
}

extension CacheTimestampQueryWhereDistinct
    on QueryBuilder<CacheTimestamp, CacheTimestamp, QDistinct> {
  QueryBuilder<CacheTimestamp, CacheTimestamp, QDistinct>
      distinctByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdate');
    });
  }

  QueryBuilder<CacheTimestamp, CacheTimestamp, QDistinct>
      distinctByValidityDurationInHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'validityDurationInHours');
    });
  }
}

extension CacheTimestampQueryProperty
    on QueryBuilder<CacheTimestamp, CacheTimestamp, QQueryProperty> {
  QueryBuilder<CacheTimestamp, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CacheTimestamp, DateTime?, QQueryOperations>
      lastUpdateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdate');
    });
  }

  QueryBuilder<CacheTimestamp, int, QQueryOperations>
      validityDurationInHoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'validityDurationInHours');
    });
  }
}
