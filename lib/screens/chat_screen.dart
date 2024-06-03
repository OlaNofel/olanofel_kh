import 'package:flutter/material.dart';
import 'package:my_test_flutter_ui_2/model/model_chat.dart';
import 'package:my_test_flutter_ui_2/service/chat_service.dart';

class ChatScreen extends StatelessWidget {
  // List<ChatData> result = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black,
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Invite Friends',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black,
                    ),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Icon(Icons.search), Text('search here....')]),
            SizedBox(
              height: 70,
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Column(children: [
                FutureBuilder<List<ModelChat>>(
                  future: ChatDataImp().getAllQuiz(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage(snapshot.data![index].image),
                              ),
                              title: Row(
                                children: [
                                  Text(
                                    snapshot.data![index].name,
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Text(
                                      snapshot.data![index].message_count
                                          .toString(),
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Text(snapshot.data![index].message),
                              trailing:
                                  Text(snapshot.data![index].date.toString()),
                            );
                          });
                    } else if (snapshot.hasError) {
                      return Text("No data");
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ]),
            ),
          ]),
        ));
  }
}
