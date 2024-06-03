import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
          padding: EdgeInsets.all(50),
          height: 852,
          width: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/box.png"),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.center,
                width: 333,
                height: 47,
                margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Text(
                  "shared you invite code",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.center,
                width: 333,
                height: 47,
                margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2),
                  color: Colors.green[200],
                ),
                child: Text(
                  "invite friends",
                ),
              )
            ],
          )),
    );
  }
}
