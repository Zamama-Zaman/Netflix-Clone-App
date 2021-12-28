// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:netflix_clone_app/feature/domain/entities/popular_movies_data.dart';

class Detailpage extends StatelessWidget {
  final PopularList list;

  const Detailpage({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              topBar(),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 8,
                    height: MediaQuery.of(context).size.height - 260,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 8,
                    height: MediaQuery.of(context).size.height - 260,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            child: Stack(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 130),
                                  child: Text(
                                    list.name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        fontFamily: 'MagnumSansMedium'),
                                  ),
                                ),
                                Positioned(
                                    top: 12,
                                    right: 0,
                                    child: Text(
                                      list.rating,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'MagnumSansBold'),
                                    ))
                              ],
                            ),
                          ),
                          Moviedata(
                            rating: list.rating,
                            dname: list.directorname,
                            release: list.release,
                          ),
                          Expanded(
                            child: FittedBox(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Description',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      list.description,
                                      style:
                                          TextStyle(fontSize: 15, height: 1.4),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox topBar() {
    return SizedBox(
      height: 250,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[BlueBar(list.image), MoviePoster(list.image)],
      ),
    );
  }
}

class BlueBar extends StatelessWidget {
  final String image;

  const BlueBar(this.image, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return ControlledAnimation(
    //   duration: Duration(milliseconds: 600),
    //   tween: Tween<double>(begin: 0, end: 250),
    //   builder: (context, animation) {
    return Container(
      // height: animation,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String image;

  const MoviePoster(this.image, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final size = MediaQuery.of(context).size;
    return
        // ControlledAnimation(
        //   duration: Duration(milliseconds: 600),
        //   delay: Duration(milliseconds: (300 * 2).round()),
        //   tween: Tween<double>(begin: 0, end: 1),
        //   curve: Curves.elasticInOut,
        //   builder: (context, scalevalue) {
        //     return
        Positioned(
      top: 170,
      left: 8,
      //   child:
      //  Transform.scale(
      //     scale: scalevalue,
      //     alignment: Alignment.center,
      child: Container(
        height: 140,
        width: 100,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(6.0),
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              BoxShadow(
                  offset: Offset(0.5, 1.0), blurRadius: 5, color: Colors.white)
            ]),
      ),
    );
  }
}

class Moviedata extends StatefulWidget {
  final String release, dname, rating;
  // final Icon icon;

  const Moviedata(
      {Key? key,
      required this.rating,
      required this.release,
      required this.dname})
      : super(key: key);

  @override
  _MoviedataState createState() => _MoviedataState();
}

class _MoviedataState extends State<Moviedata> {
  List<Movieinfo> data = [];

  @override
  void initState() {
    super.initState();
    data.add(Movieinfo(
        "Rating",
        widget.rating,
        Icon(
          Icons.star_border,
          size: 46,
        )));
    data.add(Movieinfo(
        "Release",
        widget.release,
        Icon(
          Icons.screen_lock_landscape,
          size: 46,
        )));
    data.add(Movieinfo(
      "Director",
      widget.dname,
      Icon(
        Icons.people_outline,
        size: 46,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 3 - 4,
      margin: EdgeInsets.only(top: 20),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, int index) {
            return Container(
              margin: EdgeInsets.only(
                  right: index == 0 ? 10 : 0,
                  left: index == data.length - 1 ? 10 : 0),
              width: MediaQuery.of(context).size.width / 3 - 23,
              height: MediaQuery.of(context).size.width / 3 - 23,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey)),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      data[index].rating,
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      data[index].release,
                      style:
                          TextStyle(fontFamily: 'MagnumSansBold', fontSize: 12),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    data[index].icon
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class Movieinfo {
  String rating, release;
  Icon icon;

  Movieinfo(this.rating, this.release, this.icon);
}
