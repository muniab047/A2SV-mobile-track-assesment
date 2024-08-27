import 'package:bloc/bloc.dart';
import 'package:grocery_shopping_app/feature/grocery/domain/entity/grocery.dart';
import 'package:grocery_shopping_app/feature/grocery/domain/use_case/get_all_groceries.dart';
import 'package:meta/meta.dart';

part 'grocery_event.dart';
part 'grocery_state.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  final GetAllGroceriesUseCase getAllGroceriesUseCase;

  GroceryBloc(this.getAllGroceriesUseCase) : super(GroceryInitial()) {
    on<GroceryEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoadAllGroceriesEvent>((event, emit) async{
      emit(GroceryLoading());

      final allGroceries = await getAllGroceriesUseCase.call();
      allGroceries.fold(
        (failure) => emit(GroceryError('Error fetching groceries')),
        (groceries) {
          if (groceries.isEmpty) {
            emit(GroceryEmpty());
          } else {
            emit(GroceryLoaded(groceries));
          }
        },
      );
    });
  }
}
