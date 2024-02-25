part of 'todo_bloc.dart';

@immutable
abstract class TodoState extends Equatable {}

class TodoLoaded extends TodoState {
  final List<TodoModel> todos;

  TodoLoaded({
    required this.todos,
  });

  TodoLoaded copyWith({
    List<TodoModel>? todos,
  }) {
    return TodoLoaded(todos: todos ?? this.todos);
  }

  @override
  List<Object?> get props => [
        identityHashCode(todos),
      ];
}
