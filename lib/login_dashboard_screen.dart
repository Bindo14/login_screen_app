import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen_app/signup_page.dart';

import 'common_Conroller.dart';
import 'home_page.dart';

class LoginScreenDashboard extends StatelessWidget {
   LoginScreenDashboard({Key? key}) : super(key: key);

  final formkey= GlobalKey<FormState>();

   RegExp passwordRegex = RegExp( r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

   bool isPasswordValid(String password) {
     return passwordRegex.hasMatch(password);
   }


   @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              // image: DecorationImage(
              //     image: AssetImage("assets/images/background_login.jpg"), fit: BoxFit.fill),
                gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.indigo,

                    ]

                ),
                // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)
                // )
            ),
            child: Column(
              children: [
                SizedBox(height: 20,),
               Padding(
                 padding: const EdgeInsets.all(30.0),
                 child: Container(
                   height: 100,
                   width: 100,
                   child: ClipRRect(
                     borderRadius: BorderRadius.circular(80),
                     child: Image.asset("assets/images/login_icon.jpg",
                       fit: BoxFit.fill,
                     ),
                   ),
                 ),
               ),
                Text("Welcome to macro global",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
              //  Text("Login",style: TextStyle(color: Colors.white,fontSize: 20),),
                SizedBox(height: 30,),
                Expanded(
                  child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                          boxShadow:[ BoxShadow(
                            color: Colors.grey.withAlpha(500)
                          ),],
                          color: Colors.white,
                        ),
                       // height: Get.height-247,
                        child: Form(
                          key: formkey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                                child: TextFormField(
                                  controller: CommonForAllController.to.userController,
                                  decoration: InputDecoration(
                                   // filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),

                                      ),
                                      fillColor: Colors.blue,
                                      focusColor: Colors.grey,
                                      hintText: "Enter the name",
                                      label: Text("User name")
                                  ),

                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                                child: TextFormField(
                                  controller: CommonForAllController.to.passController,

                                  decoration: InputDecoration(

                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8)
                                      ),
                                      fillColor: Colors.grey,
                                      focusColor: Colors.grey,
                                      suffixIcon: Container(

                                        child: Tooltip(

                                            message: "This is design only. I didn't handle this function",
                                            child: Icon(Icons.remove_red_eye,size: 15,)),
                                      ),
                                      hintText: "Enter the Password",
                                      label: Text("Password")
                                  ),

                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your password';
                                    }else if(value.length<9){
                                      return "Password minimum 9 characters must";
                                    }
                                    else if(!isPasswordValid(value)){
                                      return "Please enter Upper case,lower case,numbers and special character";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Tooltip(
                                        message: "This is design only. I didn't handle this function",
                                        child: TextButton(onPressed: (){}, child: Text("Forgot password ?"))),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 10,right: 10),
                                child: Container(
                                    width: Get.width,
                                    child: ElevatedButton(onPressed: (){

                                      if(formkey.currentState!.validate()){
                                        Get.to(HomePage());
                                        CommonForAllController.to.clearLoginForms();
                                        print("haii Bindo");
                                      }
                                    }, child: Text("Login"))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10,right: 10),
                                child: Container(
                                    width: Get.width,
                                    child: ElevatedButton(

                                        onPressed: (){

                                          CommonForAllController.to.clearLoginForms();
                                          Get.to(SignUpPage());
                                        },

                                        child: Text("Sign Up")
                                    )),
                              ),


                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )

          ),



        ],
      ),
    );
  }
}
