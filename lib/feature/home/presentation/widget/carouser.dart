import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ntigradproject/core/utils/app_icon.dart';
import 'package:ntigradproject/feature/home/manage/slider/slider_cubit.dart';

class Carouser extends StatefulWidget {
  const Carouser({super.key});

  @override
  State<Carouser> createState() => _CarouserState();
}

class _CarouserState extends State<Carouser> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items:
          [1, 2, 3].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber,
                  ),
                  child: SvgPicture.asset(AppIcon.slider),
                );
              },
            );
          }).toList(),
      options: CarouselOptions(viewportFraction: 1, autoPlay: true),
    );
  }
}
