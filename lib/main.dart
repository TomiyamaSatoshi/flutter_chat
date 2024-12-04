import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/pages/chat_page.dart';
import 'package:flutter_chat/firebase_options.dart';
import 'package:flutter_chat/pages/sign_in.dart';
import 'package:flutter_chat/router.dart';
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
    return MaterialApp.router(
      routerDelegate: go_router.routerDelegate,
      routeInformationParser: go_router.routeInformationParser,
      routeInformationProvider: go_router.routeInformationProvider,
      title: 'Flutter Practice',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
    );
  }
}
