
import 'package:flutter/material.dart';
import 'home_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    welcome();
  }

  welcome() async {
    Future.delayed(Duration(seconds: 10)).then((value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        )));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset("assets/images/welcome.gif"),
      ),
    ));
  }
}
