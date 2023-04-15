import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../domain/post.dart';

class CreateModel {
  final _picker = ImagePicker();
  Future<File?> getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      return null;
    }
    return File(image.path);
  }

  Future<void> uploadPost(String title, File imageFile) async {
    // 이미지 업로드
    final storageRef = FirebaseStorage.instance.ref();
    final imageRef = storageRef
        .child('postImages/${DateTime.now().millisecondsSinceEpoch}.png');
    await imageRef.putFile(imageFile);

    // 이미지 url을 얻고
    final downloadUrl = await imageRef.getDownloadURL();

    // 게시물 업로드
    final postsRef =
        FirebaseFirestore.instance.collection('posts').withConverter<Post>(
              fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
              toFirestore: (post, _) => post.toJson(),
            );

    // final newPostRef = FirebaseFirestore.instance.collection('posts').doc();
    final newPostRef = postsRef.doc(); //사전에 문서 id를 얻기위해 선언

    newPostRef.set(Post(
        id: newPostRef.id,
        userId: FirebaseAuth.instance.currentUser?.uid ?? '',
        title: title,
        imageUrl: downloadUrl
        // 'https://cdn.sisamagazine.co.kr/news/photo/202112/420043_422171_2028.jpg',
        ));
  }
}
