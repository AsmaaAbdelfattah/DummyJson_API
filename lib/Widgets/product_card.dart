import 'package:api_dio_app/Models/product_model.dart' show ProductModel;
import 'package:flutter/material.dart';

class Productcard extends StatelessWidget {
  const Productcard({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          
          Image.network(
            product.image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Text(
            product.title,
            textAlign: TextAlign.start,
            maxLines: 2,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
       SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${product.price}\$",
                style: TextStyle(
                  fontSize: 14,
                    overflow: TextOverflow.ellipsis, 
                  fontWeight: FontWeight.normal,
                  color: Colors.green,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 16),
                  Text("${product.rating}"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
