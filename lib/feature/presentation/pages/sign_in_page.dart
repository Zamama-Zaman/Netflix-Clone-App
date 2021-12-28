// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              _headerWidget(),
              SizedBox(height: 10),
              _formWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 50,
            alignment: Alignment.center,
            child: Icon(Icons.arrow_back),
          ),
        ),
        SizedBox(
          height: 40,
          child: Image.asset('assets/images/logo.png'),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }

  Widget _formWidget() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
                labelText: 'Email or phone number',
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
                labelText: 'Password',
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              vertical: 15,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.grey.shade600,
              ),
            ),
            child: Text('SignIn'),
          ),
          SizedBox(
            height: 15,
          ),
          Text('Need Help?'),
          SizedBox(height: 15),
          Text(
            'New to Netflix? Sign up now.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Sign-in is protected by Google reCAPTCHA to ensure you're not a bot. Learn more.",
            style: TextStyle(
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
