// แบ่งหมวดหมู่หน้าhome 3 อันหลัก
class CategoryModel {
  String name;
  dynamic image;

  CategoryModel({
    required this.name,
    required this.image,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: 'บทสวด',
        image: 'assets/images/budha5.jpg',
      ),
    );
    categories.add(
      CategoryModel(
        name: 'เพลง',
        image: 'assets/images/budha4.jpg',
      ),
    );
    categories.add(
      CategoryModel(
        name: 'เซียมซี',
        image: 'assets/images/budha3.jpg',
      ),
    );

    return categories; // Return the populated list
  }
}
