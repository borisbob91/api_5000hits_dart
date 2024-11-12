// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mp3_artist.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMp3ArtistCollection on Isar {
  IsarCollection<Mp3Artist> get mp3Artists => this.collection();
}

const Mp3ArtistSchema = CollectionSchema(
  name: r'Mp3Artist',
  id: 1468917327321027283,
  properties: {
    r'albums': PropertySchema(
      id: 0,
      name: r'albums',
      type: IsarType.long,
    ),
    r'biography': PropertySchema(
      id: 1,
      name: r'biography',
      type: IsarType.string,
    ),
    r'country': PropertySchema(
      id: 2,
      name: r'country',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'slug': PropertySchema(
      id: 4,
      name: r'slug',
      type: IsarType.string,
    ),
    r'songs': PropertySchema(
      id: 5,
      name: r'songs',
      type: IsarType.long,
    )
  },
  estimateSize: _mp3ArtistEstimateSize,
  serialize: _mp3ArtistSerialize,
  deserialize: _mp3ArtistDeserialize,
  deserializeProp: _mp3ArtistDeserializeProp,
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
    )
  },
  links: {
    r'photo': LinkSchema(
      id: -4197389630408266335,
      name: r'photo',
      target: r'Mp3Cover',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _mp3ArtistGetId,
  getLinks: _mp3ArtistGetLinks,
  attach: _mp3ArtistAttach,
  version: '3.1.0+1',
);

int _mp3ArtistEstimateSize(
  Mp3Artist object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.biography.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.slug.length * 3;
  return bytesCount;
}

void _mp3ArtistSerialize(
  Mp3Artist object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.albums);
  writer.writeString(offsets[1], object.biography);
  writer.writeLong(offsets[2], object.country);
  writer.writeString(offsets[3], object.name);
  writer.writeString(offsets[4], object.slug);
  writer.writeLong(offsets[5], object.songs);
}

Mp3Artist _mp3ArtistDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Mp3Artist(
    albums: reader.readLongOrNull(offsets[0]) ?? 0,
    biography: reader.readStringOrNull(offsets[1]) ?? '',
    country: reader.readLongOrNull(offsets[2]) ?? 0,
    id: id,
    name: reader.readStringOrNull(offsets[3]) ?? '',
    slug: reader.readStringOrNull(offsets[4]) ?? '',
    songs: reader.readLongOrNull(offsets[5]) ?? 0,
  );
  return object;
}

P _mp3ArtistDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 1:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 2:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 3:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 4:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 5:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _mp3ArtistGetId(Mp3Artist object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _mp3ArtistGetLinks(Mp3Artist object) {
  return [object.photo];
}

void _mp3ArtistAttach(IsarCollection<dynamic> col, Id id, Mp3Artist object) {
  object.id = id;
  object.photo.attach(col, col.isar.collection<Mp3Cover>(), r'photo', id);
}

extension Mp3ArtistByIndex on IsarCollection<Mp3Artist> {
  Future<Mp3Artist?> getBySlug(String slug) {
    return getByIndex(r'slug', [slug]);
  }

  Mp3Artist? getBySlugSync(String slug) {
    return getByIndexSync(r'slug', [slug]);
  }

  Future<bool> deleteBySlug(String slug) {
    return deleteByIndex(r'slug', [slug]);
  }

  bool deleteBySlugSync(String slug) {
    return deleteByIndexSync(r'slug', [slug]);
  }

  Future<List<Mp3Artist?>> getAllBySlug(List<String> slugValues) {
    final values = slugValues.map((e) => [e]).toList();
    return getAllByIndex(r'slug', values);
  }

  List<Mp3Artist?> getAllBySlugSync(List<String> slugValues) {
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

  Future<Id> putBySlug(Mp3Artist object) {
    return putByIndex(r'slug', object);
  }

  Id putBySlugSync(Mp3Artist object, {bool saveLinks = true}) {
    return putByIndexSync(r'slug', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySlug(List<Mp3Artist> objects) {
    return putAllByIndex(r'slug', objects);
  }

  List<Id> putAllBySlugSync(List<Mp3Artist> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'slug', objects, saveLinks: saveLinks);
  }
}

extension Mp3ArtistQueryWhereSort
    on QueryBuilder<Mp3Artist, Mp3Artist, QWhere> {
  QueryBuilder<Mp3Artist, Mp3Artist, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterWhere> anySlug() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'slug'),
      );
    });
  }
}

extension Mp3ArtistQueryWhere
    on QueryBuilder<Mp3Artist, Mp3Artist, QWhereClause> {
  QueryBuilder<Mp3Artist, Mp3Artist, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterWhereClause> idBetween(
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

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterWhereClause> slugEqualTo(
      String slug) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'slug',
        value: [slug],
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterWhereClause> slugNotEqualTo(
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

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterWhereClause> slugGreaterThan(
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

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterWhereClause> slugLessThan(
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

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterWhereClause> slugBetween(
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

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterWhereClause> slugStartsWith(
      String SlugPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'slug',
        lower: [SlugPrefix],
        upper: ['$SlugPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterWhereClause> slugIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'slug',
        value: [''],
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterWhereClause> slugIsNotEmpty() {
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
}

extension Mp3ArtistQueryFilter
    on QueryBuilder<Mp3Artist, Mp3Artist, QFilterCondition> {
  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> albumsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'albums',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> albumsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'albums',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> albumsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'albums',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> albumsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'albums',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> biographyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'biography',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition>
      biographyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'biography',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> biographyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'biography',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> biographyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'biography',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> biographyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'biography',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> biographyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'biography',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> biographyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'biography',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> biographyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'biography',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> biographyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'biography',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition>
      biographyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'biography',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> countryEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'country',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> countryGreaterThan(
    int value, {
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

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> countryLessThan(
    int value, {
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

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> countryBetween(
    int lower,
    int upper, {
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

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> slugEqualTo(
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

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> slugGreaterThan(
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

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> slugLessThan(
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

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> slugBetween(
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

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> slugStartsWith(
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

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> slugEndsWith(
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

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> slugContains(
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

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> slugMatches(
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

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> slugIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'slug',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> slugIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'slug',
        value: '',
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> songsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'songs',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> songsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'songs',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> songsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'songs',
        value: value,
      ));
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> songsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'songs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension Mp3ArtistQueryObject
    on QueryBuilder<Mp3Artist, Mp3Artist, QFilterCondition> {}

extension Mp3ArtistQueryLinks
    on QueryBuilder<Mp3Artist, Mp3Artist, QFilterCondition> {
  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> photo(
      FilterQuery<Mp3Cover> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'photo');
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterFilterCondition> photoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'photo', 0, true, 0, true);
    });
  }
}

extension Mp3ArtistQuerySortBy on QueryBuilder<Mp3Artist, Mp3Artist, QSortBy> {
  QueryBuilder<Mp3Artist, Mp3Artist, QAfterSortBy> sortByAlbums() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'albums', Sort.asc);
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterSortBy> sortByAlbumsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'albums', Sort.desc);
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterSortBy> sortByBiography() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'biography', Sort.asc);
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterSortBy> sortByBiographyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'biography', Sort.desc);
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterSortBy> sortByCountry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.asc);
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterSortBy> sortByCountryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.desc);
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterSortBy> sortBySlug() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slug', Sort.asc);
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterSortBy> sortBySlugDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slug', Sort.desc);
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterSortBy> sortBySongs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songs', Sort.asc);
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterSortBy> sortBySongsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songs', Sort.desc);
    });
  }
}

extension Mp3ArtistQuerySortThenBy
    on QueryBuilder<Mp3Artist, Mp3Artist, QSortThenBy> {
  QueryBuilder<Mp3Artist, Mp3Artist, QAfterSortBy> thenByAlbums() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'albums', Sort.asc);
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterSortBy> thenByAlbumsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'albums', Sort.desc);
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterSortBy> thenByBiography() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'biography', Sort.asc);
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterSortBy> thenByBiographyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'biography', Sort.desc);
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterSortBy> thenByCountry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.asc);
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterSortBy> thenByCountryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.desc);
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterSortBy> thenBySlug() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slug', Sort.asc);
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterSortBy> thenBySlugDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slug', Sort.desc);
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterSortBy> thenBySongs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songs', Sort.asc);
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QAfterSortBy> thenBySongsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songs', Sort.desc);
    });
  }
}

extension Mp3ArtistQueryWhereDistinct
    on QueryBuilder<Mp3Artist, Mp3Artist, QDistinct> {
  QueryBuilder<Mp3Artist, Mp3Artist, QDistinct> distinctByAlbums() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'albums');
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QDistinct> distinctByBiography(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'biography', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QDistinct> distinctByCountry() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'country');
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QDistinct> distinctBySlug(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'slug', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mp3Artist, Mp3Artist, QDistinct> distinctBySongs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'songs');
    });
  }
}

extension Mp3ArtistQueryProperty
    on QueryBuilder<Mp3Artist, Mp3Artist, QQueryProperty> {
  QueryBuilder<Mp3Artist, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Mp3Artist, int, QQueryOperations> albumsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'albums');
    });
  }

  QueryBuilder<Mp3Artist, String, QQueryOperations> biographyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'biography');
    });
  }

  QueryBuilder<Mp3Artist, int, QQueryOperations> countryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'country');
    });
  }

  QueryBuilder<Mp3Artist, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Mp3Artist, String, QQueryOperations> slugProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'slug');
    });
  }

  QueryBuilder<Mp3Artist, int, QQueryOperations> songsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'songs');
    });
  }
}
