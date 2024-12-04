import 'package:flutter/material.dart';

import '../../../core/utils/helper_functions.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_input_field.dart';
import 'login_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            SizedBox(
                width: 100,
                child: Image.asset("assets/images/roundedLogo.png")),
            Text(
              "Sign Up",
              style: TextStyle(
                  fontSize: 25, color: Theme.of(context).colorScheme.surface),
            ),
            Text("Create New Account",
                style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.surface,
                    fontWeight: FontWeight.w100)),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .9,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const AppInputField(
                    hint: "Full Name",
                  ),
                  const AppInputField(
                    hint: "Email Address",
                  ),
                  const AppInputField(
                    hint: "Password",
                    isObscure: true,
                  ),
                  const AppInputField(
                    hint: "Confirm Password",
                    isObscure: true,
                  ),
                  AppButton(
                      text: "Sign Up",
                      backgroundColor:
                          Theme.of(context).colorScheme.surface.withOpacity(.1),
                      textColor:
                          Theme.of(context).colorScheme.surface.withOpacity(1),
                      onPress: () {})
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 170, 59),
                      fontWeight: FontWeight.w100),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    HelperFunctions.routeReplacdTo(const LoginPage(), context);
                  },
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 170, 59),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
