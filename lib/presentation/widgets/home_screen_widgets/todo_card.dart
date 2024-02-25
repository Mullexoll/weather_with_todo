import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/todo_bloc/todo_bloc.dart';
import '../../../domain/models/todo_models/todo.model.dart';
import '../../helpers/text_style_helper.dart';

class TodoCard extends StatefulWidget {
  final TodoModel todo;

  const TodoCard({super.key, required this.todo});

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color:
          widget.todo.todoStatus ? Colors.greenAccent : Colors.redAccent[100],
      child: ListTile(
        title: Text(
          widget.todo.todoTitle,
          style: defaultBlack16(),
        ),
        subtitle: Text(
          widget.todo.todoValue,
          style: defaultBlack16(),
        ),
        leading: Checkbox(
          value: widget.todo.todoStatus,
          onChanged: (value) {
            BlocProvider.of<TodoBloc>(context).add(
              TodoStatusChanged(id: widget.todo.id),
            );
          },
        ),
        trailing: InkWell(
          onTap: () {
            BlocProvider.of<TodoBloc>(context).add(
              TodoDeleted(id: widget.todo.id),
            );
          },
          child: const Icon(Icons.delete_forever),
        ),
      ),
    );
  }
}
