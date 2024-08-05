import 'package:fb_exam/extensions.dart';
import 'package:fb_exam/routes/app_routes.dart';
import 'package:fb_exam/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xfffae392),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              50.height,
              const Text(
                "Login Now",
                style: TextStyle(
                  fontFamily: 'realNova',
                  fontSize: 50,
                  color: Color(0xff1a5d1a),
                ),
              ),
              50.height,
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Email';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  label: const Text(
                    'Email',
                    style: TextStyle(
                      fontFamily: 'realNova',
                    ),
                  ),
                  hintText: 'Enter Email',
                  hintStyle: const TextStyle(
                    color: Colors.black26,
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xff1a5d1a),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xff1a5d1a),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              15.height,
              TextFormField(
                controller: passwordController,
                obscureText: true,
                obscuringCharacter: "*",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Password';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  label: const Text(
                    'Password',
                    style: TextStyle(
                      fontFamily: 'realNova',
                    ),
                  ),
                  hintText: 'Enter Password',
                  hintStyle: const TextStyle(
                    color: Colors.black26,
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xff1a5d1a),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xff1a5d1a),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              30.height,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      const Color(0xff1a5d1a),
                    ),
                  ),
                  onPressed: () async {
                    User? user = await AuthServices.authServices
                        .signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text);
                    if (user != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("SIGN IN SUCCESSFULLY !!"),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      Navigator.of(context).pushReplacementNamed(
                        AppRoutes.instance.homePage,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(" SIGN-IN FAILED !!"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontFamily: 'realNova',
                      fontSize: 20,
                      color: Color(0xfff1c93b),
                    ),
                  ),
                ),
              ),
              15.height,
              const Text(
                "Or Login With",
                style: TextStyle(
                  fontFamily: 'realNova',
                  color: Color(0xff7D7763),
                ),
              ),
              15.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color(0xfffdf4d6),
                      ),
                    ),
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.squareFacebook),
                    label: const Text(
                      "Facebook",
                      style: TextStyle(
                        fontFamily: 'realNova',
                        color: Color(0xff7D7763),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color(0xfffdf4d6),
                      ),
                    ),
                    onPressed: () async {
                      UserCredential credential =
                          await AuthServices.authServices.signInWithGoogle();
                      User? user = credential.user;

                      if (user != null) {
                        Navigator.of(context)
                            .pushReplacementNamed(AppRoutes.instance.homePage);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Failed !!"),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    },
                    icon: const Icon(FontAwesomeIcons.google),
                    label: const Text(
                      "Google",
                      style: TextStyle(
                        fontFamily: 'realNova',
                        color: Color(0xff7D7763),
                      ),
                    ),
                  ),
                ],
              ),
              15.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color(0xfffdf4d6),
                      ),
                    ),
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.instagram),
                    label: const Text(
                      "Instagram",
                      style: TextStyle(
                        fontFamily: 'realNova',
                        color: Color(0xff7D7763),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color(0xfffdf4d6),
                      ),
                    ),
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.squareXTwitter),
                    label: const Text(
                      "Twitter",
                      style: TextStyle(
                        fontFamily: 'realNova',
                        color: Color(0xff7D7763),
                      ),
                    ),
                  ),
                ],
              ),
              15.height,
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    const Color(0xfffdf4d6),
                  ),
                ),
                onPressed: () async {
                  User? user = await AuthServices.authServices.anonymousLogin();
                  if (user != null) {
                    Navigator.of(context)
                        .pushReplacementNamed(AppRoutes.instance.homePage);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Failed !!"),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
                icon: const Icon(FontAwesomeIcons.circleUser),
                label: const Text(
                  "GuestLogin",
                  style: TextStyle(
                    fontFamily: 'realNova',
                    color: Color(0xff7D7763),
                  ),
                ),
              ),
              40.height,
              const Text(
                "Don't Have An Account ?",
                style: TextStyle(
                  fontFamily: 'realNova',
                  fontWeight: FontWeight.bold,
                ),
              ),
              15.height,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      const Color(0xff1a5d1a),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(AppRoutes.instance.signUpPage);
                  },
                  child: const Text(
                    "SignUp Now",
                    style: TextStyle(
                      fontFamily: 'realNova',
                      fontSize: 20,
                      color: Color(0xfff1c93b),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
