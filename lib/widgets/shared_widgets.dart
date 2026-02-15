import 'package:flutter/material.dart';

Widget header() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        "MFU Health",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),

      Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.notifications_none, size: 28),
          onPressed: () {
            showDialog(
              context: context,
              builder: (dialogContext) => Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.notifications_active,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),

                      const SizedBox(height: 16),

                      const Text(
                        "Notifications Enabled",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 14),

                      const Text(
                        "You will be notified when your queue\n is near"
                        "and when it is your turn.\n\n"
                        "You don’t need to wait at the room entrance.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),
                      ),

                      const SizedBox(height: 18),

                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Queue",style: TextStyle(fontWeight: FontWeight.bold),),
                                Text(
                                  "042",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Est. wait",style: TextStyle(fontWeight: FontWeight.bold)),
                                Text(
                                  "~ 24 minutes",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF2C94C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () => Navigator.pop(dialogContext),
                          child: const Text(
                            "OK",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}


Widget redCard({required Widget child}) => Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );

Widget actionBtn(String text) => Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
        ),
        onPressed: () {},
        child: Text(text),
      ),
    );

Widget info(String key, String value) => ListTile(
      title: Text(key),
      trailing: Text(value),
    );

Widget historyItem(String date, String type) => Card(
      child: ListTile(
        title: Text(type),
        subtitle: Text(date),
      ),
    );

Widget check(String text, bool done) => Row(
      children: [
        Icon(
          done ? Icons.check_circle : Icons.radio_button_unchecked,
          color: Colors.white,
        ),
        SizedBox(width: 8),
        Text(text, style: white()),
      ],
    );

TextStyle white() => TextStyle(color: Colors.white);

TextStyle titleWhite() => TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

TextStyle titleBlack() => TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

TextStyle bigWhite() => TextStyle(
      color: Colors.white,
      fontSize: 36,
      fontWeight: FontWeight.bold,
    );

Widget centerText(String text) => Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );

    void showQueueNotification(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: const Row(
        children: [
          Icon(Icons.notifications_active, color: Colors.red),
          SizedBox(width: 8),
          Text("Notifications Enabled"),
        ],
      ),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "You will be notified again when your queue is near and when it is your turn.",
          ),
          SizedBox(height: 12),
          Text("You don’t need to wait at the room entrance."),
          SizedBox(height: 16),
          Divider(),
          SizedBox(height: 8),
          Text("Queue: 042", style: TextStyle(fontWeight: FontWeight.bold)),
          Text("Est. wait: ~ 24 minutes"),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("OK"),
        ),
      ],
    ),
  );
}
