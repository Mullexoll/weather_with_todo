part of 'todo_bloc.dart';

@immutable
abstract class TodoState extends Equatable {}

class TodoLoaded extends TodoState {
  final List<TodoModel> todos;
  final String currentFilter;

  TodoLoaded({
    required this.todos,
    required this.currentFilter,
  });

  TodoLoaded copyWith({
    List<TodoModel>? todos,
    String? currentFilter,
  }) {
    return TodoLoaded(
      todos: todos ?? this.todos,
      currentFilter: currentFilter ?? this.currentFilter,
    );
  }

  @override
  List<Object?> get props => [
        identityHashCode(todos),
        currentFilter,
      ];
}
