
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Visit History"),

        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.red),

            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  title: const Text("Notifications Enabled"),
                  content: const Text(
                    "You will be notified again when your queue is near and when it is your turn.\n\n"
                    "You don’t need to wait at the room entrance.\n\n"
                    "Queue: 042\n"
                    "Est. wait: ~ 24 minutes",
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("OK"),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          historyCard("12 Feb 2026", "General OPD", "Doctor Exam"),
          historyCard("05 Jan 2026", "Dental", "Tooth Check"),
          historyCard("20 Dec 2025", "Pharmacy", "Medicine Pickup"),
          historyCard("02 Nov 2025", "Lab", "Blood Test"),
        ],
      ),
    );
  }
}

Widget historyCard(String date, String clinic, String service) {
  return Card(
    margin: const EdgeInsets.only(bottom: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: ListTile(
      leading: const Icon(Icons.local_hospital, color: Colors.red),
      title: Text(service),
      subtitle: Text("$clinic • $date"),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    ),
  );
}
