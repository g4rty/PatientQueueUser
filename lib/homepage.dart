import 'package:flutter/material.dart';
import 'package:user/main_nav.dart';
import 'package:user/screening_step1.dart';
import 'package:user/widgets/shared_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          header(),

          const SizedBox(height: 16),

          redCard(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today's Visit Status",
                    style: titleWhite().copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    "Queue Number : 042",
                    style: white().copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    "Patients Ahead : 4",
                    style: white().copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    "Estimated Wait : 18 minutes",
                    style: white().copyWith(fontSize: 18),
                  ),

                  const SizedBox(height: 20),

                  Align(
                    alignment: Alignment.centerRight,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const MainNav(startIndex: 1),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "View Queue",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(width: 6),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          Text("Quick Actions", style: titleBlack()),
          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: redCard(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ScreeningStep1Page(),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.assignment_turned_in,
                            color: Colors.white,
                            size: 36,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Check-In",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: redCard(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainNav(startIndex: 2),
                        ),
                      );
                    },

                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        children: const [
                          Icon(Icons.history, color: Colors.white, size: 36),
                          SizedBox(height: 10),
                          Text(
                            "My Visits",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          Text("Announcements", style: titleBlack()),
          const SizedBox(height: 8),

          Card(
            child: ListTile(
              leading: const Icon(Icons.campaign, color: Colors.red),
              title: const Text(
                "OPD opens 08:00 – 16:00",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("Please arrive 15 minutes early"),
            ),
          ),

          const SizedBox(height: 8),

          Card(
            child: ListTile(
              leading: const Icon(Icons.medical_information, color: Colors.red),
              title: const Text(
                "Bring your ID card",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("Required for all services"),
            ),
          ),

          const SizedBox(height: 8),

          Card(
            child: ListTile(
              leading: const Icon(Icons.warning_amber, color: Colors.red),
              title: const Text(
                "Mask recommended",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("For patient safety"),
            ),
          ),
        ],
      ),
    );
  }
}

Widget actionBtn(String text, VoidCallback onTap) {
  return SizedBox(
    height: 44,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white, // ตัวหนังสือสีขาว
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onTap,
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
    ),
  );
}
