import 'package:flutter/material.dart';
import 'package:karim_navigator_task/mainShell.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<Loginscreen> {
  bool state = true;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  String getUsername() {
    return username.text;
  }

  final stateForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Center(child: Text("login screen")),
      ),
      body: Form(
        key: stateForm,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(" welcome to login screen", style: TextStyle(fontSize: 30)),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.all(9.0),
                child: TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "username is required";
                    }
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: "username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  controller: username,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: TextFormField(
                  obscureText: state,
                  controller: password,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "password is required";
                    }
                    if (value.length < 6) {
                      return "password must be at least 6 characters";
                    }
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.password),
                    suffixIcon: IconButton(
                      icon: state
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          state = !state;
                        });
                      },
                    ),
                    labelText: "password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 120,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (stateForm.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Mainshell(usernamee: username.text),
                        ),
                      );
                    }
                  },
                  child: Text("login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
