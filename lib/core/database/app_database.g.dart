// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PokemonsTable extends Pokemons
    with TableInfo<$PokemonsTable, PokemonEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PokemonsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _typesMeta = const VerificationMeta('types');
  @override
  late final GeneratedColumn<String> types = GeneratedColumn<String>(
    'types',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, image, types, isFavorite];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pokemons';
  @override
  VerificationContext validateIntegrity(
    Insertable<PokemonEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    }
    if (data.containsKey('types')) {
      context.handle(
        _typesMeta,
        types.isAcceptableOrUnknown(data['types']!, _typesMeta),
      );
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PokemonEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PokemonEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      image: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image'],
      ),
      types: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}types'],
      )!,
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
    );
  }

  @override
  $PokemonsTable createAlias(String alias) {
    return $PokemonsTable(attachedDatabase, alias);
  }
}

class PokemonEntity extends DataClass implements Insertable<PokemonEntity> {
  final int id;
  final String name;
  final String? image;
  final String types;
  final bool isFavorite;
  const PokemonEntity({
    required this.id,
    required this.name,
    this.image,
    required this.types,
    required this.isFavorite,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    map['types'] = Variable<String>(types);
    map['is_favorite'] = Variable<bool>(isFavorite);
    return map;
  }

  PokemonsCompanion toCompanion(bool nullToAbsent) {
    return PokemonsCompanion(
      id: Value(id),
      name: Value(name),
      image: image == null && nullToAbsent
          ? const Value.absent()
          : Value(image),
      types: Value(types),
      isFavorite: Value(isFavorite),
    );
  }

  factory PokemonEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PokemonEntity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String?>(json['image']),
      types: serializer.fromJson<String>(json['types']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String?>(image),
      'types': serializer.toJson<String>(types),
      'isFavorite': serializer.toJson<bool>(isFavorite),
    };
  }

  PokemonEntity copyWith({
    int? id,
    String? name,
    Value<String?> image = const Value.absent(),
    String? types,
    bool? isFavorite,
  }) => PokemonEntity(
    id: id ?? this.id,
    name: name ?? this.name,
    image: image.present ? image.value : this.image,
    types: types ?? this.types,
    isFavorite: isFavorite ?? this.isFavorite,
  );
  PokemonEntity copyWithCompanion(PokemonsCompanion data) {
    return PokemonEntity(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      image: data.image.present ? data.image.value : this.image,
      types: data.types.present ? data.types.value : this.types,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PokemonEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('types: $types, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, image, types, isFavorite);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PokemonEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.image == this.image &&
          other.types == this.types &&
          other.isFavorite == this.isFavorite);
}

class PokemonsCompanion extends UpdateCompanion<PokemonEntity> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> image;
  final Value<String> types;
  final Value<bool> isFavorite;
  const PokemonsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
    this.types = const Value.absent(),
    this.isFavorite = const Value.absent(),
  });
  PokemonsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.image = const Value.absent(),
    this.types = const Value.absent(),
    this.isFavorite = const Value.absent(),
  }) : name = Value(name);
  static Insertable<PokemonEntity> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? image,
    Expression<String>? types,
    Expression<bool>? isFavorite,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
      if (types != null) 'types': types,
      if (isFavorite != null) 'is_favorite': isFavorite,
    });
  }

  PokemonsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? image,
    Value<String>? types,
    Value<bool>? isFavorite,
  }) {
    return PokemonsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      types: types ?? this.types,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (types.present) {
      map['types'] = Variable<String>(types.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PokemonsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('types: $types, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PokemonsTable pokemons = $PokemonsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [pokemons];
}

typedef $$PokemonsTableCreateCompanionBuilder =
    PokemonsCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> image,
      Value<String> types,
      Value<bool> isFavorite,
    });
typedef $$PokemonsTableUpdateCompanionBuilder =
    PokemonsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> image,
      Value<String> types,
      Value<bool> isFavorite,
    });

class $$PokemonsTableFilterComposer
    extends Composer<_$AppDatabase, $PokemonsTable> {
  $$PokemonsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get types => $composableBuilder(
    column: $table.types,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PokemonsTableOrderingComposer
    extends Composer<_$AppDatabase, $PokemonsTable> {
  $$PokemonsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get types => $composableBuilder(
    column: $table.types,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PokemonsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PokemonsTable> {
  $$PokemonsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get types =>
      $composableBuilder(column: $table.types, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );
}

class $$PokemonsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PokemonsTable,
          PokemonEntity,
          $$PokemonsTableFilterComposer,
          $$PokemonsTableOrderingComposer,
          $$PokemonsTableAnnotationComposer,
          $$PokemonsTableCreateCompanionBuilder,
          $$PokemonsTableUpdateCompanionBuilder,
          (
            PokemonEntity,
            BaseReferences<_$AppDatabase, $PokemonsTable, PokemonEntity>,
          ),
          PokemonEntity,
          PrefetchHooks Function()
        > {
  $$PokemonsTableTableManager(_$AppDatabase db, $PokemonsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PokemonsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PokemonsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PokemonsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> image = const Value.absent(),
                Value<String> types = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
              }) => PokemonsCompanion(
                id: id,
                name: name,
                image: image,
                types: types,
                isFavorite: isFavorite,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> image = const Value.absent(),
                Value<String> types = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
              }) => PokemonsCompanion.insert(
                id: id,
                name: name,
                image: image,
                types: types,
                isFavorite: isFavorite,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PokemonsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PokemonsTable,
      PokemonEntity,
      $$PokemonsTableFilterComposer,
      $$PokemonsTableOrderingComposer,
      $$PokemonsTableAnnotationComposer,
      $$PokemonsTableCreateCompanionBuilder,
      $$PokemonsTableUpdateCompanionBuilder,
      (
        PokemonEntity,
        BaseReferences<_$AppDatabase, $PokemonsTable, PokemonEntity>,
      ),
      PokemonEntity,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PokemonsTableTableManager get pokemons =>
      $$PokemonsTableTableManager(_db, _db.pokemons);
}
