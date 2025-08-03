class HabitInfo {
  final int id;
  final String title;
  final String icon;
  final String description;
  final String startDate;
  final String endDate;
  final String category;
  final String type;
  final String reminder;
  final String time;
  final List<String> frequency;

  HabitInfo(
      {required this.id,
      required this.title,
      required this.icon,
      required this.description,
      required this.startDate,
      required this.endDate,
      required this.category,
      required this.type,
      required this.reminder,
      required this.time,
      required this.frequency});
}
