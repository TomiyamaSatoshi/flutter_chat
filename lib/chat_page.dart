import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/post.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('チャット'),
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
                      return Text(post.text);
                    });
              },
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: '入力してください',
              prefixIcon: Icon(
                Icons.search,
              ),
              border: OutlineInputBorder(),
            ),
            onFieldSubmitted: (text) {
              print('入力を送信');

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
            },
          ),
        ],
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
