
import 'package:hive_flutter/hive_flutter.dart';

part 'day_habits_hive_model.g.dart';

@HiveType(typeId: 2)
class DayHabitsHive {
  @HiveField(0)
  late int id;

  @HiveField(1)
  late int date;

  @HiveField(2)
  late int habitId;

  @HiveField(3)
  late String comment;

  @HiveField(4)
  late String state;

  DayHabitsHive({
    required this.id,
    required this.date,
    required this.habitId,
    required this.comment,
    required this.state
  });
}
