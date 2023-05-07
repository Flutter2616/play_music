import 'package:flutter/material.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({Key? key}) : super(key: key);

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,height: double.infinity,
      child: Image.network("https://wallpapercave.com/wp/wp5510430.jpg",fit: BoxFit.fill),
    );
  }
}
