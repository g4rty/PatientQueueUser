import 'package:flutter/material.dart';
import 'package:user/main_nav.dart'; 

class VerifyPage extends StatelessWidget {
  const VerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "Almost there",
              style: TextStyle(color: Colors.white, fontSize: 26),
            ),

            const SizedBox(height: 12),

            const Text(
              "Please enter the 6-digit code sent to your phone number for verification.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 32),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (_) => otpBox()),
            ),

            const SizedBox(height: 40),

            yellowBtn("Verify", () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const MainNav()),
                (route) => false,
              );
            }),

            const SizedBox(height: 20),

            const Text(
              "Didn’t receive any code? Resend Again\nRequest new code in 00:30s",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

Widget textBox(String hint) => TextField(
  decoration: InputDecoration(
    hintText: hint,
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
  ),
);

Widget yellowBtn(String text, VoidCallback onTap) => SizedBox(
  width: double.infinity,
  height: 50,
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFF2C94C),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),
    onPressed: onTap,
    child: Text(
      text,
      style: const TextStyle(fontSize: 16, color: Colors.white),
    ),
  ),
);

Widget otpBox() => Container(
  width: 45,
  height: 55,
  alignment: Alignment.center,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
  ),
  child: const TextField(
    textAlign: TextAlign.center,
    decoration: InputDecoration(border: InputBorder.none),
  ),
);
