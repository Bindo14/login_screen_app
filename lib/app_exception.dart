
import 'package:get/get.dart';

import 'common_Conroller.dart';
import 'error404.dart';
import 'error500.dart';
class AppException implements Exception{
  final dynamic _message;
  final dynamic _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  int code;
  String message;

  FetchDataException(this.message, this.code)
      : super(message, "") {
    print("500 entry $code}");
    if(code==500 || code==502) {
      CommonToast.show(msg: "Sorry for the inconvenience... Please wait.....");
       Get.to(()=>Error500());
    }
    // Get.defaultDialog(
    //
    //      onConfirm: () {
    //        Get.offNamed('/');
    //      },
    //      onCancel: () {
    //        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    //      },
    //      textCancel: 'Close App',
    //      textConfirm: 'Home',
    //      middleText: message
    //  );

  }
}

class BadRequestException extends AppException {
  int code;
  String message;

  BadRequestException(this.message, this.code)
      : super(message, "Invalid Request: ") {
    // navigator!.pushNamed('/' + code.toString());
    // String scode = code != null ? code.toString() : '404';
    Get.to(()=>Error404());
  }
}

class UnauthorisedException extends AppException {
  int code;
  String message;
  String next;
  var res;

  UnauthorisedException(this.res, this.message, this.code, {this.next = ""})
      : super(message, "Unauthorised: ") {
    String scode = code != null ? code.toString() : '404';
    //navigator.pushNamed('/login');
    // Utility.log("next screen $next error $res");
    // LoginController.to.otpStatusFor.value="Login";

    Get.back();
    // userPref.token.val=null;
    Get.toNamed('/login');
    //SnackBarCommon.showSnack("Error", message);

    /*AlertBox.show(
        callback: () {
          Get.back();
        },
        title: 'Error ' + scode,
        message: Text(message));*/
  }
}

