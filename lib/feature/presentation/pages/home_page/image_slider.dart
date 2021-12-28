import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imglist = [
  "assets/images/our_planet_1.jpg",
  "assets/images/the_great_hack_1.jpg",
  "assets/images/our_planet_2.jpg",
  "assets/images/harry_potter_and_the_deathly_hallows_part2_1.jpg",
  "assets/images/The_lord_of_the_rings_gollum_1.jpg",
  "assets/images/house_of_secrets_1.jpg",
  "assets/images/inside_bill_gates_1.jpg",
  "assets/images/the_white_helmets_1.jpg",
  "assets/images/The_lord_of_the_rings_2.jfif"
];

class ImageSlider extends StatelessWidget {
  ImageSlider({Key? key}) : super(key: key);

  final CarouselSlider mostwatch = CarouselSlider(
    items: imglist.map((url) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(url),
                fit: BoxFit.fitWidth,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0.2, 1.0),
                    blurRadius: 2,
                    color: Colors.white)
              ]),
        ),
      );
    }).toList(),
    options: CarouselOptions(
      autoPlay: true,
      viewportFraction: 0.9,
      aspectRatio: 2.4,
      enlargeCenterPage: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return mostwatch;
  }
}
