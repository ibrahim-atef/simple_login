import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../controller/controllers/auth_controller.dart';
import '../../widget/auth_widgets/auth_button.dart';
import '../../widget/auth_widgets/auth_text_from_field.dart';
import '../../widget/text_utils.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: homeBackGroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * .2,
            ),


            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.symmetric(horizontal: Get.width * .1),
              child: Row(
                children: [
IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios,color: Colors.black,size: 30,),),
                  KTextUtils(
                    text: "Sign Up",
                    size: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    textDecoration: TextDecoration.none,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Get.width * .1),
              child: Divider(
                color: Color(0xff4b455d),
                height: 10,
                thickness: 1,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // full name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    GetBuilder<AuthController>(
                      builder: (_) {
                        return AuthTextFromField(
                          prefixIcon: Icon(
                            Icons.account_circle_outlined,
                            color: black,
                          ),
                          suffixIcon: Text(""),
                          controller: nameController,
                          obscureText: false,
                          validator: (value) {
                            if (value.length == 0) {
                              return 'Please enter name';
                            } else if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return "Enter valid name";
                            } else {
                              return null;
                            }
                          },
                          hintText: "Full Name",
                          textInputType: TextInputType.name,
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    //Phone number
                    GetBuilder<AuthController>(
                      builder: (_) {
                        return AuthTextFromField(
                          prefixIcon: Icon(
                            Icons.phone_android,
                            color: black,
                          ),
                          suffixIcon: Text(""),
                          controller: phoneController,
                          obscureText: false,
                          validator: (value) {
                            if (value.length == 0) {
                              return 'Please enter mobile number';
                            }
                            else if (value.toString().length <= 10 ||
                                !RegExp(validationPhone).hasMatch(value)) {
                              return "Enter valid mobile number";
                            }
                            else if (!RegExp(validationPhone)
                                .hasMatch(value)) {
                              return 'Please enter valid mobile number';
                            }
                            return null;
                          },
                          hintText: 'Phone number',
                          textInputType: TextInputType.phone,
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //Email address
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
                            if (value.length == 0) {
                              return 'Please enter email';
                            } else if (!RegExp(validationEmail)
                                .hasMatch(value)) {
                              return "Invalid Email";
                            } else {
                              return null;
                            }
                          },
                          hintText: 'Email',
                          textInputType: TextInputType.emailAddress,
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    //password
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
                            color: Colors.black,
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

                    SizedBox(
                      height: Get.height * .065,
                    ),

                    Obx(
                      () {
                        return AuthButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                String name = nameController.text;

                                String email = emailController.text.trim();
                                String password = passwordController.text;
                                String phoneNumber = phoneController.text;
                                controller.signUpUsingFirebase(
                                  name: name,
                                  email: email,
                                  password: password,
                                  phoneNumber: phoneNumber,
                                );
                              }
                            },
                            text: controller.isLoading.value == false
                                ? Text(
                                    "Sign Up",
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
                            width: Get.width * .7);
                      },
                    ),

                    SizedBox(
                      height: Get.height * .03,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
