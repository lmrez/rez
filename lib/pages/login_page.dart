import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/components/my_textfield.dart';

import '../services/auth/auth_service.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final TextEditingController emailControler = TextEditingController();

  final TextEditingController passwordControler = TextEditingController();

  // login method
  void login() async {
    // fill out authentification here
    final authService = AuthService();
    if (emailControler.text.isNotEmpty && passwordControler.text.isNotEmpty) {
      try {
        await authService.signInWithEmailPassword(
            emailControler.text, passwordControler.text);
            Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
            
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Wrong email or password"),
                ));
      }
      //navigate to home page
      
    }
    else{
      showDialog(
            context: context,
            builder: (context) => const AlertDialog(
                  title: Text("Fields are empty"),
                ));
    }
    
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "Food Delivery App",
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
                  height: 25,
                ),
                //sign in button
                myButton(
                    text: "Sign In",
                    onTap: () {
                      login();
                    }),
                const SizedBox(
                  height: 25,
                ),
          
                //not a member ? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text("Register Now",
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
