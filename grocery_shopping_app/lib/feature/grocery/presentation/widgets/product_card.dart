import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:grocery_shopping_app/feature/grocery/domain/entity/grocery.dart';

import 'custom_icon.dart';
import 'custom_text.dart';
import 'product_image.dart';

class ProductCardWidget extends StatelessWidget {
  final GroceryEntity groceryEntity;

  const ProductCardWidget({super.key, required this.groceryEntity});

  @override
  Widget build(BuildContext context) {
  

    return Card(
      child: Column(
        children: [
          ProductImageWidget(
            image: groceryEntity.image,
            height: 100,
            width: double.infinity,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            fit: BoxFit.cover,
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(15, 7, 15, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: groceryEntity.title,
                    color: const Color(0xFF3E3E3E),
                    weight: FontWeight.w500,
                    family: 'Poppins',
                    size: 20,
                    overflow: TextOverflow.ellipsis,
                  ),
               
                  Row(
                                
                    children: [
                  
                    const CustomIconWidget(
                      icon: Icons.star,
                      color: Colors.yellow,
                      size: 15,
                    ),
                  
                  CustomTextWidget(
                    text: groceryEntity.rating.toString(),
                    color: const Color(0xFFAAAAAA),
                    weight: FontWeight.w400,
                    family: 'Sora',
                    size: 12,
                  ),
                  ]),

                  Row(
                    children: [
                       CustomTextWidget(
                    text: '\$ ${groceryEntity.discount.toString()}',
                    color: const Color(0xFFAAAAAA),
                    weight: FontWeight.w500,
                    family: 'Sora',
                    size: 15,
                  ),

                  SizedBox(width: 5),

                   CustomTextWidget(
                    text: '\$ ${groceryEntity.price.toString()}',
                    color: Colors.red,
                    weight: FontWeight.w500,
                    family: 'Sora',
                    size: 15,
                  ),

                    ],
                  )
        ],
      ),
    )


        ]
        
      ));
  }
}
