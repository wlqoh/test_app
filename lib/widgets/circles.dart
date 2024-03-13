import 'package:auth_task/utils/constants.dart';
import 'package:flutter/material.dart';

class CircleDot extends StatelessWidget {
  const CircleDot({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      width: 36,
      child: Stack(
        children: [
          ClipOval(
            child: Container(
              color: Colors.grey[200],
              height: 36, // height of the button
              width: 36, // width of the button
            ),
          ),
          Center(
            child: ClipOval(
              child: Container(
                color: Colors.grey[400],
                height: 10, // height of the button
                width: 10, // width of the button
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CirclePlace extends StatelessWidget {
  const CirclePlace({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      width: 36,
      child: Stack(
        children: [
          ClipOval(
            child: Container(
              color: const Color.fromRGBO(229, 234, 255, 1),
              height: 36, // height of the button
              width: 36, // width of the button
            ),
          ),
          const Center(
            child: Icon(Icons.place_outlined, color: MyColors.kPrimaryColor),
          )
        ],
      ),
    );
  }
}
