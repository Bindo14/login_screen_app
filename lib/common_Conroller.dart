


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:login_screen_app/repository/common_repository.dart';
import 'commonAnimatedPopup.dart';
class CommonForAllController extends GetxController{
  static CommonForAllController get to => Get.put(CommonForAllController());

  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  ///signup screen controller
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  /// textform fields empty handing
  clearLoginForms(){
    userController.text ="";
    passController.text ="";
  }

  clearSignupForms(){
    userNameController.text ="";
    passwordController.text ="";
    mailController.text ="";
    phoneController.text ="";
    cityController.text ="";
    genderController.text ="";
  }

  final _touristLoading = false.obs;

  get touristLoading => _touristLoading.value;

  set touristLoading(value) {
    _touristLoading.value = value;
  }

  final _touristEmpty = false.obs;

  get touristEmpty => _touristEmpty.value;

  set touristEmpty(value) {
    _touristEmpty.value = value;
  }

  final _touristList = [].obs;

  get touristList => _touristList.value;

  set touristList(value) {
    _touristList.value = value;
  }

  final repository = CommonRepository();

  getID({required String Id,required int index})async{

    commonAnimatedPopup(context: Get.context!, child: Column(
      children: [
        Container(
          height: Get.height*0.35,
          width: Get.width*0.85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.indigo
                  ]
              )
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap:(){
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.close,size: 20,color: Colors.white,),
                      )),
                ],

              ),
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(

                      children: [
                        Text("ID :",style: TextStyle(color: Colors.white),),
                        Text( " ${CommonForAllController.to.touristList[index]['id']}",style: TextStyle(fontSize: 15,color: Colors.white),)

                      ],
                    ),
                    Row(

                      children: [
                        Text("User Name :",style: TextStyle(color: Colors.white),),
                        Flexible(
                          child: Container(
                              child: Text( "${CommonForAllController.to.touristList[index]['tourist_name']}",style: TextStyle(fontSize: 15,color: Colors.white),)),
                        )

                      ],
                    ),
                    Row(

                      children: [
                       
                        Container(
                          width: Get.width*0.66,

                            child: Text( "Mail ID : ${CommonForAllController.to.touristList[index]['tourist_email']}",style: TextStyle(fontSize: 15,color: Colors.white),maxLines: 2,))

                      ],
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ],
    ), height: Get.height*0.85, width: Get.width*0.95);


  }

  getTouristData()async{

    touristLoading = true;
    var response = await repository.getTourist();
    print("check res =${response}");
    touristLoading = false;

    // if(response['status']==200){
      print("check status=${response['status']}");
      if(response['data'].isNotEmpty){

        List<Map<String,dynamic>> res = [];
        response['data'].forEach((e){
          res.add(e);
        });


        touristList=res;
        print("touristList${touristList}");
        touristEmpty=false;
      }else{
        touristList =[];
        touristEmpty=true;
      }

  }


  final _file = File("").obs;

  get file => _file.value;

  set file(value) {
    _file.value = value;
  }


}

class CommonToast {
  static show({String? msg}){
    return Fluttertoast.showToast(
      msg: "$msg",
      webShowClose: true,
      backgroundColor: Colors.black,
      timeInSecForIosWeb: 5,
      webBgColor: "linear-gradient(#334, #000)",
      webPosition: "center",// message
      toastLength: Toast.LENGTH_LONG, // length
      gravity: ToastGravity.CENTER, // location
    );
  }
}


