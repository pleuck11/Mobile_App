import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todo_getx/views/home_view.dart';
import 'package:todo_getx/views/login_view.dart';

class AuthController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  var user = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    user.bindStream(firebaseAuth.authStateChanges());
  }

  Future<void> register(String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("Succeed", "Membership registration completed");
    } catch (e) {
      Get.snackbar("fail", e.toString());
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("Succeed", "Login successful");
      Get.off(HomeView());
    } catch (e) {
      Get.snackbar("fail", e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
      Get.snackbar("Succeed", "Successfully logged out");
      // Get.off(LoginView());
    } catch (e) {
      Get.snackbar("fail", e.toString());
    }
  }

}
