import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/todo_cubit.dart';
import 'package:todo_app/model/todo_model.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Add Todos",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: todoController,
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              context.read<TodoCubit>().addTodo(
                    Todo(
                      message: todoController.text,
                      createdAt: DateTime.now(),
                    ),
                  );

              Navigator.of(context).pop();
            },
            child: Container(
              height: 40,
              width: 100,
              decoration: const BoxDecoration(color: Colors.red),
              child: const Center(child: Text("Add")),
            ),
          )
        ],
      ),
    );
  }
}
