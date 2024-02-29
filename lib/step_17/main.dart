// ignore_for_file: public_member_api_docs

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_riverpod/firebase_options.dart';
import 'package:study_riverpod/step_17/controller/auth_controller.dart';
import 'package:study_riverpod/step_17/view/home_page.dart';
import 'package:study_riverpod/step_17/view/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebaseの初期化
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(authControllerProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: user != null ? const HomePage() : const LoginPage(),
    );
  }
}
