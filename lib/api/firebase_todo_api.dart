import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseTodoAPI {
  // create instance of firestore
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  // function for adding item to the
  Future<String> addTodo(Map<String, dynamic> todo) async {
    try {
      await db.collection("todos").add(todo);

      return "Added successfully!";
    } on FirebaseException catch (e) {
      // print error if there are any
      return "Error at ${e.code}: ${e.message}";
    }
  }

  Stream<QuerySnapshot> getAllTodos() {
    // get all snapshots of the todos collection in the firestore database
    return db.collection("todos").snapshots();
  }

  Future<String> deleteTodo(String id) async {
    // need kunin yung ID if need mag delete
    try {
      await db.collection("todos").doc(id).delete();

      return "Added successfully!";
    } on FirebaseException catch (e) {
      // print error if there are any
      return "Error at ${e.code}: ${e.message}";
    }
  }
}
