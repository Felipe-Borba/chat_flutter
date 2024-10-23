import 'package:chat_flutter/data/messages_data.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(),
        ),
        title: Text("Caio"),
      ),
      backgroundColor: Colors.blueGrey,
      body: ListView.builder(
        itemCount: chat["messages"].length,
        itemBuilder: (context, index) {
          var message = chat["messages"][index];
          var isSender = message["sender"] == "Caio";

          return Align(
            alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 6,
              ),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: isSender
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Text(message["message"]),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        message["created_at"],
                        style: TextStyle(fontSize: 10),
                      ),
                      message["sender"] == "Caio"
                          ? Icon(
                              Icons.check,
                              size: 18,
                              color:
                                  message["read"] ? Colors.blue : Colors.grey,
                            )
                          : SizedBox()
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
