import 'package:hive_flutter/adapters.dart';

part 'tile.g.dart';

@HiveType(typeId: 0)
class Tile extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String from;
  @HiveField(4)
  final String to;
  @HiveField(5)
  final String dateFrom;
  @HiveField(6)
  final String dateTo;

  Tile({
    required this.id,
    required this.name,
    required this.description,
    required this.from,
    required this.to,
    required this.dateFrom,
    required this.dateTo,
  });
}
