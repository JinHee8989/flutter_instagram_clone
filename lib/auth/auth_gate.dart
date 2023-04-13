import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:instagram_clone_renew/tab/tab_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // User is not signed in
        if (!snapshot.hasData) {
          //로그인이 안됐을 경우
          return const SignInScreen(providerConfigs: [
            EmailProviderConfiguration(),
          ]);
        }

        // Render your application if authenticated
        // 로그인이 됐을 경우
        return const TabPage();
      },
    );
  }
}
