import 'package:flutter/material.dart';

class SubmitWidget extends StatefulWidget {
  final void Function() submit;
  final bool isSubmitable;
  final String text;

  const SubmitWidget({
    super.key,
    required this.submit,
    required this.text,
    required this.isSubmitable,
  });

  @override
  State<SubmitWidget> createState() => _SubmitWidgetState();
}

class _SubmitWidgetState extends State<SubmitWidget> {
  TextButton getButton() {
    return TextButton(
      onPressed: widget.submit,
      child: Container(
        width: 215,
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Container getContainer() {
    return Container(
      width: 215,
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.all(Radius.circular(7)),
      ),
      child: Center(
        child: Text(
          widget.text,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.isSubmitable ? getButton() : getContainer();
  }
}
