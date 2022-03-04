import 'package:ecommerce_app/core/services/firestore_user.dart';
import 'package:ecommerce_app/model/user_moudle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();

  String email, password, name;
  Rxn<User> _user = Rxn<User>();

  String get user => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_firebaseAuth.authStateChanges());
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    print('alaa');
    print(googleUser.email);
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;

    final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);
    await _firebaseAuth.signInWithCredential(authCredential).then((user) {
      saveUse(user);
     // Get.offAll(()=>ControlView());
    });
  }

  void facebookSignInMethod() async {
    FacebookLoginResult facebookLoginResult =
        await _facebookLogin.logIn(['email']);
    final accessToken = facebookLoginResult.accessToken.token;
    if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
      final faceCredential = FacebookAuthProvider.credential(accessToken);
      await _firebaseAuth.signInWithCredential(faceCredential).then((user) {
        saveUse(user);
       //] Get.offAll(()=>ControlView());
      });
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      print(email);
      print(password);
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email.toString().trim(), password: password.toString().trim());
      //Get.offAll(()=>ControlView());
    } catch (error) {
      print(error);
      Get.snackbar(
        'Error login account',
        error,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createUserWithEmailAndPassword() async {
    try {
      print(email);
      print(password);
      await _firebaseAuth
          .createUserWithEmailAndPassword(
              email: email.toString().trim(),
              password: password.toString().trim())
          .then((user) async {
            print(user);
        saveUse(user);
      });

     // Get.offAll(()=>ControlView());
    } catch (error) {
    //  print(error);
      Get.snackbar(
        'Error SignUp account',
        error,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUse(UserCredential user) async {
    await FirestoreUser().addUserToFirestore(UserModel(
      userId: user.user.uid,
      email: user.user.email,
      name: name == null ? user.user.displayName : name,
      pic: '',
    ));
  }
}
