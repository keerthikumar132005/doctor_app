// import 'package:flutter/material.dart';
// import '../utils/config.dart';

// class LoginForm extends StatefulWidget {
//   const LoginForm({Key? key}) : super(key: key);

//   @override
//   State<LoginForm> createState() => _LoginFormState();
// }

// class _LoginFormState extends State<LoginForm> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool obscurePass = true;

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           TextFormField(
//             controller: _emailController,
//             keyboardType: TextInputType.emailAddress,
//             cursorColor: Config.primaryColor,
//             decoration: const InputDecoration(
//               hintText: 'Email Address',
//               labelText: 'Email',
//               alignLabelWithHint: true,
//               prefixIcon: Icon(Icons.email_outlined),
//               prefixIconColor: Config.primaryColor,
//             ),
//           ),
//           SizedBox(height: 16),
//           // TextFormField(
//           //   controller: _passwordController,
//           //   keyboardType: TextInputType.visiblePassword,
//           //   cursorColor: Config.primaryColor,
//           //   obscureText: obscurePass,
//           //   decoration: InputDecoration(
//           //     hintText: 'Password',
//           //     labelText: 'Password',
//           //     alignLabelWithHint: true,
//           //     prefixIcon: const Icon(Icons.lock_outlined),
//           //     prefixIconColor: Config.primaryColor,
//           //     suffixIcon: IconButton(
//           //       onPressed: () {
//           //         setState(() {
//           //           obscurePass = !obscurePass;
//           //         });
//           //       },
//           //       icon: obscurePass
//           //           ? const Icon(
//           //               Icons.visibility_off_outlined,
//           //               color: Colors.black38,
//           //             )
//           //           : const Icon(
//           //               Icons.visibility_outlined,
//           //               color: Config.primaryColor,
//           //             ),
//           //     ),
//           //   ),
//           // ),
//           TextFormField(
//             controller: _passwordController,
//             keyboardType: TextInputType.visiblePassword,
//             cursorColor: Config.primaryColor,
//             obscureText: obscurePass,
//             decoration: InputDecoration(
//               hintText: 'Password',
//               labelText: 'Password',
//               alignLabelWithHint: true,
//               prefixIcon: const Icon(Icons.lock_outlined),
//               prefixIconColor: Config.primaryColor,
//               suffixIcon: IconButton(
//                 onPressed: () {
//                   setState(() {
//                     obscurePass = !obscurePass;
//                   });
//                 },
//                 icon: obscurePass
//                     ? const Icon(
//                         Icons.visibility_off_outlined,
//                         color: Colors.black38,
//                       )
//                     : const Icon(
//                         Icons.visibility_outlined,
//                         color: Config.primaryColor,
//                       ),
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your password';
//               }
//               return null; // Return null if the validation succeeds
//             },
//           ),

//           SizedBox(height: 16),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.of(context).pushNamed('main');
//             },
//             child: Text('Sign In'),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../utils/config.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool obscurePass = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Config.primaryColor,
            decoration: const InputDecoration(
              hintText: 'Email Address',
              labelText: 'Email',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.email_outlined),
              prefixIconColor: Config.primaryColor,
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Config.primaryColor,
            obscureText: obscurePass,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              alignLabelWithHint: true,
              prefixIcon: const Icon(Icons.lock_outlined),
              prefixIconColor: Config.primaryColor,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscurePass = !obscurePass;
                  });
                },
                icon: obscurePass
                    ? const Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.black38,
                      )
                    : const Icon(
                        Icons.visibility_outlined,
                        color: Config.primaryColor,
                      ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null; // Return null if the validation succeeds
            },
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('main');
            },
            child: Text('Sign In'),
          ),
        ],
      ),
    );
  }
}
