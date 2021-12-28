// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:netflix_clone_app/feature/domain/entities/on_boarding_entity.dart';
import 'package:netflix_clone_app/feature/presentation/pages/choose_your_plan_page.dart';
import 'package:netflix_clone_app/feature/presentation/widgets/header_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _onBoardingData = OnBoardingEntity.onBoardingData;
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            _pageViewBuilder(),
            _columnWidget(),
            HeaderWidget(),
          ],
        ),
      ),
    );
  }

  Widget _pageViewBuilder() {
    return PageView.builder(
      itemCount: _onBoardingData.length,
      onPageChanged: (index) {
        setState(() {
          _currentPageIndex = index;
        });
      },
      itemBuilder: (context, index) => Stack(
        fit: StackFit.passthrough,
        children: [
          index == 3
              ? Container(
                  height: double.infinity,
                  child: Image.asset(
                    _onBoardingData[index].image,
                    fit: BoxFit.cover,
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(
                    bottom: 40,
                  ),
                  child: Image.asset(_onBoardingData[index].image),
                ),
          index == 3
              ? Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(0.9, 0.0),
                        end: Alignment(0.8, 0.4),
                        colors: [
                          Colors.black.withOpacity(0.5),
                          Colors.black.withOpacity(0.1),
                          Colors.black.withOpacity(0.9),
                        ]),
                  ),
                )
              : Container(),
          Container(
            margin: EdgeInsets.only(
              top: 230,
              left: 40,
              right: 40,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _onBoardingData[index].heading,
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  _onBoardingData[index].description,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _columnWidget() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _onBoardingData.map((data) {
                int index = _onBoardingData.indexOf(data);
                return Container(
                  height: 10,
                  width: 10,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color:
                        index == _currentPageIndex ? Colors.red : Colors.grey,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChooseYourPlanPage(),
                  ));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 10, right: 15, left: 15),
              padding: EdgeInsets.symmetric(vertical: 12),
              width: double.infinity,
              alignment: Alignment.center,
              // height: 50,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text('GET STARTED'),
            ),
          ),
        ],
      ),
    );
  }
}
