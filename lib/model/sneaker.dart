import 'package:flutter/material.dart';

class Sneaker {
  final String id;
  final String name;
  final double price;
  final String imagePath;
  final String description;

  Sneaker({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.description,
    required this.id,
  });
}

final List<Sneaker> sneakersList = [
  Sneaker(
    name: 'Air Jordan',
    imagePath: 'lib/assets/images/airjordan.jpg',
    price: 30,
    description: 'sneaker',
    id: '1',
  ),
  Sneaker(
    name: 'Air Force',
    imagePath: 'lib/assets/images/airforce.jpg',
    price: 40,
    description: 'sneaker',
    id: '2',
  ),
  Sneaker(
    name: 'Air Max',
    imagePath: 'lib/assets/images/airmax.jpg',
    price: 52,
    description: 'sneaker',
    id: '3',
  ),
  Sneaker(
    name: 'Low Dunks',
    imagePath: 'lib/assets/images/lowdunks.jpg',
    price: 70,
    description: 'sneaker',
    id: '4',
  ),
  Sneaker(
    name: 'Air Retro',
    imagePath: 'lib/assets/images/airretro.jpg',
    price: 48,
    description: 'sneaker',
    id: '5',
  ),
];
