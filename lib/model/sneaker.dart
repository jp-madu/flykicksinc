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
    imagePath: '/',
    price: 30,
    description: 'sneaker',
    id: '1',
  ),
  Sneaker(
    name: 'Air Force',
    imagePath: '/',
    price: 40,
    description: 'sneaker',
    id: '2',
  ),
  Sneaker(
    name: 'Air Max',
    imagePath: '/',
    price: 52,
    description: 'sneaker',
    id: '3',
  ),
  Sneaker(
    name: 'Low Dunks',
    imagePath: '/',
    price: 70,
    description: 'sneaker',
    id: '4',
  ),
  Sneaker(
    name: 'Air Retro',
    imagePath: '/',
    price: 48,
    description: 'sneaker',
    id: '5',
  ),
];
