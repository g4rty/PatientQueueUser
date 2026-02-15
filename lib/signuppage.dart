import 'package:flutter/material.dart';
import 'package:user/verifypage.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
      "Sign up",
      style: TextStyle(
        color: Colors.white,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    ),

    const SizedBox(height: 10),

    const Text(
      "Create an account to use hospital services",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),

    const SizedBox(height: 40),

    textBox("Full name"),
    const SizedBox(height: 12),
    textBox("Email"),
    const SizedBox(height: 12),
    textBox("Phone number"),
    const SizedBox(height: 12),
    textBox("Password"),


            const SizedBox(height: 32),

            yellowBtn("Sign up", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const VerifyPage()),
              );
            }),

            const SizedBox(height: 20),

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Already have an account? Sign in",
                style: TextStyle(color: Colors.white),
              ),
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
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
