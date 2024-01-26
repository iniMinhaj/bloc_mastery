import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/model/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  addTodo(Todo todo) {
    state.add(todo);
    emit([...state]);
  }

  deleteTodo(int index) {
    state.removeAt(index);
    emit([...state]);
  }
}
