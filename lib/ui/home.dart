import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projecto2/ui/login/login_screen.dart';
import 'package:projecto2/ui/main_home_page/main_home_page.dart';



class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(

        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true
      ),
      initialRoute:
      FirebaseAuth.instance.currentUser == null ? 'login' : 'home',

      routes: {

        'login' : (context) => const Login(),
        'home' : (context) => const MainPage(),
      },
    );
  }
}
