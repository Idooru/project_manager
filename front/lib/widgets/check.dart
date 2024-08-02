import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  final String label;
  final void Function(bool?) onChange;

  const CheckBoxWidget({
    super.key,
    required this.label,
    required this.onChange,
  });

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool _isChecked = false;

  void _changeCheckboxState(bool? newValue) {
    setState(() {
      _isChecked = newValue ?? false;
    });
    widget.onChange(_isChecked);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.label,
          style: const TextStyle(color: Colors.white60),
        ),
        const SizedBox(width: 10),
        Checkbox(value: _isChecked, onChanged: _changeCheckboxState),
      ],
    );
  }
}
