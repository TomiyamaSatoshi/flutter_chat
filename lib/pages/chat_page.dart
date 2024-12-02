import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/pages/my_page.dart';
import 'package:flutter_chat/models/post.dart';
import 'package:flutter_chat/widgets/common_drawer.dart';
import 'package:flutter_chat/widgets/post_widget.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Future<void> sendPost(String text) async {
    final user = FirebaseAuth.instance.currentUser!;

    final posterId = user.uid;
    final posterName = user.displayName!;
    final posterImageUrl = user.photoURL!;

    final newDocumentReference = postsReference.doc();

    final newPost = Post(
      text: text,
      createdAt: Timestamp.now(),
      posterName: posterName,
      posterImageUrl: posterImageUrl,
      posterId: posterId,
      reference: newDocumentReference,
    );

    newDocumentReference.set(newPost);
  }

  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        // キーボードを閉じたい時はこれを呼びます。
        primaryFocus?.unfocus(),
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('チャット'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const MyPage();
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.home,
                size: 32,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot<Post>>(
                stream: postsReference.orderBy('createdAt').snapshots(),
                builder: (context, snapshot) {
                  final docs = snapshot.data?.docs ?? [];
                  return ListView.builder(
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        final post = docs[index].data();
                        return PostWidget(post: post);
                      });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                // コントローラ
                controller: controller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.amber),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.amber,
                      width: 2,
                    ),
                  ),
                  fillColor: Colors.amber[50],
                  filled: true,
                  hintText: '投稿を入力',
                  prefixIcon: const Icon(
                    Icons.search,
                  ),
                  border: const OutlineInputBorder(),
                ),
                onFieldSubmitted: (text) {
                  sendPost(text);
                  controller.clear();
                },
              ),
            ),
          ],
        ),
        drawer: const CommonDrawer(),
      ),
    );
  }

  final postsReference =
      FirebaseFirestore.instance.collection('posts').withConverter<Post>(
    fromFirestore: ((snapshot, _) {
      return Post.fromFirestore(snapshot);
    }),
    toFirestore: ((value, _) {
      return value.toMap();
    }),
  );
}
