import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:job_portal/util/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final Rx<User?> _user = Rx<User?>(null);
  User? get user => _user.value;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    ever(_user, _initialScreen);
  }

  void _initialScreen(User? user) async {
    if (user == null) {
      Get.offAndToNamed(AppRoutes.logInScreen);
    } else {
      await _storeUserCredentials(user);
      Get.offAndToNamed(AppRoutes.homeScreen);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential = await _auth.signInWithCredential(credential);
        User? user = userCredential.user;

        if (user != null) {
          await _storeUserCredentials(user);
          Get.offAndToNamed(AppRoutes.homeScreen);
        }
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      await _clearUserCredentials();
      Get.offAndToNamed(AppRoutes.logInScreen);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> _storeUserCredentials(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('uid', user.uid);
    await prefs.setString('displayName', user.displayName ?? '');
    await prefs.setString('email', user.email ?? '');
    await prefs.setString('photoURL', user.photoURL ?? '');
    await prefs.setString('isLogged', 'false');
  }

  Future<void> _clearUserCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('uid');
    await prefs.remove('displayName');
    await prefs.remove('email');
    await prefs.remove('photoURL');
    await prefs.setString('isLogged', 'true');
  }
}
