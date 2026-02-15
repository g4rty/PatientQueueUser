import 'package:flutter/material.dart';
import 'package:user/screening_step2.dart';
import 'package:user/widgets/app_header.dart';

class ScreeningStep1Page extends StatefulWidget {
  const ScreeningStep1Page({super.key});

  @override
  State<ScreeningStep1Page> createState() => _ScreeningStep1PageState();
}

class _ScreeningStep1PageState extends State<ScreeningStep1Page> {
  String? selectedReason;
  final TextEditingController otherController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      appBar: appHeader("Screening — Step 1 of 2"),

      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          children: [

            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [

                  const Text(
                    "What brings you in today?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  _radioItem("Appointment visit"),
                  _radioItem("General illness"),
                  _radioItem("Follow-up visit"),
                  _radioItem("Medication refill"),
                  _radioItem("Injury / Accident"),
                  _radioItem("Other reason"),

                  if (selectedReason == "Other reason") ...[
                    const SizedBox(height: 16),
                    TextField(
                      controller: otherController,
                      decoration: InputDecoration(
                        hintText: "Please specify",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 32),

            SizedBox(
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF2C94C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: selectedReason == null
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ScreeningStep2Page(),
                          ),
                        );
                      },
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _radioItem(String value) {
    return RadioListTile<String>(
      value: value,
      groupValue: selectedReason,
      onChanged: (v) {
        setState(() {
          selectedReason = v;
        });
      },
      activeColor: Colors.white,
      title: Text(
        value,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
