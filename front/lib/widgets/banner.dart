import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Flexible(
      flex: 3,
      fit: FlexFit.tight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Project Manager',
              style: TextStyle(
                fontSize: screenSize.width * 0.5 / 5,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'with mobile v1.0.0',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: screenSize.width * 0.08 / 2,
                color: Colors.white38,
                decoration: TextDecoration.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
