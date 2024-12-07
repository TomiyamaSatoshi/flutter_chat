import 'package:flutter/material.dart';
import 'package:flutter_chat/pages/chat_page.dart';
import 'package:flutter_chat/pages/my_page.dart';
import 'package:flutter_chat/pages/riverpod_practice.dart';
import 'package:flutter_chat/pages/sign_in.dart';
import 'package:flutter_chat/router.dart';
import 'package:go_router/go_router.dart';

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
              context.push('/sign-in');
            },
          ),
          ListTile(
            title: const Text('Chat'),
            onTap: () {
              context.push('/chat');
            },
          ),
          ListTile(
            title: const Text('My Page'),
            onTap: () {
              context.push('/my-page');
            },
          ),
          ListTile(
            title: const Text('Riverpod Practice'),
            onTap: () {
              context.push('/riverpod-practice');
            },
          ),
        ],
      ),
    );
  }
}
