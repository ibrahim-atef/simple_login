import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:simple_login/view/screens/auth_screen/login_screen.dart';
import 'package:simple_login/view/screens/main_screen.dart';
import 'package:simple_login/view/screens/main_screen.dart';
import 'package:simple_login/view/screens/main_screen.dart';

import '../../constants.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;

  ////////////////////////////////////////////////
  final GetStorage authBox = GetStorage();

  var uid;

  bool isVisibilty = false;

///////////////////passwordVisibilty///////////////////////
  void visibility() {
    isVisibilty = !isVisibilty;
    update();
  }
//////////////////////////////////////////////////////////////////////signup with firebase///////////////////////////

  void signUpUsingFirebase({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    try {
      isLoading.value = true;
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await authBox.write(KUid, value.user!.uid);
        uid = value.user!.uid;
        update();

        auth.currentUser!.updateDisplayName(name);
        ///here to store user name and  in some local storage
        await authBox.write(KName, value.user!.displayName);

        Get.off(() => MainScreen());

        update();
      });
    } on FirebaseAuthException catch (error) {
      isLoading.value = false;
      update();

      String title = error.code.toString().replaceAll(RegExp('-'), ' ');
      String message = "";
      if (error.code == 'weak-password') {
        message = "password is too weak.";
        title = error.code.toString();

        print('The password provided is too weak.');
      } else if (error.code == 'email-already-in-use') {
        message = "account already exists ";

        print('The account already exists for that email.');
      } else {
        message = error.message.toString();
      }

      Get.defaultDialog(
          title: title,
          middleText: message,
          textCancel: "Ok",
          buttonColor: mainColor2,
          cancelTextColor: mainColor,
          backgroundColor: white);
    } catch (error) {
      Get.snackbar(
        "Error",
        "$error",
        snackPosition: SnackPosition.TOP,
      );
      print(error);
    }
  }

//////////////////////////////////////////////////////////////////////login with firebase///////////////////////////

  void loginUsingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      update();
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        authBox.write(KUid, value.user!.uid.toString());
        ///here to store user name and  in some local storage
        await authBox.write(KName, value.user!.displayName);

        Get.off(() => MainScreen());
        isLoading.value = false;

        update();
      });
      update();

//      displayUserId.value = await GetStorage().read("uid");

      update();
    } on FirebaseAuthException catch (error) {
      isLoading.value = false;
      update();
      String title = error.code.toString().replaceAll(RegExp('-'), ' ');
      String message = "";
      if (error.code == 'user-not-found') {
        message =
            "Account does not exists for that $email.. Create your account by signing up..";
      } else if (error.code == 'wrong-password') {
        message = "Invalid Password... PLease try again!";
      } else {
        message = error.message.toString();
      }
      Get.defaultDialog(
          title: title,
          middleText: message,
          textCancel: "Ok",
          buttonColor: mainColor2,
          cancelTextColor: mainColor,
          backgroundColor: white);
    } catch (error) {
      isLoading.value = false;
      Get.defaultDialog(
          title: "error",
          middleText: "$error",
          textCancel: "Ok",
          buttonColor: mainColor2,
          cancelTextColor: mainColor,
          backgroundColor: white);
      print(error);
    }
  }

  ////////////////////////////////signOut//////////////////////////////////////
  void signOutFromApp() async {
    try {
      await auth.signOut();

      authBox.remove("auth");
      authBox.erase();

      update();
      Get.offAll(() => LoginScreen());
    } catch (error) {
      Get.defaultDialog(
          title: "Error",
          middleText: "$error",
          textCancel: "Ok",
          buttonColor: Colors.grey,
          cancelTextColor: Colors.black,
          backgroundColor: Colors.grey.shade200);
    }
  }
}
