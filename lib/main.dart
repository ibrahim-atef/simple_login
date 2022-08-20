import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:simple_login/constants.dart';
import 'package:simple_login/view/screens/auth_screen/login_screen.dart';
import 'package:simple_login/view/screens/auth_screen/sign_up_screen.dart';
import 'package:simple_login/view/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GetStorage().read(KUid) == null

          ? LoginScreen()
          : MainScreen(),
    );
  }
}
/*
SHA1: 59:FA:16:DA:36:EA:E8:AE:7A:E6:FF:80:39:11:E2:F9:1E:89:3C:25
SHA-256: BC:19:A0:6B:C4:CE:61:8B:25:B8:E4:7F:F4:D6:34:8D:09:41:85:F7:66:A9:0F:8A:C3:38:86:78:D1:B2:C8:BF

 */
