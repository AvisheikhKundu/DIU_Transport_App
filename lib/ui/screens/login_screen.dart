import 'package:diu_transport_flutter/controller/auth_controller.dart';
import 'package:diu_transport_flutter/ui/screens/find_bus_screen.dart';
import 'package:diu_transport_flutter/ui/screens/forgot_password_screen.dart';
import 'package:diu_transport_flutter/ui/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _loginInprogress = false;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.05,
              vertical: screenSize.height * 0.05,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Top Circular Elements (you'll need to implement this part)
                SizedBox(height: screenSize.height * 0.05),

                Text(
                  'Welcome Back!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenSize.width * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: screenSize.height * 0.08),
                Image.asset('assets/images/ls1.png', height: 150, width: 150),
                SizedBox(height: screenSize.height * 0.08),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Enter your email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),

                SizedBox(height: screenSize.height * 0.025),

                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Enter your password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),

                SizedBox(height: screenSize.height * 0.01),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Handle forgot password logic
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(fontSize: screenSize.width * 0.035),
                    ),
                  ),
                ),

                SizedBox(height: screenSize.height * 0.0375),

                ElevatedButton(
                  onPressed: () async {
                    _loginInprogress = true;
                    setState(() {});
                    await AuthController().login(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    _loginInprogress = false;
                    setState(() {});
                    // Handle login logic
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FindBusScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                  child: Padding(
                    padding: EdgeInsets.all(screenSize.height * 0.02),
                    child: Visibility(
                      visible: _loginInprogress == false,
                      replacement: Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          fontSize: screenSize.width * 0.045,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: screenSize.height * 0.025),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: screenSize.width * 0.04),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to sign up screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: screenSize.width * 0.04),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
