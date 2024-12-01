import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/my_page.dart';
import 'package:flutter_chat/post.dart';
import 'package:intl/intl.dart';

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

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              post.posterImageUrl,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      post.posterName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      DateFormat('MM/dd HH:mm').format(post.createdAt.toDate()),
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color:
                            FirebaseAuth.instance.currentUser == post.posterName
                                ? Colors.amber[100]
                                : Colors.blue[100],
                      ),
                      child: Text(
                        post.text,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    if (FirebaseAuth.instance.currentUser!.uid == post.posterId)
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: TextFormField(
                                          initialValue: post.text,
                                          autofocus: true,
                                          onFieldSubmitted: (newText) {
                                            post.reference.update({
                                              'text': newText,
                                            });
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      );
                                    });
                              },
                              icon: const Icon(Icons.edit)),
                          IconButton(
                            onPressed: () {
                              post.reference.delete();
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
