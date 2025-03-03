import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/helper/search_bloc.dart';
import '../core/helper/todo_service.dart';


class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchBloc = SearchBloc(TodoService());
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search todos...',
            border: InputBorder.none,
          ),
          onChanged: (query) {
            searchBloc.add(QueryChanged(query));
          },
        ),
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
          bloc: searchBloc,
          builder: (context, state) {
            if (state is SearchInitial) {
              return Center(child: Text("Start typing..."));
            } else if (state is SearchLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is SearchLoaded) {
              return ListView.builder(
                itemCount: state.results.length,
                itemBuilder: (context, index) {
                  final todo = state.results[index];
                  return ListTile(
                    title: Text(todo.title),
                    leading: Icon(todo.completed
                        ? Icons.check_circle
                        : Icons.circle_outlined),
                  );
                },
              );
            } else if (state is SearchError) {
              return Center(child: Text(state.message));
            }
            return SizedBox();
          },
        ),
    );
  }
}
