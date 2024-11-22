// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mp3_album_release_track.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMp3AlbumReleaseTrackCollection on Isar {
  IsarCollection<Mp3AlbumReleaseTrack> get mp3AlbumReleaseTracks =>
      this.collection();
}

const Mp3AlbumReleaseTrackSchema = CollectionSchema(
  name: r'Mp3AlbumReleaseTrack',
  id: 7787291472789992616,
  properties: {
    r'albumReleaseId': PropertySchema(
      id: 0,
      name: r'albumReleaseId',
      type: IsarType.long,
    ),
    r'trackName': PropertySchema(
      id: 1,
      name: r'trackName',
      type: IsarType.string,
    ),
    r'trackNumber': PropertySchema(
      id: 2,
      name: r'trackNumber',
      type: IsarType.string,
    )
  },
  estimateSize: _mp3AlbumReleaseTrackEstimateSize,
  serialize: _mp3AlbumReleaseTrackSerialize,
  deserialize: _mp3AlbumReleaseTrackDeserialize,
  deserializeProp: _mp3AlbumReleaseTrackDeserializeProp,
  idName: r'id',
  indexes: {
    r'albumReleaseId_trackNumber': IndexSchema(
      id: 2683305500668912676,
      name: r'albumReleaseId_trackNumber',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'albumReleaseId',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'trackNumber',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _mp3AlbumReleaseTrackGetId,
  getLinks: _mp3AlbumReleaseTrackGetLinks,
  attach: _mp3AlbumReleaseTrackAttach,
  version: '3.1.0+1',
);

int _mp3AlbumReleaseTrackEstimateSize(
  Mp3AlbumReleaseTrack object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.trackName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.trackNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _mp3AlbumReleaseTrackSerialize(
  Mp3AlbumReleaseTrack object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.albumReleaseId);
  writer.writeString(offsets[1], object.trackName);
  writer.writeString(offsets[2], object.trackNumber);
}

Mp3AlbumReleaseTrack _mp3AlbumReleaseTrackDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Mp3AlbumReleaseTrack(
    albumReleaseId: reader.readLongOrNull(offsets[0]),
    trackName: reader.readStringOrNull(offsets[1]),
    trackNumber: reader.readStringOrNull(offsets[2]),
  );
  object.id = id;
  return object;
}

P _mp3AlbumReleaseTrackDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _mp3AlbumReleaseTrackGetId(Mp3AlbumReleaseTrack object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _mp3AlbumReleaseTrackGetLinks(
    Mp3AlbumReleaseTrack object) {
  return [];
}

void _mp3AlbumReleaseTrackAttach(
    IsarCollection<dynamic> col, Id id, Mp3AlbumReleaseTrack object) {
  object.id = id;
}

extension Mp3AlbumReleaseTrackQueryWhereSort
    on QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QWhere> {
  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension Mp3AlbumReleaseTrackQueryWhere
    on QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QWhereClause> {
  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterWhereClause>
      albumReleaseIdIsNullAnyTrackNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'albumReleaseId_trackNumber',
        value: [null],
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterWhereClause>
      albumReleaseIdIsNotNullAnyTrackNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'albumReleaseId_trackNumber',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterWhereClause>
      albumReleaseIdEqualToAnyTrackNumber(int? albumReleaseId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'albumReleaseId_trackNumber',
        value: [albumReleaseId],
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterWhereClause>
      albumReleaseIdNotEqualToAnyTrackNumber(int? albumReleaseId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'albumReleaseId_trackNumber',
              lower: [],
              upper: [albumReleaseId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'albumReleaseId_trackNumber',
              lower: [albumReleaseId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'albumReleaseId_trackNumber',
              lower: [albumReleaseId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'albumReleaseId_trackNumber',
              lower: [],
              upper: [albumReleaseId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterWhereClause>
      albumReleaseIdGreaterThanAnyTrackNumber(
    int? albumReleaseId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'albumReleaseId_trackNumber',
        lower: [albumReleaseId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterWhereClause>
      albumReleaseIdLessThanAnyTrackNumber(
    int? albumReleaseId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'albumReleaseId_trackNumber',
        lower: [],
        upper: [albumReleaseId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterWhereClause>
      albumReleaseIdBetweenAnyTrackNumber(
    int? lowerAlbumReleaseId,
    int? upperAlbumReleaseId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'albumReleaseId_trackNumber',
        lower: [lowerAlbumReleaseId],
        includeLower: includeLower,
        upper: [upperAlbumReleaseId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterWhereClause>
      albumReleaseIdEqualToTrackNumberIsNull(int? albumReleaseId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'albumReleaseId_trackNumber',
        value: [albumReleaseId, null],
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterWhereClause>
      albumReleaseIdEqualToTrackNumberIsNotNull(int? albumReleaseId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'albumReleaseId_trackNumber',
        lower: [albumReleaseId, null],
        includeLower: false,
        upper: [
          albumReleaseId,
        ],
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterWhereClause>
      albumReleaseIdTrackNumberEqualTo(
          int? albumReleaseId, String? trackNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'albumReleaseId_trackNumber',
        value: [albumReleaseId, trackNumber],
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterWhereClause>
      albumReleaseIdEqualToTrackNumberNotEqualTo(
          int? albumReleaseId, String? trackNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'albumReleaseId_trackNumber',
              lower: [albumReleaseId],
              upper: [albumReleaseId, trackNumber],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'albumReleaseId_trackNumber',
              lower: [albumReleaseId, trackNumber],
              includeLower: false,
              upper: [albumReleaseId],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'albumReleaseId_trackNumber',
              lower: [albumReleaseId, trackNumber],
              includeLower: false,
              upper: [albumReleaseId],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'albumReleaseId_trackNumber',
              lower: [albumReleaseId],
              upper: [albumReleaseId, trackNumber],
              includeUpper: false,
            ));
      }
    });
  }
}

extension Mp3AlbumReleaseTrackQueryFilter on QueryBuilder<Mp3AlbumReleaseTrack,
    Mp3AlbumReleaseTrack, QFilterCondition> {
  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> albumReleaseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'albumReleaseId',
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> albumReleaseIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'albumReleaseId',
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> albumReleaseIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'albumReleaseId',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> albumReleaseIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'albumReleaseId',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> albumReleaseIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'albumReleaseId',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> albumReleaseIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'albumReleaseId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> trackNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'trackName',
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> trackNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'trackName',
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> trackNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trackName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> trackNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'trackName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> trackNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'trackName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> trackNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'trackName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> trackNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'trackName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> trackNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'trackName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
          QAfterFilterCondition>
      trackNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'trackName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
          QAfterFilterCondition>
      trackNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'trackName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> trackNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trackName',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> trackNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'trackName',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> trackNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'trackNumber',
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> trackNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'trackNumber',
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> trackNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trackNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> trackNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'trackNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> trackNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'trackNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> trackNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'trackNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> trackNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'trackNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> trackNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'trackNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
          QAfterFilterCondition>
      trackNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'trackNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
          QAfterFilterCondition>
      trackNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'trackNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> trackNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trackNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack,
      QAfterFilterCondition> trackNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'trackNumber',
        value: '',
      ));
    });
  }
}

extension Mp3AlbumReleaseTrackQueryObject on QueryBuilder<Mp3AlbumReleaseTrack,
    Mp3AlbumReleaseTrack, QFilterCondition> {}

extension Mp3AlbumReleaseTrackQueryLinks on QueryBuilder<Mp3AlbumReleaseTrack,
    Mp3AlbumReleaseTrack, QFilterCondition> {}

extension Mp3AlbumReleaseTrackQuerySortBy
    on QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QSortBy> {
  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterSortBy>
      sortByAlbumReleaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'albumReleaseId', Sort.asc);
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterSortBy>
      sortByAlbumReleaseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'albumReleaseId', Sort.desc);
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterSortBy>
      sortByTrackName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trackName', Sort.asc);
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterSortBy>
      sortByTrackNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trackName', Sort.desc);
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterSortBy>
      sortByTrackNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trackNumber', Sort.asc);
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterSortBy>
      sortByTrackNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trackNumber', Sort.desc);
    });
  }
}

extension Mp3AlbumReleaseTrackQuerySortThenBy
    on QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QSortThenBy> {
  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterSortBy>
      thenByAlbumReleaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'albumReleaseId', Sort.asc);
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterSortBy>
      thenByAlbumReleaseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'albumReleaseId', Sort.desc);
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterSortBy>
      thenByTrackName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trackName', Sort.asc);
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterSortBy>
      thenByTrackNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trackName', Sort.desc);
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterSortBy>
      thenByTrackNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trackNumber', Sort.asc);
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QAfterSortBy>
      thenByTrackNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trackNumber', Sort.desc);
    });
  }
}

extension Mp3AlbumReleaseTrackQueryWhereDistinct
    on QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QDistinct> {
  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QDistinct>
      distinctByAlbumReleaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'albumReleaseId');
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QDistinct>
      distinctByTrackName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trackName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QDistinct>
      distinctByTrackNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trackNumber', caseSensitive: caseSensitive);
    });
  }
}

extension Mp3AlbumReleaseTrackQueryProperty on QueryBuilder<
    Mp3AlbumReleaseTrack, Mp3AlbumReleaseTrack, QQueryProperty> {
  QueryBuilder<Mp3AlbumReleaseTrack, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, int?, QQueryOperations>
      albumReleaseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'albumReleaseId');
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, String?, QQueryOperations>
      trackNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trackName');
    });
  }

  QueryBuilder<Mp3AlbumReleaseTrack, String?, QQueryOperations>
      trackNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trackNumber');
    });
  }
}
