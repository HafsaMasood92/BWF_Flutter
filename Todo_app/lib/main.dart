import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String input = "";

  createTodos() {
    DocumentReference documentReference = FirebaseFirestore.instance.collection("MyTodos").doc(input);

    // Map
    Map<String, String> todos = {
      "todoTitle": input
    };
    documentReference.set(todos).whenComplete(() {
      print("$input created");
    });
  }

  deleteTodos(item) {
    DocumentReference documentReference = FirebaseFirestore.instance.collection("MyTodos").doc(item);

    documentReference.delete().whenComplete(() {
      print("$item deleted");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("myTodos"),
            backgroundColor: Colors.red
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)
                        ),
                        title: Text("Add TodoList"),
                        content: TextField(onChanged: (String value) {
                          input = value;
                        }),
                        actions: <Widget>[
                          TextButton(onPressed: () {
                            createTodos();
                            Navigator.of(context).pop(); // closes the dialog
                          }, child: Text("Add"))
                        ]
                    );
                  });
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            )
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("MyTodos").snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
              if (!snapshots.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshots.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot documentSnapshot = snapshots.data!.docs[index];
                    return Dismissible(
                        onDismissed: (direction) {
                          deleteTodos(documentSnapshot["todoTitle"]);
                        },
                        key: Key(documentSnapshot["todoTitle"]),
                        child: Card(
                          elevation: 4,
                          margin: EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)
                          ),
                          child: ListTile(
                            title: Text(documentSnapshot["todoTitle"]),
                            trailing: IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    deleteTodos(documentSnapshot["todoTitle"]);
                                  });
                                }
                            ),
                          ),
                        )
                    );
                  }
              );
            }
            ),
        );
    }
}
