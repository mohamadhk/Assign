import 'package:flutter/material.dart';
import 'package:quiz/constants.dart';

class FormsScreen extends StatelessWidget {
  final _formsKey = GlobalKey<FormState>();

  final Map<String, String?> data = {
    "name": null,
    "email": null,
    "password": null
  };
  String? isValidName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String? isValidEmail(String? value) {
    final mailRegx = RegExp(MAIL_REGEX);
    if (value != null && value.isNotEmpty && mailRegx.hasMatch(value))
      return null;
    return "Please enter a valid email";
  }

  String? isValidPassword(String? value) {
    final passwordRegx = RegExp(PASSWORD_REGEX);
    if (value != null && value.isNotEmpty && passwordRegx.hasMatch(value))
      return null;
    return "please provide a stronger password ";
  }

  String? isValidConfirm(String? value) {
    if (data["password"] == value) return null;
    return "Password and confirm password must match";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child:
              Text('Registration Page', style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Center(
          child: Form(
              key: _formsKey,
              //autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Name', icon: Icon(Icons.person)),
                      validator: isValidName,
                      onChanged: ((value) => data["name"] = value),
                    ),
                    TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Email Address', icon: Icon(Icons.mail)),
                        validator: isValidEmail,
                        onChanged: ((value) => data["email"] = value)),
                    TextFormField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: const InputDecoration(
                            labelText: 'Password', icon: Icon(Icons.lock)),
                        validator: isValidPassword,
                        onChanged: ((value) => data["password"] = value)),
                    TextFormField(
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: const InputDecoration(
                          labelText: 'Confirm Password',
                          icon: Icon(Icons.lock)),
                      validator: isValidConfirm,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formsKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Register success",
                                  style: TextStyle(color: Colors.white))));
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
