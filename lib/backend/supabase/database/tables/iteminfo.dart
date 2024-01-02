import '../database.dart';

class IteminfoTable extends SupabaseTable<IteminfoRow> {
  @override
  String get tableName => 'iteminfo';

  @override
  IteminfoRow createRow(Map<String, dynamic> data) => IteminfoRow(data);
}

class IteminfoRow extends SupabaseDataRow {
  IteminfoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => IteminfoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get info => getField<String>('info');
  set info(String? value) => setField<String>('info', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  PostgresTime? get buyTime => getField<PostgresTime>('buy_time');
  set buyTime(PostgresTime? value) => setField<PostgresTime>('buy_time', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  String? get owner => getField<String>('owner');
  set owner(String? value) => setField<String>('owner', value);
}
