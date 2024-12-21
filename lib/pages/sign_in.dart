import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/widgets/common_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  Future<void> signInWithGoogle() async {
    // GoogleSignIn をして得られた情報を Firebase と関連づけることをやっています。
    final googleUser = await GoogleSignIn(
      scopes: ['profile', 'email'],
    ).signIn();

    final googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GoogleSignIn'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              await signInWithGoogle();

              // ログインが成功したらChatPageに遷移する
              if (!mounted) return;
              context.push('/chat');
            },
            child: const Text('GoogleSignIn')),
      ),
      drawer: const CommonDrawer(),
    );
  }
}
