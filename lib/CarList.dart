import 'package:flutter/material.dart';
import 'package:kt55/models/car/car.dart';

class CarList extends StatelessWidget {
  final car;
  final index;
  const CarList({super.key, required this.car, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Color.fromARGB(255, 255, 255, 255),
        shape: RoundedRectangleBorder(
            side: BorderSide(
              color: const Color.fromARGB(255, 0, 0, 0),
              width: 2,
            )),
        child: ListTile(
          leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("$index")]),
          title: Text(
            '${car.brand} ${car.model}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Цена: ${car.price}\$, Цвет:  ${car.color}",
                style: TextStyle(color: Color.fromARGB(255, 54, 2, 2)),
              ),
            ],
          ),
        ));
  }
}