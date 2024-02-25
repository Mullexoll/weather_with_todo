import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_with_todo/presentation/widgets/home_screen_widgets/todo_card.dart';

import '../../../blocs/todo_bloc/todo_bloc.dart';

class TodosBuilder extends StatelessWidget {
  const TodosBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is TodoLoaded) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return TodoCard(todo: state.todos[index]);
                  },
                  childCount: state.todos.length,
                ),
              ),
            ],
          );
        }

        //showing if todo list is empty
        return const Text(
          'Todo`s is empty',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.red,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        );
      },
    );
  }
}
