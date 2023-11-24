import 'package:exmcode/view/utils/Todo/Button/button.dart';
import 'package:flutter/material.dart';

class Dialogbox extends StatelessWidget {
  final controller;
  VoidCallback onsave;
  VoidCallback oncancel;
  Dialogbox(
      {super.key,
      required this.controller,
      required this.onsave,
      required this.oncancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amber,
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(onPressed: onsave, text: "Save"),
                SizedBox(
                  width: 10,
                ),
                Button(onPressed: oncancel, text: "Cancel"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
