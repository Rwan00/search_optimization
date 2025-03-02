import 'package:flutter/material.dart';

import '../widget/task_listview.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search todos...',
            border: InputBorder.none,
          ),
          onChanged: (value) {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {},
          ),
        ],
      ),
      body: TasksListView(),
    );
  }
}
