import 'package:flutter/material.dart';

AppBar appHeader(String title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    actions: [
      Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.notifications_none),
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

                      /// TITLE
                      const Text(
                        "Notifications Enabled",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 14),

                      /// BODY
                      const Text(
                        "You will be notified when your queue is near\nand when it is your turn.\n\n"
                        "You don’t need to wait at the room entrance.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),
                      ),

                      const SizedBox(height: 18),

                      /// INFO BOX
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
                                Text("Queue",style: TextStyle(fontWeight: FontWeight.bold)),
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

                      /// BUTTON
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF2C94C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
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
      const SizedBox(width: 8),
    ],
  );
}
