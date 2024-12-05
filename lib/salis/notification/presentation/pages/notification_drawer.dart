import 'package:flutter/material.dart';

class NotificationDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const NotificationDrawer({
    super.key,
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        'title': 'Payment Reminder',
        'message': 'Your next installment is due in 3 days.',
        'date': '5 Dec 2024',
        'isNew': true,
      },
      {
        'title': 'Property Update',
        'message': 'Your property inspection is scheduled.',
        'date': '4 Dec 2024',
        'isNew': false,
      }
    ];

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Notifications',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return Dismissible(
                    key: Key("${notification['title']}"),
                    onDismissed: (direction) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                '${notification['title'] ?? 'Notification'} dismissed')),
                      );
                    },
                    background: Container(color: Colors.red),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: notification['isNew'] as bool
                            ? Colors.green
                            : Colors.grey,
                        child: Icon(
                          (notification['isNew'] as bool)
                              ? Icons.notifications_active
                              : Icons.notifications_none,
                          color: Colors.white,
                        ),
                      ),
                      title: Text("${notification['title']}"),
                      subtitle: Text("${notification['message']}"),
                      trailing: Text(
                        "${notification['date']}",
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
