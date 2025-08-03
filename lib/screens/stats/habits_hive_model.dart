
import 'package:hive_flutter/hive_flutter.dart';

part 'habits_hive_model.g.dart';

@HiveType(typeId: 1)
class HabitsHive {
  @HiveField(0)
  late int id;

  @HiveField(1)
  late String icon;

  @HiveField(2)
  late String title;

  @HiveField(3)
  late String description;

  @HiveField(4)
  late String category;

  @HiveField(5)
  late int start;

  @HiveField(6)
  late int end;

  @HiveField(7)
  late String time;

  @HiveField(8)
  late String reminder;

  @HiveField(9)
  late String type;

  @HiveField(10)
  late List<String> frequency;

  HabitsHive({
    required this.id,
    required this.icon,
    required this.title,
    required this.description,
    required this.category,
    required this.start,
    required this.end,
    required this.time,
    required this.reminder,
    required this.type,
    required this.frequency,
  });
}
