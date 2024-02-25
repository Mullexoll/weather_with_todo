import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

part 'todo.model.g.dart';

@Collection(ignore: {'props'})
class TodoModel extends Equatable {
  final Id autoId = Isar.autoIncrement;
  @Index(
    unique: true,
  )
  final String id;
  final String todoTitle;
  final String todoValue;
  final bool todoStatus;
  final String category;

  const TodoModel({
    required this.id,
    required this.todoTitle,
    required this.todoValue,
    required this.todoStatus,
    required this.category,
  });

  @override
  List<Object?> get props => [
        id,
        todoTitle,
        todoValue,
        todoStatus,
        category,
      ];
}
