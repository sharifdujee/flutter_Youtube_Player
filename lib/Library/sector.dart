import 'dart:math';

import 'package:flutter/material.dart';

class Sector {
  final Color color;
  final double value;
  final String title;

  Sector({required this.color, required this.value, required this.title});
}

List<double> get randomNumber{
  final Random random = Random();
  final randomNumber = <double> [];
  for(int i =0; i<=13; i++){
    randomNumber.add(random.nextDouble() *100);

  }
  return randomNumber;


}

List<Sector>  get industrySector{
  return [
    Sector(color: Colors.lightBlueAccent,
        value: randomNumber[0],
        title: 'IT'),
    Sector(color: Colors.greenAccent,
        value: randomNumber[1],
        title: 'Medicine'),
    Sector(color: Colors.green,
        value: randomNumber[2],
        title: 'Safety'),
    Sector(color: Colors.yellow,
        value: randomNumber[3],
        title: "Daily"),
    Sector(color: Colors.lightBlueAccent,
        value: randomNumber[4],
        title: 'Emergency'),
    Sector(color: Colors.white,
        value: randomNumber[5],
        title: 'NewsPapers'),
    Sector(color: Colors.cyanAccent,
        value: randomNumber[6],
        title: 'Tourist'),
    Sector(
        color: Colors.cyan,
        value:  randomNumber[7],
        title: 'VIP Movement'),
    Sector(
        color: Colors.cyan,
        value:  randomNumber[8],
        title: 'VIP Movement'),
    Sector(
        color: Colors.cyan,
        value:  randomNumber[9],
        title: 'VIP Movement'),
    Sector(
        color: Colors.cyan,
        value:  randomNumber[10],
        title: 'VIP Movement'),
    Sector(
        color: Colors.cyan,
        value:  randomNumber[11],
        title: 'VIP Movement'),


  ];

}