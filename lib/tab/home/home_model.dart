import 'package:firebase_auth/firebase_auth.dart';

class HomeModal {
  String getEmail() {
    return FirebaseAuth.instance.currentUser?.email ?? '메일 없음';
  }

  String getNickName() {
    return FirebaseAuth.instance.currentUser?.displayName ?? '이름 없음';
  }

  String getProfileImageUrl() {
    return FirebaseAuth.instance.currentUser?.photoURL ??
        'https://cdn.sisamagazine.co.kr/news/photo/202112/420043_422171_2028.jpg';
  }
}
