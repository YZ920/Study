import 'package:flutter/material.dart';
import 'Controller/calculator_controller.dart'; // Ensure correct import

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("计算器"),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 显示区域
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(24),
              child: ValueListenableBuilder<String>(
                valueListenable: CalculatorController.displayTextNotifier,
                builder: (context, displayText, child) {
                  return Text(
                    displayText,
                    style: const TextStyle(
                      fontSize: 80,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
          ),
          // 按钮区域
          Expanded(
            flex: 2,
            child: Column(
              children: [
                // 第一行按钮
                Expanded(
                  child: Row(
                    children: <Widget>[
                      _buildCalcButton('AC', Colors.grey),
                      _buildCalcButton('+/-', Colors.grey),
                      _buildCalcButton('%', Colors.grey),
                      _buildCalcButton('/', Colors.orange),
                    ],
                  ),
                ),
                // 第二行按钮
                Expanded(
                  child: Row(
                    children: <Widget>[
                      _buildCalcButton('7', Colors.grey[850]!),
                      _buildCalcButton('8', Colors.grey[850]!),
                      _buildCalcButton('9', Colors.grey[850]!),
                      _buildCalcButton('x', Colors.orange),
                    ],
                  ),
                ),
                // 第三行按钮
                Expanded(
                  child: Row(
                    children: <Widget>[
                      _buildCalcButton('4', Colors.grey[850]!),
                      _buildCalcButton('5', Colors.grey[850]!),
                      _buildCalcButton('6', Colors.grey[850]!),
                      _buildCalcButton('-', Colors.orange),
                    ],
                  ),
                ),
                // 第四行按钮
                Expanded(
                  child: Row(
                    children: <Widget>[
                      _buildCalcButton('1', Colors.grey[850]!),
                      _buildCalcButton('2', Colors.grey[850]!),
                      _buildCalcButton('3', Colors.grey[850]!),
                      _buildCalcButton('+', Colors.orange),
                    ],
                  ),
                ),
                // 最后一行按钮
                Expanded(
                  child: Row(
                    children: <Widget>[
                      _buildCalcButton('0', Colors.grey[850]!, width: 2),
                      _buildCalcButton('.', Colors.grey[850]!),
                      _buildCalcButton('=', Colors.orange),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalcButton(String text, Color color, {int width = 1}) {
    return Expanded(
      flex: width,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => CalculatorController.onButtonPressed(text),
          style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            padding: const EdgeInsets.all(20),
            textStyle: const TextStyle(fontSize: 24),
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
