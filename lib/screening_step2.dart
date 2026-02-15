import 'package:flutter/material.dart';
import 'package:user/screening_result.dart';
import 'package:user/widgets/app_header.dart';

class ScreeningStep2Page extends StatefulWidget {
  const ScreeningStep2Page({super.key});

  @override
  State<ScreeningStep2Page> createState() => _ScreeningStep2PageState();
}

class _ScreeningStep2PageState extends State<ScreeningStep2Page> {
  String? selectedSymptom;
  final TextEditingController otherController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: appHeader("Screening — Step 2 of 2"),

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
                    "Do you have any urgent symptoms?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 18),

                  _radio("Severe chest pain"),
                  _radio("Difficulty breathing"),
                  _radio("Feeling faint / collapse"),
                  _radio("Heavy bleeding"),
                  _radio("Severe injury"),
                  _radio("Other"),

                  if (selectedSymptom == "Other") ...[
                    const SizedBox(height: 14),
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

            const SizedBox(height: 30),

            /// BUTTONS
            Row(
              children: [

                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      minimumSize: const Size.fromHeight(52),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Back",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF2C94C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      minimumSize: const Size.fromHeight(52),
                    ),
                    onPressed: selectedSymptom == null
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const ScreeningResultPage(),
                              ),
                            );
                          },
                    child: const Text(
                      "Submit Screening",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _radio(String text) {
    return RadioListTile<String>(
      value: text,
      groupValue: selectedSymptom,
      onChanged: (v) => setState(() => selectedSymptom = v),
      activeColor: Colors.white,
      title: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
