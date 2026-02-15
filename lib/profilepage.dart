import 'package:flutter/material.dart';
import 'package:user/historypage.dart';
import 'package:user/login_page.dart';
import 'package:user/widgets/shared_widgets.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          header(),

          const SizedBox(height: 20),

          const Center(
            child: CircleAvatar(
              radius: 48,
              backgroundColor: Colors.red,
              child: Icon(Icons.person, size: 48, color: Colors.white),
            ),
          ),

          const SizedBox(height: 12),

          const Center(
            child: Text(
              "Missxxxxxxxxxxxx",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 4),

          const Center(
            child: Text(
              "HN:0033",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),

          const SizedBox(height: 24),

          sectionCard(
            title: "Patient info",
            children: const [
              infoRow("Blood Type", "B"),
              infoRow("Birthday", "15 February 2001"),
              infoRow("Mobile Phone", "0898989898"),
              infoRow("Email", "test@gmail.com"),
            ],
          ),

          const SizedBox(height: 16),

          // ===== HISTORY =====
          sectionCard(
            title: "Treatment History",
            children: [

              const infoRow("Last Visit", "12 Feb 2026"),
              const infoRow("Total Visits", "8"),

              const SizedBox(height: 8),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HistoryPage(),
                    ),
                  );
                },
                child: const Text(
                  "View Full History",
                  style: TextStyle(fontSize: 16,color: Colors.redAccent),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          sectionCard(
            title: "Documents",
            children: const [
              docItem("Prescriptions"),
              docItem("Lab Results"),
              docItem("Visit Summaries"),
            ],
          ),

          const SizedBox(height: 24),

          // ===== LOGOUT BUTTON =====
          SizedBox(
            height: 52,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.logout),
              label: const Text("Logout",),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (route) => false,
                );
              },
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

Widget sectionCard({
  required String title,
  required List<Widget> children,
}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    ),
  );
}

class infoRow extends StatelessWidget {
  final String label;
  final String value;

  const infoRow(this.label, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(label,
                style: const TextStyle(fontSize: 16, color: Colors.black54)),
          ),
          Expanded(
            flex: 3,
            child: Text(value, style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}

class docItem extends StatelessWidget {
  final String text;
  const docItem(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const Icon(Icons.description, size: 20),
          const SizedBox(width: 8),
          Text(text,
              style: const TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline)),
        ],
      ),
    );
  }
}
