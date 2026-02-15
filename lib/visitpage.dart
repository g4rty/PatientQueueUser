import 'package:flutter/material.dart';
import 'package:user/widgets/shared_widgets.dart';

class VisitPage extends StatelessWidget {
  const VisitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          header(),

          const SizedBox(height: 16),

          // ===== TODAY VISIT =====
          redCard(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [

                  Center(
                    child: Text(
                      "Today’s Visit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 14),

                  Text("Visit ID : OPD-2026-0214",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  Text("Date : 14 Feb 2026",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  Text("Clinic : General OPD",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  Text("Doctor : — Assigned —",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // ===== VISIT PROGRESS =====
          redCard(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Center(
                    child: Text(
                      "Visit Progress",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  progressRow("Registration", true),
                  progressRow("Screening", true),
                  progressRow("Waiting for Doctor", true, active: true),
                  progressRow("Lab Test", false),
                  progressRow("Pharmacy", false),
                  progressRow("Payment", false),

                  const SizedBox(height: 16),

                  const Text(
                    "Overall Progress: 60%",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),

                  const SizedBox(height: 8),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: 0.6,
                      minHeight: 12,
                      backgroundColor: Colors.white30,
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Center(
                    child: Text(
                      "Next Steps",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text("1. Doctor Examination",
                      style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold)),
                  const Text("2. Pharmacy Pickup",
                      style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold)),
                  const Text("3. Payment Counter",
                      style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold)),

                  const SizedBox(height: 12),

                  const Text(
                    "*Order may change",
                    style: TextStyle(color: Colors.white70, fontSize: 14,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget progressRow(String text, bool done, {bool active = false}) {
  IconData icon;
  Color color;

  if (done) {
    icon = Icons.check_circle;
    color = Colors.white;
  } else if (active) {
    icon = Icons.radio_button_checked;
    color = Colors.white;
  } else {
    icon = Icons.radio_button_unchecked;
    color = Colors.white70;
  }

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(color: color, fontSize: 16,fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
