part of 'grocery_bloc.dart';

@immutable
sealed class GroceryEvent {}


class LoadAllGroceriesEvent extends GroceryEvent {
  LoadAllGroceriesEvent();
}

class LoadSingleGroceryEvent extends GroceryEvent {
  final String id;

  LoadSingleGroceryEvent(this.id);
}
