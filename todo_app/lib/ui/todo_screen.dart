import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/todo_cubit.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/ui/add_todo_screen.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Todos",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todos) => ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(todos[index].message),
                subtitle: Text(todos[index].createdAt.toString()),
                trailing: InkWell(
                    onTap: () {
                      context.read<TodoCubit>().deleteTodo(index);
                    },
                    child: const Icon(Icons.delete)),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const AddTodoScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
