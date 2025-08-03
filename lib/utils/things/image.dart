class _HabitName {
  static const books = "books";
  static const clean = "clean";
  static const computer = "computer";
  static const food = "food";
  static const social = "friends";
  static const mail = "mail";
  static const medicine = "medicine";
  static const money = "money";
  static const shops = "shop";
  static const sleep = "sleep";
  static const sport = "sport";
}

class Habits{

static const _path = "assets/images/outline-habit/png/";
static const _type = "-o";
static const _file = ".png";


static String getIcon(String iconName) {
  return "$_path$iconName$_type$_file";
}

 static const List<String> iconNames = [
    _HabitName.books,
    _HabitName.clean,
    _HabitName.computer,
    _HabitName.food,
    _HabitName.social,
    _HabitName.mail,
    _HabitName.medicine,
    _HabitName.money,
    _HabitName.shops,
    _HabitName.sleep,
    _HabitName.sport
  ];

  static const List<String> icons = [
    "$_path${_HabitName.books}$_type$_file",
    "$_path${_HabitName.clean}$_type$_file",
    "$_path${_HabitName.computer}$_type$_file",
    "$_path${_HabitName.food}$_type$_file",
    "$_path${_HabitName.social}$_type$_file",
    "$_path${_HabitName.mail}$_type$_file",
    "$_path${_HabitName.medicine}$_type$_file",
    "$_path${_HabitName.money}$_type$_file",
    "$_path${_HabitName.shops}$_type$_file",
    "$_path${_HabitName.sleep}$_type$_file",
    "$_path${_HabitName.sport}$_type$_file"
  ];

}

