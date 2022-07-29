import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:TIXCLONE/dummy_data.dart';
import 'package:TIXCLONE/form/formDaftar.dart';
import 'package:TIXCLONE/main.dart';
import 'package:TIXCLONE/form/formLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class formLogin extends StatefulWidget {
  const formLogin({Key? key}) : super(key: key);

  @override
  State<formLogin> createState() => _formLoginState();
}

class _formLoginState extends State<formLogin> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String errorMessage = '';

  bool isDark = false;

  saveToLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isDark", isDark);
  }

  getLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool("isDark") ?? false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Image.network(
          'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco,dpr_1/fqd7bfjhay48dq0q0xjg',
          width: 200,
          height: 75,
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: InkWell(
              child: isDark
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode),
              onTap: () {
                isDark = !isDark;
                saveToLocalStorage();
                setState(() {});
              },
            ),
          )
        ],
        backgroundColor: isDark
            ? Color.fromARGB(255, 105, 105, 105)
            : Color.fromARGB(255, 212, 212, 212),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Scaffold(
      backgroundColor:
          isDark ? Color.fromARGB(255, 161, 161, 161) : Colors.white,
      body: Form(
        key: _key,
        child: Container(
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                        child: Image.network(
                            'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco,dpr_1/fqd7bfjhay48dq0q0xjg')),
                    TextFormField(
                      controller: emailController,
                      validator: validateEmail,
                      decoration: new InputDecoration(
                        hintText: "Email",
                        icon: Icon(Icons.person),
                      ),
                    ),
                    TextFormField(
                      controller: passwordController,
                      validator: validatePassword,
                      obscureText: true,
                      decoration: new InputDecoration(
                        hintText: "Password",
                        icon: Icon(Icons.password),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(errorMessage),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_key.currentState!.validate()) {
                          try {
                            final FirebaseAuth _auth = FirebaseAuth.instance;
                            await _auth.signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Login Berhasil!'),
                            ));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MyBottomNavigationBar()),
                            );
                          } on FirebaseAuthException catch (error) {
                            errorMessage = error.message!;
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Email or password is wrong'),
                            ));
                          }
                        }
                        //login();
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style:
                          ElevatedButton.styleFrom(primary: Colors.blue[900]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Belum memiliki akun?"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => formDaftar()),
                                );
                              },
                              child: Text(
                                "Daftar disini",
                                style: TextStyle(color: Colors.blue[900]),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validateEmail(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty) {
      return 'E-mail address is required';
    }
    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formEmail)) {
      return 'Invalid E-mail Address Format';
    }
    return null;
  }

  String? validatePassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  // login() async {
  //   for (int i = 0; i < DummyData.data.length; i++) {
  //     try {
  //       if (DummyData.data[i]['username'] == usernameController.text &&
  //           DummyData.data[i]['password'] == passwordController.text) {
  //         print('Berhasil');
  //         print(DummyData.data[i]['username']);
  //         final SharedPreferences sharedPreferences =
  //             await SharedPreferences.getInstance();
  //         sharedPreferences.setString('nama', DummyData.data[i]['nama']);
  //       }
  //     } catch (error) {
  //       print(error);
  //     }
  //   }
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => MyBottomNavigationBar()),
  //   );
  // }
}
