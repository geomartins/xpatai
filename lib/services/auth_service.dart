import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:xpatai/modules/auth/screens/login.dart';
import 'package:xpatai/modules/dashboard/screens/dashboard.dart';

import '../modules/dashboard/controllers/profile_controller.dart';

class AuthService {
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            Get.put<ProfileController>(ProfileController())
                .updateDisplayNameAndEmail(snapshot.data?.displayName ?? '',
                    snapshot.data?.email ?? '');
            return Dashboard();
          } else {
            return Login();
          }
        });
  }

  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() async {
    FirebaseAuth.instance.signOut();
    await FirebaseAuth.instance.signOut();
    Get.offNamed(Login.id);
  }

  Future<void> updateDisplayNameAndEmail(
      {required String name, required String email}) async {
    await FirebaseAuth.instance.currentUser!.updateEmail(email);
    await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
  }
}
