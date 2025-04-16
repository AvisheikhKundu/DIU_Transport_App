import 'package:diu_transport_flutter/ui/screens/login_screen.dart';
import 'package:diu_transport_flutter/ui/utils/app_strings.dart';
import 'package:flutter/material.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/logo.png'),
            Image.asset('assets/images/get_started.png', height: 120),
            Column(
              children: [
                Image.asset('assets/images/location_icon.png'),
                Text(
                  AppStrings.getStartedText,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(350, 60),
                backgroundColor: Color(0xff50C2C9),
                foregroundColor: Colors.white,
                textStyle: TextStyle(fontSize: 20)
              ),
              onPressed: _onTapGetStarted,
              child: Text('Get Started'),
            ),
            SizedBox(height: 5),
            Text(
              'All rights resevred by@Avisheikh ',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapGetStarted() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (predicate) => true,
    );
  }
}
