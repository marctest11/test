import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class IDReaderServices {
  static const platformMethodChannel = const MethodChannel('s11private/nalib');
  String idCardText = '';
  String idCardPhoto = '';
  List<String> idInfo = [];

  Future<List<String>> readCard() async {
    String _message;
    try {
      final String result =
          await platformMethodChannel.invokeMethod('readCard');
      // debugPrint('----readCard from Flutter----');
      // debugPrint('result readCard = $result');
      idInfo = result.split("\n\n\n");
    } on PlatformException catch (e) {
      _message = "Can't do native stuff ${e.message}.";
    }
    return idInfo;
  }
}