import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorController {
  // Expose _displayTextNotifier as a public static property
  static final ValueNotifier<String> displayTextNotifier = ValueNotifier<String>('0');

  static String get displayText => displayTextNotifier.value;

  static void onButtonPressed(String text) {
    if (text == 'AC') {
      displayTextNotifier.value = '0';
    } else if (text == '=') {
      _calculateResult();
    } else {
      if (displayTextNotifier.value == '0') {
        displayTextNotifier.value = text;
      } else {
        displayTextNotifier.value += text;
      }
    }
  }

  static void _calculateResult() async {
    try {
      print(displayTextNotifier.value);
      final result = await _invokeCalculateMethod(displayTextNotifier.value);
      displayTextNotifier.value = result.toString();
    } on PlatformException catch (e) {
      print("Failed to calculate: '${e.message}'.");
      displayTextNotifier.value = 'Error';
    }

  }

  static Future<dynamic> _invokeCalculateMethod(String expression) async {
    const platform = MethodChannel('com.example.calculator');
    return await platform.invokeMethod('calculate', {'expression': expression});
  }
}
