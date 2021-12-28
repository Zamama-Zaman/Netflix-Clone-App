// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:netflix_clone_app/feature/domain/entities/b_movies.dart';
import 'package:netflix_clone_app/feature/presentation/pages/home_page/detail_page.dart';
import 'package:netflix_clone_app/feature/presentation/pages/home_page/image_slider.dart';
import 'package:netflix_clone_app/feature/presentation/pages/home_page/popular_movies.dart';
import 'package:netflix_clone_app/feature/domain/entities/popular_movies_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  List<String> text = [
    'The Great Hack',
  ];
  List<String> photos = [
    'assets/images/the_great_hack_2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    popMovies(PopularList plist) => InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Detailpage(
                  list: plist,
                ),
              ),
            );
          },
          child: PopularMovie(
            image: plist.image,
            name: plist.name,
            rating: plist.rating,
          ),
        );

    final popularscroll = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        //  children:bmovies1.map((movie)=>bestm(movie)).toList()
        children: populartlist.map((pl) => popMovies(pl)).toList(),
      ),
    );
    bestm(BMovies movie) => TopMovies(
          image: movie.image,
        );
    final scroll = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: bmovies1.map((movie) => bestm(movie)).toList(),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Netflix",
          style: TextStyle(color: Colors.red, fontSize: 28),
        ),
        backgroundColor: Colors.black,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.notifications,
              color: Colors.red,
              size: 25,
            ),
          )
        ],
        //  toolbarOpacity: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ImageData(image: photos[index], name: text[index]),
            SizedBox(height: 20.0),
            scroll,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Continue Watching",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            ImageSlider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Popular On Netflix",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        color: Colors.red),
                  )
                ],
              ),
            ),
            popularscroll,
          ],
        ),
      ),
    );
  }
}

class ImageData extends StatelessWidget {
  final String image;
  final String name;
  const ImageData({Key? key, required this.image, required this.name})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: EdgeInsets.only(
        bottom: 10.0,
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.contain,
          ),
          borderRadius: BorderRadius.circular(8.0)),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          name,
          style: TextStyle(
            backgroundColor: Colors.black12,
            color: Colors.white.withOpacity(
              .8,
            ),
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
          ),
        ),
      ),
    );
  }
}

class TopMovies extends StatelessWidget {
  final String image;
  const TopMovies({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipOval(
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0.5, 1.0),
                    blurRadius: 5,
                    color: Colors.white)
              ]),
        ),
      ),
    );
  }
}
