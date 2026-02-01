import 'package:flutter/material.dart';

class Productcard extends StatefulWidget {
  const Productcard({super.key});

  @override
  State<Productcard> createState() => _ProductcardState();
}

class _ProductcardState extends State<Productcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.network("https://via.placeholder.com/150"),
          Text(
            "Product Name",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "100\$",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.green,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 16),
                  Text("Rating: 4.5"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
