import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/pages/sign_in.dart';
import 'package:flutter_chat/widgets/common_drawer.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('マイページ'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            // ユーザアイコン画像
            CircleAvatar(
              backgroundImage: NetworkImage(user.photoURL!),
              radius: 40,
            ),
            const SizedBox(
              height: 10,
            ),
            // ユーザ名
            Text(
              user.displayName!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            // 部分的に左寄せ
            Align(
              alignment: Alignment.centerLeft,
              // ユーザID
              child: Text('ユーザID:${user.uid}'),
            ),
            Align(
              alignment: Alignment.centerLeft,
              // 登録日
              child: Text('登録日:${user.metadata.creationTime}'),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () async {
                  // Googleからサインアウト
                  await GoogleSignIn().signOut();
                  // Firebaseからサインアウト
                  await FirebaseAuth.instance.signOut();
                  // SignInページに遷移
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return const SignInPage();
                  }), (route) => false);
                },
                child: const Text('サインアウト'))
          ],
        ),
      ),
      drawer: const CommonDrawer(),
    );
  }
}
