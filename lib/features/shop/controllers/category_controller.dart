import 'package:e_commerce/data/repositories/categories/category_repository.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();
  final _categoryRepostory = Get.put(CategoryRepository());
  final isLoading = false.obs;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategory = <CategoryModel>[].obs;
  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// Load Category data
  Future<void> fetchCategories() async {
    try {
      /// Show loader while loading categories
      isLoading.value = true;

      /// Fetch categories from data source (Firestore, API, etc)
      final categories = await _categoryRepostory.getAllCategory();

      /// Update the categories list
      allCategories.assignAll(categories);

      /// Filter featured categories
      featuredCategory.assignAll(
        allCategories
            .where(
              (category) => category.isFeatured && category.parentId.isEmpty,
            )
            .take(8)
            .toList(),
      );
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }

  /// --Load selected category data
  /// Get Category or Sub-Category Products.
}
