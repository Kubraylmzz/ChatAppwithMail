import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_provider_base.dart';

class AndroidAuthProvider implements AuthProviderBase {
  @override
  Future<FirebaseApp> initialize() async {
    return await Firebase.initializeApp(
      name: 'The Chat Crew',
      options: const FirebaseOptions(
          apiKey: "AIzaSyCgFrok_c2bEE6HgHl6mqOK28gD2Kjpk80",
          authDomain: "the-chat-crew-3ba8d.firebaseapp.com",
          databaseURL: "https://the-chat-crew-3ba8d.firebaseio.com",
          projectId: "the-chat-crew-3ba8d",
          storageBucket: "the-chat-crew-3ba8d.appspot.com",
          messagingSenderId: "930300433010",
          appId: "1:1069277730537:android:b349ed7b5f0b4947638278"),
    );
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

class AuthProvider extends AndroidAuthProvider {}
