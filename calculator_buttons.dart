import 'package:flutter/services.dart';

class CalculatorButtons {
  static const platform = MethodChannel('com.example.calculator');

  static Future<dynamic> onButtonPressed(String text) async {
    try {
      // Simple logic for demonstration; modify as needed
      final result = await platform.invokeMethod('calculate', {
        'operation': text,
        'num1': 1, // 示例参数
        'num2': 2, // 示例参数
      });
      return result;
    } on PlatformException catch (e) {
      print("Failed to calculate: '${e.message}'.");
      return 'Error';
    }
  }
}
