// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mp3_video.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMp3VideoCollection on Isar {
  IsarCollection<Mp3Video> get mp3Videos => this.collection();
}

const Mp3VideoSchema = CollectionSchema(
  name: r'Mp3Video',
  id: 1782902543318977077,
  properties: {
    r'added': PropertySchema(
      id: 0,
      name: r'added',
      type: IsarType.dateTime,
    ),
    r'addedBy': PropertySchema(
      id: 1,
      name: r'addedBy',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 2,
      name: r'title',
      type: IsarType.string,
    ),
    r'views': PropertySchema(
      id: 3,
      name: r'views',
      type: IsarType.long,
    ),
    r'ytId': PropertySchema(
      id: 4,
      name: r'ytId',
      type: IsarType.string,
    )
  },
  estimateSize: _mp3VideoEstimateSize,
  serialize: _mp3VideoSerialize,
  deserialize: _mp3VideoDeserialize,
  deserializeProp: _mp3VideoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _mp3VideoGetId,
  getLinks: _mp3VideoGetLinks,
  attach: _mp3VideoAttach,
  version: '3.1.0+1',
);

int _mp3VideoEstimateSize(
  Mp3Video object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.addedBy;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ytId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _mp3VideoSerialize(
  Mp3Video object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.added);
  writer.writeString(offsets[1], object.addedBy);
  writer.writeString(offsets[2], object.title);
  writer.writeLong(offsets[3], object.views);
  writer.writeString(offsets[4], object.ytId);
}

Mp3Video _mp3VideoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Mp3Video(
    added: reader.readDateTimeOrNull(offsets[0]),
    addedBy: reader.readStringOrNull(offsets[1]),
    id: id,
    title: reader.readStringOrNull(offsets[2]),
    views: reader.readLongOrNull(offsets[3]),
    ytId: reader.readStringOrNull(offsets[4]),
  );
  return object;
}

P _mp3VideoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _mp3VideoGetId(Mp3Video object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _mp3VideoGetLinks(Mp3Video object) {
  return [];
}

void _mp3VideoAttach(IsarCollection<dynamic> col, Id id, Mp3Video object) {
  object.id = id;
}

extension Mp3VideoQueryWhereSort on QueryBuilder<Mp3Video, Mp3Video, QWhere> {
  QueryBuilder<Mp3Video, Mp3Video, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension Mp3VideoQueryWhere on QueryBuilder<Mp3Video, Mp3Video, QWhereClause> {
  QueryBuilder<Mp3Video, Mp3Video, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Mp3Video, Mp3Video, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterWhereClause> idBetween(
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

extension Mp3VideoQueryFilter
    on QueryBuilder<Mp3Video, Mp3Video, QFilterCondition> {
  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> addedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'added',
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> addedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'added',
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> addedEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'added',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> addedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'added',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> addedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'added',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> addedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'added',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> addedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addedBy',
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> addedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addedBy',
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> addedByEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> addedByGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'addedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> addedByLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'addedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> addedByBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'addedBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> addedByStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'addedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> addedByEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'addedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> addedByContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'addedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> addedByMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'addedBy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> addedByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedBy',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> addedByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'addedBy',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> viewsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'views',
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> viewsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'views',
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> viewsEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'views',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> viewsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'views',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> viewsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'views',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> viewsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'views',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> ytIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ytId',
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> ytIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ytId',
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> ytIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ytId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> ytIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ytId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> ytIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ytId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> ytIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ytId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> ytIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ytId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> ytIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ytId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> ytIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ytId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> ytIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ytId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> ytIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ytId',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterFilterCondition> ytIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ytId',
        value: '',
      ));
    });
  }
}

extension Mp3VideoQueryObject
    on QueryBuilder<Mp3Video, Mp3Video, QFilterCondition> {}

extension Mp3VideoQueryLinks
    on QueryBuilder<Mp3Video, Mp3Video, QFilterCondition> {}

extension Mp3VideoQuerySortBy on QueryBuilder<Mp3Video, Mp3Video, QSortBy> {
  QueryBuilder<Mp3Video, Mp3Video, QAfterSortBy> sortByAdded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'added', Sort.asc);
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterSortBy> sortByAddedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'added', Sort.desc);
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterSortBy> sortByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.asc);
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterSortBy> sortByAddedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.desc);
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterSortBy> sortByViews() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'views', Sort.asc);
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterSortBy> sortByViewsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'views', Sort.desc);
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterSortBy> sortByYtId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ytId', Sort.asc);
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterSortBy> sortByYtIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ytId', Sort.desc);
    });
  }
}

extension Mp3VideoQuerySortThenBy
    on QueryBuilder<Mp3Video, Mp3Video, QSortThenBy> {
  QueryBuilder<Mp3Video, Mp3Video, QAfterSortBy> thenByAdded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'added', Sort.asc);
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterSortBy> thenByAddedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'added', Sort.desc);
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterSortBy> thenByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.asc);
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterSortBy> thenByAddedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.desc);
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterSortBy> thenByViews() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'views', Sort.asc);
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterSortBy> thenByViewsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'views', Sort.desc);
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterSortBy> thenByYtId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ytId', Sort.asc);
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QAfterSortBy> thenByYtIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ytId', Sort.desc);
    });
  }
}

extension Mp3VideoQueryWhereDistinct
    on QueryBuilder<Mp3Video, Mp3Video, QDistinct> {
  QueryBuilder<Mp3Video, Mp3Video, QDistinct> distinctByAdded() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'added');
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QDistinct> distinctByAddedBy(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedBy', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QDistinct> distinctByViews() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'views');
    });
  }

  QueryBuilder<Mp3Video, Mp3Video, QDistinct> distinctByYtId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ytId', caseSensitive: caseSensitive);
    });
  }
}

extension Mp3VideoQueryProperty
    on QueryBuilder<Mp3Video, Mp3Video, QQueryProperty> {
  QueryBuilder<Mp3Video, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Mp3Video, DateTime?, QQueryOperations> addedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'added');
    });
  }

  QueryBuilder<Mp3Video, String?, QQueryOperations> addedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedBy');
    });
  }

  QueryBuilder<Mp3Video, String?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<Mp3Video, int?, QQueryOperations> viewsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'views');
    });
  }

  QueryBuilder<Mp3Video, String?, QQueryOperations> ytIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ytId');
    });
  }
}
