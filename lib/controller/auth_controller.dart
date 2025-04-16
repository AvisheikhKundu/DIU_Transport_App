import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  Future<void> register({
    required String email,
    required String password,
    required String userName,
    required String userNid,
    required String userAddress,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    // Create user
    final userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    print('Sign Up Successfull');

    // Save user data to Firestore
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user!.uid)
        .set({
          'full-name': userName,
          'email': email,
          'nid': userNid,
          'address': userAddress,
        });

  }

  Future<void> login({required String email, required String password}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }
}
