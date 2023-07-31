import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitterclone/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _signInKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _signInKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const FaIcon(FontAwesomeIcons.twitter,
             color: Colors.blue, 
             size: 70,
             ),
            const SizedBox(
              height: 20,
              ),
            const Text("Log in to Twitter", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 30, 15, 0),
              padding: const EdgeInsets.symmetric(vertical: 10,),
              decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(30),
              ),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20,
                  ),
                ),
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  } else if (!emailValid.hasMatch(value)) {
                    return "Please enter a valid email address";
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.symmetric(vertical: 10,),
              decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(30),
              ),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20,
                  ),
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Please enter a password";
                  } else if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),
            ),
            Container(
              width: 200,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(30)),
              child: TextButton(
                onPressed: () {
                  if (_signInKey.currentState!.validate()) {
                  debugPrint("Email: ${emailController.text}");
                  debugPrint("Password: ${passwordController.text}");
                  }
                },
                child: const Text('Log In', style: TextStyle(color: Colors.white, fontSize: 18),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const SignUp()));
                },
                child: const Text("Don't have an account? Sign up here")),
            ),
          ],
        ),
      ),
    );
  }
}