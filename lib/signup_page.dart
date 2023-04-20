

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_screen_app/home_page.dart';
import 'package:login_screen_app/searchable_main_dropdown.dart';
import 'common_Conroller.dart';
import 'package:flutter/services.dart';
class SignUpPage extends StatelessWidget {
   SignUpPage({Key? key}) : super(key: key);

  final formkey= GlobalKey<FormState>();

   RegExp passwordRegex = RegExp( r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

   bool isPasswordValid(String password) {
     return passwordRegex.hasMatch(password);
   }
  // File? file;
   ImagePicker image = ImagePicker();
  @override
  Widget build(BuildContext context) {
    CommonForAllController.to.clearSignupForms();
    print("check file format${CommonForAllController.to.file}");
    return
      SafeArea(
        child: Scaffold(
          body: Column(
            children: [

              Container(
                  height: Get.height-28,
                  width: Get.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.blue,
                          Colors.indigo,
                        ]

                    ),
                  ),
                  child: Column(


                    children: [

                      Padding(
                        padding: const EdgeInsets.only(top: 5,left: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap :(){
                                Get.back();
                                CommonForAllController.to.clearSignupForms();
                              },
                              child: Icon(Icons.arrow_back,color: Colors.white,size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: Image.asset("assets/images/signup_logo.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Form(
                                key: formkey,
                                child: Obx(()=>
                                   Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: 20,),
                                          Container(
                                            height: 120,
                                            width: 150,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                border: Border.all(color: Colors.black54),
                                                color: Colors.white
                                            ),

                                            child: CommonForAllController.to.file.path == ""
                                                ?Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Center(child: Text("Choose image")),
                                                    SizedBox(height: 10,),
                                                    Icon(Icons.image,size: 50,color: Colors.blue,)
                                                  ],
                                                )
                                                : Image.file(

                                              CommonForAllController.to.file!,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          SizedBox(width: 20,),

                                          InkWell(
                                            onTap: (){
                                              getgall();
                                            },
                                            child: Container(
                                              height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(50),
                                                  color: Colors.blue
                                                ),
                                                child: Icon(Icons.image,size: 30,)),
                                          ),
                                          SizedBox(width: 20,),
                                          InkWell(
                                            onTap: (){
                                              getcam();
                                            },
                                            child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(50),
                                                    color: Colors.blue
                                                ),
                                                child: Icon(Icons.photo_camera,size: 30,)),
                                          ),


                                        ],
                                      ),


                                      Padding(
                                        padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                                        child: TextFormField(
                                          controller: CommonForAllController.to.userNameController,
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
                                              return 'Please enter your User name';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                                        child: TextFormField(
                                          controller: CommonForAllController.to.passwordController,
                                          decoration: InputDecoration(

                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8)
                                              ),
                                              fillColor: Colors.grey,
                                              focusColor: Colors.grey,
                                              suffixIcon: Container(

                                                child: Icon(Icons.remove_red_eye,size: 15,),
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
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                                        child: TextFormField(

                                          controller: CommonForAllController.to.mailController,
                                          decoration: InputDecoration(

                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8)
                                              ),
                                              fillColor: Colors.grey,
                                              focusColor: Colors.grey,

                                              hintText: "Enter the Mail ID",
                                              label: Text("Mail ID")
                                          ),

                                          validator: (value) {
                                            if (value == "" || value == null) {
                                              return "please enter mail id";
                                            } else if (!value.isEmail) {
                                              return "please enter correct mail id";
                                            }
                                            else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                                        child: TextFormField(
                                          controller: CommonForAllController.to.phoneController,
                                          inputFormatters: [
                                            new LengthLimitingTextInputFormatter(10),
                                          ],
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8)
                                              ),
                                              fillColor: Colors.grey,

                                              focusColor: Colors.grey,
                                              hintText: "Enter the Phone number",
                                              label: Text("Phone Number")
                                          ),

                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter the Phone number';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 5),
                                            child: Container(
                                              width: Get.width*0.4,
                                              child: MainSearchableDropDown(

                                                  items: [
                                                {
                                                  "country":"India"
                                                },
                                                {
                                                  "country":"USA"
                                                },
                                                {
                                                  "country":"China"
                                                },
                                              ], label: 'Country', title: "country", controller:CommonForAllController.to.cityController, onChanged: (value){

                                              }
                                              ,isRequired: true,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 35,),
                                          Container(
                                            width: Get.width*0.4,
                                            child: MainSearchableDropDown(

                                              items: [
                                                {
                                                  "gender":"Male"
                                                },
                                                {
                                                  "gender":"Female"
                                                },
                                                {
                                                  "gender":"Others"
                                                },
                                              ], label: 'Gender', title: "gender", controller:CommonForAllController.to.genderController, onChanged: (value){

                                            }
                                              ,isRequired: true,
                                            ),
                                          ),
                                        ],
                                      ),


                                      Padding(
                                        padding: const EdgeInsets.only(left: 10,right: 10),
                                        child: Container(
                                            width: Get.width,
                                            child: ElevatedButton(onPressed: (){
                                              if(formkey.currentState!.validate()){

                                                Get.to(HomePage());
                                                CommonForAllController.to.clearSignupForms();
                                              }
                                            }, child: Text("Sign Up"))),
                                      ),



                                    ],
                                  ),
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
        ),
      );





  }
   getcam() async {
     // ignore: deprecated_member_use
     var img = await image.getImage(source: ImageSource.camera);
     CommonForAllController.to.file = File(img!.path);
   }

   getgall() async {
     // ignore: deprecated_member_use
     var img = await image.getImage(source: ImageSource.gallery);

     CommonForAllController.to.file = File(img!.path);

   }
}
