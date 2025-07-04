import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
part 'hiveTask.g.dart';

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
  DateTime createdTime;

  @HiveField(4)
  DateTime createdDate;

  @HiveField(5)
  bool isCompleted;
  
  factory HiveTask.create({
    required String? title,
    required String? description,
    DateTime? createdTime,
    DateTime? createdDate,
  })=>
  HiveTask(
    id: const Uuid().v1(),
    title: title ?? "",
    description: description ?? "",
    createdTime: createdTime ?? DateTime.now(),
    createdDate: createdDate ?? DateTime.now(),
    isCompleted: false
  );
}
