import 'package:flutter/material.dart';

class NoneWidget extends StatelessWidget {
  final int flex;

  const NoneWidget({super.key, required this.flex});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: Container(),
    );
  }
}
