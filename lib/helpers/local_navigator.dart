// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class Task {
//   final int id;
//   final String title;
//   bool isCompleted;
//
//   Task({
//     required this.id,
//     required this.title,
//     this.isCompleted = false,
//   });
//
//   factory Task.fromJson(Map<String, dynamic> json) {
//     return Task(
//       id: json['id'],
//       title: json['title'],
//       isCompleted: json['isCompleted'],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'title': title,
//     'isCompleted': isCompleted,
//   };
// }
//
// class TaskListScreen extends StatefulWidget {
//   @override
//   _TaskListScreenState createState() => _TaskListScreenState();
// }
//
// class _TaskListScreenState extends State<TaskListScreen> {
//   List<Task> tasks = [];
//   TextEditingController taskTitleController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     fetchTasks();
//   }
//
//   Future<void> fetchTasks() async {
//     final response = await http.get(Uri.parse('https://your-api-endpoint/tasks'));
//     if (response.statusCode == 200) {
//       final List<dynamic> tasksJson = json.decode(response.body);
//       setState(() {
//         tasks = tasksJson.map((taskJson) => Task.fromJson(taskJson)).toList();
//       });
//     } else {
//       // Handle error
//       print('Failed to fetch tasks. Status code: ${response.statusCode}');
//     }
//   }
//
//   Future<void> createTask(String title) async {
//     final response = await http.post(
//       Uri.parse('https://your-api-endpoint/tasks'),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode({'title': title}),
//     );
//     if (response.statusCode == 201) {
//       final dynamic taskJson = json.decode(response.body);
//       setState(() {
//         tasks.add(Task.fromJson(taskJson));
//       });
//     } else {
//       // Handle error
//       print('Failed to create task. Status code: ${response.statusCode}');
//     }
//   }
//
//   Future<void> updateTaskCompletion(Task task, bool isCompleted) async {
//     final response = await http.put(
//       Uri.parse('https://your-api-endpoint/tasks/${task.id}'),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode({'isCompleted': isCompleted}),
//     );
//     if (response.statusCode == 200) {
//       setState(() {
//         task.isCompleted = isCompleted;
//       });
//     } else {
//       // Handle error
//       print('Failed to update task. Status code: ${response.statusCode}');
//     }
//   }
//
//   Future<void> deleteTask(Task task) async {
//     final response = await http.delete(
//       Uri.parse('https://your-api-endpoint/tasks/${task.id}'),
//     );
//     if (response.statusCode == 204) {
//       setState(() {
//         tasks.remove(task);
//       });
//     } else {
//       // Handle error
//       print('Failed to delete task. Status code: ${response.statusCode}');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Task List'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: taskTitleController,
//               decoration: InputDecoration(
//                 labelText: 'Task Title',
//               ),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               createTask(taskTitleController.text);
//             },
//             child: Text('Add Task'),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: tasks.length,
//               itemBuilder: (context, index) {
//                 Task task = tasks[index];
//                 return ListTile(
//                   title: Text(task.title),
//                   trailing: Checkbox(
//                     value: task.isCompleted,
//                     onChanged: (value) {
//                       updateTaskCompletion(task, value!);
//                     },
//                   ),
//                   onLongPress: () {
//                     deleteTask(task);
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: TaskListScreen(),
//   ));
// }