import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../home.dart';

enum PhoneAuthState {
  Started,
  CodeSent,
  CodeResent,
  Verified,
  Failed,
  Error,
  AutoRetrievalTimeOut
}

class FirebasePhoneAuth {
  static var firebaseAuth;
  static var _authCredential, actualCode, phone, status;

  static instantiate({String phoneNumber}) async {
    firebaseAuth = FirebaseAuth.instance;
    phone = phoneNumber;
    startAuth();
  }

  static startAuth() {
    firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  static final PhoneCodeSent codeSent =
      (String verificationId, [int forceResendingToken]) async {
    actualCode = verificationId;
    debugPrint(
        "\nEnter the code sent to " + phone + " actualcode :" + actualCode);
  };

  static final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
      (String verificationId) {
    actualCode = verificationId;
    debugPrint("\nAuto retrieval time out");
  };

  static final PhoneVerificationFailed verificationFailed =
      (AuthException authException) {
    debugPrint('${authException.message}');
    if (authException.message.contains('not authorized'))
      debugPrint('App not authroized');
    else if (authException.message.contains('Network'))
      debugPrint('Please check your internet connection and try again');
    else
      debugPrint('Something has gone wrong, please try later ' +
          authException.message);
  };

  static final PhoneVerificationCompleted verificationCompleted =
      (AuthCredential auth) {
    debugPrint('Auto retrieving verification code');
  };

  static Future<void> signInWithPhoneNumber(
      String smsCode, BuildContext context) async {
    _authCredential = PhoneAuthProvider.getCredential(
        verificationId: actualCode, smsCode: smsCode);

    await firebaseAuth
        .signInWithCredential(_authCredential)
        .then((AuthResult result) async {
      Navigator.of(context).pushReplacement(CupertinoPageRoute(
          builder: (BuildContext context) => Home(
                user: result.user,
              )));
    }).catchError((error) {
      debugPrint('Something has gone wrong, please try later $error');
    });
  }
}
