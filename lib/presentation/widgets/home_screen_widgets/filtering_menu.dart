import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/todo_bloc/todo_bloc.dart';

class FilteringMenu extends StatefulWidget {
  const FilteringMenu({super.key});

  @override
  State<FilteringMenu> createState() => _FilteringMenuState();
}

class _FilteringMenuState extends State<FilteringMenu> {
  // Example list of options
  // TODO: need to refactor and adding to state
  List<String> options = [
    'All',
    'Completed',
    'Not completed',
    'Work',
    'Sport',
    'Life',
  ];

// Currently selected option
  String selectedOption = 'All';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedOption, // The currently selected option
      padding: const EdgeInsets.only(left: 5),
      onChanged: (String? newValue) {
        // Callback when an option is selected
        if (newValue != null) {
          // Update the selected option
          // You can perform additional actions here based on the selected option
          setState(() {
            selectedOption = newValue;
          });
          BlocProvider.of<TodoBloc>(context).add(
            FilterTypeChanged(filterName: newValue),
          );
          // Call setState if necessary to rebuild the UI
        }
      },
      items: options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        );
      }).toList(),
    );
  }
}
