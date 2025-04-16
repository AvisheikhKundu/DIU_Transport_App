import 'package:diu_transport_flutter/ui/screens/find_bus_screen.dart';
import 'package:flutter/material.dart';

class SignUpConfirmScreen extends StatefulWidget {
  const SignUpConfirmScreen({super.key});

  @override
  State<SignUpConfirmScreen> createState() => _SignUpConfirmScreenState();
}

class _SignUpConfirmScreenState extends State<SignUpConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Confirm Your Account',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'We sent a code to your email address. Enter that code to confirm your account',
            ),
            SizedBox(height: 30),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter Code',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(300, 50),
                  backgroundColor: Color(0xff50C2C9),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FindBusScreen()),
                  );
                },
                child: Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
