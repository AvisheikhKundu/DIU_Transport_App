import 'package:diu_transport_flutter/controller/auth_controller.dart';
import 'package:diu_transport_flutter/ui/screens/login_screen.dart';
import 'package:diu_transport_flutter/ui/screens/sign_up_confirm_screen.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nidController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _registerInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/images/location_icon.png'),
                Text(
                  'Welcome Onboard!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('Let’s help you to go', style: TextStyle(fontSize: 18)),
                SizedBox(height: 40),

                // Full Name
                TextFormField(
                  controller: _fullNameController,
                  decoration: InputDecoration(
                    labelText: 'Enter your full name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Email
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Enter your email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // NID
                TextFormField(
                  controller: _nidController,
                  decoration: InputDecoration(
                    labelText: 'Enter your NID/BRC',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Address
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: 'Enter your address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Password
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
                SizedBox(height: 40),

                // Sign Up Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(300, 50),
                    backgroundColor: Color(0xff50C2C9),
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: _registerInProgress ? null : _handleRegistration,
                  child:
                      _registerInProgress
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text('Sign Up'),
                ),
                SizedBox(height: 10),

                // Sign In Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    TextButton(onPressed: _onTapSignIn, child: Text('Sign in')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignIn() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  Future<void> _handleRegistration() async {
    setState(() {
      _registerInProgress = true;
    });

    try {
      await AuthController().register(
        email: _emailController.text,
        password: _passwordController.text,
        userName: _fullNameController.text,
        userNid: _nidController.text,
        userAddress: _addressController.text,
      );

      // Navigate to confirmation screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignUpConfirmScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed: ${e.toString()}')),
      );
    } finally {
      setState(() {
        _registerInProgress = false;
      });
    }
  }
}
