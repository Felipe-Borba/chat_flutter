import 'package:chat_flutter/components/custom_input.dart';
import 'package:chat_flutter/services/firestore_service.dart';
import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedbacks"),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: 24,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(),
            title: Text("nome usuário"),
            subtitle: Text("feedback "),
            trailing: Text("10/10"),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 2,
              ),
            ),
            SizedBox(width: 8),
            Container(
              height: 70,
              width: 70,
              child: ElevatedButton(
                onPressed: () async {
                  await FirestoreService().postFeedback("todo");
                },
                child: Icon(Icons.send),
              ),
            ),
            SizedBox(width: 8),
            Container(
              height: 70,
              width: 70,
              child: ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.mic),
              ),
            )
          ],
        ),
      ),
    );
  }
}
