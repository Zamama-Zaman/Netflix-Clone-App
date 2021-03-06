// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_app/feature/presentation/pages/create_your_account.dart';
import 'package:netflix_clone_app/feature/presentation/widgets/header_widget.dart';

class PlansPage extends StatefulWidget {
  const PlansPage({Key? key}) : super(key: key);

  @override
  State<PlansPage> createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  int _selectedPlan = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: false,
          flexibleSpace: HeaderWidget(),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('STEP 1 OF 3'),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Choose the plan that's right for you",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Downgrade or upgrade at anytime"),
                SizedBox(
                  height: 15,
                ),
                _rowButtonWidget(),
                _plans(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _rowButtonWidget() {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                _selectedPlan = 0;
              });
            },
            child: _singleRowButton(
              text: "Basic",
              color: _selectedPlan == 0 ? Colors.red : Colors.red.shade300,
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                _selectedPlan = 1;
              });
            },
            child: _singleRowButton(
              text: "Standard",
              color: _selectedPlan == 1 ? Colors.red : Colors.red.shade300,
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                _selectedPlan = 2;
              });
            },
            child: _singleRowButton(
              text: "Premium",
              color: _selectedPlan == 2 ? Colors.red : Colors.red.shade300,
            ),
          ),
        ),
      ],
    );
  }

  Widget _singleRowButton({required Color color, required String text}) {
    return Container(
      margin: EdgeInsets.all(4),
      height: 50,
      alignment: Alignment.center,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(4), color: color),
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _plans() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 15,
          ),
          Text("Monthly Price"),
          SizedBox(
            height: 15,
          ),
          _monthlyPriceWidget(),
          SizedBox(
            height: 15,
          ),
          _videoQualityWidget(),
          SizedBox(
            height: 15,
          ),
          _resolutionWidget(),
          SizedBox(
            height: 15,
          ),
          Text("Screens you can watch on at the same time"),
          SizedBox(
            height: 15,
          ),
          _screensYouWatchWidget(),
          SizedBox(
            height: 15,
          ),
          Text("Watch on your laptop, TV Phones and Tablet"),
          SizedBox(
            height: 15,
          ),
          _watchOnAnyDeviceWidget(),
          SizedBox(
            height: 15,
          ),
          Text("Unlimited files and TV Programmers"),
          SizedBox(
            height: 15,
          ),
          _watchOnAnyDeviceWidget(),
          SizedBox(
            height: 15,
          ),
          Text("Cancel at any time"),
          SizedBox(
            height: 15,
          ),
          _watchOnAnyDeviceWidget(),
          SizedBox(
            height: 15,
          ),
          Text(
            "HD (720p), full HD (1080p), Ultra HD (4k) and HDR availability subject to your internet service and device capabilities. Not all content available in HD, Full HD, Ultra HD or HDR. See Terms Use For More Details,",
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CreateYourAccountPage(),
                ),
              );
            },
            child: Container(
              height: 30,
              width: double.maxFinite,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Text("CONTINUE"),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _monthlyPriceWidget() {
    if (_selectedPlan == 0) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "Rs950",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "Rs1,200",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "Rs1,500",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1.5,
          )
        ],
      );
    } else if (_selectedPlan == 1) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "Rs950",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "Rs1,200",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "Rs1,500",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1.5,
          )
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "Rs950",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "Rs1,200",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "Rs1,500",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1.5,
          )
        ],
      );
    }
  }

  Widget _videoQualityWidget() {
    if (_selectedPlan == 0) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "Good",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "Better",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "Best",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1.5,
          )
        ],
      );
    } else if (_selectedPlan == 1) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "Good",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "Better",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "Best",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1.5,
          )
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "Good",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "Better",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "Best",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1.5,
          )
        ],
      );
    }
  }

  Widget _resolutionWidget() {
    if (_selectedPlan == 0) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "480p",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "1080p",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "4k+HDR",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1.5,
          )
        ],
      );
    } else if (_selectedPlan == 1) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "480p",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "1080p",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "4k+HDR",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1.5,
          )
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "480p",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "1080p",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "4k+HDR",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1.5,
          )
        ],
      );
    }
  }

  Widget _screensYouWatchWidget() {
    if (_selectedPlan == 0) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "1",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "2",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "4",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1.5,
          )
        ],
      );
    } else if (_selectedPlan == 1) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "1",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "2",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "4",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1.5,
          )
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "1",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "2",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "4",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1.5,
          )
        ],
      );
    }
  }

  Widget _watchOnAnyDeviceWidget() {
    if (_selectedPlan == 0) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Icon(
                    Icons.done,
                    color: Colors.red,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Icon(
                    Icons.done,
                    color: Colors.grey,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Icon(
                    Icons.done,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1.5,
          )
        ],
      );
    } else if (_selectedPlan == 1) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Icon(
                    Icons.done,
                    color: Colors.grey,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Icon(
                    Icons.done,
                    color: Colors.red,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Icon(
                    Icons.done,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1.5,
          )
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Icon(
                    Icons.done,
                    color: Colors.grey,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Icon(
                    Icons.done,
                    color: Colors.grey,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Icon(
                    Icons.done,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1.5,
          )
        ],
      );
    }
  }
}
