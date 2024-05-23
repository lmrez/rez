import 'package:flutter/material.dart';
import 'package:food_delivery/services/auth/auth_service.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final TextEditingController emailControler = TextEditingController();

  final TextEditingController passwordControler = TextEditingController();

  final TextEditingController confirmPasswordControler =
      TextEditingController();

  //register method
  void register() async {
    //get auth service
    final authService = AuthService();
    // check if password match
    if (passwordControler.text == confirmPasswordControler.text) {
      try {
        await authService.signUpWithEmailPassword(
            emailControler.text, passwordControler.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Password doesnt match !"),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Icon(Icons.lock_open_rounded,
                    size: 72, color: Theme.of(context).colorScheme.inversePrimary),
          
                const SizedBox(
                  height: 25,
                ),
                //message
                Text(
                  "Lets create an account for you",
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(
                  height: 25,
                ),
                //email textfield
                MyTextField(
                    controller: emailControler,
                    hintText: "Email",
                    obscureText: false),
                const SizedBox(
                  height: 10,
                ),
                //password textfield
                MyTextField(
                    controller: passwordControler,
                    hintText: "Password",
                    obscureText: true),
          
                const SizedBox(
                  height: 10,
                ),
                //confirm password textfield
                MyTextField(
                    controller: confirmPasswordControler,
                    hintText: "Confirm Password",
                    obscureText: true),
          
                const SizedBox(
                  height: 25,
                ),
                //sign up button
                myButton(
                    text: "Sign Up",
                    onTap: () {
                      register();
                    }),
                const SizedBox(
                  height: 25,
                ),
          
                // already have an account? Login here
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text("Login now",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
