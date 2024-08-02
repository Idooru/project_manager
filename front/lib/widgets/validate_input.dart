import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ValidateInputWidget extends StatefulWidget {
  final double? areaWidth;
  final double? labelWidth;
  final String label;
  final TextEditingController controller;
  final void Function(String)? textChange;
  final bool isValid;
  final String failReason;

  const ValidateInputWidget({
    super.key,
    this.areaWidth,
    this.labelWidth,
    this.textChange,
    required this.label,
    required this.controller,
    required this.isValid,
    required this.failReason,
  });

  @override
  State<ValidateInputWidget> createState() => _ValidateInputWidgetState();
}

class _ValidateInputWidgetState extends State<ValidateInputWidget> {
  bool isInputted = false;

  void alertReason() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Validation Error'),
          content: Text(widget.failReason),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

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
              onChanged: (value) {
                widget.textChange!(value);
                isInputted = true;

                if (widget.controller.text.isEmpty) isInputted = false;
              },
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
            ),
          ),
          isInputted
              ? IconButton(
                  icon: widget.isValid
                      ? const Icon(Icons.check_circle_outline, size: 30)
                      : const Icon(Icons.error, size: 30),
                  color: widget.isValid ? Colors.green[600] : Colors.red[600],
                  onPressed: widget.isValid ? () {} : alertReason,
                )
              : Container(),
          SizedBox(width: 10, child: Container()),
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
