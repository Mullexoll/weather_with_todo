part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent extends Equatable {}

class TodoRepositoryInit extends TodoEvent {
  @override
  List<Object?> get props => [];
}

class NewTodoAdded extends TodoEvent {
  final String todoTitle;
  final String todoValue;

  NewTodoAdded({
    required this.todoValue,
    required this.todoTitle,
  });

  @override
  List<Object?> get props => [
        todoValue,
        todoTitle,
      ];
}

class TodoStatusChanged extends TodoEvent {
  final String id;

  TodoStatusChanged({required this.id});

  @override
  List<Object?> get props => [id];
}

class TodoDeleted extends TodoEvent {
  final String id;

  TodoDeleted({required this.id});

  @override
  List<Object?> get props => [id];
}
