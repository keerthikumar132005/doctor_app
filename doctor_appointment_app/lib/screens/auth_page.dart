// import 'package:doctor_appointment_app/components/login_form.dart';
// import 'package:doctor_appointment_app/register.dart';
// import 'package:doctor_appointment_app/utils/text.dart';
// import 'package:flutter/material.dart';
// import '../components/social_button.dart';
// import '../utils/config.dart';

// class AuthPage extends StatefulWidget {
//   const AuthPage({Key? key}) : super(key: key);

//   @override
//   State<AuthPage> createState() => _AuthPageState();
// }

// class _AuthPageState extends State<AuthPage> {
//   @override
//   Widget build(BuildContext context) {
//     Config().init(context);
//     return Scaffold(
//         body: Padding(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 15,
//         vertical: 15,
//       ),
//       child: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               AppText.enText['welcome_text'] ?? 'Welcome', // Handle null case
//               style: const TextStyle(
//                 fontSize: 36,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Config.spaceSmall,
//             Text(
//               AppText.enText['signIn_text'] ?? 'Sign In', // Handle null case
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Config.spaceSmall,
//             const LoginForm(),
//             Config.spaceSmall,
//             Center(
//               child: TextButton(
//                 onPressed: () {},
//                 child: Text(
//                   AppText.enText['forget-password'] ??
//                       'Forgot Password', // Handle null case
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//             const Spacer(),
//             Center(
//               child: Text(
//                 AppText.enText['signIn_text'] ?? 'Sign In', // Handle null case
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.normal,
//                   color: Color.fromRGBO(158, 158, 158, 1),
//                 ),
//               ),
//             ),
//             Config.spaceSmall,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: const <Widget>[
//                 SocialButton(social: 'google'),
//                 SocialButton(social: 'facebook'),
//               ],
//             ),
//             Config.spaceSmall,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   AppText.enText['signUp_text']!,
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.normal,
//                     color: Colors.grey.shade500,
//                   ),
//                 ),
//                 const Text(
//                   'Sign Up',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     ));
//   }
// }
import 'package:doctor_appointment_app/components/login_form.dart';
import 'package:doctor_appointment_app/register.dart';
import 'package:doctor_appointment_app/utils/text.dart';
import 'package:flutter/material.dart';
import '../components/social_button.dart';
import '../utils/config.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                AppText.enText['welcome_text'] ?? 'Welcome',
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Config.spaceSmall,
              Text(
                AppText.enText['signIn_text'] ?? 'Sign In',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Config.spaceSmall,
              const LoginForm(),
              Config.spaceSmall,
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    AppText.enText['forget-password'] ?? 'Forgot Password',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: Text(
                  AppText.enText['signIn_text'] ?? 'Sign In',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color.fromRGBO(158, 158, 158, 1),
                  ),
                ),
              ),
              Config.spaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const <Widget>[
                  SocialButton(social: 'google'),
                  SocialButton(social: 'facebook'),
                ],
              ),
              Config.spaceSmall,
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DoctorRegistrationForm()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      AppText.enText['signUp_text']!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
