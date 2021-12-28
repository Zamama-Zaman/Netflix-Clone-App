// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:netflix_clone_app/feature/presentation/pages/sign_in_page.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 70,
            width: 70,
            child: Image.asset('assets/images/n_symbol.png'),
          ),
          Row(children: [
            Text('PRVIACY'),
            SizedBox(
              width: 10,
            ),
            Text('HELP'),
            SizedBox(
              width: 10,
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInPage(),
                    ),
                  );
                },
                child: Container(
                    alignment: Alignment.center,
                    // width: 50,
                    height: 50,
                    child: Text('SIGN IN'))),
            SizedBox(
              width: 10,
            ),
          ]),
        ],
      ),
    );
  }
}
