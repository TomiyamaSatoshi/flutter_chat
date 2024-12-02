import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/pages/chat_page.dart';
import 'package:flutter_chat/firebase_options.dart';
import 'package:flutter_chat/pages/sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  // runApp 前に何かを実行したいときはこれが必要です。
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) {
      return MaterialApp(
        theme: ThemeData(),
        home: const SignInPage(),
      );
    } else {
      return MaterialApp(
        theme: ThemeData(),
        home: const ChatPage(),
      );
    }
  }
}
