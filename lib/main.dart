import 'dart:developer';

import 'package:api_dio_app/Models/product_model.dart';
import 'package:api_dio_app/Widgets/product_card.dart' show Productcard;
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
        backgroundColor: Colors.grey[300],
        body: FutureBuilder<List<ProductModel>>(
          future: getApiRequest(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              return Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10,bottom: 10),
                child: GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 200,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (contect, index) {
                    return Productcard(product: snapshot.data![index]);
                  },
                ),
              );
            }

            return Center(child: Text("No data found",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),));
          },
        ),
      ),
    );
  }
}
