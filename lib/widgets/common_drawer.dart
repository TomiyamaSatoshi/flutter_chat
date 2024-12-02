import 'package:flutter/material.dart';
import 'package:flutter_chat/pages/chat_page.dart';
import 'package:flutter_chat/pages/my_page.dart';
import 'package:flutter_chat/pages/riverpod_practice.dart';
import 'package:flutter_chat/pages/sign_in.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text('SignIn'),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                builder: (context) {
                  return const SignInPage();
                },
              ), (route) => false);
            },
          ),
          ListTile(
            title: const Text('Chat'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const ChatPage();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: const Text('My Page'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const MyPage();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Riverpod Practice'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return RiverpodPractice();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
