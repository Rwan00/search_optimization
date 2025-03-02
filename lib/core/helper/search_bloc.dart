import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../model/task_model.dart';
import 'todo_service.dart';

abstract class SearchEvent {}

class QueryChanged extends SearchEvent {
  final String query;
  QueryChanged(this.query);
}


abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<TaskModel> results;
  SearchLoaded(this.results);
}

class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final TodoService todoService;

  SearchBloc(this.todoService) : super(SearchInitial()) {
    on<QueryChanged>(
      _onQueryChanged,
      transformer: (events, mapper) =>
          events.debounceTime(const Duration(milliseconds: 500)).switchMap(mapper),
    );
  }

  Future<void> _onQueryChanged(QueryChanged event, Emitter<SearchState> emit) async {
    if (event.query.isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());

    try {
      final todos = await todoService.getTodos();
      final filteredTodos = todos
          .where((todo) =>
              todo.title.toLowerCase().contains(event.query.toLowerCase()))
          .toList();

      emit(SearchLoaded(filteredTodos));
    } catch (e) {
      emit(SearchError("Error fetching todos"));
    }
  }
}