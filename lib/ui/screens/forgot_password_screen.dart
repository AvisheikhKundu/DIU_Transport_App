import 'package:diu_transport_flutter/ui/screens/forgot_password_2.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Welcome Back!',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 80),
              Image.asset('assets/images/ls1.png'),
              SizedBox(height: 40),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Enter Code',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(300, 50),
                  backgroundColor: Color(0xff50C2C9),
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword2()));
                },
                child: Text('Sign In'),
              ),
        
              TextButton(onPressed: () {}, child: Text('Send Code Again')),
            ],
          ),
        ),
      ),
    );
  }
}


