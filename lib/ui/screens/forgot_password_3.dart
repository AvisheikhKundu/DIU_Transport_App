import 'package:diu_transport_flutter/ui/screens/find_bus_screen.dart';
import 'package:flutter/material.dart';

class ForgotPassword3 extends StatefulWidget {
  const ForgotPassword3({super.key});

  @override
  State<ForgotPassword3> createState() => _ForgotPassword3State();
}

class _ForgotPassword3State extends State<ForgotPassword3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'Confirm Your Account',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Welcome Back!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Image.asset('assets/images/ls1.png'),
                ],
              ),

              Column(
                children: [
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Enter New password',
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
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FindBusScreen(),
                        ),
                      );
                    },
                    child: Text('Confirm Password'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
