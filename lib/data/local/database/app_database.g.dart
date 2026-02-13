// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $QuranSurahTableTable extends QuranSurahTable
    with TableInfo<$QuranSurahTableTable, QuranSurahTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuranSurahTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _surahNumberMeta = const VerificationMeta(
    'surahNumber',
  );
  @override
  late final GeneratedColumn<int> surahNumber = GeneratedColumn<int>(
    'surah_number',
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
  static const VerificationMeta _nameLatinMeta = const VerificationMeta(
    'nameLatin',
  );
  @override
  late final GeneratedColumn<String> nameLatin = GeneratedColumn<String>(
    'name_latin',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numberOfAyahMeta = const VerificationMeta(
    'numberOfAyah',
  );
  @override
  late final GeneratedColumn<int> numberOfAyah = GeneratedColumn<int>(
    'number_of_ayah',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _placeOfRevelationMeta = const VerificationMeta(
    'placeOfRevelation',
  );
  @override
  late final GeneratedColumn<String> placeOfRevelation =
      GeneratedColumn<String>(
        'place_of_revelation',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _meaningMeta = const VerificationMeta(
    'meaning',
  );
  @override
  late final GeneratedColumn<String> meaning = GeneratedColumn<String>(
    'meaning',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isBookmarkedMeta = const VerificationMeta(
    'isBookmarked',
  );
  @override
  late final GeneratedColumn<bool> isBookmarked = GeneratedColumn<bool>(
    'is_bookmarked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_bookmarked" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isLastReadMeta = const VerificationMeta(
    'isLastRead',
  );
  @override
  late final GeneratedColumn<bool> isLastRead = GeneratedColumn<bool>(
    'is_last_read',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_last_read" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _lastReadAyahMeta = const VerificationMeta(
    'lastReadAyah',
  );
  @override
  late final GeneratedColumn<int> lastReadAyah = GeneratedColumn<int>(
    'last_read_ayah',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    surahNumber,
    name,
    nameLatin,
    numberOfAyah,
    placeOfRevelation,
    meaning,
    description,
    isBookmarked,
    isLastRead,
    lastReadAyah,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quran_surahs';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuranSurahTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('surah_number')) {
      context.handle(
        _surahNumberMeta,
        surahNumber.isAcceptableOrUnknown(
          data['surah_number']!,
          _surahNumberMeta,
        ),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_latin')) {
      context.handle(
        _nameLatinMeta,
        nameLatin.isAcceptableOrUnknown(data['name_latin']!, _nameLatinMeta),
      );
    } else if (isInserting) {
      context.missing(_nameLatinMeta);
    }
    if (data.containsKey('number_of_ayah')) {
      context.handle(
        _numberOfAyahMeta,
        numberOfAyah.isAcceptableOrUnknown(
          data['number_of_ayah']!,
          _numberOfAyahMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_numberOfAyahMeta);
    }
    if (data.containsKey('place_of_revelation')) {
      context.handle(
        _placeOfRevelationMeta,
        placeOfRevelation.isAcceptableOrUnknown(
          data['place_of_revelation']!,
          _placeOfRevelationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_placeOfRevelationMeta);
    }
    if (data.containsKey('meaning')) {
      context.handle(
        _meaningMeta,
        meaning.isAcceptableOrUnknown(data['meaning']!, _meaningMeta),
      );
    } else if (isInserting) {
      context.missing(_meaningMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('is_bookmarked')) {
      context.handle(
        _isBookmarkedMeta,
        isBookmarked.isAcceptableOrUnknown(
          data['is_bookmarked']!,
          _isBookmarkedMeta,
        ),
      );
    }
    if (data.containsKey('is_last_read')) {
      context.handle(
        _isLastReadMeta,
        isLastRead.isAcceptableOrUnknown(
          data['is_last_read']!,
          _isLastReadMeta,
        ),
      );
    }
    if (data.containsKey('last_read_ayah')) {
      context.handle(
        _lastReadAyahMeta,
        lastReadAyah.isAcceptableOrUnknown(
          data['last_read_ayah']!,
          _lastReadAyahMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {surahNumber};
  @override
  QuranSurahTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuranSurahTableData(
      surahNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}surah_number'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      nameLatin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_latin'],
      )!,
      numberOfAyah: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number_of_ayah'],
      )!,
      placeOfRevelation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}place_of_revelation'],
      )!,
      meaning: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meaning'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      isBookmarked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_bookmarked'],
      )!,
      isLastRead: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_last_read'],
      )!,
      lastReadAyah: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_read_ayah'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $QuranSurahTableTable createAlias(String alias) {
    return $QuranSurahTableTable(attachedDatabase, alias);
  }
}

class QuranSurahTableData extends DataClass
    implements Insertable<QuranSurahTableData> {
  final int surahNumber;
  final String name;
  final String nameLatin;
  final int numberOfAyah;
  final String placeOfRevelation;
  final String meaning;
  final String description;
  final bool isBookmarked;
  final bool isLastRead;
  final int? lastReadAyah;
  final DateTime createdAt;
  final DateTime updatedAt;
  const QuranSurahTableData({
    required this.surahNumber,
    required this.name,
    required this.nameLatin,
    required this.numberOfAyah,
    required this.placeOfRevelation,
    required this.meaning,
    required this.description,
    required this.isBookmarked,
    required this.isLastRead,
    this.lastReadAyah,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['surah_number'] = Variable<int>(surahNumber);
    map['name'] = Variable<String>(name);
    map['name_latin'] = Variable<String>(nameLatin);
    map['number_of_ayah'] = Variable<int>(numberOfAyah);
    map['place_of_revelation'] = Variable<String>(placeOfRevelation);
    map['meaning'] = Variable<String>(meaning);
    map['description'] = Variable<String>(description);
    map['is_bookmarked'] = Variable<bool>(isBookmarked);
    map['is_last_read'] = Variable<bool>(isLastRead);
    if (!nullToAbsent || lastReadAyah != null) {
      map['last_read_ayah'] = Variable<int>(lastReadAyah);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  QuranSurahTableCompanion toCompanion(bool nullToAbsent) {
    return QuranSurahTableCompanion(
      surahNumber: Value(surahNumber),
      name: Value(name),
      nameLatin: Value(nameLatin),
      numberOfAyah: Value(numberOfAyah),
      placeOfRevelation: Value(placeOfRevelation),
      meaning: Value(meaning),
      description: Value(description),
      isBookmarked: Value(isBookmarked),
      isLastRead: Value(isLastRead),
      lastReadAyah: lastReadAyah == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReadAyah),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory QuranSurahTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuranSurahTableData(
      surahNumber: serializer.fromJson<int>(json['surahNumber']),
      name: serializer.fromJson<String>(json['name']),
      nameLatin: serializer.fromJson<String>(json['nameLatin']),
      numberOfAyah: serializer.fromJson<int>(json['numberOfAyah']),
      placeOfRevelation: serializer.fromJson<String>(json['placeOfRevelation']),
      meaning: serializer.fromJson<String>(json['meaning']),
      description: serializer.fromJson<String>(json['description']),
      isBookmarked: serializer.fromJson<bool>(json['isBookmarked']),
      isLastRead: serializer.fromJson<bool>(json['isLastRead']),
      lastReadAyah: serializer.fromJson<int?>(json['lastReadAyah']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'surahNumber': serializer.toJson<int>(surahNumber),
      'name': serializer.toJson<String>(name),
      'nameLatin': serializer.toJson<String>(nameLatin),
      'numberOfAyah': serializer.toJson<int>(numberOfAyah),
      'placeOfRevelation': serializer.toJson<String>(placeOfRevelation),
      'meaning': serializer.toJson<String>(meaning),
      'description': serializer.toJson<String>(description),
      'isBookmarked': serializer.toJson<bool>(isBookmarked),
      'isLastRead': serializer.toJson<bool>(isLastRead),
      'lastReadAyah': serializer.toJson<int?>(lastReadAyah),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  QuranSurahTableData copyWith({
    int? surahNumber,
    String? name,
    String? nameLatin,
    int? numberOfAyah,
    String? placeOfRevelation,
    String? meaning,
    String? description,
    bool? isBookmarked,
    bool? isLastRead,
    Value<int?> lastReadAyah = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => QuranSurahTableData(
    surahNumber: surahNumber ?? this.surahNumber,
    name: name ?? this.name,
    nameLatin: nameLatin ?? this.nameLatin,
    numberOfAyah: numberOfAyah ?? this.numberOfAyah,
    placeOfRevelation: placeOfRevelation ?? this.placeOfRevelation,
    meaning: meaning ?? this.meaning,
    description: description ?? this.description,
    isBookmarked: isBookmarked ?? this.isBookmarked,
    isLastRead: isLastRead ?? this.isLastRead,
    lastReadAyah: lastReadAyah.present ? lastReadAyah.value : this.lastReadAyah,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  QuranSurahTableData copyWithCompanion(QuranSurahTableCompanion data) {
    return QuranSurahTableData(
      surahNumber: data.surahNumber.present
          ? data.surahNumber.value
          : this.surahNumber,
      name: data.name.present ? data.name.value : this.name,
      nameLatin: data.nameLatin.present ? data.nameLatin.value : this.nameLatin,
      numberOfAyah: data.numberOfAyah.present
          ? data.numberOfAyah.value
          : this.numberOfAyah,
      placeOfRevelation: data.placeOfRevelation.present
          ? data.placeOfRevelation.value
          : this.placeOfRevelation,
      meaning: data.meaning.present ? data.meaning.value : this.meaning,
      description: data.description.present
          ? data.description.value
          : this.description,
      isBookmarked: data.isBookmarked.present
          ? data.isBookmarked.value
          : this.isBookmarked,
      isLastRead: data.isLastRead.present
          ? data.isLastRead.value
          : this.isLastRead,
      lastReadAyah: data.lastReadAyah.present
          ? data.lastReadAyah.value
          : this.lastReadAyah,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuranSurahTableData(')
          ..write('surahNumber: $surahNumber, ')
          ..write('name: $name, ')
          ..write('nameLatin: $nameLatin, ')
          ..write('numberOfAyah: $numberOfAyah, ')
          ..write('placeOfRevelation: $placeOfRevelation, ')
          ..write('meaning: $meaning, ')
          ..write('description: $description, ')
          ..write('isBookmarked: $isBookmarked, ')
          ..write('isLastRead: $isLastRead, ')
          ..write('lastReadAyah: $lastReadAyah, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    surahNumber,
    name,
    nameLatin,
    numberOfAyah,
    placeOfRevelation,
    meaning,
    description,
    isBookmarked,
    isLastRead,
    lastReadAyah,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuranSurahTableData &&
          other.surahNumber == this.surahNumber &&
          other.name == this.name &&
          other.nameLatin == this.nameLatin &&
          other.numberOfAyah == this.numberOfAyah &&
          other.placeOfRevelation == this.placeOfRevelation &&
          other.meaning == this.meaning &&
          other.description == this.description &&
          other.isBookmarked == this.isBookmarked &&
          other.isLastRead == this.isLastRead &&
          other.lastReadAyah == this.lastReadAyah &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class QuranSurahTableCompanion extends UpdateCompanion<QuranSurahTableData> {
  final Value<int> surahNumber;
  final Value<String> name;
  final Value<String> nameLatin;
  final Value<int> numberOfAyah;
  final Value<String> placeOfRevelation;
  final Value<String> meaning;
  final Value<String> description;
  final Value<bool> isBookmarked;
  final Value<bool> isLastRead;
  final Value<int?> lastReadAyah;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const QuranSurahTableCompanion({
    this.surahNumber = const Value.absent(),
    this.name = const Value.absent(),
    this.nameLatin = const Value.absent(),
    this.numberOfAyah = const Value.absent(),
    this.placeOfRevelation = const Value.absent(),
    this.meaning = const Value.absent(),
    this.description = const Value.absent(),
    this.isBookmarked = const Value.absent(),
    this.isLastRead = const Value.absent(),
    this.lastReadAyah = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  QuranSurahTableCompanion.insert({
    this.surahNumber = const Value.absent(),
    required String name,
    required String nameLatin,
    required int numberOfAyah,
    required String placeOfRevelation,
    required String meaning,
    required String description,
    this.isBookmarked = const Value.absent(),
    this.isLastRead = const Value.absent(),
    this.lastReadAyah = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       nameLatin = Value(nameLatin),
       numberOfAyah = Value(numberOfAyah),
       placeOfRevelation = Value(placeOfRevelation),
       meaning = Value(meaning),
       description = Value(description);
  static Insertable<QuranSurahTableData> custom({
    Expression<int>? surahNumber,
    Expression<String>? name,
    Expression<String>? nameLatin,
    Expression<int>? numberOfAyah,
    Expression<String>? placeOfRevelation,
    Expression<String>? meaning,
    Expression<String>? description,
    Expression<bool>? isBookmarked,
    Expression<bool>? isLastRead,
    Expression<int>? lastReadAyah,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (surahNumber != null) 'surah_number': surahNumber,
      if (name != null) 'name': name,
      if (nameLatin != null) 'name_latin': nameLatin,
      if (numberOfAyah != null) 'number_of_ayah': numberOfAyah,
      if (placeOfRevelation != null) 'place_of_revelation': placeOfRevelation,
      if (meaning != null) 'meaning': meaning,
      if (description != null) 'description': description,
      if (isBookmarked != null) 'is_bookmarked': isBookmarked,
      if (isLastRead != null) 'is_last_read': isLastRead,
      if (lastReadAyah != null) 'last_read_ayah': lastReadAyah,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  QuranSurahTableCompanion copyWith({
    Value<int>? surahNumber,
    Value<String>? name,
    Value<String>? nameLatin,
    Value<int>? numberOfAyah,
    Value<String>? placeOfRevelation,
    Value<String>? meaning,
    Value<String>? description,
    Value<bool>? isBookmarked,
    Value<bool>? isLastRead,
    Value<int?>? lastReadAyah,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return QuranSurahTableCompanion(
      surahNumber: surahNumber ?? this.surahNumber,
      name: name ?? this.name,
      nameLatin: nameLatin ?? this.nameLatin,
      numberOfAyah: numberOfAyah ?? this.numberOfAyah,
      placeOfRevelation: placeOfRevelation ?? this.placeOfRevelation,
      meaning: meaning ?? this.meaning,
      description: description ?? this.description,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      isLastRead: isLastRead ?? this.isLastRead,
      lastReadAyah: lastReadAyah ?? this.lastReadAyah,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (surahNumber.present) {
      map['surah_number'] = Variable<int>(surahNumber.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nameLatin.present) {
      map['name_latin'] = Variable<String>(nameLatin.value);
    }
    if (numberOfAyah.present) {
      map['number_of_ayah'] = Variable<int>(numberOfAyah.value);
    }
    if (placeOfRevelation.present) {
      map['place_of_revelation'] = Variable<String>(placeOfRevelation.value);
    }
    if (meaning.present) {
      map['meaning'] = Variable<String>(meaning.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isBookmarked.present) {
      map['is_bookmarked'] = Variable<bool>(isBookmarked.value);
    }
    if (isLastRead.present) {
      map['is_last_read'] = Variable<bool>(isLastRead.value);
    }
    if (lastReadAyah.present) {
      map['last_read_ayah'] = Variable<int>(lastReadAyah.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuranSurahTableCompanion(')
          ..write('surahNumber: $surahNumber, ')
          ..write('name: $name, ')
          ..write('nameLatin: $nameLatin, ')
          ..write('numberOfAyah: $numberOfAyah, ')
          ..write('placeOfRevelation: $placeOfRevelation, ')
          ..write('meaning: $meaning, ')
          ..write('description: $description, ')
          ..write('isBookmarked: $isBookmarked, ')
          ..write('isLastRead: $isLastRead, ')
          ..write('lastReadAyah: $lastReadAyah, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $QuranAyahTableTable extends QuranAyahTable
    with TableInfo<$QuranAyahTableTable, QuranAyahTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuranAyahTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _surahNumberMeta = const VerificationMeta(
    'surahNumber',
  );
  @override
  late final GeneratedColumn<int> surahNumber = GeneratedColumn<int>(
    'surah_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES quran_surahs (surah_number) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _ayahNumberMeta = const VerificationMeta(
    'ayahNumber',
  );
  @override
  late final GeneratedColumn<int> ayahNumber = GeneratedColumn<int>(
    'ayah_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _arabicTextMeta = const VerificationMeta(
    'arabicText',
  );
  @override
  late final GeneratedColumn<String> arabicText = GeneratedColumn<String>(
    'arabic_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latinTextMeta = const VerificationMeta(
    'latinText',
  );
  @override
  late final GeneratedColumn<String> latinText = GeneratedColumn<String>(
    'latin_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _translationIdMeta = const VerificationMeta(
    'translationId',
  );
  @override
  late final GeneratedColumn<String> translationId = GeneratedColumn<String>(
    'translation_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    surahNumber,
    ayahNumber,
    arabicText,
    latinText,
    translationId,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quran_ayahs';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuranAyahTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('surah_number')) {
      context.handle(
        _surahNumberMeta,
        surahNumber.isAcceptableOrUnknown(
          data['surah_number']!,
          _surahNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_surahNumberMeta);
    }
    if (data.containsKey('ayah_number')) {
      context.handle(
        _ayahNumberMeta,
        ayahNumber.isAcceptableOrUnknown(data['ayah_number']!, _ayahNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_ayahNumberMeta);
    }
    if (data.containsKey('arabic_text')) {
      context.handle(
        _arabicTextMeta,
        arabicText.isAcceptableOrUnknown(data['arabic_text']!, _arabicTextMeta),
      );
    } else if (isInserting) {
      context.missing(_arabicTextMeta);
    }
    if (data.containsKey('latin_text')) {
      context.handle(
        _latinTextMeta,
        latinText.isAcceptableOrUnknown(data['latin_text']!, _latinTextMeta),
      );
    } else if (isInserting) {
      context.missing(_latinTextMeta);
    }
    if (data.containsKey('translation_id')) {
      context.handle(
        _translationIdMeta,
        translationId.isAcceptableOrUnknown(
          data['translation_id']!,
          _translationIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {surahNumber, ayahNumber},
  ];
  @override
  QuranAyahTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuranAyahTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      surahNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}surah_number'],
      )!,
      ayahNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ayah_number'],
      )!,
      arabicText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}arabic_text'],
      )!,
      latinText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}latin_text'],
      )!,
      translationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}translation_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $QuranAyahTableTable createAlias(String alias) {
    return $QuranAyahTableTable(attachedDatabase, alias);
  }
}

class QuranAyahTableData extends DataClass
    implements Insertable<QuranAyahTableData> {
  final int id;
  final int surahNumber;
  final int ayahNumber;
  final String arabicText;
  final String latinText;
  final String? translationId;
  final DateTime createdAt;
  final DateTime updatedAt;
  const QuranAyahTableData({
    required this.id,
    required this.surahNumber,
    required this.ayahNumber,
    required this.arabicText,
    required this.latinText,
    this.translationId,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['surah_number'] = Variable<int>(surahNumber);
    map['ayah_number'] = Variable<int>(ayahNumber);
    map['arabic_text'] = Variable<String>(arabicText);
    map['latin_text'] = Variable<String>(latinText);
    if (!nullToAbsent || translationId != null) {
      map['translation_id'] = Variable<String>(translationId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  QuranAyahTableCompanion toCompanion(bool nullToAbsent) {
    return QuranAyahTableCompanion(
      id: Value(id),
      surahNumber: Value(surahNumber),
      ayahNumber: Value(ayahNumber),
      arabicText: Value(arabicText),
      latinText: Value(latinText),
      translationId: translationId == null && nullToAbsent
          ? const Value.absent()
          : Value(translationId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory QuranAyahTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuranAyahTableData(
      id: serializer.fromJson<int>(json['id']),
      surahNumber: serializer.fromJson<int>(json['surahNumber']),
      ayahNumber: serializer.fromJson<int>(json['ayahNumber']),
      arabicText: serializer.fromJson<String>(json['arabicText']),
      latinText: serializer.fromJson<String>(json['latinText']),
      translationId: serializer.fromJson<String?>(json['translationId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'surahNumber': serializer.toJson<int>(surahNumber),
      'ayahNumber': serializer.toJson<int>(ayahNumber),
      'arabicText': serializer.toJson<String>(arabicText),
      'latinText': serializer.toJson<String>(latinText),
      'translationId': serializer.toJson<String?>(translationId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  QuranAyahTableData copyWith({
    int? id,
    int? surahNumber,
    int? ayahNumber,
    String? arabicText,
    String? latinText,
    Value<String?> translationId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => QuranAyahTableData(
    id: id ?? this.id,
    surahNumber: surahNumber ?? this.surahNumber,
    ayahNumber: ayahNumber ?? this.ayahNumber,
    arabicText: arabicText ?? this.arabicText,
    latinText: latinText ?? this.latinText,
    translationId: translationId.present
        ? translationId.value
        : this.translationId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  QuranAyahTableData copyWithCompanion(QuranAyahTableCompanion data) {
    return QuranAyahTableData(
      id: data.id.present ? data.id.value : this.id,
      surahNumber: data.surahNumber.present
          ? data.surahNumber.value
          : this.surahNumber,
      ayahNumber: data.ayahNumber.present
          ? data.ayahNumber.value
          : this.ayahNumber,
      arabicText: data.arabicText.present
          ? data.arabicText.value
          : this.arabicText,
      latinText: data.latinText.present ? data.latinText.value : this.latinText,
      translationId: data.translationId.present
          ? data.translationId.value
          : this.translationId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuranAyahTableData(')
          ..write('id: $id, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('ayahNumber: $ayahNumber, ')
          ..write('arabicText: $arabicText, ')
          ..write('latinText: $latinText, ')
          ..write('translationId: $translationId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    surahNumber,
    ayahNumber,
    arabicText,
    latinText,
    translationId,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuranAyahTableData &&
          other.id == this.id &&
          other.surahNumber == this.surahNumber &&
          other.ayahNumber == this.ayahNumber &&
          other.arabicText == this.arabicText &&
          other.latinText == this.latinText &&
          other.translationId == this.translationId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class QuranAyahTableCompanion extends UpdateCompanion<QuranAyahTableData> {
  final Value<int> id;
  final Value<int> surahNumber;
  final Value<int> ayahNumber;
  final Value<String> arabicText;
  final Value<String> latinText;
  final Value<String?> translationId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const QuranAyahTableCompanion({
    this.id = const Value.absent(),
    this.surahNumber = const Value.absent(),
    this.ayahNumber = const Value.absent(),
    this.arabicText = const Value.absent(),
    this.latinText = const Value.absent(),
    this.translationId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  QuranAyahTableCompanion.insert({
    this.id = const Value.absent(),
    required int surahNumber,
    required int ayahNumber,
    required String arabicText,
    required String latinText,
    this.translationId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : surahNumber = Value(surahNumber),
       ayahNumber = Value(ayahNumber),
       arabicText = Value(arabicText),
       latinText = Value(latinText);
  static Insertable<QuranAyahTableData> custom({
    Expression<int>? id,
    Expression<int>? surahNumber,
    Expression<int>? ayahNumber,
    Expression<String>? arabicText,
    Expression<String>? latinText,
    Expression<String>? translationId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (surahNumber != null) 'surah_number': surahNumber,
      if (ayahNumber != null) 'ayah_number': ayahNumber,
      if (arabicText != null) 'arabic_text': arabicText,
      if (latinText != null) 'latin_text': latinText,
      if (translationId != null) 'translation_id': translationId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  QuranAyahTableCompanion copyWith({
    Value<int>? id,
    Value<int>? surahNumber,
    Value<int>? ayahNumber,
    Value<String>? arabicText,
    Value<String>? latinText,
    Value<String?>? translationId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return QuranAyahTableCompanion(
      id: id ?? this.id,
      surahNumber: surahNumber ?? this.surahNumber,
      ayahNumber: ayahNumber ?? this.ayahNumber,
      arabicText: arabicText ?? this.arabicText,
      latinText: latinText ?? this.latinText,
      translationId: translationId ?? this.translationId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (surahNumber.present) {
      map['surah_number'] = Variable<int>(surahNumber.value);
    }
    if (ayahNumber.present) {
      map['ayah_number'] = Variable<int>(ayahNumber.value);
    }
    if (arabicText.present) {
      map['arabic_text'] = Variable<String>(arabicText.value);
    }
    if (latinText.present) {
      map['latin_text'] = Variable<String>(latinText.value);
    }
    if (translationId.present) {
      map['translation_id'] = Variable<String>(translationId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuranAyahTableCompanion(')
          ..write('id: $id, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('ayahNumber: $ayahNumber, ')
          ..write('arabicText: $arabicText, ')
          ..write('latinText: $latinText, ')
          ..write('translationId: $translationId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $QuranAudioTableTable extends QuranAudioTable
    with TableInfo<$QuranAudioTableTable, QuranAudioTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuranAudioTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _ayahIdMeta = const VerificationMeta('ayahId');
  @override
  late final GeneratedColumn<int> ayahId = GeneratedColumn<int>(
    'ayah_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES quran_ayahs (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _surahNumberMeta = const VerificationMeta(
    'surahNumber',
  );
  @override
  late final GeneratedColumn<int> surahNumber = GeneratedColumn<int>(
    'surah_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ayahNumberMeta = const VerificationMeta(
    'ayahNumber',
  );
  @override
  late final GeneratedColumn<int> ayahNumber = GeneratedColumn<int>(
    'ayah_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _audioUrlMeta = const VerificationMeta(
    'audioUrl',
  );
  @override
  late final GeneratedColumn<String> audioUrl = GeneratedColumn<String>(
    'audio_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ayahId,
    surahNumber,
    ayahNumber,
    audioUrl,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quran_audios';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuranAudioTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ayah_id')) {
      context.handle(
        _ayahIdMeta,
        ayahId.isAcceptableOrUnknown(data['ayah_id']!, _ayahIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ayahIdMeta);
    }
    if (data.containsKey('surah_number')) {
      context.handle(
        _surahNumberMeta,
        surahNumber.isAcceptableOrUnknown(
          data['surah_number']!,
          _surahNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_surahNumberMeta);
    }
    if (data.containsKey('ayah_number')) {
      context.handle(
        _ayahNumberMeta,
        ayahNumber.isAcceptableOrUnknown(data['ayah_number']!, _ayahNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_ayahNumberMeta);
    }
    if (data.containsKey('audio_url')) {
      context.handle(
        _audioUrlMeta,
        audioUrl.isAcceptableOrUnknown(data['audio_url']!, _audioUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_audioUrlMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {surahNumber, ayahNumber},
  ];
  @override
  QuranAudioTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuranAudioTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      ayahId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ayah_id'],
      )!,
      surahNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}surah_number'],
      )!,
      ayahNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ayah_number'],
      )!,
      audioUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}audio_url'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $QuranAudioTableTable createAlias(String alias) {
    return $QuranAudioTableTable(attachedDatabase, alias);
  }
}

class QuranAudioTableData extends DataClass
    implements Insertable<QuranAudioTableData> {
  final int id;
  final int ayahId;
  final int surahNumber;
  final int ayahNumber;
  final String audioUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  const QuranAudioTableData({
    required this.id,
    required this.ayahId,
    required this.surahNumber,
    required this.ayahNumber,
    required this.audioUrl,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ayah_id'] = Variable<int>(ayahId);
    map['surah_number'] = Variable<int>(surahNumber);
    map['ayah_number'] = Variable<int>(ayahNumber);
    map['audio_url'] = Variable<String>(audioUrl);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  QuranAudioTableCompanion toCompanion(bool nullToAbsent) {
    return QuranAudioTableCompanion(
      id: Value(id),
      ayahId: Value(ayahId),
      surahNumber: Value(surahNumber),
      ayahNumber: Value(ayahNumber),
      audioUrl: Value(audioUrl),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory QuranAudioTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuranAudioTableData(
      id: serializer.fromJson<int>(json['id']),
      ayahId: serializer.fromJson<int>(json['ayahId']),
      surahNumber: serializer.fromJson<int>(json['surahNumber']),
      ayahNumber: serializer.fromJson<int>(json['ayahNumber']),
      audioUrl: serializer.fromJson<String>(json['audioUrl']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ayahId': serializer.toJson<int>(ayahId),
      'surahNumber': serializer.toJson<int>(surahNumber),
      'ayahNumber': serializer.toJson<int>(ayahNumber),
      'audioUrl': serializer.toJson<String>(audioUrl),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  QuranAudioTableData copyWith({
    int? id,
    int? ayahId,
    int? surahNumber,
    int? ayahNumber,
    String? audioUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => QuranAudioTableData(
    id: id ?? this.id,
    ayahId: ayahId ?? this.ayahId,
    surahNumber: surahNumber ?? this.surahNumber,
    ayahNumber: ayahNumber ?? this.ayahNumber,
    audioUrl: audioUrl ?? this.audioUrl,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  QuranAudioTableData copyWithCompanion(QuranAudioTableCompanion data) {
    return QuranAudioTableData(
      id: data.id.present ? data.id.value : this.id,
      ayahId: data.ayahId.present ? data.ayahId.value : this.ayahId,
      surahNumber: data.surahNumber.present
          ? data.surahNumber.value
          : this.surahNumber,
      ayahNumber: data.ayahNumber.present
          ? data.ayahNumber.value
          : this.ayahNumber,
      audioUrl: data.audioUrl.present ? data.audioUrl.value : this.audioUrl,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuranAudioTableData(')
          ..write('id: $id, ')
          ..write('ayahId: $ayahId, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('ayahNumber: $ayahNumber, ')
          ..write('audioUrl: $audioUrl, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    ayahId,
    surahNumber,
    ayahNumber,
    audioUrl,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuranAudioTableData &&
          other.id == this.id &&
          other.ayahId == this.ayahId &&
          other.surahNumber == this.surahNumber &&
          other.ayahNumber == this.ayahNumber &&
          other.audioUrl == this.audioUrl &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class QuranAudioTableCompanion extends UpdateCompanion<QuranAudioTableData> {
  final Value<int> id;
  final Value<int> ayahId;
  final Value<int> surahNumber;
  final Value<int> ayahNumber;
  final Value<String> audioUrl;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const QuranAudioTableCompanion({
    this.id = const Value.absent(),
    this.ayahId = const Value.absent(),
    this.surahNumber = const Value.absent(),
    this.ayahNumber = const Value.absent(),
    this.audioUrl = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  QuranAudioTableCompanion.insert({
    this.id = const Value.absent(),
    required int ayahId,
    required int surahNumber,
    required int ayahNumber,
    required String audioUrl,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : ayahId = Value(ayahId),
       surahNumber = Value(surahNumber),
       ayahNumber = Value(ayahNumber),
       audioUrl = Value(audioUrl);
  static Insertable<QuranAudioTableData> custom({
    Expression<int>? id,
    Expression<int>? ayahId,
    Expression<int>? surahNumber,
    Expression<int>? ayahNumber,
    Expression<String>? audioUrl,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ayahId != null) 'ayah_id': ayahId,
      if (surahNumber != null) 'surah_number': surahNumber,
      if (ayahNumber != null) 'ayah_number': ayahNumber,
      if (audioUrl != null) 'audio_url': audioUrl,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  QuranAudioTableCompanion copyWith({
    Value<int>? id,
    Value<int>? ayahId,
    Value<int>? surahNumber,
    Value<int>? ayahNumber,
    Value<String>? audioUrl,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return QuranAudioTableCompanion(
      id: id ?? this.id,
      ayahId: ayahId ?? this.ayahId,
      surahNumber: surahNumber ?? this.surahNumber,
      ayahNumber: ayahNumber ?? this.ayahNumber,
      audioUrl: audioUrl ?? this.audioUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ayahId.present) {
      map['ayah_id'] = Variable<int>(ayahId.value);
    }
    if (surahNumber.present) {
      map['surah_number'] = Variable<int>(surahNumber.value);
    }
    if (ayahNumber.present) {
      map['ayah_number'] = Variable<int>(ayahNumber.value);
    }
    if (audioUrl.present) {
      map['audio_url'] = Variable<String>(audioUrl.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuranAudioTableCompanion(')
          ..write('id: $id, ')
          ..write('ayahId: $ayahId, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('ayahNumber: $ayahNumber, ')
          ..write('audioUrl: $audioUrl, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $QuranSurahTableTable quranSurahTable = $QuranSurahTableTable(
    this,
  );
  late final $QuranAyahTableTable quranAyahTable = $QuranAyahTableTable(this);
  late final $QuranAudioTableTable quranAudioTable = $QuranAudioTableTable(
    this,
  );
  late final QuranDao quranDao = QuranDao(this as AppDatabase);
  late final QuranAyahDao quranAyahDao = QuranAyahDao(this as AppDatabase);
  late final QuranAudioDao quranAudioDao = QuranAudioDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    quranSurahTable,
    quranAyahTable,
    quranAudioTable,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'quran_surahs',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('quran_ayahs', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'quran_ayahs',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('quran_audios', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$QuranSurahTableTableCreateCompanionBuilder =
    QuranSurahTableCompanion Function({
      Value<int> surahNumber,
      required String name,
      required String nameLatin,
      required int numberOfAyah,
      required String placeOfRevelation,
      required String meaning,
      required String description,
      Value<bool> isBookmarked,
      Value<bool> isLastRead,
      Value<int?> lastReadAyah,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$QuranSurahTableTableUpdateCompanionBuilder =
    QuranSurahTableCompanion Function({
      Value<int> surahNumber,
      Value<String> name,
      Value<String> nameLatin,
      Value<int> numberOfAyah,
      Value<String> placeOfRevelation,
      Value<String> meaning,
      Value<String> description,
      Value<bool> isBookmarked,
      Value<bool> isLastRead,
      Value<int?> lastReadAyah,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$QuranSurahTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $QuranSurahTableTable,
          QuranSurahTableData
        > {
  $$QuranSurahTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$QuranAyahTableTable, List<QuranAyahTableData>>
  _quranAyahTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.quranAyahTable,
    aliasName: $_aliasNameGenerator(
      db.quranSurahTable.surahNumber,
      db.quranAyahTable.surahNumber,
    ),
  );

  $$QuranAyahTableTableProcessedTableManager get quranAyahTableRefs {
    final manager = $$QuranAyahTableTableTableManager($_db, $_db.quranAyahTable)
        .filter(
          (f) => f.surahNumber.surahNumber.sqlEquals(
            $_itemColumn<int>('surah_number')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_quranAyahTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$QuranSurahTableTableFilterComposer
    extends Composer<_$AppDatabase, $QuranSurahTableTable> {
  $$QuranSurahTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameLatin => $composableBuilder(
    column: $table.nameLatin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get numberOfAyah => $composableBuilder(
    column: $table.numberOfAyah,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get placeOfRevelation => $composableBuilder(
    column: $table.placeOfRevelation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get meaning => $composableBuilder(
    column: $table.meaning,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isLastRead => $composableBuilder(
    column: $table.isLastRead,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lastReadAyah => $composableBuilder(
    column: $table.lastReadAyah,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> quranAyahTableRefs(
    Expression<bool> Function($$QuranAyahTableTableFilterComposer f) f,
  ) {
    final $$QuranAyahTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.surahNumber,
      referencedTable: $db.quranAyahTable,
      getReferencedColumn: (t) => t.surahNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuranAyahTableTableFilterComposer(
            $db: $db,
            $table: $db.quranAyahTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$QuranSurahTableTableOrderingComposer
    extends Composer<_$AppDatabase, $QuranSurahTableTable> {
  $$QuranSurahTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameLatin => $composableBuilder(
    column: $table.nameLatin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numberOfAyah => $composableBuilder(
    column: $table.numberOfAyah,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get placeOfRevelation => $composableBuilder(
    column: $table.placeOfRevelation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get meaning => $composableBuilder(
    column: $table.meaning,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isLastRead => $composableBuilder(
    column: $table.isLastRead,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastReadAyah => $composableBuilder(
    column: $table.lastReadAyah,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QuranSurahTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuranSurahTableTable> {
  $$QuranSurahTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get nameLatin =>
      $composableBuilder(column: $table.nameLatin, builder: (column) => column);

  GeneratedColumn<int> get numberOfAyah => $composableBuilder(
    column: $table.numberOfAyah,
    builder: (column) => column,
  );

  GeneratedColumn<String> get placeOfRevelation => $composableBuilder(
    column: $table.placeOfRevelation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get meaning =>
      $composableBuilder(column: $table.meaning, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isLastRead => $composableBuilder(
    column: $table.isLastRead,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lastReadAyah => $composableBuilder(
    column: $table.lastReadAyah,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> quranAyahTableRefs<T extends Object>(
    Expression<T> Function($$QuranAyahTableTableAnnotationComposer a) f,
  ) {
    final $$QuranAyahTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.surahNumber,
      referencedTable: $db.quranAyahTable,
      getReferencedColumn: (t) => t.surahNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuranAyahTableTableAnnotationComposer(
            $db: $db,
            $table: $db.quranAyahTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$QuranSurahTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuranSurahTableTable,
          QuranSurahTableData,
          $$QuranSurahTableTableFilterComposer,
          $$QuranSurahTableTableOrderingComposer,
          $$QuranSurahTableTableAnnotationComposer,
          $$QuranSurahTableTableCreateCompanionBuilder,
          $$QuranSurahTableTableUpdateCompanionBuilder,
          (QuranSurahTableData, $$QuranSurahTableTableReferences),
          QuranSurahTableData,
          PrefetchHooks Function({bool quranAyahTableRefs})
        > {
  $$QuranSurahTableTableTableManager(
    _$AppDatabase db,
    $QuranSurahTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuranSurahTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuranSurahTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuranSurahTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> surahNumber = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> nameLatin = const Value.absent(),
                Value<int> numberOfAyah = const Value.absent(),
                Value<String> placeOfRevelation = const Value.absent(),
                Value<String> meaning = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<bool> isBookmarked = const Value.absent(),
                Value<bool> isLastRead = const Value.absent(),
                Value<int?> lastReadAyah = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => QuranSurahTableCompanion(
                surahNumber: surahNumber,
                name: name,
                nameLatin: nameLatin,
                numberOfAyah: numberOfAyah,
                placeOfRevelation: placeOfRevelation,
                meaning: meaning,
                description: description,
                isBookmarked: isBookmarked,
                isLastRead: isLastRead,
                lastReadAyah: lastReadAyah,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> surahNumber = const Value.absent(),
                required String name,
                required String nameLatin,
                required int numberOfAyah,
                required String placeOfRevelation,
                required String meaning,
                required String description,
                Value<bool> isBookmarked = const Value.absent(),
                Value<bool> isLastRead = const Value.absent(),
                Value<int?> lastReadAyah = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => QuranSurahTableCompanion.insert(
                surahNumber: surahNumber,
                name: name,
                nameLatin: nameLatin,
                numberOfAyah: numberOfAyah,
                placeOfRevelation: placeOfRevelation,
                meaning: meaning,
                description: description,
                isBookmarked: isBookmarked,
                isLastRead: isLastRead,
                lastReadAyah: lastReadAyah,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$QuranSurahTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({quranAyahTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (quranAyahTableRefs) db.quranAyahTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (quranAyahTableRefs)
                    await $_getPrefetchedData<
                      QuranSurahTableData,
                      $QuranSurahTableTable,
                      QuranAyahTableData
                    >(
                      currentTable: table,
                      referencedTable: $$QuranSurahTableTableReferences
                          ._quranAyahTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$QuranSurahTableTableReferences(
                            db,
                            table,
                            p0,
                          ).quranAyahTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.surahNumber == item.surahNumber,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$QuranSurahTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuranSurahTableTable,
      QuranSurahTableData,
      $$QuranSurahTableTableFilterComposer,
      $$QuranSurahTableTableOrderingComposer,
      $$QuranSurahTableTableAnnotationComposer,
      $$QuranSurahTableTableCreateCompanionBuilder,
      $$QuranSurahTableTableUpdateCompanionBuilder,
      (QuranSurahTableData, $$QuranSurahTableTableReferences),
      QuranSurahTableData,
      PrefetchHooks Function({bool quranAyahTableRefs})
    >;
typedef $$QuranAyahTableTableCreateCompanionBuilder =
    QuranAyahTableCompanion Function({
      Value<int> id,
      required int surahNumber,
      required int ayahNumber,
      required String arabicText,
      required String latinText,
      Value<String?> translationId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$QuranAyahTableTableUpdateCompanionBuilder =
    QuranAyahTableCompanion Function({
      Value<int> id,
      Value<int> surahNumber,
      Value<int> ayahNumber,
      Value<String> arabicText,
      Value<String> latinText,
      Value<String?> translationId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$QuranAyahTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $QuranAyahTableTable,
          QuranAyahTableData
        > {
  $$QuranAyahTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $QuranSurahTableTable _surahNumberTable(_$AppDatabase db) =>
      db.quranSurahTable.createAlias(
        $_aliasNameGenerator(
          db.quranAyahTable.surahNumber,
          db.quranSurahTable.surahNumber,
        ),
      );

  $$QuranSurahTableTableProcessedTableManager get surahNumber {
    final $_column = $_itemColumn<int>('surah_number')!;

    final manager = $$QuranSurahTableTableTableManager(
      $_db,
      $_db.quranSurahTable,
    ).filter((f) => f.surahNumber.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_surahNumberTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$QuranAudioTableTable, List<QuranAudioTableData>>
  _quranAudioTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.quranAudioTable,
    aliasName: $_aliasNameGenerator(
      db.quranAyahTable.id,
      db.quranAudioTable.ayahId,
    ),
  );

  $$QuranAudioTableTableProcessedTableManager get quranAudioTableRefs {
    final manager = $$QuranAudioTableTableTableManager(
      $_db,
      $_db.quranAudioTable,
    ).filter((f) => f.ayahId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _quranAudioTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$QuranAyahTableTableFilterComposer
    extends Composer<_$AppDatabase, $QuranAyahTableTable> {
  $$QuranAyahTableTableFilterComposer({
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

  ColumnFilters<int> get ayahNumber => $composableBuilder(
    column: $table.ayahNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get arabicText => $composableBuilder(
    column: $table.arabicText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get latinText => $composableBuilder(
    column: $table.latinText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get translationId => $composableBuilder(
    column: $table.translationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$QuranSurahTableTableFilterComposer get surahNumber {
    final $$QuranSurahTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.surahNumber,
      referencedTable: $db.quranSurahTable,
      getReferencedColumn: (t) => t.surahNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuranSurahTableTableFilterComposer(
            $db: $db,
            $table: $db.quranSurahTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> quranAudioTableRefs(
    Expression<bool> Function($$QuranAudioTableTableFilterComposer f) f,
  ) {
    final $$QuranAudioTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.quranAudioTable,
      getReferencedColumn: (t) => t.ayahId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuranAudioTableTableFilterComposer(
            $db: $db,
            $table: $db.quranAudioTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$QuranAyahTableTableOrderingComposer
    extends Composer<_$AppDatabase, $QuranAyahTableTable> {
  $$QuranAyahTableTableOrderingComposer({
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

  ColumnOrderings<int> get ayahNumber => $composableBuilder(
    column: $table.ayahNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get arabicText => $composableBuilder(
    column: $table.arabicText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get latinText => $composableBuilder(
    column: $table.latinText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get translationId => $composableBuilder(
    column: $table.translationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$QuranSurahTableTableOrderingComposer get surahNumber {
    final $$QuranSurahTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.surahNumber,
      referencedTable: $db.quranSurahTable,
      getReferencedColumn: (t) => t.surahNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuranSurahTableTableOrderingComposer(
            $db: $db,
            $table: $db.quranSurahTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$QuranAyahTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuranAyahTableTable> {
  $$QuranAyahTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get ayahNumber => $composableBuilder(
    column: $table.ayahNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get arabicText => $composableBuilder(
    column: $table.arabicText,
    builder: (column) => column,
  );

  GeneratedColumn<String> get latinText =>
      $composableBuilder(column: $table.latinText, builder: (column) => column);

  GeneratedColumn<String> get translationId => $composableBuilder(
    column: $table.translationId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$QuranSurahTableTableAnnotationComposer get surahNumber {
    final $$QuranSurahTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.surahNumber,
      referencedTable: $db.quranSurahTable,
      getReferencedColumn: (t) => t.surahNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuranSurahTableTableAnnotationComposer(
            $db: $db,
            $table: $db.quranSurahTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> quranAudioTableRefs<T extends Object>(
    Expression<T> Function($$QuranAudioTableTableAnnotationComposer a) f,
  ) {
    final $$QuranAudioTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.quranAudioTable,
      getReferencedColumn: (t) => t.ayahId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuranAudioTableTableAnnotationComposer(
            $db: $db,
            $table: $db.quranAudioTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$QuranAyahTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuranAyahTableTable,
          QuranAyahTableData,
          $$QuranAyahTableTableFilterComposer,
          $$QuranAyahTableTableOrderingComposer,
          $$QuranAyahTableTableAnnotationComposer,
          $$QuranAyahTableTableCreateCompanionBuilder,
          $$QuranAyahTableTableUpdateCompanionBuilder,
          (QuranAyahTableData, $$QuranAyahTableTableReferences),
          QuranAyahTableData,
          PrefetchHooks Function({bool surahNumber, bool quranAudioTableRefs})
        > {
  $$QuranAyahTableTableTableManager(
    _$AppDatabase db,
    $QuranAyahTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuranAyahTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuranAyahTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuranAyahTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> surahNumber = const Value.absent(),
                Value<int> ayahNumber = const Value.absent(),
                Value<String> arabicText = const Value.absent(),
                Value<String> latinText = const Value.absent(),
                Value<String?> translationId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => QuranAyahTableCompanion(
                id: id,
                surahNumber: surahNumber,
                ayahNumber: ayahNumber,
                arabicText: arabicText,
                latinText: latinText,
                translationId: translationId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int surahNumber,
                required int ayahNumber,
                required String arabicText,
                required String latinText,
                Value<String?> translationId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => QuranAyahTableCompanion.insert(
                id: id,
                surahNumber: surahNumber,
                ayahNumber: ayahNumber,
                arabicText: arabicText,
                latinText: latinText,
                translationId: translationId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$QuranAyahTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({surahNumber = false, quranAudioTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (quranAudioTableRefs) db.quranAudioTable,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (surahNumber) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.surahNumber,
                                    referencedTable:
                                        $$QuranAyahTableTableReferences
                                            ._surahNumberTable(db),
                                    referencedColumn:
                                        $$QuranAyahTableTableReferences
                                            ._surahNumberTable(db)
                                            .surahNumber,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (quranAudioTableRefs)
                        await $_getPrefetchedData<
                          QuranAyahTableData,
                          $QuranAyahTableTable,
                          QuranAudioTableData
                        >(
                          currentTable: table,
                          referencedTable: $$QuranAyahTableTableReferences
                              ._quranAudioTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$QuranAyahTableTableReferences(
                                db,
                                table,
                                p0,
                              ).quranAudioTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ayahId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$QuranAyahTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuranAyahTableTable,
      QuranAyahTableData,
      $$QuranAyahTableTableFilterComposer,
      $$QuranAyahTableTableOrderingComposer,
      $$QuranAyahTableTableAnnotationComposer,
      $$QuranAyahTableTableCreateCompanionBuilder,
      $$QuranAyahTableTableUpdateCompanionBuilder,
      (QuranAyahTableData, $$QuranAyahTableTableReferences),
      QuranAyahTableData,
      PrefetchHooks Function({bool surahNumber, bool quranAudioTableRefs})
    >;
typedef $$QuranAudioTableTableCreateCompanionBuilder =
    QuranAudioTableCompanion Function({
      Value<int> id,
      required int ayahId,
      required int surahNumber,
      required int ayahNumber,
      required String audioUrl,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$QuranAudioTableTableUpdateCompanionBuilder =
    QuranAudioTableCompanion Function({
      Value<int> id,
      Value<int> ayahId,
      Value<int> surahNumber,
      Value<int> ayahNumber,
      Value<String> audioUrl,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$QuranAudioTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $QuranAudioTableTable,
          QuranAudioTableData
        > {
  $$QuranAudioTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $QuranAyahTableTable _ayahIdTable(_$AppDatabase db) =>
      db.quranAyahTable.createAlias(
        $_aliasNameGenerator(db.quranAudioTable.ayahId, db.quranAyahTable.id),
      );

  $$QuranAyahTableTableProcessedTableManager get ayahId {
    final $_column = $_itemColumn<int>('ayah_id')!;

    final manager = $$QuranAyahTableTableTableManager(
      $_db,
      $_db.quranAyahTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ayahIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$QuranAudioTableTableFilterComposer
    extends Composer<_$AppDatabase, $QuranAudioTableTable> {
  $$QuranAudioTableTableFilterComposer({
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

  ColumnFilters<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ayahNumber => $composableBuilder(
    column: $table.ayahNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get audioUrl => $composableBuilder(
    column: $table.audioUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$QuranAyahTableTableFilterComposer get ayahId {
    final $$QuranAyahTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ayahId,
      referencedTable: $db.quranAyahTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuranAyahTableTableFilterComposer(
            $db: $db,
            $table: $db.quranAyahTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$QuranAudioTableTableOrderingComposer
    extends Composer<_$AppDatabase, $QuranAudioTableTable> {
  $$QuranAudioTableTableOrderingComposer({
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

  ColumnOrderings<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ayahNumber => $composableBuilder(
    column: $table.ayahNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get audioUrl => $composableBuilder(
    column: $table.audioUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$QuranAyahTableTableOrderingComposer get ayahId {
    final $$QuranAyahTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ayahId,
      referencedTable: $db.quranAyahTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuranAyahTableTableOrderingComposer(
            $db: $db,
            $table: $db.quranAyahTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$QuranAudioTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuranAudioTableTable> {
  $$QuranAudioTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get ayahNumber => $composableBuilder(
    column: $table.ayahNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get audioUrl =>
      $composableBuilder(column: $table.audioUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$QuranAyahTableTableAnnotationComposer get ayahId {
    final $$QuranAyahTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ayahId,
      referencedTable: $db.quranAyahTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuranAyahTableTableAnnotationComposer(
            $db: $db,
            $table: $db.quranAyahTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$QuranAudioTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuranAudioTableTable,
          QuranAudioTableData,
          $$QuranAudioTableTableFilterComposer,
          $$QuranAudioTableTableOrderingComposer,
          $$QuranAudioTableTableAnnotationComposer,
          $$QuranAudioTableTableCreateCompanionBuilder,
          $$QuranAudioTableTableUpdateCompanionBuilder,
          (QuranAudioTableData, $$QuranAudioTableTableReferences),
          QuranAudioTableData,
          PrefetchHooks Function({bool ayahId})
        > {
  $$QuranAudioTableTableTableManager(
    _$AppDatabase db,
    $QuranAudioTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuranAudioTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuranAudioTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuranAudioTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> ayahId = const Value.absent(),
                Value<int> surahNumber = const Value.absent(),
                Value<int> ayahNumber = const Value.absent(),
                Value<String> audioUrl = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => QuranAudioTableCompanion(
                id: id,
                ayahId: ayahId,
                surahNumber: surahNumber,
                ayahNumber: ayahNumber,
                audioUrl: audioUrl,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int ayahId,
                required int surahNumber,
                required int ayahNumber,
                required String audioUrl,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => QuranAudioTableCompanion.insert(
                id: id,
                ayahId: ayahId,
                surahNumber: surahNumber,
                ayahNumber: ayahNumber,
                audioUrl: audioUrl,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$QuranAudioTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({ayahId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (ayahId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.ayahId,
                                referencedTable:
                                    $$QuranAudioTableTableReferences
                                        ._ayahIdTable(db),
                                referencedColumn:
                                    $$QuranAudioTableTableReferences
                                        ._ayahIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$QuranAudioTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuranAudioTableTable,
      QuranAudioTableData,
      $$QuranAudioTableTableFilterComposer,
      $$QuranAudioTableTableOrderingComposer,
      $$QuranAudioTableTableAnnotationComposer,
      $$QuranAudioTableTableCreateCompanionBuilder,
      $$QuranAudioTableTableUpdateCompanionBuilder,
      (QuranAudioTableData, $$QuranAudioTableTableReferences),
      QuranAudioTableData,
      PrefetchHooks Function({bool ayahId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$QuranSurahTableTableTableManager get quranSurahTable =>
      $$QuranSurahTableTableTableManager(_db, _db.quranSurahTable);
  $$QuranAyahTableTableTableManager get quranAyahTable =>
      $$QuranAyahTableTableTableManager(_db, _db.quranAyahTable);
  $$QuranAudioTableTableTableManager get quranAudioTable =>
      $$QuranAudioTableTableTableManager(_db, _db.quranAudioTable);
}
