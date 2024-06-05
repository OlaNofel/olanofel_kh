import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ola_nofel_test2/screens/home_screen.dart';
import '../model/model_chat.dart';
import '../service/chat_service.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black,
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
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
            SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<ModelChat>>(
                future: ChatDataImp().getAlldata(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("No data"));
                  } else if (snapshot.hasData) {
                    List<ModelChat> messagesChat = snapshot.data!;
                    return StatefulBuilder(
                      builder: (BuildContext context, setState) {
                        List<ModelChat> filteredMessages = messagesChat;

                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(17.0),
                              child: Container(
                                color: Colors.green[100],
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Search here..",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.green,
                                      ),
                                    ),
                                    suffixIcon: Icon(
                                      Icons.record_voice_over,
                                      color: Colors.grey,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      filteredMessages = messagesChat
                                          .where((chat) =>
                                              chat.message.contains(value))
                                          .toList();
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: filteredMessages.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            filteredMessages[index].image),
                                      ),
                                      title: Row(
                                        children: [
                                          Text(filteredMessages[index].name),
                                          SizedBox(width: 20),
                                          Expanded(
                                            child: Text(
                                              filteredMessages[index]
                                                  .unread_message_count
                                                  .toString(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      subtitle:
                                          Text(filteredMessages[index].message),
                                      trailing: Text(filteredMessages[index]
                                          .date
                                          .toString()),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return Center(child: Text("No messages available"));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
