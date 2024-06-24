import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kasir_app/features/home/data/datasources/firebase_repo.dart';
import 'package:kasir_app/features/home/data/models/product_new_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FirebaseRepo _firebaseRepo;
  ProductBloc(this._firebaseRepo) : super(ProductInitial()) {
    on<AddProduct>((event, emit) async {
      try {
        emit(ProductLoading());

        // Upload image and get URL
        String imageUrl = await _firebaseRepo.uploadImageToStorage(event.image);

        print(imageUrl);

        // Add product with imageUrl
        await _firebaseRepo.addProduct(event.categoryName, event.name,
            event.description, imageUrl, event.price, DateTime.now());

        emit(ProductLoaded());
      } catch (e) {
        emit(ProductFailure(message: e.toString()));
      }
    });

    on<GetListProducts>((event, emit) async {
      try {
        emit(ProductLoading());
        final foodProducts = await _firebaseRepo.getListFood().first;
        final drinkProducts = await _firebaseRepo.getListDrink().first;

        emit(CategoryProductsLoaded(
            foodProducts: foodProducts, drinkProducts: drinkProducts));
      } catch (e) {
        emit(ProductFailure(message: e.toString()));
      }
    });
  }
}
