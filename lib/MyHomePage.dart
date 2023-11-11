import 'package:flutter/material.dart';
import 'package:kt55/status.dart';
import 'package:kt55/CarList.dart';
import 'package:dio/dio.dart';
import 'models/car/car.dart';
import 'models/gatCars/getCars.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var url = 'https://myfakeapi.com/api/cars';
  Dio client = Dio();
  var cars = <Car>[];
  NetworkStatus networkStatus = NetworkStatus.init;
  Future<void> getData() async {
    networkStatus = NetworkStatus.loading;
    setState(() {});
    var response = await client.get(url);

    cars = GetCars.fromJson(response.data).cars;
    networkStatus = NetworkStatus.success;
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (networkStatus == NetworkStatus.loading)
                const CircularProgressIndicator()
              else
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: ElevatedButton(
                    onPressed: getData,
                    child: Text("Перезагрузить"),
                  ),
                ),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: cars.length,
                itemBuilder: (context, index) {
                  return CarList(car: cars[index], index: index + 1);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}