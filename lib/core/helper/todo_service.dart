import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/task_model.dart';


class TodoService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<TaskModel>> getTodos() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((todo) => TaskModel.fromJson(todo))
          .toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }

  
}

