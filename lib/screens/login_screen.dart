import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'r',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                Text('i',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Color.fromARGB(255, 152, 206, 154))),
                Text('i',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Color.fromARGB(255, 152, 206, 154))),
                Text(
                  'd',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                Text(
                  'e',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Text('Welcome to RIIDE',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.white)),
          SizedBox(
            height: 50,
          ),
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
              border:
                  UnderlineInputBorder(borderRadius: BorderRadius.circular(15)),
              labelText: 'UserName',
            ),
          ),
          SizedBox(
            height: 50,
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
                border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(15)),
                labelText: 'Password',
                prefixIconColor: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'remember',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.white),
                ),
                Text(
                  'Forget Password',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 152, 206, 154)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                width: 333,
                height: 47,
                margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 152, 206, 154)),
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don’t have an account ?',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    )),
                Text('Sign up',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 152, 206, 154),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
