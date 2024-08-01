import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputWidget extends StatefulWidget {
  final double? areaWidth;
  final double? labelWidth;
  final String label;
  final TextEditingController controller;
  final void Function(String)? textChange;

  const TextInputWidget({
    super.key,
    this.areaWidth,
    this.labelWidth,
    required this.label,
    required this.controller,
    this.textChange,
  });

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.areaWidth ?? double.infinity,
      height: 50,
      margin: const EdgeInsets.fromLTRB(6, 0, 6, 0),
      decoration: const BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
              obscureText: widget.label.contains('PW') ? true : false,
              controller: widget.controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: widget.label,
              ),
              onChanged: widget.textChange,
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }
}
