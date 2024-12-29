// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mp3_music.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMp3MusicCollection on Isar {
  IsarCollection<Mp3Music> get mp3Musics => this.collection();
}

const Mp3MusicSchema = CollectionSchema(
  name: r'Mp3Music',
  id: -4664747136630591572,
  properties: {
    r'album': PropertySchema(
      id: 0,
      name: r'album',
      type: IsarType.string,
    ),
    r'artist': PropertySchema(
      id: 1,
      name: r'artist',
      type: IsarType.string,
    ),
    r'bitrate': PropertySchema(
      id: 2,
      name: r'bitrate',
      type: IsarType.string,
    ),
    r'country': PropertySchema(
      id: 3,
      name: r'country',
      type: IsarType.long,
    ),
    r'duration': PropertySchema(
      id: 4,
      name: r'duration',
      type: IsarType.string,
    ),
    r'file': PropertySchema(
      id: 5,
      name: r'file',
      type: IsarType.string,
    ),
    r'filesize': PropertySchema(
      id: 6,
      name: r'filesize',
      type: IsarType.string,
    ),
    r'genre': PropertySchema(
      id: 7,
      name: r'genre',
      type: IsarType.string,
    ),
    r'hits': PropertySchema(
      id: 8,
      name: r'hits',
      type: IsarType.long,
    ),
    r'label': PropertySchema(
      id: 9,
      name: r'label',
      type: IsarType.string,
    ),
    r'slug': PropertySchema(
      id: 10,
      name: r'slug',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 11,
      name: r'title',
      type: IsarType.string,
    ),
    r'track': PropertySchema(
      id: 12,
      name: r'track',
      type: IsarType.string,
    ),
    r'uploaded': PropertySchema(
      id: 13,
      name: r'uploaded',
      type: IsarType.dateTime,
    ),
    r'uploader': PropertySchema(
      id: 14,
      name: r'uploader',
      type: IsarType.string,
    ),
    r'year': PropertySchema(
      id: 15,
      name: r'year',
      type: IsarType.string,
    )
  },
  estimateSize: _mp3MusicEstimateSize,
  serialize: _mp3MusicSerialize,
  deserialize: _mp3MusicDeserialize,
  deserializeProp: _mp3MusicDeserializeProp,
  idName: r'id',
  indexes: {
    r'slug': IndexSchema(
      id: 6169444064746062836,
      name: r'slug',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'slug',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'artist': IndexSchema(
      id: 5842945185359817302,
      name: r'artist',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'artist',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'title': IndexSchema(
      id: -7636685945352118059,
      name: r'title',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'title',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'genre': IndexSchema(
      id: 7810252941268804523,
      name: r'genre',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'genre',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'cover': LinkSchema(
      id: -7634194999314828088,
      name: r'cover',
      target: r'Mp3Cover',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _mp3MusicGetId,
  getLinks: _mp3MusicGetLinks,
  attach: _mp3MusicAttach,
  version: '3.1.0+1',
);

int _mp3MusicEstimateSize(
  Mp3Music object,
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
  bytesCount += 3 + object.artist.length * 3;
  {
    final value = object.bitrate;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.duration;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.file;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.filesize;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.genre;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.label;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.slug.length * 3;
  bytesCount += 3 + object.title.length * 3;
  {
    final value = object.track;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.uploader;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.year;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _mp3MusicSerialize(
  Mp3Music object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.album);
  writer.writeString(offsets[1], object.artist);
  writer.writeString(offsets[2], object.bitrate);
  writer.writeLong(offsets[3], object.country);
  writer.writeString(offsets[4], object.duration);
  writer.writeString(offsets[5], object.file);
  writer.writeString(offsets[6], object.filesize);
  writer.writeString(offsets[7], object.genre);
  writer.writeLong(offsets[8], object.hits);
  writer.writeString(offsets[9], object.label);
  writer.writeString(offsets[10], object.slug);
  writer.writeString(offsets[11], object.title);
  writer.writeString(offsets[12], object.track);
  writer.writeDateTime(offsets[13], object.uploaded);
  writer.writeString(offsets[14], object.uploader);
  writer.writeString(offsets[15], object.year);
}

Mp3Music _mp3MusicDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Mp3Music(
    album: reader.readStringOrNull(offsets[0]),
    artist: reader.readStringOrNull(offsets[1]) ?? '',
    bitrate: reader.readStringOrNull(offsets[2]),
    country: reader.readLongOrNull(offsets[3]),
    duration: reader.readStringOrNull(offsets[4]),
    file: reader.readStringOrNull(offsets[5]),
    filesize: reader.readStringOrNull(offsets[6]),
    genre: reader.readStringOrNull(offsets[7]),
    hits: reader.readLongOrNull(offsets[8]),
    label: reader.readStringOrNull(offsets[9]),
    slug: reader.readStringOrNull(offsets[10]) ?? '',
    title: reader.readStringOrNull(offsets[11]) ?? '',
    track: reader.readStringOrNull(offsets[12]),
    uploaded: reader.readDateTimeOrNull(offsets[13]),
    uploader: reader.readStringOrNull(offsets[14]),
    year: reader.readStringOrNull(offsets[15]),
  );
  object.id = id;
  return object;
}

P _mp3MusicDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 11:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _mp3MusicGetId(Mp3Music object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _mp3MusicGetLinks(Mp3Music object) {
  return [object.cover];
}

void _mp3MusicAttach(IsarCollection<dynamic> col, Id id, Mp3Music object) {
  object.id = id;
  object.cover.attach(col, col.isar.collection<Mp3Cover>(), r'cover', id);
}

extension Mp3MusicByIndex on IsarCollection<Mp3Music> {
  Future<Mp3Music?> getBySlug(String slug) {
    return getByIndex(r'slug', [slug]);
  }

  Mp3Music? getBySlugSync(String slug) {
    return getByIndexSync(r'slug', [slug]);
  }

  Future<bool> deleteBySlug(String slug) {
    return deleteByIndex(r'slug', [slug]);
  }

  bool deleteBySlugSync(String slug) {
    return deleteByIndexSync(r'slug', [slug]);
  }

  Future<List<Mp3Music?>> getAllBySlug(List<String> slugValues) {
    final values = slugValues.map((e) => [e]).toList();
    return getAllByIndex(r'slug', values);
  }

  List<Mp3Music?> getAllBySlugSync(List<String> slugValues) {
    final values = slugValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'slug', values);
  }

  Future<int> deleteAllBySlug(List<String> slugValues) {
    final values = slugValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'slug', values);
  }

  int deleteAllBySlugSync(List<String> slugValues) {
    final values = slugValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'slug', values);
  }

  Future<Id> putBySlug(Mp3Music object) {
    return putByIndex(r'slug', object);
  }

  Id putBySlugSync(Mp3Music object, {bool saveLinks = true}) {
    return putByIndexSync(r'slug', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySlug(List<Mp3Music> objects) {
    return putAllByIndex(r'slug', objects);
  }

  List<Id> putAllBySlugSync(List<Mp3Music> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'slug', objects, saveLinks: saveLinks);
  }
}

extension Mp3MusicQueryWhereSort on QueryBuilder<Mp3Music, Mp3Music, QWhere> {
  QueryBuilder<Mp3Music, Mp3Music, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhere> anySlug() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'slug'),
      );
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhere> anyArtist() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'artist'),
      );
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhere> anyTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'title'),
      );
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhere> anyGenre() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'genre'),
      );
    });
  }
}

extension Mp3MusicQueryWhere on QueryBuilder<Mp3Music, Mp3Music, QWhereClause> {
  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> idBetween(
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

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> slugEqualTo(String slug) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'slug',
        value: [slug],
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> slugNotEqualTo(
      String slug) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'slug',
              lower: [],
              upper: [slug],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'slug',
              lower: [slug],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'slug',
              lower: [slug],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'slug',
              lower: [],
              upper: [slug],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> slugGreaterThan(
    String slug, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'slug',
        lower: [slug],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> slugLessThan(
    String slug, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'slug',
        lower: [],
        upper: [slug],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> slugBetween(
    String lowerSlug,
    String upperSlug, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'slug',
        lower: [lowerSlug],
        includeLower: includeLower,
        upper: [upperSlug],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> slugStartsWith(
      String SlugPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'slug',
        lower: [SlugPrefix],
        upper: ['$SlugPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> slugIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'slug',
        value: [''],
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> slugIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'slug',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'slug',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'slug',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'slug',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> artistEqualTo(
      String artist) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'artist',
        value: [artist],
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> artistNotEqualTo(
      String artist) {
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

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> artistGreaterThan(
    String artist, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'artist',
        lower: [artist],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> artistLessThan(
    String artist, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'artist',
        lower: [],
        upper: [artist],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> artistBetween(
    String lowerArtist,
    String upperArtist, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'artist',
        lower: [lowerArtist],
        includeLower: includeLower,
        upper: [upperArtist],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> artistStartsWith(
      String ArtistPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'artist',
        lower: [ArtistPrefix],
        upper: ['$ArtistPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> artistIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'artist',
        value: [''],
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> artistIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'artist',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'artist',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'artist',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'artist',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> titleEqualTo(
      String title) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'title',
        value: [title],
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> titleNotEqualTo(
      String title) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'title',
              lower: [],
              upper: [title],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'title',
              lower: [title],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'title',
              lower: [title],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'title',
              lower: [],
              upper: [title],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> titleGreaterThan(
    String title, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'title',
        lower: [title],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> titleLessThan(
    String title, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'title',
        lower: [],
        upper: [title],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> titleBetween(
    String lowerTitle,
    String upperTitle, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'title',
        lower: [lowerTitle],
        includeLower: includeLower,
        upper: [upperTitle],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> titleStartsWith(
      String TitlePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'title',
        lower: [TitlePrefix],
        upper: ['$TitlePrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'title',
        value: [''],
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'title',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'title',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'title',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'title',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> genreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'genre',
        value: [null],
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> genreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'genre',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> genreEqualTo(
      String? genre) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'genre',
        value: [genre],
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> genreNotEqualTo(
      String? genre) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'genre',
              lower: [],
              upper: [genre],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'genre',
              lower: [genre],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'genre',
              lower: [genre],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'genre',
              lower: [],
              upper: [genre],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> genreGreaterThan(
    String? genre, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'genre',
        lower: [genre],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> genreLessThan(
    String? genre, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'genre',
        lower: [],
        upper: [genre],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> genreBetween(
    String? lowerGenre,
    String? upperGenre, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'genre',
        lower: [lowerGenre],
        includeLower: includeLower,
        upper: [upperGenre],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> genreStartsWith(
      String GenrePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'genre',
        lower: [GenrePrefix],
        upper: ['$GenrePrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> genreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'genre',
        value: [''],
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterWhereClause> genreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'genre',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'genre',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'genre',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'genre',
              upper: [''],
            ));
      }
    });
  }
}

extension Mp3MusicQueryFilter
    on QueryBuilder<Mp3Music, Mp3Music, QFilterCondition> {
  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> albumIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'album',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> albumIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'album',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> albumEqualTo(
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

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> albumGreaterThan(
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

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> albumLessThan(
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

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> albumBetween(
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

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> albumStartsWith(
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

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> albumEndsWith(
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

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> albumContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'album',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> albumMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'album',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> albumIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'album',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> albumIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'album',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> artistEqualTo(
    String value, {
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

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> artistGreaterThan(
    String value, {
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

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> artistLessThan(
    String value, {
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

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> artistBetween(
    String lower,
    String upper, {
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

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> artistStartsWith(
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

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> artistEndsWith(
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

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> artistContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'artist',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> artistMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'artist',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> artistIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'artist',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> artistIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'artist',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> bitrateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bitrate',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> bitrateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bitrate',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> bitrateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bitrate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> bitrateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bitrate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> bitrateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bitrate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> bitrateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bitrate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> bitrateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bitrate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> bitrateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bitrate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> bitrateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bitrate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> bitrateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bitrate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> bitrateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bitrate',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> bitrateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bitrate',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> countryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'country',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> countryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'country',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> countryEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'country',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> countryGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'country',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> countryLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'country',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> countryBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'country',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> durationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'duration',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> durationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'duration',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> durationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> durationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> durationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> durationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'duration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> durationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> durationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> durationContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> durationMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'duration',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> durationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'duration',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> durationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'duration',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> fileIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'file',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> fileIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'file',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> fileEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'file',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> fileGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'file',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> fileLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'file',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> fileBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'file',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> fileStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'file',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> fileEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'file',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> fileContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'file',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> fileMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'file',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> fileIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'file',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> fileIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'file',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> filesizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'filesize',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> filesizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'filesize',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> filesizeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filesize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> filesizeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'filesize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> filesizeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'filesize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> filesizeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'filesize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> filesizeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'filesize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> filesizeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'filesize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> filesizeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'filesize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> filesizeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'filesize',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> filesizeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filesize',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> filesizeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'filesize',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> genreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'genre',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> genreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'genre',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> genreEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'genre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> genreGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'genre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> genreLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'genre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> genreBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'genre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> genreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'genre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> genreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'genre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> genreContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'genre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> genreMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'genre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> genreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'genre',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> genreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'genre',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> hitsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hits',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> hitsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hits',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> hitsEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hits',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> hitsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hits',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> hitsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hits',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> hitsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hits',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> labelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'label',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> labelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'label',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> labelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> labelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> labelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> labelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'label',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> labelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> labelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> labelContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> labelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'label',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> labelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> labelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> slugEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'slug',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> slugGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'slug',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> slugLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'slug',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> slugBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'slug',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> slugStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'slug',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> slugEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'slug',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> slugContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'slug',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> slugMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'slug',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> slugIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'slug',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> slugIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'slug',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> titleEqualTo(
    String value, {
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

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> titleGreaterThan(
    String value, {
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

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> titleLessThan(
    String value, {
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

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
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

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> titleContains(
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

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> titleMatches(
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

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> trackIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'track',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> trackIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'track',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> trackEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'track',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> trackGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'track',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> trackLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'track',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> trackBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'track',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> trackStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'track',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> trackEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'track',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> trackContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'track',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> trackMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'track',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> trackIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'track',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> trackIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'track',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> uploadedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uploaded',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> uploadedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uploaded',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> uploadedEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uploaded',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> uploadedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uploaded',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> uploadedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uploaded',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> uploadedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uploaded',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> uploaderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uploader',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> uploaderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uploader',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> uploaderEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uploader',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> uploaderGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uploader',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> uploaderLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uploader',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> uploaderBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uploader',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> uploaderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uploader',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> uploaderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uploader',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> uploaderContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uploader',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> uploaderMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uploader',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> uploaderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uploader',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> uploaderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uploader',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> yearIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'year',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> yearIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'year',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> yearEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> yearGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> yearLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> yearBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'year',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> yearStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> yearEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> yearContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> yearMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'year',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> yearIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'year',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> yearIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'year',
        value: '',
      ));
    });
  }
}

extension Mp3MusicQueryObject
    on QueryBuilder<Mp3Music, Mp3Music, QFilterCondition> {}

extension Mp3MusicQueryLinks
    on QueryBuilder<Mp3Music, Mp3Music, QFilterCondition> {
  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> cover(
      FilterQuery<Mp3Cover> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'cover');
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterFilterCondition> coverIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'cover', 0, true, 0, true);
    });
  }
}

extension Mp3MusicQuerySortBy on QueryBuilder<Mp3Music, Mp3Music, QSortBy> {
  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByAlbum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'album', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByAlbumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'album', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByArtist() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByArtistDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByBitrate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bitrate', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByBitrateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bitrate', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByCountry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByCountryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByFile() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'file', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByFileDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'file', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByFilesize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filesize', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByFilesizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filesize', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByGenre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByGenreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByHits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hits', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByHitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hits', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortBySlug() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slug', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortBySlugDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slug', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByTrack() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'track', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByTrackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'track', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByUploaded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploaded', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByUploadedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploaded', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByUploader() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploader', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByUploaderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploader', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> sortByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension Mp3MusicQuerySortThenBy
    on QueryBuilder<Mp3Music, Mp3Music, QSortThenBy> {
  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByAlbum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'album', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByAlbumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'album', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByArtist() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByArtistDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByBitrate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bitrate', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByBitrateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bitrate', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByCountry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByCountryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByFile() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'file', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByFileDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'file', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByFilesize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filesize', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByFilesizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filesize', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByGenre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByGenreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByHits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hits', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByHitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hits', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenBySlug() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slug', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenBySlugDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slug', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByTrack() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'track', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByTrackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'track', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByUploaded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploaded', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByUploadedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploaded', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByUploader() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploader', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByUploaderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploader', Sort.desc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QAfterSortBy> thenByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension Mp3MusicQueryWhereDistinct
    on QueryBuilder<Mp3Music, Mp3Music, QDistinct> {
  QueryBuilder<Mp3Music, Mp3Music, QDistinct> distinctByAlbum(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'album', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QDistinct> distinctByArtist(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'artist', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QDistinct> distinctByBitrate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bitrate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QDistinct> distinctByCountry() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'country');
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QDistinct> distinctByDuration(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'duration', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QDistinct> distinctByFile(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'file', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QDistinct> distinctByFilesize(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'filesize', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QDistinct> distinctByGenre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'genre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QDistinct> distinctByHits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hits');
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QDistinct> distinctByLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'label', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QDistinct> distinctBySlug(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'slug', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QDistinct> distinctByTrack(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'track', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QDistinct> distinctByUploaded() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uploaded');
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QDistinct> distinctByUploader(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uploader', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mp3Music, Mp3Music, QDistinct> distinctByYear(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'year', caseSensitive: caseSensitive);
    });
  }
}

extension Mp3MusicQueryProperty
    on QueryBuilder<Mp3Music, Mp3Music, QQueryProperty> {
  QueryBuilder<Mp3Music, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Mp3Music, String?, QQueryOperations> albumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'album');
    });
  }

  QueryBuilder<Mp3Music, String, QQueryOperations> artistProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'artist');
    });
  }

  QueryBuilder<Mp3Music, String?, QQueryOperations> bitrateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bitrate');
    });
  }

  QueryBuilder<Mp3Music, int?, QQueryOperations> countryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'country');
    });
  }

  QueryBuilder<Mp3Music, String?, QQueryOperations> durationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'duration');
    });
  }

  QueryBuilder<Mp3Music, String?, QQueryOperations> fileProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'file');
    });
  }

  QueryBuilder<Mp3Music, String?, QQueryOperations> filesizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'filesize');
    });
  }

  QueryBuilder<Mp3Music, String?, QQueryOperations> genreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'genre');
    });
  }

  QueryBuilder<Mp3Music, int?, QQueryOperations> hitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hits');
    });
  }

  QueryBuilder<Mp3Music, String?, QQueryOperations> labelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'label');
    });
  }

  QueryBuilder<Mp3Music, String, QQueryOperations> slugProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'slug');
    });
  }

  QueryBuilder<Mp3Music, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<Mp3Music, String?, QQueryOperations> trackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'track');
    });
  }

  QueryBuilder<Mp3Music, DateTime?, QQueryOperations> uploadedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uploaded');
    });
  }

  QueryBuilder<Mp3Music, String?, QQueryOperations> uploaderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uploader');
    });
  }

  QueryBuilder<Mp3Music, String?, QQueryOperations> yearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'year');
    });
  }
}
