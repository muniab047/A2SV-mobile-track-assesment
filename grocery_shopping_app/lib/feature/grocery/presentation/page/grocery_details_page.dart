import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_shopping_app/feature/grocery/domain/entity/grocery.dart';
import 'package:grocery_shopping_app/feature/grocery/presentation/bloc/grocery_bloc.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_icon.dart';
import '../widgets/custom_text.dart';
import '../widgets/loading.dart';
import '../widgets/product_image.dart';


class GroceryDetailsPage extends StatefulWidget {
  final GroceryEntity groceryEntity;

  const GroceryDetailsPage({required this.groceryEntity, super.key});

  @override
  State<GroceryDetailsPage> createState() => _GroceryDetailsPageState();
}

class _GroceryDetailsPageState extends State<GroceryDetailsPage> {
  bool _isExpanded = false; // State variable to manage text expansion
  List<bool> _checkboxValues = []; // State variable to manage checkboxes

  @override
  void initState() {
    super.initState();
    // Initialize checkbox states to false for each option
    _checkboxValues = List<bool>.filled(widget.groceryEntity.options.length, false);
  }

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<GroceryBloc>(context);

    double ratio(double num) {
      return num * MediaQuery.of(context).size.width / 350;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
        child: Column(
          children: [
            Stack(
              children: [
                ProductImageWidget(
                  image: widget.groceryEntity.image,
                  width: double.infinity,
                  height: ratio(250),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 10,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                        ratio(10), ratio(10), ratio(10), ratio(10)),
                    height: ratio(42),
                    decoration: const ShapeDecoration(
                      shape: CircleBorder(),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: CustomIconButtonWidget(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icons.keyboard_arrow_left_sharp,
                      color: const Color(0XFF3F51F3),
                      size: ratio(30),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              // Use Expanded to make the scrollable area take the remaining space
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(ratio(20), ratio(5), ratio(20), ratio(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: widget.groceryEntity.title,
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
                            text: widget.groceryEntity.rating.toString(),
                            color: const Color(0xFFAAAAAA),
                            weight: FontWeight.w400,
                            family: 'Sora',
                            size: 12,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomTextWidget(
                            text: '\$${widget.groceryEntity.discount.toString()}',
                            color: Colors.grey,
                            weight: FontWeight.w400,
                            family: 'Sora',
                            size: 12,
                           // decoration: TextDecoration.lineThrough, // Strikethrough
                          ),
                          SizedBox(width: 5), // Add some spacing between the discount and price
                          CustomTextWidget(
                            text: '\$${widget.groceryEntity.price.toString()}',
                            color: Colors.red,
                            weight: FontWeight.w400,
                            family: 'Sora',
                            size: 12,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ratio(10),
                      ),
                      SizedBox(
                        height: ratio(25),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.groceryEntity.description,
                            maxLines: _isExpanded ? null : 3, // If expanded, show all lines; otherwise, show 3
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: ratio(12),
                              color: const Color(0XFF666666),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: SizedBox()),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isExpanded = !_isExpanded; // Toggle expanded state
                                  });
                                },
                                child: Text(
                                  _isExpanded ? "See Less" : "See More",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ratio(50),
                      ),
                      Text(
                        'Additional Options',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      ListView.builder(
                        itemCount: widget.groceryEntity.options.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(), // Prevent ListView from scrolling
                        itemBuilder: (context, index) {
                          final options = widget.groceryEntity.options;
                          return ListTile(
                            title: Text(options[index].name),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('\$${options[index].price.toStringAsFixed(2)}'),
                                Checkbox(
                                  value: _checkboxValues[index],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _checkboxValues[index] = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                    offset: Offset(0.0, -3.0),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          // Decrement logic
                        },
                      ),
                      Text(
                        '1', // Counter value
                        style: TextStyle(fontSize: 18.0),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          // Increment logic
                        },
                      ),
                    ],
                  ),
                  FilledButton(
                    style: ElevatedButton.styleFrom(
                    // primary: Colors.orange, // Change button color to orange
                    backgroundColor: Colors.orange,
                    ),
                    onPressed: () {
                      // Button action
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Add to Basket',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
