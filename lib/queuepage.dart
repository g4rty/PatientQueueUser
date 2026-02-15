import 'package:flutter/material.dart';
import 'package:user/widgets/shared_widgets.dart';

class QueuePage extends StatelessWidget {
  const QueuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(16), child: header()),

            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: redCard(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("042", style: bigWhite()),
                          const SizedBox(height: 6),

                          Text(
                            "YOUR QUEUE NUMBER",
                            style: titleWhite(),
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 25),

                          _row("Service", "Doctor Exam"),
                          _row("Room", "3"),
                          _row("Status", "Waiting"),

                          const SizedBox(height: 20),

                          _row("Estimated Wait", "18 min"),
                          _row("Patients Ahead", "4"),
                          _row("Avg / Patient", "6 min"),
                          _row("Last update", "12:30"),

                          const SizedBox(height: 18),
                          Center(
                            child: Text(
                              "Progress 60%",
                              style: white().copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: SizedBox(
                              height: 14,
                              child: LinearProgressIndicator(
                                value: 0.6,
                                backgroundColor: Colors.white24,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _row(String left, String right) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$left :",
          style: white().copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          right,
          style: white().copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
