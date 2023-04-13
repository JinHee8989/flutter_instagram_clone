import 'package:firebase_auth/firebase_auth.dart';

class AccountModel {
  void logout() async {
    await FirebaseAuth.instance.signOut();
  }

  String getNickName() {
    return FirebaseAuth.instance.currentUser?.displayName ?? '이름 없음';
  }

  String getProfileImageUrl() {
    return FirebaseAuth.instance.currentUser?.photoURL ??
        'https://cdn.sisamagazine.co.kr/news/photo/202112/420043_422171_2028.jpg';
  }
}
