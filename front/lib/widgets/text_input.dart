import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  final int? areaWidth;
  final String label;
  final TextEditingController controller;
  final void Function(String)? textChange;

  const TextInputWidget({
    super.key,
    this.areaWidth,
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
      width: widget.areaWidth == null
          ? double.infinity
          : widget.areaWidth as double,
      height: 50,
      margin: const EdgeInsets.fromLTRB(6, 0, 6, 10),
      decoration: const BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            width: 55,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.label,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black45,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: TextField(
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
              obscureText: widget.label.contains('PW') ? true : false,
              controller: widget.controller,
              decoration: const InputDecoration(border: InputBorder.none),
              onChanged: widget.textChange,
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
