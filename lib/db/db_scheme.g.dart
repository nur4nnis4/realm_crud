// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_scheme.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Header extends _Header with RealmEntity, RealmObjectBase, RealmObject {
  Header(
    ObjectId id,
    DateTime tanggal,
    bool status,
    String catatan, {
    Iterable<Detail> details = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'tanggal', tanggal);
    RealmObjectBase.set(this, 'status', status);
    RealmObjectBase.set(this, 'catatan', catatan);
    RealmObjectBase.set<RealmList<Detail>>(
        this, 'details', RealmList<Detail>(details));
  }

  Header._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  DateTime get tanggal =>
      RealmObjectBase.get<DateTime>(this, 'tanggal') as DateTime;
  @override
  set tanggal(DateTime value) => RealmObjectBase.set(this, 'tanggal', value);

  @override
  bool get status => RealmObjectBase.get<bool>(this, 'status') as bool;
  @override
  set status(bool value) => RealmObjectBase.set(this, 'status', value);

  @override
  String get catatan => RealmObjectBase.get<String>(this, 'catatan') as String;
  @override
  set catatan(String value) => RealmObjectBase.set(this, 'catatan', value);

  @override
  RealmList<Detail> get details =>
      RealmObjectBase.get<Detail>(this, 'details') as RealmList<Detail>;
  @override
  set details(covariant RealmList<Detail> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Header>> get changes =>
      RealmObjectBase.getChanges<Header>(this);

  @override
  Header freeze() => RealmObjectBase.freezeObject<Header>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Header._);
    return const SchemaObject(ObjectType.realmObject, Header, 'Header', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('tanggal', RealmPropertyType.timestamp),
      SchemaProperty('status', RealmPropertyType.bool),
      SchemaProperty('catatan', RealmPropertyType.string),
      SchemaProperty('details', RealmPropertyType.object,
          linkTarget: 'Detail', collectionType: RealmCollectionType.list),
    ]);
  }
}

class Detail extends _Detail with RealmEntity, RealmObjectBase, RealmObject {
  Detail(
    ObjectId id,
    String nama,
    int qty,
    String satuan,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'nama', nama);
    RealmObjectBase.set(this, 'qty', qty);
    RealmObjectBase.set(this, 'satuan', satuan);
  }

  Detail._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get nama => RealmObjectBase.get<String>(this, 'nama') as String;
  @override
  set nama(String value) => RealmObjectBase.set(this, 'nama', value);

  @override
  int get qty => RealmObjectBase.get<int>(this, 'qty') as int;
  @override
  set qty(int value) => RealmObjectBase.set(this, 'qty', value);

  @override
  String get satuan => RealmObjectBase.get<String>(this, 'satuan') as String;
  @override
  set satuan(String value) => RealmObjectBase.set(this, 'satuan', value);

  @override
  Stream<RealmObjectChanges<Detail>> get changes =>
      RealmObjectBase.getChanges<Detail>(this);

  @override
  Detail freeze() => RealmObjectBase.freezeObject<Detail>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Detail._);
    return const SchemaObject(ObjectType.realmObject, Detail, 'Detail', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('nama', RealmPropertyType.string),
      SchemaProperty('qty', RealmPropertyType.int),
      SchemaProperty('satuan', RealmPropertyType.string),
    ]);
  }
}
