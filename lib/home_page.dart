

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen_app/common_Conroller.dart';
import 'login_dashboard_screen.dart';



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    print("check the file data${CommonForAllController.to.file}");
    CommonForAllController.to.getTouristData();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                height: Get.height,
                width: Get.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.indigo
                    ]
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("Tourist Details",style: TextStyle(fontSize: 25,color: Colors.white),),
                          ),
                          Spacer(),
                          Container(
                            height: 60,width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Obx(()=>
                            CommonForAllController.to.file.path == ""?
                                Icon(Icons.image):
                             Image.file(CommonForAllController.to.file)),
                          ),
                          SizedBox(width: 20,),
                          InkWell(
                            onTap: (){
                              Container(
                                color: Colors.red,
                                child:  showDeleteAlertDialog(context)
                              );

                            },

                            child: Container(
                              child: Column(
                                children: [
                                  Icon(Icons.logout,size: 25,color: Colors.white,),
                                  Text("Logout",style: TextStyle(color: Colors.white),)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20,)
                        ],
                      ),
                      SizedBox(height: 20,),
                      Text("Sample Api integrations"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(()=>
                        CommonForAllController.to.touristLoading == true?
                        Container(
                            child: CircularProgressIndicator(),):
                        CommonForAllController.to.touristEmpty == true?
                        Text("No Data in the list"):
                           Container(
                             height: 220,
                            // width: 500,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child :
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 320,
                                    childAspectRatio: 1 / 0.4,
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 10
                              ),
                                    itemCount: CommonForAllController.to.touristList.length,
                                    shrinkWrap: true,
                                    itemBuilder: (BuildContext ctx, index){
                                   print("testing bindo ${CommonForAllController.to.touristList.length}");
                                  return
                                   Column(
                                     children: [
                                       InkWell(
                                         onTap: (){
                                           CommonForAllController.to.getID(Id: "${CommonForAllController.to.touristList[index]['id']}",index: index);

                                   },
                                         child: Container(
                                           width: 300,

                                           decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(8),
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.indigo,
                                                Colors.blue
                                              ]
                                            )
                                           ),
                                           child: Padding(
                                             padding: const EdgeInsets.all(8.0),
                                             child: Column(
                                               children: [
                                                 Row(
                                                   children: [
                                                     Text("ID :",style: TextStyle(color: Colors.white)),
                                                     Container(
                                                         width: 60,
                                                         child: Text(" ${CommonForAllController.to.touristList[index]['id']}",style: TextStyle(color: Colors.white),maxLines: 1,)),
                                                   ],
                                                 ),
                                                 Row(
                                                   children: [
                                                     Text("Tourist Name :",style: TextStyle(color: Colors.white)),
                                                     Container(
                                                         width: 60,
                                                         child:  Text("${CommonForAllController.to.touristList[index]['tourist_name']}",style: TextStyle(color: Colors.white),maxLines: 1,),),
                                                   ],
                                                 ),
                                                 Row(
                                                   children: [
                                                     Text("Mail :",style: TextStyle(color: Colors.white)),
                                                     Container(
                                                         width: 60,
                                                         child: Text("${CommonForAllController.to.touristList[index]['tourist_email']}",style: TextStyle(color: Colors.white),maxLines: 1,)),
                                                   ],
                                                 ),



                                               ],
                                             ),
                                           ),
                                         ),
                                       )
                                     ],
                                   );
                                    }),
                               ),
                            ),
                        )



                        ),

                    ],
                  ),
                ),


              ),
            )
          ],
        ),
      ),
    );
  }
  showDeleteAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("cancel".tr),
      onPressed: () {
        Get.back();
      },
    );
    Widget continueButton = TextButton(

      child:  Text("confirm".tr),
      onPressed: () async {
        Get.to(LoginScreenDashboard());

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor:   Colors.white,
      title:  Text("Alert !"),
      content:  Text(
          "Do you really want to exit ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(

      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
