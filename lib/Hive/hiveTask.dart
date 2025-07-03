import 'package:hive/hive.dart';

@HiveType(typeId:0)
class HiveTask extends HiveObject{
  HiveTask({
    required this.id,
    required this.title,
    required this.description,
    required this.createdTime,
    required this.createdDate,
    required this.isCompleted,
  });

  @HiveField(0)
  final String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  String createdTime;

  @HiveField(4)
  String createdDate;

  @HiveField(5)
  String isCompleted;
}