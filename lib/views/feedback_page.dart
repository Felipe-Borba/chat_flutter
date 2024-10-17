import 'package:chat_flutter/components/custom_input.dart';
import 'package:chat_flutter/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FeedbackPage extends StatefulWidget {
  FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  TextEditingController messageController = TextEditingController();

  var feedbacks;

  @override
  void initState() {
    super.initState();

    feedbacks = FirestoreService().getFeedback();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedbacks"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            feedbacks = FirestoreService().getFeedback();
          });
        },
        child: FutureBuilder(
          future: feedbacks,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                var data = snapshot.data[index];
                Timestamp date = data["created_at"];
                var formatedDate = DateFormat("dd/MM").format(date.toDate());

                return ListTile(
                  leading: CircleAvatar(),
                  title: Text(data["user"].toString()),
                  subtitle: Text(data["message"].toString()),
                  trailing: Text(formatedDate),
                );
              },
            );

            // throw Exception(snapshot.connectionState);
          },
        ),
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
                controller: messageController,
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
                child: Icon(Icons.mic),
              ),
            ),
            SizedBox(width: 8),
            Container(
              height: 70,
              width: 70,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    var message = await FirestoreService()
                        .postFeedback(messageController.text);

                    messageController.clear();
                  } catch (e) {
                    print(e);
                  }
                },
                child: Icon(Icons.send),
              ),
            )
          ],
        ),
      ),
    );
  }
}
