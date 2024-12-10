import 'package:flutter/material.dart';
import 'package:flutter_chat/pages/chat_page.dart';
import 'package:flutter_chat/pages/freezed_json_practice.dart';
import 'package:flutter_chat/pages/my_page.dart';
import 'package:flutter_chat/pages/riverpod_practice.dart';
import 'package:flutter_chat/pages/sign_in.dart';
import 'package:go_router/go_router.dart';

final go_router = GoRouter(
  // アプリが起動した時
  initialLocation: '/sign-in',
  // パスと画面の組み合わせ
  routes: [
    GoRoute(
        path: '/sign-in',
        name: 'SignIn',
        pageBuilder: (context, state) {
          return MaterialPage(key: state.pageKey, child: const SignInPage());
        }),
    GoRoute(
        path: '/chat',
        name: 'Chat',
        pageBuilder: (context, state) {
          return MaterialPage(key: state.pageKey, child: const ChatPage());
        }),
    GoRoute(
        path: '/my-page',
        name: 'MyPage',
        pageBuilder: (context, state) {
          return MaterialPage(key: state.pageKey, child: const MyPage());
        }),
    GoRoute(
        path: '/riverpod-practice',
        name: 'RiverpodPractice',
        pageBuilder: (context, state) {
          return MaterialPage(
              key: state.pageKey, child: const RiverpodPractice());
        }),
    GoRoute(
        path: '/freezed-json-practice',
        name: 'FreezedJsonPractice',
        pageBuilder: (context, state) {
          return MaterialPage(
              key: state.pageKey, child: const FreezedJsonPractice());
        })
  ],
  // 遷移ページがないなどのエラーが発生した時に、このページに行く
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: Scaffold(
      body: Center(
        child: Text(state.error.toString()),
      ),
    ),
  ),
);
