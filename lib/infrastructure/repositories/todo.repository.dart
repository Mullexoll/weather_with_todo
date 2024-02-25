import 'package:isar/isar.dart';

import '../../domain/models/todo_models/todo.model.dart';

class TodoRepository {
  final IsarCollection<TodoModel> _storage;
  final Isar _isar;

  TodoRepository(this._isar) : _storage = _isar.collection<TodoModel>();

  Future<bool> addRepositoryToIsar({
    required TodoModel repository,
  }) async {
    final foundRepository = await _storage.getById(repository.id);

    if (foundRepository == null) {
      await _isar.writeTxn(() async => await _storage.put(repository));
    } else {
      if (foundRepository.id == repository.id) {
        await _isar
            .writeTxn(() async => await _storage.deleteById(repository.id));
      }
    }

    return true;
  }

  Future<List<TodoModel>> getAllRepositories() {
    final foundRepositories = _storage.where().findAll();

    return foundRepositories;
  }

  void deleteRepository(String id) async {
    await _isar.writeTxn(() async {
      final _ = await _storage.deleteById(id);
    });
  }

  Future<void> updateTodo(String id) async {
    // Start a write transaction
    await _isar.writeTxn(() async {
      // Find the todo you want to update by its ID
      TodoModel? todo = await _storage.getById(id);
      if (todo != null) {
        TodoModel updatedTodo = TodoModel(
          id: todo.id,
          todoTitle: todo.todoTitle,
          todoValue: todo.todoValue,
          todoStatus: !todo.todoStatus,
        );

        // Save the changes by calling .save()
        await _storage.putById(updatedTodo);
      }
    });
  }
}
