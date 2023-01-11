// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uper.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetUperCollection on Isar {
  IsarCollection<Uper> get upers => this.collection();
}

const UperSchema = CollectionSchema(
  name: r'Uper',
  id: -2737407647114250626,
  properties: {
    r'createTime': PropertySchema(
      id: 0,
      name: r'createTime',
      type: IsarType.dateTime,
    ),
    r'face': PropertySchema(
      id: 1,
      name: r'face',
      type: IsarType.string,
    ),
    r'lastSeen': PropertySchema(
      id: 2,
      name: r'lastSeen',
      type: IsarType.dateTime,
    ),
    r'lastUpdate': PropertySchema(
      id: 3,
      name: r'lastUpdate',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'sign': PropertySchema(
      id: 5,
      name: r'sign',
      type: IsarType.string,
    )
  },
  estimateSize: _uperEstimateSize,
  serialize: _uperSerialize,
  deserialize: _uperDeserialize,
  deserializeProp: _uperDeserializeProp,
  idName: r'id',
  indexes: {
    r'lastUpdate': IndexSchema(
      id: -2443505817451631414,
      name: r'lastUpdate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'lastUpdate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'lastSeen': IndexSchema(
      id: -4002271667734767009,
      name: r'lastSeen',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'lastSeen',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'createTime': IndexSchema(
      id: -7085130145048818916,
      name: r'createTime',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createTime',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'videos': LinkSchema(
      id: 8686380647584270620,
      name: r'videos',
      target: r'Video',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _uperGetId,
  getLinks: _uperGetLinks,
  attach: _uperAttach,
  version: '3.0.5',
);

int _uperEstimateSize(
  Uper object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.face.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.sign.length * 3;
  return bytesCount;
}

void _uperSerialize(
  Uper object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createTime);
  writer.writeString(offsets[1], object.face);
  writer.writeDateTime(offsets[2], object.lastSeen);
  writer.writeDateTime(offsets[3], object.lastUpdate);
  writer.writeString(offsets[4], object.name);
  writer.writeString(offsets[5], object.sign);
}

Uper _uperDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Uper(
    face: reader.readString(offsets[1]),
    id: id,
    name: reader.readString(offsets[4]),
    sign: reader.readString(offsets[5]),
  );
  object.createTime = reader.readDateTime(offsets[0]);
  object.lastSeen = reader.readDateTime(offsets[2]);
  object.lastUpdate = reader.readDateTime(offsets[3]);
  return object;
}

P _uperDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _uperGetId(Uper object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _uperGetLinks(Uper object) {
  return [object.videos];
}

void _uperAttach(IsarCollection<dynamic> col, Id id, Uper object) {
  object.id = id;
  object.videos.attach(col, col.isar.collection<Video>(), r'videos', id);
}

extension UperQueryWhereSort on QueryBuilder<Uper, Uper, QWhere> {
  QueryBuilder<Uper, Uper, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Uper, Uper, QAfterWhere> anyLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'lastUpdate'),
      );
    });
  }

  QueryBuilder<Uper, Uper, QAfterWhere> anyLastSeen() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'lastSeen'),
      );
    });
  }

  QueryBuilder<Uper, Uper, QAfterWhere> anyCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createTime'),
      );
    });
  }
}

extension UperQueryWhere on QueryBuilder<Uper, Uper, QWhereClause> {
  QueryBuilder<Uper, Uper, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Uper, Uper, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Uper, Uper, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Uper, Uper, QAfterWhereClause> idBetween(
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

  QueryBuilder<Uper, Uper, QAfterWhereClause> lastUpdateEqualTo(
      DateTime lastUpdate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lastUpdate',
        value: [lastUpdate],
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterWhereClause> lastUpdateNotEqualTo(
      DateTime lastUpdate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastUpdate',
              lower: [],
              upper: [lastUpdate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastUpdate',
              lower: [lastUpdate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastUpdate',
              lower: [lastUpdate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastUpdate',
              lower: [],
              upper: [lastUpdate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Uper, Uper, QAfterWhereClause> lastUpdateGreaterThan(
    DateTime lastUpdate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastUpdate',
        lower: [lastUpdate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterWhereClause> lastUpdateLessThan(
    DateTime lastUpdate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastUpdate',
        lower: [],
        upper: [lastUpdate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterWhereClause> lastUpdateBetween(
    DateTime lowerLastUpdate,
    DateTime upperLastUpdate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastUpdate',
        lower: [lowerLastUpdate],
        includeLower: includeLower,
        upper: [upperLastUpdate],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterWhereClause> lastSeenEqualTo(
      DateTime lastSeen) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lastSeen',
        value: [lastSeen],
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterWhereClause> lastSeenNotEqualTo(
      DateTime lastSeen) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastSeen',
              lower: [],
              upper: [lastSeen],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastSeen',
              lower: [lastSeen],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastSeen',
              lower: [lastSeen],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastSeen',
              lower: [],
              upper: [lastSeen],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Uper, Uper, QAfterWhereClause> lastSeenGreaterThan(
    DateTime lastSeen, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastSeen',
        lower: [lastSeen],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterWhereClause> lastSeenLessThan(
    DateTime lastSeen, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastSeen',
        lower: [],
        upper: [lastSeen],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterWhereClause> lastSeenBetween(
    DateTime lowerLastSeen,
    DateTime upperLastSeen, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastSeen',
        lower: [lowerLastSeen],
        includeLower: includeLower,
        upper: [upperLastSeen],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterWhereClause> createTimeEqualTo(
      DateTime createTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createTime',
        value: [createTime],
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterWhereClause> createTimeNotEqualTo(
      DateTime createTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createTime',
              lower: [],
              upper: [createTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createTime',
              lower: [createTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createTime',
              lower: [createTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createTime',
              lower: [],
              upper: [createTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Uper, Uper, QAfterWhereClause> createTimeGreaterThan(
    DateTime createTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createTime',
        lower: [createTime],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterWhereClause> createTimeLessThan(
    DateTime createTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createTime',
        lower: [],
        upper: [createTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterWhereClause> createTimeBetween(
    DateTime lowerCreateTime,
    DateTime upperCreateTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createTime',
        lower: [lowerCreateTime],
        includeLower: includeLower,
        upper: [upperCreateTime],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UperQueryFilter on QueryBuilder<Uper, Uper, QFilterCondition> {
  QueryBuilder<Uper, Uper, QAfterFilterCondition> createTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> createTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> createTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> createTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> faceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'face',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> faceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'face',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> faceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'face',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> faceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'face',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> faceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'face',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> faceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'face',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> faceContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'face',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> faceMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'face',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> faceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'face',
        value: '',
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> faceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'face',
        value: '',
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Uper, Uper, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Uper, Uper, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Uper, Uper, QAfterFilterCondition> lastSeenEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSeen',
        value: value,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> lastSeenGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSeen',
        value: value,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> lastSeenLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSeen',
        value: value,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> lastSeenBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSeen',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> lastUpdateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdate',
        value: value,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> lastUpdateGreaterThan(
    DateTime value, {
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

  QueryBuilder<Uper, Uper, QAfterFilterCondition> lastUpdateLessThan(
    DateTime value, {
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

  QueryBuilder<Uper, Uper, QAfterFilterCondition> lastUpdateBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<Uper, Uper, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Uper, Uper, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Uper, Uper, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Uper, Uper, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Uper, Uper, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Uper, Uper, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Uper, Uper, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> signEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sign',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> signGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sign',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> signLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sign',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> signBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sign',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> signStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sign',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> signEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sign',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> signContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sign',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> signMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sign',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> signIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sign',
        value: '',
      ));
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> signIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sign',
        value: '',
      ));
    });
  }
}

extension UperQueryObject on QueryBuilder<Uper, Uper, QFilterCondition> {}

extension UperQueryLinks on QueryBuilder<Uper, Uper, QFilterCondition> {
  QueryBuilder<Uper, Uper, QAfterFilterCondition> videos(FilterQuery<Video> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'videos');
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> videosLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'videos', length, true, length, true);
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> videosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'videos', 0, true, 0, true);
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> videosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'videos', 0, false, 999999, true);
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> videosLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'videos', 0, true, length, include);
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> videosLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'videos', length, include, 999999, true);
    });
  }

  QueryBuilder<Uper, Uper, QAfterFilterCondition> videosLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'videos', lower, includeLower, upper, includeUpper);
    });
  }
}

extension UperQuerySortBy on QueryBuilder<Uper, Uper, QSortBy> {
  QueryBuilder<Uper, Uper, QAfterSortBy> sortByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.asc);
    });
  }

  QueryBuilder<Uper, Uper, QAfterSortBy> sortByCreateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.desc);
    });
  }

  QueryBuilder<Uper, Uper, QAfterSortBy> sortByFace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'face', Sort.asc);
    });
  }

  QueryBuilder<Uper, Uper, QAfterSortBy> sortByFaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'face', Sort.desc);
    });
  }

  QueryBuilder<Uper, Uper, QAfterSortBy> sortByLastSeen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSeen', Sort.asc);
    });
  }

  QueryBuilder<Uper, Uper, QAfterSortBy> sortByLastSeenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSeen', Sort.desc);
    });
  }

  QueryBuilder<Uper, Uper, QAfterSortBy> sortByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.asc);
    });
  }

  QueryBuilder<Uper, Uper, QAfterSortBy> sortByLastUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.desc);
    });
  }

  QueryBuilder<Uper, Uper, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Uper, Uper, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Uper, Uper, QAfterSortBy> sortBySign() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sign', Sort.asc);
    });
  }

  QueryBuilder<Uper, Uper, QAfterSortBy> sortBySignDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sign', Sort.desc);
    });
  }
}

extension UperQuerySortThenBy on QueryBuilder<Uper, Uper, QSortThenBy> {
  QueryBuilder<Uper, Uper, QAfterSortBy> thenByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.asc);
    });
  }

  QueryBuilder<Uper, Uper, QAfterSortBy> thenByCreateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.desc);
    });
  }

  QueryBuilder<Uper, Uper, QAfterSortBy> thenByFace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'face', Sort.asc);
    });
  }

  QueryBuilder<Uper, Uper, QAfterSortBy> thenByFaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'face', Sort.desc);
    });
  }

  QueryBuilder<Uper, Uper, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Uper, Uper, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Uper, Uper, QAfterSortBy> thenByLastSeen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSeen', Sort.asc);
    });
  }

  QueryBuilder<Uper, Uper, QAfterSortBy> thenByLastSeenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSeen', Sort.desc);
    });
  }

  QueryBuilder<Uper, Uper, QAfterSortBy> thenByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.asc);
    });
  }

  QueryBuilder<Uper, Uper, QAfterSortBy> thenByLastUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.desc);
    });
  }

  QueryBuilder<Uper, Uper, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Uper, Uper, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Uper, Uper, QAfterSortBy> thenBySign() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sign', Sort.asc);
    });
  }

  QueryBuilder<Uper, Uper, QAfterSortBy> thenBySignDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sign', Sort.desc);
    });
  }
}

extension UperQueryWhereDistinct on QueryBuilder<Uper, Uper, QDistinct> {
  QueryBuilder<Uper, Uper, QDistinct> distinctByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createTime');
    });
  }

  QueryBuilder<Uper, Uper, QDistinct> distinctByFace(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'face', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Uper, Uper, QDistinct> distinctByLastSeen() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSeen');
    });
  }

  QueryBuilder<Uper, Uper, QDistinct> distinctByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdate');
    });
  }

  QueryBuilder<Uper, Uper, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Uper, Uper, QDistinct> distinctBySign(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sign', caseSensitive: caseSensitive);
    });
  }
}

extension UperQueryProperty on QueryBuilder<Uper, Uper, QQueryProperty> {
  QueryBuilder<Uper, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Uper, DateTime, QQueryOperations> createTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createTime');
    });
  }

  QueryBuilder<Uper, String, QQueryOperations> faceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'face');
    });
  }

  QueryBuilder<Uper, DateTime, QQueryOperations> lastSeenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSeen');
    });
  }

  QueryBuilder<Uper, DateTime, QQueryOperations> lastUpdateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdate');
    });
  }

  QueryBuilder<Uper, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Uper, String, QQueryOperations> signProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sign');
    });
  }
}
