// import 'package:flutter/material.dart';
// import '../utils/config.dart';

// class CustomButton extends StatelessWidget {
//   const CustomButton({
//     Key? key,
//     required this.width,
//     required this.title,
//     required this.onPressed,
//     required this.disable,
//   }) : super(key: key);

//   final double width;
//   final String title;
//   final bool disable;
//   final VoidCallback onPressed; // Change Function() to VoidCallback

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width,
//       child: ElevatedButton(
//         style: ButtonStyle(
//           backgroundColor:
//               MaterialStateProperty.all<Color>(Config.primaryColor),
//           foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
//         ),
//         onPressed: disable ? null : onPressed,
//         child: Text(
//           title,
//           style: const TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import '../utils/config.dart';

class Button extends StatelessWidget {
  const Button(
      {Key? key,
      required this.width,
      required this.title,
      required this.onPressed,
      required this.disable})
      : super(key: key);

  final double width;
  final String title;
  final bool disable; //this is used to disable button
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Config.primaryColor,
          foregroundColor: Colors.white,
        ),
        onPressed: disable ? null : onPressed,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
