import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_login/controller/controllers/auth_controller.dart';
import 'package:simple_login/view/screens/auth_screen/sign_up_screen.dart';

import '../../../constants.dart';
import '../../widget/auth_widgets/auth_button.dart';
import '../../widget/auth_widgets/auth_text_from_field.dart';
import '../../widget/text_utils.dart';

class LoginScreen extends StatelessWidget {
  final form = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBackGroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),



              SizedBox(
                height: Get.height * .1,
              ),
              // نص ال login
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Form(
                  key: form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KTextUtils(
                        text: "Login",
                        size: 30,
                        color: black,
                        fontWeight: FontWeight.bold,
                        textDecoration: TextDecoration.none,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GetBuilder<AuthController>(
                        builder: (_) {
                          return AuthTextFromField(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: black,
                            ),
                            suffixIcon: Text(""),
                            controller: emailController,
                            obscureText: false,
                            validator: (value) {
                              if (!RegExp(validationEmail).hasMatch(value)) {
                                return "Invalid Email";
                              } else {
                                return null;
                              }
                            },
                            hintText: 'Email',
                            textInputType: TextInputType.text,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GetBuilder<AuthController>(
                        builder: (_) {
                          return AuthTextFromField(
                            prefixIcon: Icon(
                              Icons.lock_outline_rounded,
                              color: black,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.visibility();
                              },
                              icon: controller.isVisibilty
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              color: black,
                            ),
                            controller: passwordController,
                            obscureText: controller.isVisibilty ? false : true,
                            validator: (value) {
                              if (value.toString().length < 6) {
                                return "Password is too short";
                              } else {
                                return null;
                              }
                            },
                            hintText: 'Password',
                            textInputType: TextInputType.visiblePassword,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          TextButton(
                              onPressed: () {
                              },
                              child: KTextUtils(
                                text: "Forget Password",
                                size: Get.width * .03,
                                color: black,
                                fontWeight: FontWeight.w400,
                                textDecoration: TextDecoration.underline,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: Get.height * .05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GetBuilder<AuthController>(builder: (_) {
                    return AuthButton(
                        onPressed: () {

                            if (form.currentState!.validate()) {
                              String email = emailController.text.trim();
                              String password = passwordController.text;
                              FocusScope.of(context).unfocus();
                              controller.loginUsingFirebase(
                                  email: email, password: password);
                            }

                        },
                        text: controller.isLoading == false
                            ? Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        )
                            : SizedBox(
                            width: Get.width * .07,
                            height: Get.width * .07,
                            child: CircularProgressIndicator(
                              color: mainColor,
                            )),
                        width: MediaQuery.of(context).size.width / 1.3);
                  }),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              // نص sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KTextUtils(
                    text: "Don’t have an account?",
                    size: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    textDecoration: TextDecoration.none,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(()=>SignUpScreen());
                      },
                      child: KTextUtils(
                        text: "SignUp",
                        size: 18,
                        color: black,
                        fontWeight: FontWeight.w400,
                        textDecoration: TextDecoration.underline,
                      ))
                ],
              ),



            ],
          ),
        ),
      ),
    );
  }
}
