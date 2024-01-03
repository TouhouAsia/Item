// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemInfoStruct extends BaseStruct {
  ItemInfoStruct({
    int? id,
    String? name,
    String? info,
    double? price,
    DateTime? buyTime,
    String? image,
    bool? isArchive,
  })  : _id = id,
        _name = name,
        _info = info,
        _price = price,
        _buyTime = buyTime,
        _image = image,
        _isArchive = isArchive;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? 'None';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "info" field.
  String? _info;
  String get info => _info ?? 'None';
  set info(String? val) => _info = val;
  bool hasInfo() => _info != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  // "buy_time" field.
  DateTime? _buyTime;
  DateTime? get buyTime => _buyTime;
  set buyTime(DateTime? val) => _buyTime = val;
  bool hasBuyTime() => _buyTime != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  // "is_archive" field.
  bool? _isArchive;
  bool get isArchive => _isArchive ?? false;
  set isArchive(bool? val) => _isArchive = val;
  bool hasIsArchive() => _isArchive != null;

  static ItemInfoStruct fromMap(Map<String, dynamic> data) => ItemInfoStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        info: data['info'] as String?,
        price: castToType<double>(data['price']),
        buyTime: data['buy_time'] as DateTime?,
        image: data['image'] as String?,
        isArchive: data['is_archive'] as bool?,
      );

  static ItemInfoStruct? maybeFromMap(dynamic data) =>
      data is Map ? ItemInfoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'info': _info,
        'price': _price,
        'buy_time': _buyTime,
        'image': _image,
        'is_archive': _isArchive,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'info': serializeParam(
          _info,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'buy_time': serializeParam(
          _buyTime,
          ParamType.DateTime,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'is_archive': serializeParam(
          _isArchive,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ItemInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemInfoStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        info: deserializeParam(
          data['info'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        buyTime: deserializeParam(
          data['buy_time'],
          ParamType.DateTime,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        isArchive: deserializeParam(
          data['is_archive'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ItemInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemInfoStruct &&
        id == other.id &&
        name == other.name &&
        info == other.info &&
        price == other.price &&
        buyTime == other.buyTime &&
        image == other.image &&
        isArchive == other.isArchive;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, name, info, price, buyTime, image, isArchive]);
}

ItemInfoStruct createItemInfoStruct({
  int? id,
  String? name,
  String? info,
  double? price,
  DateTime? buyTime,
  String? image,
  bool? isArchive,
}) =>
    ItemInfoStruct(
      id: id,
      name: name,
      info: info,
      price: price,
      buyTime: buyTime,
      image: image,
      isArchive: isArchive,
    );
