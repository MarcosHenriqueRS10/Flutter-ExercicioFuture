import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: FutureBuilder(
          future: mensagemBoasVindas(),
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
          }
          if (asyncSnapshot.connectionState == ConnectionState.done){
            if(asyncSnapshot.hasError){
              return Center(child: Text("Ocorreu um erro"));
            }
            return Center(child: Text("Hello World"));
          }
            return Container();
          },
        ),
      ),
    );
  }
}

Future<String> mensagemBoasVindas() async {
  await Future.delayed(Duration(seconds: 5));
  // throw Exception();
  return "Hello World";
}