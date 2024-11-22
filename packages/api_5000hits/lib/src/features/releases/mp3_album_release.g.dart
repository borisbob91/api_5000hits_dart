// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mp3_album_release.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMp3AlbumReleaseCollection on Isar {
  IsarCollection<Mp3AlbumRelease> get mp3AlbumReleases => this.collection();
}

const Mp3AlbumReleaseSchema = CollectionSchema(
  name: r'Mp3AlbumRelease',
  id: 2578616342086761534,
  properties: {
    r'added': PropertySchema(
      id: 0,
      name: r'added',
      type: IsarType.dateTime,
    ),
    r'album': PropertySchema(
      id: 1,
      name: r'album',
      type: IsarType.string,
    ),
    r'artist': PropertySchema(
      id: 2,
      name: r'artist',
      type: IsarType.string,
    ),
    r'author': PropertySchema(
      id: 3,
      name: r'author',
      type: IsarType.long,
    ),
    r'comment': PropertySchema(
      id: 4,
      name: r'comment',
      type: IsarType.string,
    ),
    r'rdate': PropertySchema(
      id: 5,
      name: r'rdate',
      type: IsarType.string,
    ),
    r'views': PropertySchema(
      id: 6,
      name: r'views',
      type: IsarType.long,
    ),
    r'visible': PropertySchema(
      id: 7,
      name: r'visible',
      type: IsarType.long,
    )
  },
  estimateSize: _mp3AlbumReleaseEstimateSize,
  serialize: _mp3AlbumReleaseSerialize,
  deserialize: _mp3AlbumReleaseDeserialize,
  deserializeProp: _mp3AlbumReleaseDeserializeProp,
  idName: r'id',
  indexes: {
    r'artist': IndexSchema(
      id: 5842945185359817302,
      name: r'artist',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'artist',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    ),
    r'album': IndexSchema(
      id: 6222745341035631462,
      name: r'album',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'album',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    ),
    r'rdate': IndexSchema(
      id: 8384823805786492627,
      name: r'rdate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'rdate',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'cover': LinkSchema(
      id: -5768874051046488414,
      name: r'cover',
      target: r'Mp3Cover',
      single: true,
    ),
    r'tracks': LinkSchema(
      id: 1043396225174375262,
      name: r'tracks',
      target: r'Mp3AlbumReleaseTrack',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _mp3AlbumReleaseGetId,
  getLinks: _mp3AlbumReleaseGetLinks,
  attach: _mp3AlbumReleaseAttach,
  version: '3.1.0+1',
);

int _mp3AlbumReleaseEstimateSize(
  Mp3AlbumRelease object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.album;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.artist;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.comment;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.rdate;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _mp3AlbumReleaseSerialize(
  Mp3AlbumRelease object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.added);
  writer.writeString(offsets[1], object.album);
  writer.writeString(offsets[2], object.artist);
  writer.writeLong(offsets[3], object.author);
  writer.writeString(offsets[4], object.comment);
  writer.writeString(offsets[5], object.rdate);
  writer.writeLong(offsets[6], object.views);
  writer.writeLong(offsets[7], object.visible);
}

Mp3AlbumRelease _mp3AlbumReleaseDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Mp3AlbumRelease(
    added: reader.readDateTimeOrNull(offsets[0]),
    album: reader.readStringOrNull(offsets[1]),
    artist: reader.readStringOrNull(offsets[2]),
    author: reader.readLongOrNull(offsets[3]),
    comment: reader.readStringOrNull(offsets[4]),
    rdate: reader.readStringOrNull(offsets[5]),
    views: reader.readLongOrNull(offsets[6]),
    visible: reader.readLongOrNull(offsets[7]),
  );
  object.id = id;
  return object;
}

P _mp3AlbumReleaseDeserializeProp<P>(
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
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _mp3AlbumReleaseGetId(Mp3AlbumRelease object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _mp3AlbumReleaseGetLinks(Mp3AlbumRelease object) {
  return [object.cover, object.tracks];
}

void _mp3AlbumReleaseAttach(
    IsarCollection<dynamic> col, Id id, Mp3AlbumRelease object) {
  object.id = id;
  object.cover.attach(col, col.isar.collection<Mp3Cover>(), r'cover', id);
  object.tracks
      .attach(col, col.isar.collection<Mp3AlbumReleaseTrack>(), r'tracks', id);
}

extension Mp3AlbumReleaseQueryWhereSort
    on QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QWhere> {
  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension Mp3AlbumReleaseQueryWhere
    on QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QWhereClause> {
  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterWhereClause>
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

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterWhereClause> idBetween(
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

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterWhereClause>
      artistIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'artist',
        value: [null],
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterWhereClause>
      artistIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'artist',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterWhereClause>
      artistEqualTo(String? artist) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'artist',
        value: [artist],
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterWhereClause>
      artistNotEqualTo(String? artist) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'artist',
              lower: [],
              upper: [artist],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'artist',
              lower: [artist],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'artist',
              lower: [artist],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'artist',
              lower: [],
              upper: [artist],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterWhereClause>
      albumIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'album',
        value: [null],
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterWhereClause>
      albumIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'album',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterWhereClause>
      albumEqualTo(String? album) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'album',
        value: [album],
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterWhereClause>
      albumNotEqualTo(String? album) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'album',
              lower: [],
              upper: [album],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'album',
              lower: [album],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'album',
              lower: [album],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'album',
              lower: [],
              upper: [album],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterWhereClause>
      rdateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'rdate',
        value: [null],
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterWhereClause>
      rdateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'rdate',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterWhereClause>
      rdateEqualTo(String? rdate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'rdate',
        value: [rdate],
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterWhereClause>
      rdateNotEqualTo(String? rdate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rdate',
              lower: [],
              upper: [rdate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rdate',
              lower: [rdate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rdate',
              lower: [rdate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rdate',
              lower: [],
              upper: [rdate],
              includeUpper: false,
            ));
      }
    });
  }
}

extension Mp3AlbumReleaseQueryFilter
    on QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QFilterCondition> {
  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      addedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'added',
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      addedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'added',
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      addedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'added',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      addedGreaterThan(
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

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      addedLessThan(
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

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      addedBetween(
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

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      albumIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'album',
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      albumIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'album',
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      albumEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'album',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      albumGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'album',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      albumLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'album',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      albumBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'album',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      albumStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'album',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      albumEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'album',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      albumContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'album',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      albumMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'album',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      albumIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'album',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      albumIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'album',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      artistIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'artist',
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      artistIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'artist',
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      artistEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'artist',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      artistGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'artist',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      artistLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'artist',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      artistBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'artist',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      artistStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'artist',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      artistEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'artist',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      artistContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'artist',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      artistMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'artist',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      artistIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'artist',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      artistIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'artist',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      authorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'author',
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      authorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'author',
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      authorEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'author',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      authorGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'author',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      authorLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'author',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      authorBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'author',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      commentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'comment',
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      commentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'comment',
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      commentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      commentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      commentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      commentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'comment',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      commentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      commentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      commentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      commentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'comment',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      commentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      commentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
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

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
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

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      rdateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rdate',
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      rdateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rdate',
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      rdateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rdate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      rdateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rdate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      rdateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rdate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      rdateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rdate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      rdateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rdate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      rdateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rdate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      rdateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rdate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      rdateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rdate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      rdateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rdate',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      rdateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rdate',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      viewsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'views',
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      viewsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'views',
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      viewsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'views',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      viewsGreaterThan(
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

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      viewsLessThan(
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

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      viewsBetween(
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

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      visibleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'visible',
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      visibleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'visible',
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      visibleEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'visible',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      visibleGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'visible',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      visibleLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'visible',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      visibleBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'visible',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension Mp3AlbumReleaseQueryObject
    on QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QFilterCondition> {}

extension Mp3AlbumReleaseQueryLinks
    on QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QFilterCondition> {
  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition> cover(
      FilterQuery<Mp3Cover> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'cover');
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      coverIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'cover', 0, true, 0, true);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition> tracks(
      FilterQuery<Mp3AlbumReleaseTrack> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'tracks');
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      tracksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tracks', length, true, length, true);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      tracksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tracks', 0, true, 0, true);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      tracksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tracks', 0, false, 999999, true);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      tracksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tracks', 0, true, length, include);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      tracksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tracks', length, include, 999999, true);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterFilterCondition>
      tracksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'tracks', lower, includeLower, upper, includeUpper);
    });
  }
}

extension Mp3AlbumReleaseQuerySortBy
    on QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QSortBy> {
  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy> sortByAdded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'added', Sort.asc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy>
      sortByAddedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'added', Sort.desc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy> sortByAlbum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'album', Sort.asc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy>
      sortByAlbumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'album', Sort.desc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy> sortByArtist() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.asc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy>
      sortByArtistDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.desc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy> sortByAuthor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.asc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy>
      sortByAuthorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.desc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy> sortByComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.asc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy>
      sortByCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.desc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy> sortByRdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rdate', Sort.asc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy>
      sortByRdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rdate', Sort.desc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy> sortByViews() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'views', Sort.asc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy>
      sortByViewsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'views', Sort.desc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy> sortByVisible() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visible', Sort.asc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy>
      sortByVisibleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visible', Sort.desc);
    });
  }
}

extension Mp3AlbumReleaseQuerySortThenBy
    on QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QSortThenBy> {
  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy> thenByAdded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'added', Sort.asc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy>
      thenByAddedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'added', Sort.desc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy> thenByAlbum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'album', Sort.asc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy>
      thenByAlbumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'album', Sort.desc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy> thenByArtist() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.asc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy>
      thenByArtistDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.desc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy> thenByAuthor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.asc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy>
      thenByAuthorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.desc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy> thenByComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.asc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy>
      thenByCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.desc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy> thenByRdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rdate', Sort.asc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy>
      thenByRdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rdate', Sort.desc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy> thenByViews() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'views', Sort.asc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy>
      thenByViewsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'views', Sort.desc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy> thenByVisible() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visible', Sort.asc);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QAfterSortBy>
      thenByVisibleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visible', Sort.desc);
    });
  }
}

extension Mp3AlbumReleaseQueryWhereDistinct
    on QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QDistinct> {
  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QDistinct> distinctByAdded() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'added');
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QDistinct> distinctByAlbum(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'album', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QDistinct> distinctByArtist(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'artist', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QDistinct> distinctByAuthor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'author');
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QDistinct> distinctByComment(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'comment', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QDistinct> distinctByRdate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rdate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QDistinct> distinctByViews() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'views');
    });
  }

  QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QDistinct>
      distinctByVisible() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visible');
    });
  }
}

extension Mp3AlbumReleaseQueryProperty
    on QueryBuilder<Mp3AlbumRelease, Mp3AlbumRelease, QQueryProperty> {
  QueryBuilder<Mp3AlbumRelease, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Mp3AlbumRelease, DateTime?, QQueryOperations> addedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'added');
    });
  }

  QueryBuilder<Mp3AlbumRelease, String?, QQueryOperations> albumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'album');
    });
  }

  QueryBuilder<Mp3AlbumRelease, String?, QQueryOperations> artistProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'artist');
    });
  }

  QueryBuilder<Mp3AlbumRelease, int?, QQueryOperations> authorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'author');
    });
  }

  QueryBuilder<Mp3AlbumRelease, String?, QQueryOperations> commentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'comment');
    });
  }

  QueryBuilder<Mp3AlbumRelease, String?, QQueryOperations> rdateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rdate');
    });
  }

  QueryBuilder<Mp3AlbumRelease, int?, QQueryOperations> viewsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'views');
    });
  }

  QueryBuilder<Mp3AlbumRelease, int?, QQueryOperations> visibleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visible');
    });
  }
}
