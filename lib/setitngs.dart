import 'package:flutter/material.dart';
import 'package:karim_navigator_task/loginScreen.dart';

class Setitngs extends StatelessWidget {
  final String user;
  Setitngs({required this.user});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> devInfo = [
      {"title": "Name", "value": user},
      {"title": "Email", "value": "dev@example.com"},
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 60),
        child: Center(
          child: Column(
            children: [
              Text(
                "Welcome, Developer!",
                style: TextStyle(fontSize: 31, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 400,

                  child: ListView.builder(
                    itemCount: devInfo.length,
                    itemBuilder: (context, index) {
                      return Text(
                        "${devInfo[index]["title"]} : ${devInfo[index]["value"]}",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    },
                  ),
                ),
              ),

              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.red),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Loginscreen()),
                      (route) =>false
                        
                        
                     
                    );
                  },
                  child: Text(
                    "LOG OUT",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
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
  }
}
