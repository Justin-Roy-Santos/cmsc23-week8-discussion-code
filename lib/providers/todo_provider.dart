/*
  Created by: Claizel Coubeili Cepe
  Date: updated April 26, 2023
  Description: Sample todo app with Firebase 
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/todo_model.dart';
import 'package:week7_networking_discussion/api/firebase_todo_api.dart';

class TodoListProvider with ChangeNotifier {
  FirebaseTodoAPI firebaseService = FirebaseTodoAPI();

  // fetch data from the firestore
  late Stream<QuerySnapshot> _todoStream;

  // get all todos pag initialization
  TodoListProvider() {
    fetchTodos();
  }

  // getter
  Stream<QuerySnapshot> get todo => _todoStream;

  // get data from the firestore
  // methods for fetching
  void fetchTodos() {
    _todoStream = firebaseService.getAllTodos();
    notifyListeners();
  }

  void addTodo(Todo item) async {
    // _todoList.add(item);
    String message = await firebaseService.addTodo(item.toJson(item));
    print(message);
    notifyListeners();
  }

  void editTodo(int index, String newTitle) {
    // _todoList[index].title = newTitle;
    notifyListeners();
  }

  void deleteTodo(String title) {
    // for (int i = 0; i < _todoList.length; i++) {
    //   if (_todoList[i].title == title) {
    //     _todoList.remove(_todoList[i]);
    //   }
    // }
    notifyListeners();
  }

  void toggleStatus(int index, bool status) {
    // _todoList[index].completed = status;
    notifyListeners();
  }
}
