

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Error404 extends StatelessWidget {
  const Error404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Colors.red,
        child: Text("500 issues"),
      ),
    );
  }
}
