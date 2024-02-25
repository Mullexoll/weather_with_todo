import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_with_todo/presentation/widgets/home_screen_widgets/todo_card.dart';

import '../../../blocs/todo_bloc/todo_bloc.dart';
import 'filtering_menu_delegate.dart';

class TodosBuilder extends StatelessWidget {
  const TodosBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is TodoLoaded) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                delegate:
                    FilteringMenuDelegate(), // Create a delegate for your filtering menu
                floating:
                    true, // Whether the menu should become visible when scrolling down
                pinned:
                    true, // Whether the menu should remain visible when scrolling up
              ),
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
