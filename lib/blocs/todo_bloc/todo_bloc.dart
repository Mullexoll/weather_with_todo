import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/models/todo_models/todo.model.dart';
import '../../infrastructure/repositories/todo.repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  late Isar _isarRepository;

  TodoBloc() : super(TodoLoaded(todos: const [])) {
    on<TodoRepositoryInit>(_onTodoRepositoryInit);
    on<NewTodoAdded>(_onNewTodoAdded);
    on<TodoStatusChanged>(_onTodoStatusChanged);
    on<TodoDeleted>(_onTodoDeleted);
  }

  Future<FutureOr<void>> _onTodoRepositoryInit(
    TodoRepositoryInit event,
    Emitter<TodoState> emit,
  ) async {
    //get document directory path
    final dir = await getApplicationDocumentsDirectory();

    //open Isar Database
    //TODO: need to create single tone for easy using in project
    _isarRepository = await Isar.open(
      [TodoModelSchema],
      name: 'TodoRepositoryIsarDB',
      directory: dir.path,
    );

    //get all saved todos in database
    final List<TodoModel> savedTodos =
        await TodoRepository(_isarRepository).getAllRepositories();

    //emit state with saved previously todos
    emit(TodoLoaded(todos: savedTodos));
  }

  FutureOr<void> _onNewTodoAdded(
    NewTodoAdded event,
    Emitter<TodoState> emit,
  ) {
    //get todo list from state
    List<TodoModel> savedTodos = List.of((state as TodoLoaded).todos);

    //create random number for id
    //TODO: need to change to Uuid
    Random random = Random();
    int randomId = random.nextInt(100000);

    //create newTodo model
    TodoModel newTodo = TodoModel(
      id: randomId.toString(),
      todoTitle: event.todoTitle,
      todoValue: event.todoValue,
      todoStatus: false,
    );

    //add newTodo to Isar Database
    _addTodoToDataBase(newTodo);

    //add newTodo to state list
    savedTodos.add(newTodo);

    //emit state with list which contain new todo
    emit((state as TodoLoaded).copyWith(todos: savedTodos));
  }

  FutureOr<void> _onTodoStatusChanged(
    TodoStatusChanged event,
    Emitter<TodoState> emit,
  ) {
    //get todo list from state
    List<TodoModel> savedTodos = List.of((state as TodoLoaded).todos);
    //find element for update
    TodoModel todoToUpdate = savedTodos.firstWhere(
      (element) => element.id == event.id,
    );
    //find index to update
    int indexToUpdate = savedTodos.indexOf(todoToUpdate);

    //create new model
    TodoModel updatedTodo = TodoModel(
      id: todoToUpdate.id,
      todoTitle: todoToUpdate.todoTitle,
      todoValue: todoToUpdate.todoValue,
      todoStatus: !todoToUpdate.todoStatus,
    );
    //update old model
    savedTodos[indexToUpdate] = updatedTodo;

    //update todo in Isar database
    _updateTodoFromDataBase(event.id);

    //emit new state with updated list
    emit((state as TodoLoaded).copyWith(todos: savedTodos));
  }

  FutureOr<void> _onTodoDeleted(
    TodoDeleted event,
    Emitter<TodoState> emit,
  ) {
    //get todo list from state
    List<TodoModel> savedTodos = List.of((state as TodoLoaded).todos);
    //find element to delete
    TodoModel todoToDelete = savedTodos.firstWhere(
      (element) => element.id == event.id,
    );
    //remove element from list
    savedTodos.remove(todoToDelete);
    //delete todo from Isar database
    _deleteTodoFromDataBase(event.id);

    //emit new state without deleted element
    emit((state as TodoLoaded).copyWith(todos: savedTodos));
  }

  //Needed for manipulate with Isar Database
  _addTodoToDataBase(TodoModel todo) async {
    await TodoRepository(_isarRepository).addRepositoryToIsar(repository: todo);
  }

  _deleteTodoFromDataBase(String id) {
    TodoRepository(_isarRepository).deleteRepository(id);
  }

  _updateTodoFromDataBase(String id) {
    TodoRepository(_isarRepository).updateTodo(id);
  }
}
