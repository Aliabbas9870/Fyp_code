import 'package:flutter/material.dart';
import 'package:fypapp/chatbot/AssistantBot.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  // List of mock messages and notifications
  List<String> messages = ["AI Assistant"];
  List<String> notifications = [
    "Your appointment is confirmed",
    "Offer on haircuts",
    "Reminder: Visit us!"
  ];

  bool showMessages = true;

  // Sample function to simulate navigating to a chatbot
  void openChatBot(String message) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AssistantBot(message: message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  showMessages = true;
                });
              },
              child: Text("Messages",
                  style: GoogleFonts.manrope(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  showMessages = false;
                });
              },
              child: Text("Notifications",
                  style: GoogleFonts.manrope(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
      body: showMessages ? buildMessagesView() : buildNotificationsView(),
    );
  }

  // Function to display the messages view
  Widget buildMessagesView() {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text(messages[index]),
          onTap: () => openChatBot(messages[index]),
        );
      },
    );
  }

  // Function to display the notifications view
  Widget buildNotificationsView() {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(notifications[index]),
          trailing: Text(TimeOfDay.now().format(context)),
        );
      },
    );
  }
}
