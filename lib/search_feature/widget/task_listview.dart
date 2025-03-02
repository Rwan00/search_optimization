import 'package:flutter/material.dart';


class TasksListView extends StatelessWidget {
 
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount:
             10,
          itemBuilder: (context, index) {
            
            return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Card(
        color: const Color.fromARGB(255, 232, 244, 252),
        child: Row(
          children: [
            Checkbox(
              value: todo.completed,
              onChanged: onChanged,
            ),
            SizedBox(
              width: 170,
              child: Text(todo.title),
            ),
            Spacer(),
            Column(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.delete,
                  ),
                  onPressed: delete,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.edit,
                  ),
                  onPressed: () => showEditTodoDialog(context, todo),
                ),
              ],
            ),
          ],
        ),
      ),
    );
          },
        );
  }
}
