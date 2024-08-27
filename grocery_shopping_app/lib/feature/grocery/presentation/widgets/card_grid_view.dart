import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_shopping_app/feature/grocery/domain/entity/grocery.dart';
import 'package:grocery_shopping_app/feature/grocery/presentation/bloc/grocery_bloc.dart';
import 'package:grocery_shopping_app/feature/grocery/presentation/page/grocery_details_page.dart';


import 'product_card.dart';

class CardGridView extends StatelessWidget {
  final List<GroceryEntity> allGroceries;
  

  const CardGridView({super.key, required this.allGroceries});

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<GroceryBloc>(context);

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 200,
      ),
      itemCount: allGroceries.length,
      itemBuilder: (context, index) {
        final groceryEntity = allGroceries[index];
        


        return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=> GroceryDetailsPage(groceryEntity: groceryEntity,))
              ).then((_) => context.read<GroceryBloc>().add(LoadAllGroceriesEvent()));

            },
            child: ProductCardWidget(
              groceryEntity: groceryEntity,
            ));
      },
    );
    ;
  }
}
