import 'dart:developer';

import 'package:api_dio_app/Models/ProductModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  
  runApp(const MyApp());
}
Future<List<ProductModel>> getApiRequest() async {
  final dio = Dio();
  final response = await dio.get('https://dummyjson.com/products');
  log("response: ${response.data["total"].toString()}");
  return ProductModel.mapList(response.data["products"]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder<List<ProductModel>>(
          future: getApiRequest(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].title
                  ,style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),),
                  
                  subtitle: Text("Price: ${snapshot.data![index].price} $"),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
