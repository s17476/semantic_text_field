import 'package:flutter/material.dart';
import 'package:semantic_text_field/semantic_text_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Semantic text field'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('BadTextField'),
              SizedBox(height: 16),
              TextField(
                decoration:
                    InputDecoration(hintText: 'This is a bad text field'),
              ),
              SizedBox(height: 32),
              Text('SemanticTextField'),
              SizedBox(height: 16),
              SemanticTextField(
                decoration: InputDecoration(hintText: 'Semantic text field'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
