import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:grocery_shopping_app/feature/grocery/domain/entity/grocery.dart';
import 'package:grocery_shopping_app/feature/grocery/presentation/bloc/grocery_bloc.dart';

import '../widgets/card_grid_view.dart';
import '../widgets/loading.dart';
import '../widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late List<ProductEntity> _allProducts = widget.allProducts;
  // late List<ProductEntity> _filteredProducts = widget.allProducts;
  final TextEditingController _searchController = TextEditingController();

  double ratio(double num) {
    return num * MediaQuery.of(context).size.width / 500;
  }
  // void _filterProducts(String query) {
  //   setState(() {
  //     _filteredProducts = _allProducts
  //         .where((product) => product.name.toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GroceryBloc>().add(LoadAllGroceriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: const Color(0XFF3F51F3),
            size: ratio(16),
          ),
        ),
        title: Text(
          'Burger',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: ratio(16),
              color: const Color(0XFF3E3E3E)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  ratio(20), ratio(10), ratio(20), ratio(10)),
              child: SingleChildScrollView(
                child: BlocConsumer<GroceryBloc, GroceryState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    if (state is GroceryLoading) {
                      return LoadingWidget();
                    }
                    if (state is GroceryError) {
                      return const Center(
                        child: Text('Error'),
                      );
                    }
                    if (state is GroceryLoaded) {
                     

                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                onChanged: null,
                                decoration: InputDecoration(
                                    label: Text(
                                      'Search Grocery',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          color: Color(0XFF666666)),
                                    ),
                                    border: OutlineInputBorder(),
                                    suffixIcon: Icon(
                                      Icons.arrow_forward,
                                      color: Color(0XFF3F51F3),
                                    )),
                              ),
                            ),
                            Container(
                              height: 48,
                              width: 48,
                              margin: const EdgeInsets.only(left: 7),
                              decoration: const BoxDecoration(
                                color: Color(0XFF3F51F3),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              child: const Icon(
                                Icons.filter_list_rounded,
                                color: Colors.white,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: ratio(27)),
                        SizedBox(
                            height: ratio(1000),
                            child: CardGridView(allGroceries: state.groceries)),
                      ],
                    );}

                    else{
                      return
                      Text('something went wrong');
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
