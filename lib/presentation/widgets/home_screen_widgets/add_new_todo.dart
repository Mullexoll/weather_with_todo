import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/todo_bloc/todo_bloc.dart';

class AddNewTodo extends StatefulWidget {
  const AddNewTodo({
    super.key,
  });

  @override
  State<AddNewTodo> createState() => _AddNewTodoState();
}

class _AddNewTodoState extends State<AddNewTodo> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<String> options = ['Without category', 'Work', 'Sport', 'Life'];
  String selectedOption = 'Without category';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Todo'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
          DropdownButton<String>(
            value: selectedOption, // The currently selected option
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  selectedOption = newValue;
                });
                BlocProvider.of<TodoBloc>(context).add(
                  FilterTypeChanged(filterName: newValue),
                );
              }
            },
            items: options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            String title = titleController.text;
            String description = descriptionController.text;
            if (title.isNotEmpty && description.isNotEmpty) {
              BlocProvider.of<TodoBloc>(context).add(
                NewTodoAdded(
                  todoValue: description,
                  todoTitle: title,
                  category: selectedOption,
                ),
              );
              Navigator.of(context).pop();
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
