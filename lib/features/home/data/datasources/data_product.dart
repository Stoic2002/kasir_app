import 'package:kasir_app/core/assets/assets.gen.dart';
import 'package:kasir_app/features/home/data/models/category_model.dart';
import 'package:kasir_app/features/home/data/models/product_model.dart';

class DataProduct {
  final List<CategoryModel> categories = [
    CategoryModel(
      categoryId: 1,
      categoryName: 'makanan',
      productModel: [
        ProductModel(
            id: 001,
            categoryId: 1,
            name: 'biawak bakar',
            categoryName: 'makanan',
            image: Assets.images.food.provider(),
            price: 20000,
            description:
                'Et quidem faciunt, ut summum bonum sit extremum et rationibus conquisitis de voluptate. Sed ut summum bonum sit id',
            stock: 10,
            isAvailable: 0,
            createdAt: DateTime(2024),
            updateAt: DateTime(2024)),
        ProductModel(
            id: 002,
            categoryId: 1,
            name: 'babi pan pan',
            categoryName: 'makanan',
            image: Assets.images.food.provider(),
            price: 50000,
            description:
                'Et quidem faciunt, ut summum bonum sit extremum et rationibus conquisitis de voluptate. Sed ut summum bonum sit id',
            stock: 10,
            isAvailable: 0,
            createdAt: DateTime(2024),
            updateAt: DateTime(2024))
      ],
    ),
    CategoryModel(
      categoryId: 2,
      categoryName: 'minuman',
      productModel: [
        ProductModel(
            id: 005,
            categoryId: 2,
            name: 'es teh solo',
            categoryName: 'minuman',
            image: Assets.images.drink.provider(),
            price: 5000,
            description: 'test',
            stock: 10,
            isAvailable: 0,
            createdAt: DateTime(2024),
            updateAt: DateTime(2024))
      ],
    ),
    CategoryModel(
      categoryId: 3,
      categoryName: 'Snacks',
      productModel: [
        ProductModel(
          id: 123,
          categoryId: 3,
          name: 'snicker',
          categoryName: 'Snacks',
          image: Assets.images.snacks.provider(),
          price: 10000,
          description:
              'Et quidem faciunt, ut summum bonum sit extremum et rationibus conquisitis de voluptate. Sed ut summum bonum sit id',
          stock: 10,
          isAvailable: 0,
          createdAt: DateTime(2024),
          updateAt: DateTime(2024),
        ),
        ProductModel(
            id: 124,
            categoryId: 3,
            name: 'Cheese Puffs',
            categoryName: 'Snacks',
            price: 4000,
            image: Assets.images.snacks.provider(),
            description:
                'Et quidem faciunt, ut summum bonum sit extremum et rationibus conquisitis de voluptate. Sed ut summum bonum sit id',
            stock: 10,
            isAvailable: 0,
            createdAt: DateTime(2024),
            updateAt: DateTime(2024)),
        ProductModel(
            id: 125,
            categoryId: 3,
            name: 'chiki',
            categoryName: 'Snacks',
            image: Assets.images.snacks.provider(),
            price: 6000,
            description:
                'Et quidem faciunt, ut summum bonum sit extremum et rationibus conquisitis de voluptate. Sed ut summum bonum sit id',
            stock: 10,
            isAvailable: 0,
            createdAt: DateTime(2024),
            updateAt: DateTime(2024)),
        ProductModel(
            id: 126,
            categoryId: 3,
            name: 'lays',
            categoryName: 'Snacks',
            image: Assets.images.snacks.provider(),
            price: 15000,
            description:
                'Et quidem faciunt, ut summum bonum sit extremum et rationibus conquisitis de voluptate. Sed ut summum bonum sit id',
            stock: 10,
            isAvailable: 0,
            createdAt: DateTime(2024),
            updateAt: DateTime(2024)),
        ProductModel(
            id: 423,
            categoryId: 3,
            name: 'qtela',
            categoryName: 'Snacks',
            image: Assets.images.snacks.provider(),
            price: 10000,
            description:
                'Et quidem faciunt, ut summum bonum sit extremum et rationibus conquisitis de voluptate. Sed ut summum bonum sit id',
            stock: 10,
            isAvailable: 0,
            createdAt: DateTime(2024),
            updateAt: DateTime(2024)),
        ProductModel(
            id: 657,
            categoryId: 3,
            name: 'kusuka',
            categoryName: 'Snacks',
            image: Assets.images.snacks.provider(),
            price: 10000,
            description:
                'Et quidem faciunt, ut summum bonum sit extremum et rationibus conquisitis de voluptate. Sed ut summum bonum sit id',
            stock: 10,
            isAvailable: 0,
            createdAt: DateTime(2024),
            updateAt: DateTime(2024))
      ],
    ),
    CategoryModel(
      categoryId: 4,
      categoryName: 'Liquor',
      productModel: [
        ProductModel(
            id: 007,
            categoryId: 4,
            name: 'whiskey',
            categoryName: 'Liquor',
            image: Assets.images.liquor.provider(),
            price: 500000,
            description:
                'Et quidem faciunt, ut summum bonum sit extremum et rationibus conquisitis de voluptate. Sed ut summum bonum sit id',
            stock: 10,
            isAvailable: 0,
            createdAt: DateTime(2024),
            updateAt: DateTime(2024))
      ],
    )
  ];
}
