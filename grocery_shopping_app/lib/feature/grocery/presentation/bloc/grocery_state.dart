part of 'grocery_bloc.dart';

@immutable
sealed class GroceryState {}

final class GroceryInitial extends GroceryState {}

class GroceryLoading extends GroceryState {}

final class GroceryLoaded extends GroceryState {
  final List<GroceryEntity> groceries;

  GroceryLoaded(this.groceries);
}


final class GroceryError extends GroceryState {
  final String message;

  GroceryError(this.message);
}

final class GroceryEmpty extends GroceryState {}

