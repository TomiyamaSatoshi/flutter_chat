import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  // 投稿文
  final String text;
  // 投稿日時
  final Timestamp createdAt;
  // 投稿者名
  final String posterName;
  // 投稿者アイコンURL
  final String posterImageUrl;
  // 投稿者ユーザID
  final String posterId;
  // Firestore Reference path情報
  final DocumentReference reference;

  Post({
    required this.text,
    required this.createdAt,
    required this.posterName,
    required this.posterImageUrl,
    required this.posterId,
    required this.reference,
  });

  factory Post.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final map = snapshot.data()!;

    return Post(
      text: map['text'],
      createdAt: map['createdAt'],
      posterName: map['posterName'],
      posterImageUrl: map['posterImageUrl'],
      posterId: map['posterId'],
      reference: snapshot.reference,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'createdAt': createdAt,
      'posterName': posterName,
      'posterImageUrl': posterImageUrl,
      'posterId': posterId,
    };
  }
}
