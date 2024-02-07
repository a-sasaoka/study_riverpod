// ignore_for_file: public_member_api_docs, missing_provider_scope

import 'package:flutter/material.dart';
import 'package:study_riverpod/freezed/user.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late User _user;

  @override
  void initState() {
    super.initState();

    const user1 = User('妻', email: 'a@sample.com');
    const user2 = User('子', email: 'a@sample.com');
    const user3 = User('父', email: 'a@sample.com', isDelete: true);

    const userList = [user1, user2, user3];

    _user = const User('世帯主', email: 'a@sample.com', family: userList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text(_user.userName),
            const SizedBox(
              height: 16,
            ),
            Text(_user.email),
            const SizedBox(
              height: 16,
            ),
            Text(_user.greetWithName()),
            const SizedBox(
              height: 16,
            ),
            Text(_user.toString()),
            const SizedBox(
              height: 16,
            ),
            Text(_user.toJson().toString()),
            const SizedBox(
              height: 16,
            ),
            Text(_user.activeFamily.toString()),
          ],
        ),
      ),
    );
  }
}
