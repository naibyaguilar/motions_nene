import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

import '../model/item_navigation';
import '../screens/home_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();
    slides.add(Slide(
        title: 'Consiente',
        styleTitle: const TextStyle(
            color: Color.fromARGB(255, 157, 75, 250),
            fontSize: 80,
            fontFamily: 'Hunters'),
        description:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
        styleDescription: const TextStyle(
            color: Colors.white, fontSize: 25, fontFamily: 'ComicSans'),
        pathImage: "assets/images/slider/motherhood_cuate.png",
        widthImage: 500.0,
        heightImage: 500.0,
        backgroundColor: const Color(0XFFC2D0FF)));
    slides.add(Slide(
        title: 'Administra',
        styleTitle: const TextStyle(
            color: Color(0XFF9D4BFA), fontSize: 80, fontFamily: 'Hunters'),
        description:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
        styleDescription: const TextStyle(
            color: Colors.white, fontSize: 25, fontFamily: 'ComicSans'),
        pathImage: 'assets/images/slider/teddybear_cuate.png',
        widthImage: 500.0,
        heightImage: 500.0,
        backgroundColor: const Color(0XFFD1E9D1)));
    slides.add(Slide(
        title: 'Cuida',
        styleTitle: const TextStyle(
            color: Color(0XFF9D4BFA), fontSize: 80, fontFamily: 'Hunters'),
        description:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
        styleDescription: const TextStyle(
            color: Colors.white, fontSize: 25, fontFamily: 'ComicSans'),
        pathImage: 'assets/images/slider/babyccuate.png',
        widthImage: 500.0,
        heightImage: 500.0,
        backgroundColor: const Color(0XFFF2ACC6)));
  }

  void onDonerPress() {
    //Navigator.pushReplacementNamed(context, '/');
    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()),);
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      renderSkipBtn: const Text(
        'Omitir',
        style: TextStyle(color: Colors.black, fontSize: 25),
      ),
      renderNextBtn: const Icon(Icons.arrow_forward_ios_outlined,
          color: Colors.black, size: 36),
      renderDoneBtn: const Text(
        'Comenzar',
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
      onDonePress: onDonerPress,
    );
  }
}

class XFFFADA64 {}
