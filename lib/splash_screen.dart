
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'login_dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    _animationController.repeat(reverse: true);
    Future.delayed(
      Duration(seconds: 10),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreenDashboard()),
        );
      },
    );
   }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.indigo, Colors.blue],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // Text("Hello !",style: TextStyle(color: Colors.black54,fontSize: 30),),
                // SizedBox(height: 10,),
                Container(
                  height: Get.height*0.55,
                  width: Get.width,
                  child:
                    Lottie.network(

                        'https://assets10.lottiefiles.com/packages/lf20_HkgorVWtzK.json'
                    )

                  /* ScaleTransition(
                    scale: _animation,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.asset(
                        'assets/images/moon.jpg',
                        fit: BoxFit.fill,
                        width: 200.0,
                        height: 200.0,
                      ),
                    ),
                  ),*/
                ),
                // SizedBox(height: 10,),
                // Text("Here i m handling in login screen,signup screen and Home page",style: TextStyle(color: Colors.white,fontSize: 25),textAlign: TextAlign.center,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
